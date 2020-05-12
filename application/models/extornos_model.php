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
		$this->db->join('t_estatus_venta','t_estatus_venta.id_venta = t_ventas.id_venta','left');
		$this->db->where_in('t_estatus_venta.estatus_venta',['L','LP']);
		$this->db->where('t_estatus_venta.estatus','0');
		$this->db->where('cod_vendedor',$id);
		$this->db->where('nsem',$sem);
		$listusuarios = $this->db->get('public.t_ventas');

		//echo $this->db->last_query();


		if($listusuarios->num_rows()>0)
		{
			 return $listusuarios->result_array();
		}

	}

	function e_listvendedores()
	{

		$data=$this->db->query("SELECT * FROM t_vendedores where id_vendedor in (select id_vendedor from t_ventas as v, t_estatus_venta as e where e.estatus_venta='L' and v.id_venta = e.id_venta and e.estatus=0)");
		
		//echo $this->db->last_query();

		if($data->num_rows()>0)
		{
			 return $data->result_array();
		}
		
	}

	function e_listsemana()
	{
		$data=$this->db->query("SELECT * FROM t_semanas where estatus=1 and id_semana in (select id_semana from t_ventas as v, t_estatus_venta as e where e.estatus_venta='L' and v.id_venta = e.id_venta and e.estatus=0) order by nsem asc");

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
				'motivo'=>$motivo	
			);


			$this->db->insert('public.t_extornos',$data);

			$data = array(
				'estatus'=>'1',
			);
	
			$this->db->where('id_venta', $id_venta);
			$this->db->update('t_estatus_venta', $data);

			$data = array(
				'id_venta'=>$id_venta,
				'estatus_venta'=>'E',
				'fecha_registro'=>date('Y-m-d'),
				'ult_mod'=>date('Y-m-d')
		
			);
		
			$this->db->insert('public.t_estatus_venta',$data);



			$retorno="Venta Extornada";

			return $retorno;

	}

	function buscarExtornos(){

		$this->db->select('solicitud, monto_fraccionado, comision_liquidada, t_motivos.motivo, cod_vendedor, apellidos, nombres, telefono, nsem, id_estatus, cuotas_fraccionar');
		$this->db->join('t_semanas','t_semanas.id_semana = t_extornos.id_semana','left');
		$this->db->join('t_motivos','t_motivos.id_motivo = t_extornos.motivo','left');
		$this->db->join('t_ventas','t_ventas.id_venta = t_extornos.id_venta','left');
		$this->db->join('t_liquidacion','t_liquidacion.id_venta = t_extornos.id_venta','left');
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