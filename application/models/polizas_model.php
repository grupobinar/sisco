<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');

class Polizas_model extends CI_Model{
    function __construct(){
        parent::__construct();
        $this->load->database();
    }    

    function listvendedores() {

    	if ($this->session->userdata('rol')<>2) {
		$this->db->where('id_coordinador',$this->session->userdata('id_usuario'));
		}

		$listusuarios = $this->db->get('public.t_vendedores');

		
		if($listusuarios->num_rows()>0)
		{
			return $listusuarios->result_array();
		}
    }

    function buscartomador($n,$c) {
		
		$cedula = $n.'-'.$c;

		$this->db->select('nombres, apellidos, correo, telefono');
		$this->db->where('identificacion',$cedula);
		$listusuarios = $this->db->get('public.t_tomadores');

		
		if($listusuarios->num_rows()>0)
		{
			return $listusuarios->row_array();
		} else{
			return false;
		}
    }

	function editar($tpoliza,$plan,$cobertura,$suma,$id_poliza,$fecha,$usuario){


		  	$data = array(
			'id_tpoliza'=>$tpoliza,
			'id_plan'=>$plan,	
			'cobertura'=>$cobertura,	
			'suma'=>$suma,	
			'ult_mod'=>$fecha,
			'id_usuario'=>$usuario,
			);


			$this->db->where('id_poliza', $id_poliza);
			$this->db->update('t_polizas', $data);

			

			$retorno="Usuario Modificado";


			return $retorno;

	}

	function desactivarPoliza($id_poliza){


		  	$data = array(
				'estatus'=>'1'
			);

			$this->db->where('id_poliza', $id_poliza);
			$this->db->update('t_polizas', $data);


	}
	
	
	function listpoliza()
	{
		$this->db->join('t_tpoliza','t_tpoliza.id_tpoliza = t_polizas.id_tpoliza');
		$this->db->join('t_plan','t_plan.id_tplan = t_polizas.id_plan');
		$this->db->where('estatus','0');
		$listusuarios = $this->db->get('public.t_polizas');

		//echo $this->db->last_query();	


		if($listusuarios->num_rows()>0)
		{
			return $listusuarios->result();
		}

	}

	function listadicionales($id)
	{
		$this->db->where('id_venta',$id);
		$this->db->join('t_parentesco','t_parentesco.id_parentesco = t_adicionales.id_parentesco');
		$listusuarios = $this->db->get('public.t_adicionales');

		//echo $this->db->last_query();	


		if($listusuarios->num_rows()>0)
		{
			return $listusuarios->result_array();
		}

	}

	function listventas()
	{
		$this->db->select('id_venta, identificacion, nsem, desde, hasta, referencia_pago, monto, cuotas_canceladas, t_ventas.fecha_registro, nombres, apellidos, telefono, correo, tplan, cobertura, tpoliza, tpago');
		$this->db->join('t_tomadores','t_tomadores.id_tomador = t_ventas.id_tomador','left');
		$this->db->join('t_plan','t_plan.id_tplan = t_ventas.id_plan','left');
		$this->db->join('t_polizas','t_polizas.id_poliza = t_ventas.id_poliza','left');
		$this->db->join('t_tpoliza','t_tpoliza.id_tpoliza = t_ventas.id_tpoliza','left');
		$this->db->join('t_tpago','t_tpago.id_tpago = t_ventas.tipo_pago','left');
		$this->db->join('t_semanas','t_semanas.id_semana = t_ventas.id_semana','left');
		$listusuarios = $this->db->get('public.t_ventas');


		if($listusuarios->num_rows()>0)
		{
			 return $listusuarios->result_array();
		}

	}

	function buscarventa($id)
	{
		$this->db->select('id_venta, tipo_pago, referencia_pago, monto, cuotas_canceladas, solicitud, t_tomadores.identificacion, t_tomadores.nombres, t_tomadores.apellidos, t_tomadores.telefono, t_tomadores.correo, usuario, tplan, cobertura, suma, num_poliza, tpoliza, factor, tpago, desde, hasta, observaciones, nsem, t_vendedores.nombres as name_vendedor, t_vendedores.apellidos as lastname_vendedor, cod_vendedor');
		$this->db->join('t_tomadores','t_tomadores.id_tomador = t_ventas.id_tomador','left');
		$this->db->join('t_plan','t_plan.id_tplan = t_ventas.id_plan','left');
		$this->db->join('t_polizas','t_polizas.id_poliza = t_ventas.id_poliza','left');
		$this->db->join('t_tpoliza','t_tpoliza.id_tpoliza = t_ventas.id_tpoliza','left');
		$this->db->join('t_tpago','t_tpago.id_tpago = t_ventas.tipo_pago','left');
		$this->db->join('t_semanas','t_semanas.id_semana = t_ventas.id_semana','left');
		$this->db->join('t_vendedores','t_vendedores.id_vendedor = t_ventas.id_vendedor','left');
		$this->db->where('id_venta',$id);

		$listusuarios = $this->db->get('public.t_ventas');


		if($listusuarios->num_rows()>0)
		{
			 return $listusuarios->row_array();
		}

	}

