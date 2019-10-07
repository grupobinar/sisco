<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');

class Liquidacion_model extends CI_Model{
    function __construct(){
        parent::__construct();
        $this->load->database();
    }    


	function listventas()
	{
		$this->db->distinct();
		$this->db->select('t_vendedores.id_vendedor,identificacion, nsem, desde, hasta, nombres, apellidos, telefono');
		$this->db->join('t_vendedores','t_vendedores.id_vendedor = t_ventas.id_vendedor','left');
		$this->db->join('t_semanas','t_semanas.id_semana = t_ventas.id_semana','left');
		$listusuarios = $this->db->get('public.t_ventas');

		//echo $this->db->last_query();


		if($listusuarios->num_rows()>0)
		{
			 return $listusuarios->result();
		}

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