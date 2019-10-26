<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');

class Reportes_model extends CI_Model{
    function __construct(){
        parent::__construct();
        $this->load->database();
    }    


	function metrica_tpago($d_sem, $h_sem, $coo)
	{
		$this->db->select('tpago, count(*) as total, sum(monto) as suma');
		$this->db->join('t_tpago','t_tpago.id_tpago = t_ventas.tipo_pago','left');
		$this->db->join('t_vendedores','t_vendedores.id_vendedor = t_ventas.id_vendedor','left');
		$this->db->where('id_semana >=',$d_sem);
		$this->db->where('id_semana <=',$h_sem);
		$this->db->where('id_coordinador',$coo);
		$this->db->group_by('tpago');

		$data = $this->db->get('public.t_ventas'); 

		//echo $this->db->last_query();


		return $data->result_array();


	}

	function metrica_tventa($d_sem, $h_sem, $coo)
	{
		$this->db->select('concepto, count(*) as total');
		$this->db->join('t_concepto','t_concepto.id_concepto = t_ventas.tventa','left');
		$this->db->join('t_vendedores','t_vendedores.id_vendedor = t_ventas.id_vendedor','left');
		$this->db->where('id_semana >=',$d_sem);
		$this->db->where('id_semana <=',$h_sem);
		$this->db->where('id_coordinador',$coo);
		$this->db->group_by('concepto');

		$data = $this->db->get('public.t_ventas'); 

		return $data->result_array();


	}

	function metrica_tpoliza($d_sem, $h_sem, $coo)
	{
		$this->db->select('tpoliza, count(*) as total');
		$this->db->join('t_tpoliza','t_tpoliza.id_tpoliza = t_ventas.id_tpoliza','left');
		$this->db->join('t_vendedores','t_vendedores.id_vendedor = t_ventas.id_vendedor','left');
		$this->db->where('id_semana >=',$d_sem);
		$this->db->where('id_semana <=',$h_sem);
		$this->db->where('id_coordinador',$coo);
		$this->db->group_by('tpoliza');

		$data = $this->db->get('public.t_ventas'); 

		return $data->result_array();


	}

	function metrica_tpolizam($d_sem, $h_sem, $coo)
	{
		$this->db->select('tpoliza, num_poliza, count(*) as total');
		$this->db->join('t_polizas','t_polizas.id_poliza = t_ventas.id_poliza','left');
		$this->db->join('t_tpoliza','t_tpoliza.id_tpoliza = t_ventas.id_tpoliza','left');
		$this->db->join('t_vendedores','t_vendedores.id_vendedor = t_ventas.id_vendedor','left');
		$this->db->where('id_semana >=',$d_sem);
		$this->db->where('id_semana <=',$h_sem);
		$this->db->where('id_coordinador',$coo);
		$this->db->group_by('tpoliza, num_poliza');

		$data = $this->db->get('public.t_ventas'); 

		return $data->result_array();


	}

	function semana($sem)
	{

		$this->db->where('nsem',$sem); 
		$data = $this->db->get('public.t_semanas'); 

		return $data->row_array();


	}

	function coordinador($id)
	{

		$this->db->where('t_usuarios.id_persona',$id); 
		$this->db->join('t_personas','t_personas.id_persona = t_usuarios.id_persona','left');
		$data = $this->db->get('public.t_usuarios'); 

		return $data->row_array();


	}

	function coordinador_($id)
	{

		$this->db->where('t_usuarios.id_user',$id); 
		$this->db->join('t_personas','t_personas.id_persona = t_usuarios.id_persona','left');
		$data = $this->db->get('public.t_usuarios'); 

		return $data->row_array();


	}

	function cierre($estatus){
		$this->db->select('')
	}

	function hcell($vendedor,$sem){

		$this->db->select('tventa, count(*) as total');
		$this->db->where('id_vendedor',$vendedor); 
		$this->db->where('id_semana',$sem); 
		$this->db->where('estatus_venta','L'); 
		$this->db->group_by('tventa');

		$data = $this->db->get('public.t_ventas'); 

		return $data->result_array();

	}

	function vendedores_rpt_general($coordinador,$sem)
	{
		$this->db->select('t_vendedores.id_vendedor, apellidos, nombres, cod_vendedor, concepto');
		$this->db->where('id_coordinador',$coordinador); 
		$this->db->where('t_ventas.id_semana',$sem); 
		$this->db->where('t_ventas.estatus_venta','L'); 
		$this->db->join('t_ventas','t_ventas.id_vendedor = t_vendedores.id_vendedor','left');
		$this->db->join('t_concepto','t_concepto.id_concepto = t_ventas.tventa','left');
		$this->db->group_by('t_vendedores.id_vendedor, apellidos, nombres, cod_vendedor, concepto');
		$this->db->order_by('t_vendedores.id_vendedor');

		$data = $this->db->get('public.t_vendedores'); 

		return $data->result_array();

	}

	function vendedores_rpt_i($cod,$sem)
	{
		$this->db->select('t_vendedores.id_vendedor, apellidos, nombres,  cod_vendedor, concepto, id_coordinador, nsem, desde, hasta, t_semanas.id_semana');
		$this->db->where('cod_vendedor',$cod); 
		$this->db->where('t_semanas.nsem',$sem); 
		$this->db->join('t_vendedores','t_vendedores.id_vendedor = t_ventas.id_vendedor','left');
		$this->db->join('t_semanas','t_semanas.id_semana = t_ventas.id_semana','left');
		$this->db->join('t_concepto','t_concepto.id_concepto = t_ventas.tventa','left');

		$data = $this->db->get('public.t_ventas'); 

		return $data->row_array();

	}

