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
		$this->db->join('t_estatus_venta','t_estatus_venta.id_venta = t_ventas.id_venta','left');
		$this->db->where('t_estatus_venta.sem_l >= ',$d_sem);
		$this->db->where('t_estatus_venta.sem_l <= ',$h_sem);
		$this->db->where_in('t_estatus_venta.estatus_venta',['L','LP']);
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
		$this->db->join('t_estatus_venta','t_estatus_venta.id_venta = t_ventas.id_venta','left');
		$this->db->where('t_estatus_venta.sem_l >= ',$d_sem);
		$this->db->where('t_estatus_venta.sem_l <= ',$h_sem);
		$this->db->where_in('t_estatus_venta.estatus_venta',['L','LP']);
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
		$this->db->join('t_estatus_venta','t_estatus_venta.id_venta = t_ventas.id_venta','left');
		$this->db->where_in('t_estatus_venta.estatus_venta',['L','LP']);
		$this->db->where('t_estatus_venta.sem_l >= ',$d_sem);
		$this->db->where('t_estatus_venta.sem_l <= ',$h_sem);
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
		$this->db->join('t_estatus_venta','t_estatus_venta.id_venta = t_ventas.id_venta','left');
		$this->db->where_in('t_estatus_venta.estatus_venta',['L','LP']);
		$this->db->where('t_estatus_venta.sem_l >= ',$d_sem);
		$this->db->where('t_estatus_venta.sem_l <= ',$h_sem);
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

	function emails()
	{

		$data = $this->db->get('public.t_email'); 

		return $data->result_array();


	}

	function semanaMail()
	{

		$this->db->order_by('id_semana','desc'); 
		$this->db->where('estatus','1'); 
		$data = $this->db->get('public.t_semanas'); 

		return $data->row_array();


	}

	function semana2($sem)
	{

		$this->db->where('id_semana',$sem); 
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

	function coordinadorMail()
	{

		$this->db->where('t_usuarios.id_rol','3'); 
		$this->db->where('t_usuarios.estatus','0'); 
		$this->db->join('t_personas','t_personas.id_persona = t_usuarios.id_persona','left');
		$data = $this->db->get('public.t_usuarios'); 

		return $data->result_array();


	}

	function vendedor($id)
	{

		$this->db->where('t_vendedores.cod_vendedor',$id); 
		$data = $this->db->get('public.t_vendedores'); 

		return $data->row_array();


	}

	function coordinador_($id)
	{

		$this->db->where('t_usuarios.id_user',$id); 
		$this->db->join('t_personas','t_personas.id_persona = t_usuarios.id_persona','left');
		$data = $this->db->get('public.t_usuarios'); 

		return $data->row_array();


	}

	function contar_adicionales($id){

		$this->db->select('COUNT(*) as total');
		$this->db->where('id_venta',$id);
		$adicionales_count = $this->db->get('public.t_adicionales');

		return $adicionales_count->row()->total;
	}

	function contar_adicionales2($id,$sem){

		$this->db->select('COUNT(*) as total');
		$this->db->join('t_estatus_venta','t_estatus_venta.id_venta = t_ventas.id_venta','left');
		$this->db->where('t_estatus_venta.estatus_venta !=','X');
		$this->db->where('t_estatus_venta.estatus','0');		
		$this->db->where('tventa','2');
		$this->db->where('id_vendedor',$id);
		$this->db->where('id_semana',$sem);

		$adicionales_count = $this->db->get('public.t_ventas');

		return $adicionales_count->row()->total;
	}

	function contar_vida($id,$sem){

		$this->db->select('COUNT(*) as total');
		$this->db->join('t_estatus_venta','t_estatus_venta.id_venta = t_ventas.id_venta','left');
		$this->db->where('t_estatus_venta.estatus_venta !=','X');
		$this->db->where('t_estatus_venta.estatus','0');
		$this->db->where('id_vendedor',$id);
		$this->db->where('id_tpoliza','5');
		$this->db->where('id_semana',$sem);


		$adicionales_count = $this->db->get('public.t_ventas');

		return $adicionales_count->row()->total;
	}

	function contar_act($id,$sem){

		$this->db->select('COUNT(*) as total');
		$this->db->join('t_estatus_venta','t_estatus_venta.id_venta = t_ventas.id_venta','left');
		$this->db->where('t_estatus_venta.estatus','0');
		$this->db->where('id_vendedor',$id);
		$this->db->where('tventa','3');
		$this->db->where('id_semana',$sem);
		$this->db->where('t_estatus_venta.estatus_venta !=','X');


		$adicionales_count = $this->db->get('public.t_ventas');

		//echo $this->db->last_query();


		return $adicionales_count->row()->total;
	}

	function cierre($estatus,$sem){
		$this->db->select("t_ventas.id_venta, t_vendedores.id_vendedor, t_usuarios.id_user, t_personas.apellidos as ap_c, t_personas.nombres as name_c, t_vendedores.apellidos as ap_v, t_vendedores.nombres as name_v, solicitud, t_tomadores.identificacion, t_tomadores.apellidos as ap_t, t_tomadores.nombres as name_t, concepto, tpoliza, num_poliza, cuotas_canceladas, t_estatus_venta.estatus_venta, comision_liquidada, comision_c");

		$this->db->join('t_vendedores','t_vendedores.id_vendedor = t_ventas.id_vendedor','left');
		$this->db->join('t_usuarios','t_usuarios.id_user = t_vendedores.id_coordinador','left');
		$this->db->join('t_personas','t_personas.id_persona = t_usuarios.id_persona','left');
		$this->db->join('t_tomadores','t_tomadores.id_tomador = t_ventas.id_tomador','left');
		$this->db->join('t_concepto','t_concepto.id_concepto = t_ventas.tventa','left');
		$this->db->join('t_tpoliza','t_tpoliza.id_tpoliza = t_ventas.id_tpoliza','left');
		$this->db->join('t_polizas','t_polizas.id_poliza = t_ventas.id_poliza','left');
		$this->db->join('t_liquidacion','t_liquidacion.id_venta = t_ventas.id_venta','left');
		$this->db->join('t_semanas','t_semanas.id_semana = t_ventas.id_semana','left');
		$this->db->join('t_estatus_venta','t_estatus_venta.id_venta = t_ventas.id_venta','left');

		$this->db->where('t_estatus_venta.liquidacion = t_liquidacion.id_liquidacion');
		$this->db->where('t_estatus_venta.sem_l',$sem);

		$this->db->order_by('id_user, t_vendedores.id_vendedor, t_tomadores.id_tomador');

		//$this->db->where('(t_ventas.id_semana='.$sem.' or t_ventas.id_sem='.$sem.')',NULL,FALSE);
		$this->db->where_in('t_estatus_venta.estatus_venta',['L','LP']);
		

		$data = $this->db->get('public.t_ventas'); 
		return $data->result_array();
		//echo $this->db->last_query();
	}

	function hcell($vendedor,$sem){

		$this->db->select('tventa, count(*) as total');
		$this->db->join('t_estatus_venta','t_estatus_venta.id_venta = t_ventas.id_venta','left');
		//$this->db->where('t_estatus_venta.liquidacion = t_liquidacion.id_liquidacion');
		$this->db->where('t_estatus_venta.sem_l',$sem);
		$this->db->where('id_vendedor',$vendedor); 
		$this->db->where('id_semana',$sem); 
		$this->db->where_in('t_estatus_venta.estatus_venta',['L','LP']);
		$this->db->group_by('tventa');

		$data = $this->db->get('public.t_ventas'); 

		//echo $this->db->last_query();


		return $data->result_array();


	}

	function vendedores_rpt_general($coordinador,$sem)
	{

		$this->db->select('t_vendedores.id_vendedor, apellidos, nombres, cod_vendedor, concepto');
		$this->db->join('t_ventas','t_ventas.id_vendedor = t_vendedores.id_vendedor','left');
		$this->db->join('t_concepto','t_concepto.id_concepto = t_ventas.tventa','left');
		$this->db->join('t_estatus_venta','t_estatus_venta.id_venta = t_ventas.id_venta','left');
		$this->db->where('id_coordinador',$coordinador);
		$this->db->where('(id_semana='.$sem.' or id_sem='.$sem.')',NULL,FALSE);
		$this->db->where_in('t_estatus_venta.estatus_venta',['L','LP']);
		$this->db->group_by('t_vendedores.id_vendedor, apellidos, nombres, cod_vendedor, concepto');
		$this->db->order_by('t_vendedores.id_vendedor');

		$data = $this->db->get('public.t_vendedores'); 

		//return $this->db->last_query();
		return $data->result_array();

	}

	function vendedores_rpt_i($cod,$sem)
	{
		$this->db->select('t_vendedores.id_vendedor, apellidos, nombres,  cod_vendedor, concepto, id_coordinador, nsem, desde, hasta, t_semanas.id_semana');
		$this->db->where('cod_vendedor',$cod); 
		//$this->db->where('(t_ventas.id_semana='.$sem.' or id_sem='.$sem.')',NULL,FALSE); 
		$this->db->join('t_vendedores','t_vendedores.id_vendedor = t_ventas.id_vendedor','left');
		$this->db->join('t_semanas','t_semanas.id_semana = t_ventas.id_sem','left');
		$this->db->join('t_concepto','t_concepto.id_concepto = t_ventas.tventa','left');

		$data = $this->db->get('public.t_ventas'); 

		//echo $this->db->last_query();

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
		$this->db->select('t_tomadores.identificacion, t_tomadores.apellidos, t_tomadores.nombres, concepto, suma, cuotas_canceladas, monto_fraccionado, monto_fraccionado_c, t_motivos.motivo, t_ventas.id_semana, t_ventas.id_sem');
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

		$this->db->select('apellidos, nombres, concepto, tpoliza, t_liquidacion.suma, cuotas_canceladas, identificacion, comision_liquidada, t_liquidacion.ult_mod , num_poliza, nsem, t_ventas.id_semana, id_sem');
		$this->db->join('t_tomadores','t_tomadores.id_tomador = t_ventas.id_tomador','left');
		$this->db->join('t_concepto','t_concepto.id_concepto = t_ventas.tventa','left');
		$this->db->join('t_tpoliza','t_tpoliza.id_tpoliza = t_ventas.id_tpoliza','left');
		$this->db->join('t_liquidacion','t_liquidacion.id_venta = t_ventas.id_venta','left');
		$this->db->join('t_polizas','t_polizas.id_poliza = t_ventas.id_poliza','left');
		$this->db->join('t_semanas','t_semanas.id_semana = t_ventas.id_semana','left');
		$this->db->join('t_estatus_venta','t_estatus_venta.id_venta = t_ventas.id_venta','left');

		//$this->db->where('t_estatus_venta.estatus','0'); 
		$this->db->where('t_estatus_venta.liquidacion = t_liquidacion.id_liquidacion'); 
		$this->db->where('id_vendedor',$vendedor); 
		$this->db->where('t_estatus_venta.sem_l',$sem); 
		//$this->db->where('(t_ventas.id_semana='.$sem.' or id_sem='.$sem.')',NULL,FALSE);


		$data = $this->db->get('public.t_ventas'); 
		//echo $this->db->last_query();


		return $data->result_array();


	}

	function ventasd($vendedor,$sem){

		$this->db->select('apellidos, nombres, concepto, tpoliza, suma, cuotas_canceladas, identificacion, num_poliza');
		$this->db->join('t_tomadores','t_tomadores.id_tomador = t_ventas.id_tomador','left');
		$this->db->join('t_concepto','t_concepto.id_concepto = t_ventas.tventa','left');
		$this->db->join('t_tpoliza','t_tpoliza.id_tpoliza = t_ventas.id_tpoliza','left');
		$this->db->join('t_polizas','t_polizas.id_poliza = t_ventas.id_poliza','left');
		$this->db->join('t_estatus_venta','t_estatus_venta.id_venta = t_ventas.id_venta','left');

		$this->db->where('id_vendedor',$vendedor); 
		$this->db->where('id_semana',$sem); 
		$this->db->where_in('t_estatus_venta.estatus_venta',['D','LP']); 
		$this->db->where('t_estatus_venta.estatus','0'); 

		$data = $this->db->get('public.t_ventas'); 

		//echo $this->db->last_query();

		return $data->result_array();


	}

	function comisiones($vendedor,$sem){

		$this->db->select('tventa, sum(comision_liquidada) as comision, sum(comision_c) as comision_c');
		$this->db->join('t_ventas','t_ventas.id_venta = t_liquidacion.id_venta','left');
		$this->db->join('t_estatus_venta','t_estatus_venta.id_venta = t_ventas.id_venta','left');
		$this->db->where('t_estatus_venta.liquidacion = t_liquidacion.id_liquidacion');
		$this->db->where('t_estatus_venta.sem_l',$sem);
		$this->db->where('id_vendedor',$vendedor); 
		//$this->db->where('(t_ventas.id_semana='.$sem.' or (id_sem='.$sem.' and tipo_pago=2))',NULL,FALSE);
		//$this->db->where('t_ventas.id_semana',$sem); 
		$this->db->group_by('tventa'); 


		$data = $this->db->get('public.t_liquidacion'); 
		//echo ($this->db->last_query());


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
		$data=$this->db->query("SELECT * FROM t_semanas where estatus=1 and id_semana in (select id_semana from t_ventas as v, t_estatus_venta as e where e.estatus_venta in ('L','LP') and v.id_venta = e.id_venta and e.estatus=0) or id_semana in (select id_sem from t_ventas as v, t_estatus_venta as e where e.estatus_venta='L' and v.id_venta = e.id_venta and e.estatus=0) order by id_semana asc");

		if($data->num_rows()>0)
		{
			 return $data->result_array();
		}
		
	}

	function e_listvendedores()
	{

		$data=$this->db->query("SELECT * FROM t_vendedores where id_vendedor in (select id_vendedor from t_ventas as v, t_estatus_venta as e where e.estatus_venta in ('L','LP') and v.id_venta = e.id_venta and e.estatus=0)");
		
		//echo $this->db->last_query();

		if($data->num_rows()>0)
		{
			 return $data->result_array();
		}
		
	}

	function e_listvendedores2($coo,$sem)
	{

		$this->db->where('id_coordinador',$coo);
		//$this->db->where('id_semana',$sem);
		$data = $this->db->get('public.t_vendedores'); 

		
		if($data->num_rows()>0)
		{
			 return $data->result_array();
		}
		
	}

	function rpt($v,$s){

		$this->db->select('COUNT(*) as total, tplan');
		$this->db->join('t_plan','t_plan.id_tplan = t_ventas.id_plan','left');
		$this->db->join('t_estatus_venta','t_estatus_venta.id_venta = t_ventas.id_venta','left');
		$this->db->group_by('t_plan.tplan');
		$this->db->where('id_vendedor',$v);
		$this->db->where('id_semana',$s);
		$this->db->where('tventa','1');
		$this->db->where('t_estatus_venta.estatus_venta !=','X');
		$this->db->where('t_estatus_venta.estatus !=','0');
		//$this->db->where('estatus','0');
		$this->db->where('t_ventas.id_tpoliza !=','5');

		$data1 = $this->db->get('public.t_ventas'); 

		//echo $this->db->last_query();

		if($data1->num_rows()>0)
		{
			 return $data1->result_array();
		}

	}
}
