<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');

class Reportes_model extends CI_Model{
    function __construct(){
        parent::__construct();
        $this->load->database();
    }    


	function listVendedores($individual = 'I', $semana = 0)
	{
        if ($individual != 'I') {
            $this->db->where('id_vendedor', $individual);
            $this->db->select("t_vendedores.*, t_personas.nombres || ' ' || t_personas.apellidos as nombre_coordinador");
            $this->db->join('t_usuarios','t_usuarios.id_user = t_vendedores.id_coordinador');
            $this->db->join('t_personas','t_usuarios.id_persona = t_personas.id_persona');
            $listusuarios = $this->db->get('public.t_vendedores')->result_array();
        }else{
			if($semana) {
				$this->db->where('vendedores_ventas_detalles.id_semana', $semana);
			}

            $this->db->select("distinct(t_vendedores.*), t_personas.nombres || ' ' || t_personas.apellidos as nombre_coordinador");
            $this->db->join('t_usuarios','t_usuarios.id_user = t_vendedores.id_coordinador');
			$this->db->join('t_personas','t_usuarios.id_persona = t_personas.id_persona');
			$this->db->join('vendedores_ventas_detalles','vendedores_ventas_detalles.id_vendedor = t_vendedores.id_vendedor');
			$listusuarios = $this->db->get('public.t_vendedores')->result_array();
        }

		return $listusuarios;
	}

	function contar($id)
	{
		$this->db->select('COUNT(*) as total');
		$this->db->where('id_vendedor',$id);
		$listusuarios = $this->db->get('public.t_ventas');

		if($listusuarios->num_rows()>0)
		{
			 return $listusuarios->row()->total;
		}

	}

	function getLiquidacion($id_venta){
		$this->db->where('id_venta', $id_venta);
		$listusuarios = $this->db->get('public.t_liquidacion')->result_array();

		return $listusuarios;
	}

	function ventas_vendedor($id){

		$this->db->select('cuotas_canceladas, suma, tventa, factor');
		$this->db->join('t_plan','t_plan.id_tplan = t_ventas.id_plan','left');
		$this->db->join('t_polizas','t_polizas.id_poliza = t_ventas.id_poliza','left');
		$this->db->join('t_tpoliza','t_tpoliza.id_tpoliza = t_ventas.id_tpoliza','left');
		$this->db->where('id_vendedor',$id);
		$listusuarios = $this->db->get('public.t_ventas');


		if($listusuarios->num_rows()>0)
		{

			$comision=0;

			foreach ($listusuarios->result_array() as $key) {
				if($key['tventa']==1){
					$c=((($key['suma']*$key['factor'])/1000)/12)*0.8;
					if($key['cuotas_canceladas']>=4){
						$c=$c+($c*0.2);
					}
				}elseif ($key['tventa']==2) {
					$c=3500;
				}elseif ($key['tventa']==3) {
					$c=1000;
				}

				$comision=$comision + $c;
			}

			return $comision;
		}

	}

	function detalleLiquidacion($id){

		$this->db->select('id_venta, cuotas_canceladas, tplan, suma, factor, tpoliza, tventa');
		$this->db->join('t_plan','t_plan.id_tplan = t_ventas.id_plan','left');
		$this->db->join('t_polizas','t_polizas.id_poliza = t_ventas.id_poliza','left');
		$this->db->join('t_tpoliza','t_tpoliza.id_tpoliza = t_ventas.id_tpoliza','left');
		$this->db->where('id_vendedor',$id);
		$listusuarios = $this->db->get('public.t_ventas');

		//echo $this->db->last_query();


		if($listusuarios->num_rows()>0)
		{

			return $listusuarios->result_array();
			
		}

	}

}