	function extornos_rpt_i($cod,$sem)
	{
		$this->db->select('t_tomadores.identificacion, t_tomadores.apellidos, t_tomadores.nombres, concepto, tpoliza, suma, cuotas_canceladas, monto_fraccionado');
		$this->db->where('t_ventas.id_vendedor',$cod); 
		$this->db->where('t_extornos.id_semana',$sem); 
		$this->db->join('t_vendedores','t_vendedores.id_vendedor = t_ventas.id_vendedor','left');
		$this->db->join('t_tomadores','t_tomadores.id_tomador = t_ventas.id_tomador','left');
		$this->db->join('t_extornos','t_extornos.id_venta = t_ventas.id_venta','left');
		$this->db->join('t_concepto','t_concepto.id_concepto = t_ventas.tventa','left');
		$this->db->join('t_tpoliza','t_tpoliza.id_tpoliza = t_ventas.id_tpoliza','left');
		$this->db->join('t_polizas','t_polizas.id_poliza = t_ventas.id_poliza','left');


		$data = $this->db->get('public.t_ventas'); 
		//echo $this->db->last_query();


		return $data->result_array();

	}

	function extornos_rpt_g($cod,$sem)
	{
		$this->db->select('t_tomadores.identificacion, t_tomadores.apellidos, t_tomadores.nombres, concepto, suma, cuotas_canceladas, monto_fraccionado, monto_fraccionado_c, t_motivos.motivo');
		$this->db->where('t_vendedores.id_coordinador',$cod); 
		$this->db->where('t_extornos.id_semana',$sem); 
		$this->db->join('t_vendedores','t_vendedores.id_vendedor = t_ventas.id_vendedor','left');
		$this->db->join('t_tomadores','t_tomadores.id_tomador = t_ventas.id_tomador','left');
		$this->db->join('t_extornos','t_extornos.id_venta = t_ventas.id_venta','left');
		$this->db->join('t_polizas','t_polizas.id_poliza = t_ventas.id_poliza','left');
		$this->db->join('t_concepto','t_concepto.id_concepto = t_ventas.tventa','left');
		$this->db->join('t_motivos','t_motivos.id_motivo = t_extornos.motivo','left');



		$data = $this->db->get('public.t_ventas'); 
		//echo $this->db->last_query();
		if($data->num_rows()>0)
		{
			 return $data->result_array();
		}

	}

	function ventas($vendedor,$sem){

		$this->db->select('apellidos, nombres, concepto, tpoliza, t_liquidacion.suma, cuotas_canceladas, identificacion, comision_liquidada, t_liquidacion.ult_mod , num_poliza');
		$this->db->join('t_tomadores','t_tomadores.id_tomador = t_ventas.id_tomador','left');
		$this->db->join('t_concepto','t_concepto.id_concepto = t_ventas.tventa','left');
		$this->db->join('t_tpoliza','t_tpoliza.id_tpoliza = t_ventas.id_tpoliza','left');
		$this->db->join('t_liquidacion','t_liquidacion.id_venta = t_ventas.id_venta','left');
		$this->db->join('t_polizas','t_polizas.id_poliza = t_ventas.id_poliza','left');


		$this->db->where('id_vendedor',$vendedor); 
		$this->db->where('id_semana',$sem); 
		$this->db->where('estatus_venta !=','X'); 
		$this->db->where('estatus_venta !=','D'); 

		$data = $this->db->get('public.t_ventas'); 

		return $data->result_array();


	}

	function ventasd($vendedor,$sem){

		$this->db->select('apellidos, nombres, concepto, tpoliza, suma, cuotas_canceladas, identificacion, num_poliza');
		$this->db->join('t_tomadores','t_tomadores.id_tomador = t_ventas.id_tomador','left');
		$this->db->join('t_concepto','t_concepto.id_concepto = t_ventas.tventa','left');
		$this->db->join('t_tpoliza','t_tpoliza.id_tpoliza = t_ventas.id_tpoliza','left');
		$this->db->join('t_polizas','t_polizas.id_poliza = t_ventas.id_poliza','left');

		$this->db->where('id_vendedor',$vendedor); 
		$this->db->where('id_semana',$sem); 
		$this->db->where('estatus_venta =','D'); 

		$data = $this->db->get('public.t_ventas'); 

		return $data->result_array();


	}

	function comisiones($vendedor,$sem){

		$this->db->select('tventa, sum(comision_liquidada) as comision, sum(comision_c) as comision_c');
		$this->db->join('t_ventas','t_ventas.id_venta = t_liquidacion.id_venta','left');
		$this->db->where('id_vendedor',$vendedor); 
		$this->db->where('t_ventas.id_semana',$sem); 
		$this->db->group_by('tventa'); 
		
		$data = $this->db->get('public.t_liquidacion'); 

		return $data->result_array();


	}

	function e_listcoord()
	{

		$data=$this->db->query("SELECT * FROM t_usuarios as u, t_personas as p where p.id_persona = u.id_persona and id_rol = 3 and id_user in (select id_coordinador from t_vendedores)");
		
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

	function e_listvendedores()
	{

		$data=$this->db->query("SELECT * FROM t_vendedores where id_vendedor in (select id_vendedor from t_ventas where estatus_venta='L')");
		
		//echo $this->db->last_query();

		if($data->num_rows()>0)
		{
			 return $data->result_array();
		}
		
	}

}