	function listtpoliza()
	{
		$this->db->order_by('id_tpoliza','desc');
		$listusuarios = $this->db->get('public.t_tpoliza');

		if($listusuarios->num_rows()>0)
		{
			return $listusuarios->result_array();
		}

	}

	function listcobertura()
	{
		$this->db->select('id_poliza, cobertura');
		$this->db->where('estatus','0');
		$listusuarios = $this->db->get('public.t_polizas');


		
		if($listusuarios->num_rows()>0)
		{
			return $listusuarios->result();
		}

	}

	function buscarCobertura($plan,$tpoliza)
	{
		$this->db->select('id_poliza, cobertura, num_poliza');
		$this->db->where('id_plan',$plan);
		$this->db->where('id_tpoliza',$tpoliza);
		$this->db->where('estatus','0');
		$listusuarios = $this->db->get('public.t_polizas');
		
		if($listusuarios->num_rows()>0)
		{
			return $listusuarios->result();
		}

	}

	function listtpago()
	{
		$this->db->select('id_tpago, tpago');
		$listusuarios = $this->db->get('public.t_tpago');

		
		if($listusuarios->num_rows()>0)
		{
			return $listusuarios->result();
		}

	}

	function listplan()
	{
		$this->db->order_by('id_tplan','desc');
		$listusuarios = $this->db->get('public.t_plan');


		
		if($listusuarios->num_rows()>0)
		{
			return $listusuarios->result_array();
		}

	}

	function listparent()
	{
		$listusuarios = $this->db->get('public.t_parentesco');


		if($listusuarios->num_rows()>0)
		{
			return $listusuarios->result_array();
		}

	}

	function buscarPoliza($id)
	{
		$this->db->join('t_tpoliza','t_tpoliza.id_tpoliza = t_polizas.id_tpoliza');
		$this->db->join('t_plan','t_plan.id_tplan = t_polizas.id_plan');
		$this->db->where('t_polizas.id_poliza',$id);
		$this->db->where('t_polizas.estatus','0');
		
		$listusuarios = $this->db->get('public.t_polizas');

		if($listusuarios->num_rows()>0)
		{
			return $listusuarios->row();
		}

	}

		function guardar($tpoliza,$plan,$cobertura,$suma,$fecha,$usuario){ 

		  	$data = array(
			'id_tpoliza'=>$tpoliza,
			'id_plan'=>$plan,	
			'cobertura'=>$cobertura,	
			'suma'=>$suma,	
			'ult_mod'=>$fecha,
			'id_usuario'=>$usuario,
			);


			$this->db->insert('public.t_polizas',$data);


			$retorno="Poliza Creada";


			return $retorno;

	}

