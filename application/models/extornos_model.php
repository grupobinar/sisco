<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');

class Extornos_model extends CI_Model{
    function __construct(){
        parent::__construct();
        $this->load->database();
    }    


	function listventas($id,$sem)
	{
		$this->db->select('t_vendedores.id_vendedor, t_ventas.id_venta, t_tomadores.identificacion, t_tomadores.apellidos, t_tomadores.nombres, tventa, cuotas_canceladas, t_polizas.suma, tpoliza, comision_liquidada, comision_c');
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

		$data=$this->db->query("SELECT * FROM t_vendedores where id_vendedor in (select id_vendedor from t_ventas where estatus_venta='L')");
		
		//echo $this->db->last_query();

		if($data->num_rows()>0)
		{
			 return $data->result_array();
		}
		
	}

	function e_listsemana()
	{
		$data=$this->db->query("SELECT * FROM t_semanas where estatus=1 and id_semana in (select id_semana from t_ventas where estatus_venta='L') order by nsem asc");

		if($data->num_rows()>0)
		{
			 return $data->result_array();
		}
		
	}

	function guardar($c_extornar, $m_extornar, $m_extornar_c, $motivo, $id_venta, $id_vendedor, $fecha, $usuario){

		  	$data = array(
				'id_venta'=>$id_venta,
				'id_vendedor'=>$id_vendedor,
				'monto_extornable'=>$m_extornar,	
				'monto_fraccionado'=>$m_extornar,	
				'monto_fraccionado_c'=>$m_extornar_c,	
				'monto_extornable_c'=>$m_extornar_c,	
				'cuotas_fraccionar'=>'1',	
				'cuotas_extornadas'=>$c_extornar,	
				'id_usuario'=>$usuario,	
				'motivo'=>$motivo,	
				'fecha_registro'=>$fecha,
				'ult_mod'=>$fecha
			);


			$this->db->insert('public.t_extornos',$data);

			$data = array(
				'estatus_venta'=>'E',
			);

			$this->db->set($data);
			$this->db->where('id_venta', $id_venta);
			$this->db->update('t_ventas');


			$retorno="Venta Extornada";

			return $retorno;

	}

	function buscarExtornos(){

		$this->db->select('solicitud, monto_fraccionado, motivo, cod_vendedor, apellidos, nombres, telefono');
		$this->db->join('t_ventas','t_ventas.id_venta = t_extornos.id_venta','left');
		$this->db->join('t_vendedores','t_vendedores.id_vendedor = t_extornos.id_vendedor','left');
		$extornos = $this->db->get('public.t_extornos');

		if($extornos->num_rows()>0)
		{
			 return $extornos->result_array();
		}
	}

	function motivos(){

		$this->db->select('id_motivo, motivo');
		$motivos = $this->db->get('public.t_motivos');

		if($motivos->num_rows()>0)
		{
			 return $motivos->result_array();
		}
	}

}