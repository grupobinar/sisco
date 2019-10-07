<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');

class Extornos_model extends CI_Model{
    function __construct(){
        parent::__construct();
        $this->load->database();
    }    


	function listventas($id,$sem)
	{
		$this->db->select('t_vendedores.id_vendedor, t_ventas.id_venta, t_tomadores.identificacion, t_tomadores.apellidos, t_tomadores.nombres, tventa, cuotas_canceladas, suma, tpoliza, comision_liquidada, comision_coordinador');
		$this->db->join('t_polizas','t_polizas.id_poliza = t_ventas.id_poliza','left');
		$this->db->join('t_tpoliza','t_tpoliza.id_tpoliza = t_ventas.id_tpoliza','left');
		$this->db->join('t_tomadores','t_tomadores.id_tomador = t_ventas.id_tomador','left');
		$this->db->join('t_vendedores','t_vendedores.id_vendedor = t_ventas.id_vendedor','left');
		$this->db->join('t_semanas','t_semanas.id_semana = t_ventas.id_semana','left');
		$this->db->join('t_liquidacion','t_liquidacion.id_venta = t_ventas.id_venta','left');
		$this->db->where('cod_vendedor',$id);
		$this->db->where('nsem',$sem);
		$this->db->where('estatus_venta','L');
		$listusuarios = $this->db->get('public.t_ventas');

		//echo $this->db->last_query();


		if($listusuarios->num_rows()>0)
		{
			 return $listusuarios->result_array();
		}

	}

	function e_listvendedores()
	{
		$data = $this->db->get('public.t_vendedores');

		if($data->num_rows()>0)
		{
			 return $data->result_array();
		}
		
	}

	function e_listsemana()
	{
		$this->db->where('estatus','1');
		$data = $this->db->get('public.t_semanas');

		if($data->num_rows()>0)
		{
			 return $data->result_array();
		}
		
	}

	function guardar($c_extornar, $m_extornar, $motivo, $id_venta, $id_vendedor, $fecha, $usuario){

		  	$data = array(
				'id_venta'=>$id_venta,
				'id_vendedor'=>$id_vendedor,
				'monto_extornable'=>$m_extornar,	
				'cuotas_extornadas'=>$c_extornar,	
				'id_usuario'=>$usuario,	
				'fecha_registro'=>$fecha,
				'ult_mod'=>$fecha
			);


			$this->db->insert('public.t_extornos',$data);


			$retorno="Venta Extornada";

			return $retorno;

	}

}