	function guardar_venta($nac,$cedula,$rpago,$monto,$ccancelada,$nombres,$apellidos,$tplan,$cobertura,$tpoliza,$tpago,$fecha,$usuario,$tventa,$nsolicitud,$correo,$telefono,$cod_vendedor,$adicionales,$ad_nac,$ad_cedula,$ad_name,$ad_edad,$ad_parent){ 

	if ($tventa==1) {

		$q = $this->db->query("SELECT id_tomador FROM t_tomadores WHERE identificacion='".$nac."-".$cedula."'");
		  $count = $q->num_rows(); 

		 $id_tomador = $q->row()->id_tomador;

		  if($count==0){

		  	$identificacion=$nac.'-'.$cedula;

			$data = array(
				'nombres'=>$nombres,
				'apellidos'=>$apellidos,
				'identificacion'=>$identificacion,
				'correo'=>$correo,
				'telefono'=>$telefono,
				'usuario'=>$usuario,
				'fecha_registro'=>$fecha,
				'ult_mod'=>$fecha,
			);


			$this->db->insert('public.t_tomadores',$data);
			$id_tomador =  $this->db->insert_id(); 


		}
	}

			$this->db->where('estatus','0');
			$sem = $this->db->get('public.t_semanas');

	if ($tventa==1) {
				$data = array(
				'tventa'=>$tventa,
				'solicitud'=>$nsolicitud,
				'referencia_pago'=>$rpago,
				'monto'=>$monto,
				'cuotas_canceladas'=>$ccancelada,
				'fecha_registro'=>$fecha,
				'id_plan'=>$tplan,
				'id_poliza'=>$cobertura,
				'id_tpoliza'=>$tpoliza,
				'id_tomador'=>$id_tomador,
				'tipo_pago'=>$tpago,
				'id_vendedor'=>$cod_vendedor,
				'id_usuario'=>$usuario,
				'id_semana'=>$sem->row()->id_semana,
				'fecha_registro'=>$fecha,
				'ult_mod'=>$fecha,
			);

	}
	elseif ($tventa==2) {
		$data = array(
				'tventa'=>$tventa,
				'solicitud'=>$nsolicitud,
				'referencia_pago'=>$rpago,
				'monto'=>$monto,
				'cuotas_canceladas'=>$ccancelada,
				'fecha_registro'=>$fecha,
				'id_tomador'=>$id_tomador,
				'tipo_pago'=>$tpago,
				'id_vendedor'=>$cod_vendedor,
				'id_usuario'=>$usuario,
				'id_semana'=>$sem->row()->id_semana,
				'fecha_registro'=>$fecha,
				'ult_mod'=>$fecha,
			);

	}elseif ($tventa==3) {

		$q = $this->db->query("SELECT id_tomador FROM t_tomadores WHERE identificacion='".$nac."-".$cedula."'");
		  $count = $q->num_rows(); 

		 $id_tomador = $q->row()->id_tomador;

		 $data = array(
				'nombres'=>$nombres,
				'apellidos'=>$apellidos,
				'correo'=>$correo,
				'telefono'=>$telefono,
				'usuario'=>$usuario,
				'ult_mod'=>$fecha,
			);

		 $this->db->where('id_tomador', $id_tomador);
		 $this->db->update('t_tomadores', $data);


		$data = array(
				'tventa'=>$tventa,
				'solicitud'=>$nsolicitud,
				'fecha_registro'=>$fecha,
				'id_tomador'=>$id_tomador,
				'tipo_pago'=>$tpago,
				'id_vendedor'=>$cod_vendedor,
				'id_usuario'=>$usuario,
				'id_semana'=>$sem->row()->id_semana,
				'fecha_registro'=>$fecha,
				'ult_mod'=>$fecha,
			);

	}

	
	$this->db->insert('public.t_ventas',$data);

		 echo $this->db->last_query();
	
	$id_venta =  $this->db->insert_id();


	
		


			$i=0;
			if ($adicionales=='on') {
				foreach ($ad_nac as $key) {
				$identificacion_ad=$key.'-'.$ad_cedula[$i];

				$data = array(
				'identificacion'=>$identificacion_ad,
				'nombres'=>$ad_name[$i],
				'edad'=>$ad_edad[$i],
				'tomador'=>$identificacion,
				'id_venta'=>$id_venta,
				'id_parentesco'=>$ad_parent[$i],
				'usuario'=>$usuario,
				'fecha_registro'=>$fecha,
				'ult_mod'=>$fecha,
			);

			$this->db->insert('public.t_adicionales',$data);
			$i++;


				}

			}

			$retorno="Poliza Vendida";

			return $retorno;

	}

	public function calculoComisionBase(){
		//Obtener la poliza, cobertura y plan para poder manipular la suma asegurada
		$this->db->where('polizas_plan_cobertura.id_poliza',1);
		$this->db->where('polizas_plan_cobertura.id_plan_poliza',1);
		$this->db->where('polizas_plan_cobertura.id_cobertura_poliza',69);
		$poliza['poliza'] = $this->db->get('public.polizas_plan_cobertura')->result_array()[0];

		//Añadir la cantidad de ventas por cada poliza de dicho tipo.
		$poliza['poliza']['cantidad_poliza_vendidas'] = 6;

		//Primas Anuales y Mensual
		$poliza['poliza']['prima_anual'] = round(($poliza['poliza']['suma_poliza'] * $poliza['poliza']['factor_poliza'])/1000, 2);
		$poliza['poliza']['prima_mensual'] = round($poliza['poliza']['prima_anual']/12, 2);

		$planes_comision = $this->db->get('public.t_plan_comision')->result_array();
		
		
		switch (true) {
			case $poliza['poliza']['cantidad_poliza_vendidas'] > 0 && $poliza['poliza']['cantidad_poliza_vendidas'] < $planes_comision[1]['ventas_min']:
				$porcentaje = (80/100);
				$poliza['poliza']['comision_base'] = round(($poliza['poliza']['prima_mensual'] * $porcentaje)*$poliza['poliza']['cantidad_poliza_vendidas'], 2);
			break;

			case $poliza['poliza']['cantidad_poliza_vendidas'] < $planes_comision[2]['ventas_min']:
				$porcentaje = (100/100);
				$poliza['poliza']['comision_base'] = round(($poliza['poliza']['prima_mensual'] * $porcentaje)*$poliza['poliza']['cantidad_poliza_vendidas'], 2);
			break;

			case $poliza['poliza']['cantidad_poliza_vendidas'] >= $planes_comision[2]['ventas_min']:
				$porcentaje = (110/100);
				$poliza['poliza']['comision_base'] = round(($poliza['poliza']['prima_mensual'] * $porcentaje)*$poliza['poliza']['cantidad_poliza_vendidas'], 2);
			break;
		}

		echo '<pre>' . var_export($poliza, true) . '</pre>'; die();
	}
}