<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');

class Polizas_model extends CI_Model{
    function __construct(){
        parent::__construct();
        $this->load->database();
    }    

    function anular($id){

		$data = array(
				'estatus_venta'=>'X'
			);

			$this->db->where('id_venta', $id);
			$this->db->update('t_ventas', $data);

			return "Venta Anulada";

	}

    function listvendedores() {

    	if ($this->session->userdata('rol')==3) {
		$this->db->where('id_coordinador',$this->session->userdata('id_usuario'));
		}

		$this->db->where('estatus','0');


		$listusuarios = $this->db->get('public.t_vendedores');

		
		if($listusuarios->num_rows()>0)
		{
			return $listusuarios->result_array();
		}
    }

    function buscartomador($n,$c) {
		
		$cedula = $n.'-'.$c;

		$this->db->select('nombres, apellidos, correo, telefono, tedad');
		$this->db->where('identificacion',$cedula);

		//echo $this->db->last_query();
		
		$listusuarios = $this->db->get('public.t_tomadores');

		
		if($listusuarios->num_rows()>0)
		{
			return $listusuarios->row_array();
		} else{
			return false;
		}
    }

    function buscarSolicitud($nsol)
    {
    	$this->db->select('solicitud');
		$this->db->where('solicitud',$nsol);
		$this->db->where('estatus_venta !=','X');

		$var = $this->db->get('public.t_ventas');

		//echo $this->db->last_query();

		if($var->num_rows()>0)
			return "existe";
		else
			return "no";

    }

	function editar($tpoliza,$plan,$cobertura,$suma,$id_poliza,$fecha,$usuario){


		  	$data = array(
			'id_tpoliza'=>$tpoliza,
			'id_plan'=>$plan,	
			'cobertura'=>$cobertura,	
			'suma'=>$suma,	
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
		$this->db->where('t_polizas.estatus','0');
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
		$this->db->select('id_venta, t_tomadores.identificacion, nsem, desde, hasta, referencia_pago, monto, cuotas_canceladas, t_ventas.fecha_registro, t_tomadores.nombres, t_tomadores.apellidos, t_tomadores.telefono, t_tomadores.correo, tplan, cobertura, tpoliza, tpago, tventa, estatus_venta, solicitud');
		$this->db->join('t_tomadores','t_tomadores.id_tomador = t_ventas.id_tomador','left');
		$this->db->join('t_plan','t_plan.id_tplan = t_ventas.id_plan','left');
		$this->db->join('t_polizas','t_polizas.id_poliza = t_ventas.id_poliza','left');
		$this->db->join('t_tpoliza','t_tpoliza.id_tpoliza = t_ventas.id_tpoliza','left');
		$this->db->join('t_tpago','t_tpago.id_tpago = t_ventas.tipo_pago','left');
		$this->db->join('t_semanas','t_semanas.id_semana = t_ventas.id_semana','left');

		if ($this->session->userdata('rol')==3) {
			$this->db->join('t_vendedores','t_ventas.id_vendedor = t_vendedores.id_vendedor');
			$this->db->where('t_vendedores.id_coordinador', $this->session->userdata('id_usuario'));
		}

			//$this->db->where('t_vendedores.estatus', '0');


		$listusuarios = $this->db->get('public.t_ventas');

		if($listusuarios->num_rows()>0)
		{
			 return $listusuarios->result_array();
		}
	}

	function contar_adicionales($id){

		$this->db->select('COUNT(*) as total');
		$this->db->where('id_venta',$id);
		$adicionales_count = $this->db->get('public.t_adicionales');

		//echo $this->db->last_query().";";

		return $adicionales_count->row()->total;
	}

	function listventas2($f)
	{
		$this->db->select('id_venta, t_tomadores.identificacion, nsem, desde, hasta, referencia_pago, monto, cuotas_canceladas, t_ventas.fecha_registro, t_tomadores.nombres, t_tomadores.apellidos, t_tomadores.telefono, t_tomadores.correo, tplan, cobertura, tpoliza, tpago, tventa, estatus_venta, concepto, solicitud, t_vendedores.nombres as namev, t_vendedores.apellidos as apev, t_vendedores.id_vendedor');
		$this->db->join('t_vendedores','t_vendedores.id_vendedor = t_ventas.id_vendedor','left');
		$this->db->join('t_tomadores','t_tomadores.id_tomador = t_ventas.id_tomador','left');
		$this->db->join('t_plan','t_plan.id_tplan = t_ventas.id_plan','left');
		$this->db->join('t_polizas','t_polizas.id_poliza = t_ventas.id_poliza','left');
		$this->db->join('t_tpoliza','t_tpoliza.id_tpoliza = t_ventas.id_tpoliza','left');
		$this->db->join('t_tpago','t_tpago.id_tpago = t_ventas.tipo_pago','left');
		$this->db->join('t_semanas','t_semanas.id_semana = t_ventas.id_semana','left');
		$this->db->join('t_concepto','t_concepto.id_concepto = t_ventas.tventa','left');
		$this->db->where('t_ventas.fecha_registro', $f);
		$this->db->order_by('t_vendedores.id_vendedor','ASC');


		$listusuarios = $this->db->get('public.t_ventas');

		//echo $this->db->last_query();

		if($listusuarios->num_rows()>0)
		{
			 return $listusuarios->result_array();
		}
	}

	function listventas3($f)
	{
		$this->db->select('id_venta, t_tomadores.identificacion, nsem, desde, hasta, referencia_pago, monto, cuotas_canceladas, t_ventas.fecha_registro, t_tomadores.nombres, t_tomadores.apellidos, tplan, cobertura, tpoliza, tpago, tventa, estatus_venta, concepto, solicitud, desde, hasta');
		$this->db->join('t_vendedores','t_vendedores.id_vendedor = t_ventas.id_vendedor','left');
		$this->db->join('t_tomadores','t_tomadores.id_tomador = t_ventas.id_tomador','left');
		$this->db->join('t_plan','t_plan.id_tplan = t_ventas.id_plan','left');
		$this->db->join('t_polizas','t_polizas.id_poliza = t_ventas.id_poliza','left');
		$this->db->join('t_tpoliza','t_tpoliza.id_tpoliza = t_ventas.id_tpoliza','left');
		$this->db->join('t_tpago','t_tpago.id_tpago = t_ventas.tipo_pago','left');
		$this->db->join('t_semanas','t_semanas.id_semana = t_ventas.id_semana','left');
		$this->db->join('t_concepto','t_concepto.id_concepto = t_ventas.tventa','left');
		$this->db->where('t_ventas.estatus_venta', 'D');
		$this->db->where('t_vendedores.cod_vendedor', $f);
		$this->db->order_by('t_ventas.id_semana','ASC');


		$listusuarios = $this->db->get('public.t_ventas');

		//echo $this->db->last_query();

		if($listusuarios->num_rows()>0)
		{
			 return $listusuarios->result_array();
		}
	}

	function listventasd()
	{
		$this->db->select('id_venta, t_tomadores.identificacion, nsem, desde, hasta, referencia_pago, monto, cuotas_canceladas, t_ventas.fecha_registro, t_tomadores.nombres, t_tomadores.apellidos, t_tomadores.telefono, t_tomadores.correo, tplan, cobertura, tpoliza, tpago, tventa, estatus_venta');
		$this->db->join('t_tomadores','t_tomadores.id_tomador = t_ventas.id_tomador','left');
		$this->db->join('t_plan','t_plan.id_tplan = t_ventas.id_plan','left');
		$this->db->join('t_polizas','t_polizas.id_poliza = t_ventas.id_poliza','left');
		$this->db->join('t_tpoliza','t_tpoliza.id_tpoliza = t_ventas.id_tpoliza','left');
		$this->db->join('t_tpago','t_tpago.id_tpago = t_ventas.tipo_pago','left');
		$this->db->join('t_semanas','t_semanas.id_semana = t_ventas.id_semana','left');

		if ($this->session->userdata('rol')==3) {
			$this->db->join('t_vendedores','t_ventas.id_vendedor = t_vendedores.id_vendedor');
			$this->db->where('t_vendedores.id_coordinador', $this->session->userdata('id_usuario'));
		}

		$this->db->where('t_ventas.estatus_venta', 'D');



		$listusuarios = $this->db->get('public.t_ventas');

		//echo $this->db->last_query();


		if($listusuarios->num_rows()>0)
		{
			 return $listusuarios->result_array();
		}
	}

	function buscarventa($id)
	{
		$this->db->select('id_venta, tipo_pago, referencia_pago, monto, cuotas_canceladas, solicitud, t_tomadores.identificacion, t_tomadores.nombres, t_tomadores.apellidos, t_tomadores.telefono, t_tomadores.correo, usuario, tplan, cobertura, suma, num_poliza, tpoliza, factor, tpago, desde, hasta, observaciones, nsem, t_vendedores.nombres as name_vendedor, t_vendedores.apellidos as lastname_vendedor, cod_vendedor, tventa, tedad');
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
		$this->db->where('estatus','0');
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
		$this->db->where('estatus', '0');
		$this->db->order_by('id_tpago', 'asc');
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
			'id_usuario'=>$usuario,
			);


			$this->db->insert('public.t_polizas',$data);


			$retorno="Poliza Creada";


			return $retorno;

	}

	function guardar_venta($nac,$cedula,$rpago,$monto,$ccancelada,$nombres,$apellidos,$tplan,$cobertura,$tpoliza,$tpago,$tedad, $fecha,$usuario,$tventa,$nsolicitud,$correo,$telefono,$cod_vendedor,$adicionales,$ad_nac,$ad_cedula,$ad_name,$ad_edad,$ad_parent){ 

		if ($rpago=="") $rpago="0";
		if ($ccancelada=="") $ccancelada="0";
		if ($monto=="") $monto="0";
		if ($nsolicitud=="") $nsolicitud="0";

		$identificacion=$nac.'-'.$cedula;
		
		if($tpago==2) $estatus = "D";
		else $estatus = "A";


	$q = $this->db->query("SELECT id_tomador FROM t_tomadores WHERE identificacion='".$nac."-".$cedula."'");
		  $count = $q->num_rows(); 

		 $id_tomador = $q->row()->id_tomador;

	if (($tventa==1) OR ($tventa==2)) {

		  if($count==0){


			$data = array(
				'nombres'=>$nombres,
				'apellidos'=>$apellidos,
				'identificacion'=>$identificacion,
				'correo'=>$correo,
				'telefono'=>$telefono,
				'usuario'=>$usuario,
				'tedad'=>$tedad,
			);


			$this->db->insert('public.t_tomadores',$data);
			$id_tomador =  $this->db->insert_id(); 


		}
	}

			$this->db->where('estatus !=','1');
			$sem = $this->db->get('public.t_semanas');

	if ($tventa==1) {
		
				$data = array(
				'tventa'=>$tventa,
				'solicitud'=>$nsolicitud,
				'referencia_pago'=>$rpago,
				'monto'=>$monto,
				'cuotas_canceladas'=>$ccancelada,
				'id_plan'=>$tplan,
				'id_poliza'=>$cobertura,
				'id_tpoliza'=>$tpoliza,
				'id_tomador'=>$id_tomador,
				'tipo_pago'=>$tpago,
				'id_vendedor'=>$cod_vendedor,
				'id_usuario'=>$usuario,
				'id_semana'=>$sem->row()->id_semana,
				'id_sem'=>$sem->row()->id_semana,
				'estatus_venta'=>$estatus,
				'fecha_registro'=>date('Y-m-d'),
			);

	}
	elseif ($tventa==2) {
		$data = array(
				'tventa'=>$tventa,
				'solicitud'=>$nsolicitud,
				'referencia_pago'=>$rpago,
				'monto'=>$monto,
				'cuotas_canceladas'=>$ccancelada,
				'id_tomador'=>$id_tomador,
				'tipo_pago'=>$tpago,
				'id_vendedor'=>$cod_vendedor,
				'id_usuario'=>$usuario,
				'id_semana'=>$sem->row()->id_semana,
				'id_sem'=>$sem->row()->id_semana,
				'estatus_venta'=>$estatus,

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
			);
		 if ($id_tomador>0)
		 {
		 	$this->db->where('id_tomador', $id_tomador);
		 	$this->db->update('t_tomadores', $data);
		 }else{
		 	$data = array(
				'identificacion'=>$identificacion,
				'nombres'=>$nombres,
				'apellidos'=>$apellidos,
				'correo'=>$correo,
				'telefono'=>$telefono,
				'usuario'=>$usuario,
			);
			$this->db->insert('public.t_tomadores',$data);	
		 	$id_tomador =  $this->db->insert_id();

		 }


		$data = array(
				'tventa'=>$tventa,
				'solicitud'=>$nsolicitud,
				'id_tomador'=>$id_tomador,
				'tipo_pago'=>$tpago,
				'id_vendedor'=>$cod_vendedor,
				'id_usuario'=>$usuario,
				'id_semana'=>$sem->row()->id_semana,
				'id_sem'=>$sem->row()->id_semana,
				'estatus_venta'=>$estatus,
			);

	}

	
	$this->db->insert('public.t_ventas',$data);	
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
				'usuario'=>$usuario
			);

			$this->db->insert('public.t_adicionales',$data);
			$i++;


				}

			}

			$retorno="Poliza Vendida";

			return $retorno;

	}

	function procesar($id,$estatus){
		$this->db->where('estatus !=','1');
		$sem = $this->db->get('public.t_semanas');

		$data = array(
				'estatus_venta'=>$estatus,
				'id_sem'=>$sem->row()->id_semana,
			);

		 	$this->db->where('id_venta', $id);
		 	$this->db->update('t_ventas', $data);

		 	return "Operacion realizada con exito";
	}

	public function getVendedoresVentasPolizas($semana, $vendedor = 'vendedores', $estatus_venta = 'A'){
		if (!is_string($vendedor)) {
			if ($semana) {
				$this->db->where('id_semana', $semana);
			}
			
			$this->db->where('vendedores_ventas_detalles.cod_vendedor', $vendedor);
			$this->db->where('estatus_venta', $estatus_venta);
			
			if ($this->session->userdata('rol')==3) {
				$this->db->where('id_coordinador',$this->session->userdata('id_usuario'));
			}

			$this->db->join('t_vendedores', 'vendedores_ventas_detalles.id_vendedor = t_vendedores.id_vendedor');
			$list_ventas_vendedores = $this->db->get('public.vendedores_ventas_detalles');
		}else{
			$this->db->where('id_semana',$semana);
			$this->db->where('estatus_venta', $estatus_venta);
			
			if ($this->session->userdata('rol')==3) {
				$this->db->where('id_coordinador',$this->session->userdata('id_usuario'));
			}

			$this->db->join('t_vendedores', 'vendedores_ventas_detalles.id_vendedor = t_vendedores.id_vendedor');
			$list_ventas_vendedores = $this->db->get('public.vendedores_ventas_detalles');
		}

		return $list_ventas_vendedores->result_array();
	}

	public function calculoComisionBase($ventas, $individual){
		if ($individual == 0) {

			$adicionales_ventas = $this->adicionalesVentasTotal($ventas);
			$cantidad_polizas_vendidas = count($ventas);

			for ($i=0; $i < count($ventas); $i++) { 

				//Obtener la poliza, cobertura y plan para poder manipular la suma asegurada
				$this->db->where('polizas_plan_coberturas.id_poliza', $ventas[$i]['id_poliza']);
				$this->db->where('polizas_plan_coberturas.id_plan_poliza', $ventas[$i]['id_plan']);
				$this->db->where('polizas_plan_coberturas.id_cobertura_poliza',$ventas[$i]['id_cobertura']);
				$poliza['poliza'] = $this->db->get('public.polizas_plan_coberturas')->result_array()[0];

				$this->db->where('t_adicionales.id_venta',$ventas[$i]['id_venta']);
				$adicionales_venta = $this->db->get('public.t_adicionales')->result_array();

				$poliza['poliza']['poliza_adicional_familiar'] = count($adicionales_venta);
				$poliza['poliza']['tipo_venta'] = $ventas[$i]['tipo_venta'];

				$poliza['poliza']['coutas_pagadas_poliza'] = $ventas[$i]['cuotas_canceladas'];

				//Primas Anuales y Mensual
				if ($poliza['poliza']['id_poliza'] == 5) {
					$poliza['poliza']['edad_tomador'] = intval($ventas[$i]['edad_tomador']);

					$this->db->where('t_factor_edad.edad', $poliza['poliza']['edad_tomador']);
					$factor_edad = $this->db->get('public.t_factor_edad')->result_array();

					$poliza['poliza']['factor_poliza'] = $factor_edad[0]['factor'];

				}
				
				$poliza['poliza']['prima_anual'] = round(($poliza['poliza']['suma_poliza'] * $poliza['poliza']['factor_poliza'])/1000, 2);
				$poliza['poliza']['prima_mensual'] = round($poliza['poliza']['prima_anual']/12, 2);

				$planes_comision = $this->db->get('public.t_plan_comision')->result_array();

				switch ($ventas[$i]['tipo_venta']) {
					case 1:
						$this->db->where('t_comisiones.id_tcomision', 1);
						$this->db->where('t_comisiones.id_basec', 1);
						$this->db->where('t_comisiones.estatus', 0);
						$t_comision = $this->db->get('public.t_comisiones')->result_array();
						break;
	
					case 2:
						$this->db->where('t_comisiones.id_tcomision', 2);
						$this->db->where('t_comisiones.id_basec', 3);
						$this->db->where('t_comisiones.estatus', 0);
						$t_comision = $this->db->get('public.t_comisiones')->result_array();
						break;
	
					case 3:
						$this->db->where('t_comisiones.id_tcomision', 3);
						$this->db->where('t_comisiones.id_basec', 3);
						$this->db->where('t_comisiones.estatus', 0);
						$t_comision = $this->db->get('public.t_comisiones')->result_array();
						break;
				}

				for ($j=0; $j < count($t_comision); $j++) { 
					if ($cantidad_polizas_vendidas >= $t_comision[$j]['min']) {
						$t_comision_venta = $t_comision[$j];
					}
				}

				switch ($t_comision_venta['id_basec']) {
					case 1:
						$porcentaje = (intval($t_comision_venta['cuota'])/100);
						$poliza['poliza']['comision_base'] = round(($poliza['poliza']['prima_mensual'] * $porcentaje), 2);
						break;
					
					case 3:
						$poliza['poliza']['comision_base'] = $t_comision_venta['cuota'];
						break;
				}

				$calculos = $this->preprocesarComision($poliza);
				$poliza['poliza']['comision_preprocesada'] = $calculos['poliza']['comision_preprocesada'];
				$ventas[$i]['comision_preprocesada'] = $poliza['poliza']['comision_preprocesada'];
			}

			$comision_total = 0;

			for ($i=0; $i < count($ventas); $i++) { 
				$comision_total += $ventas[$i]['comision_preprocesada'];
			}

			$comision_total = round($comision_total, 2);
			return $comision_total;

		}else{
			$adicionales_ventas = $this->adicionalesVentasTotal($ventas);

			$this->db->where('polizas_plan_coberturas.id_poliza', $ventas['id_poliza']);
			$this->db->where('polizas_plan_coberturas.id_plan_poliza', $ventas['id_plan']);
			$this->db->where('polizas_plan_coberturas.id_cobertura_poliza',$ventas['id_cobertura']);
			$poliza['poliza'] = $this->db->get('public.polizas_plan_coberturas')->result_array()[0];

			$this->db->where('t_adicionales.id_venta',$ventas['id_venta']);
			$adicionales_venta = $this->db->get('public.t_adicionales')->result_array();

			$poliza['poliza']['poliza_adicional_familiar'] = count($adicionales_venta);
			$poliza['poliza']['tipo_venta'] = $ventas['tipo_venta'];
			$poliza['poliza']['coutas_pagadas_poliza'] = $ventas['cuotas_canceladas'];

			//Primas Anuales y Mensual
			if ($poliza['poliza']['id_poliza'] == 5) {
				$poliza['poliza']['edad_tomador'] = intval($ventas['edad_tomador']);

				$this->db->where('t_factor_edad.edad', $poliza['poliza']['edad_tomador']);
				$factor_edad = $this->db->get('public.t_factor_edad')->result_array();

				$poliza['poliza']['factor_poliza'] = $factor_edad[0]['factor'];

			}

			$poliza['poliza']['prima_anual'] = round(($poliza['poliza']['suma_poliza'] * $poliza['poliza']['factor_poliza'])/1000, 2);
			$poliza['poliza']['prima_mensual'] = round($poliza['poliza']['prima_anual']/12, 2);

			$planes_comision = $this->db->get('public.t_plan_comision')->result_array();

			switch ($ventas['tipo_venta']) {
				case 1:
					$this->db->where('t_comisiones.id_tcomision', 1);
					$this->db->where('t_comisiones.id_basec', 1);
					$this->db->where('t_comisiones.estatus', 0);
					$t_comision = $this->db->get('public.t_comisiones')->result_array();
					break;

				case 2:
					$this->db->where('t_comisiones.id_tcomision', 2);
					$this->db->where('t_comisiones.id_basec', 3);
					$this->db->where('t_comisiones.estatus', 0);
					$t_comision = $this->db->get('public.t_comisiones')->result_array();
					break;

				case 3:
					$this->db->where('t_comisiones.id_tcomision', 3);
					$this->db->where('t_comisiones.id_basec', 3);
					$this->db->where('t_comisiones.estatus', 0);
					$t_comision = $this->db->get('public.t_comisiones')->result_array();
					break;
			}

			for ($j=0; $j < count($t_comision); $j++) { 
				if ($ventas['cantidad_cobertura'] >= $t_comision[$j]['min']) {
					$t_comision_venta = $t_comision[$j];
				}
			}

			switch ($t_comision_venta['id_basec']) {
				case 1:
					$porcentaje = (intval($t_comision_venta['cuota'])/100);
					$poliza['poliza']['comision_base'] = round(($poliza['poliza']['prima_mensual'] * $porcentaje), 2);
					break;
				
				case 3:
					$poliza['poliza']['comision_base'] = $t_comision_venta['cuota'];
					break;
			}

			$calculos = $this->preprocesarComision($poliza);
			$poliza['poliza']['comision_preprocesada'] = $calculos['poliza']['comision_preprocesada'];
			$ventas['comision_preprocesada'] = $poliza['poliza']['comision_preprocesada'];
			$comision_total = round($poliza['poliza']['comision_preprocesada'], 2);
			
			$datos_retorno['comision_total'] = $comision_total;
			$datos_retorno['prima_mensual'] = $poliza['poliza']['prima_mensual'];
			$datos_retorno['suma_asegurada'] = $poliza['poliza']['suma_poliza'];
			$datos_retorno['vendedor_data'] = $ventas['vendedor_data'];

			$t_comision_coordinador = $this->db->get('public.t_ccoordinador')->result_array()[0]['comision_c'];
			$datos_retorno['comision_coordinador'] = $datos_retorno['comision_total'] * ($t_comision_coordinador/100);


			return $datos_retorno;
		}
	}

	public function adicionalesVentasTotal($ventas){
		$total_ventas_adicionales = 0;

		for ($i=0; $i < count($ventas); $i++) { 
			$this->db->where('t_adicionales.id_venta',$ventas[$i]['id_venta']);
			$adicionales_venta = $this->db->get('public.t_adicionales')->result_array();

			$total_ventas_adicionales = $total_ventas_adicionales + count($adicionales_venta);
		}

		return $total_ventas_adicionales;
	}

	public function preprocesarComision($poliza){
		$this->db->where('t_comisiones.id_tcomision',intval($poliza['poliza']['tipo_venta']));
		$this->db->where('t_comisiones.id_basec', 2);
		$t_comision = $this->db->get('public.t_comisiones')->result_array();

		for ($j=0; $j < count($t_comision); $j++) { 
			if (intval($poliza['poliza']['coutas_pagadas_poliza']) >= $t_comision[$j]['min']) {
				$t_comision_venta = $t_comision[$j];
			}
		}

		if (count($t_comision_venta)) {
			$porcentaje_cuotas = $poliza['poliza']['comision_base'] * ($t_comision_venta['cuota']/100);
			$poliza['poliza']['comision_preprocesada'] = round($poliza['poliza']['comision_base'] + $porcentaje_cuotas, 2); 

		}else{
			$poliza['poliza']['comision_preprocesada'] = round($poliza['poliza']['comision_base'], 2);
		}

		if ($poliza['poliza']['poliza_adicional_familiar'] > 0) {
			$this->db->where('t_concepto.concepto', 'Por personas adicionales');
			$t_concepto = $this->db->get('public.t_concepto')->result_array();

			$this->db->where('t_comisiones.id_tcomision', $t_concepto[0]['id_concepto']);
			$this->db->where('t_comisiones.id_basec', 3);
			$this->db->where('t_comisiones.estatus', 0);
			$t_comision = $this->db->get('public.t_comisiones')->result_array();

			$poliza['poliza']['comision_preprocesada'] = $poliza['poliza']['comision_preprocesada'] + ($t_comision[0]['cuota'] * $poliza['poliza']['poliza_adicional_familiar']);
		}

		return $poliza;
	}

	public function getVendedoresData($cod_vendedores){
		$this->db->where_in('t_vendedores.cod_vendedor', $cod_vendedores);
		$vendedores_data = $this->db->get('public.t_vendedores')->result_array();
		return $vendedores_data;
	}

	public function getSemanaDetalle($numero_semana = 0, $buscar_id = 0){
		if ($buscar_id == 1) {
			$this->db->order_by('id_semana','desc');
			$this->db->limit(1);
			$this->db->where('t_semanas.estatus', 1);
			$this->db->where('t_semanas.nsem', $numero_semana);
			$semana_detalle = $this->db->get('public.t_semanas')->result_array();


			if (!count($semana_detalle)) {
				$this->db->order_by('id_semana','desc');
				$this->db->where('t_semanas.estatus', 1);
				$this->db->where('t_semanas.id_semana', $numero_semana);
				$semana_detalle = $this->db->get('public.t_semanas')->result_array();
			}

			return $semana_detalle;
		}else{
			$this->db->order_by('id_semana','desc');
			//$this->db->limit(1);
			$this->db->where('t_semanas.estatus', 1);
			$semana_detalle = $this->db->get('public.t_semanas')->result_array();
			
			if (!count($semana_detalle)) {
				$semana_detalle = 'No hay ventas con semanas cerradas';	
			}

			return $semana_detalle;
		}

	}

	public function anularVenta($vendedor_id, $venta_id){
		$data = array(
			'estatus_venta' => 'X'
		);
		
		$this->db->where('t_ventas.id_vendedor', $vendedor_id);
		$this->db->where('t_ventas.id_venta', $venta_id);
		$semana_detalle = $this->db->update('t_ventas', $data);

		return array(
			'mensaje' => 'Anulada con exito',
			'tipo' => 'success'
		);
	}

	public function preliquidacion($ventas){
		for ($i=0; $i < count($ventas); $i++) { 

			$data = array(
				'estatus_venta' => 'P'
			);
			
			$this->db->where('t_ventas.id_vendedor', $ventas[$i]['id_vendedor']);
			$this->db->where('t_ventas.id_venta', $ventas[$i]['id_venta']);
			$semana_detalle = $this->db->update('t_ventas', $data);
		}
		
		return array(
			'mensaje' => 'Venta preliquidada con exito',
			'tipo' => 'success'
		);
	}

	public function liquidacion($ventas){

		for ($i=0; $i < count($ventas); $i++) { 

			$this->db->where('t_extornos.id_vendedor', intval($ventas[$i]['id_vendedor']));
			$this->db->where('t_extornos.id_estatus =', 0);
			$get_extornos = $this->db->get('public.t_extornos')->result_array();
			
			$data = array(
				'estatus_venta' => 'L'
			);

			$this->db->where('t_ventas.id_vendedor', $ventas[$i]['id_vendedor']);
			$this->db->where('t_ventas.id_venta', $ventas[$i]['id_venta']);
			$update_ventas = $this->db->update('t_ventas', $data);

			if (count($get_extornos)) {
				for ($j=0; $j < count($get_extornos); $j++) { 
					if (is_null($get_extornos[$j]['monto_fraccionado'])) {
						if ($get_extornos[$j]['monto_extornable'] > $ventas[$i]['comision_total']) {
							$get_extornos[$j]['monto_extornable'] = $get_extornos[$j]['monto_extornable'] - $ventas[$i]['comision_total'];
							$ventas[$i]['comision_total'] = $ventas[$i]['comision_total'] - $ventas[$i]['comision_total'];
						}else{
							$ventas[$i]['comision_total'] = $ventas[$i]['comision_total'] - $get_extornos[$j]['monto_extornable'];
							$get_extornos[$j]['monto_extornable'] = $get_extornos[$j]['monto_extornable'] - $get_extornos[$j]['monto_extornable'];
						}
	
						if ($get_extornos[$j]['monto_extornable'] == 0) {
	
							$data_extorno = array(
								'id_estatus' => 1
							);
	
							$this->db->where('t_extornos.id_vendedor', $ventas[$i]['id_vendedor']);
							$update_ventas = $this->db->update('t_extornos', $data);
						}else{
							$data_extorno = array(
								'monto_fraccionado' => $get_extornos[$j]['monto_extornable']
							);
	
							$this->db->where('t_extornos.id_vendedor', $ventas[$i]['id_vendedor']);
							$update_ventas = $this->db->update('t_extornos', $data_extorno);
						}					
					}else{
						if ($get_extornos[$j]['monto_fraccionado'] > $ventas[$i]['comision_total']) {
							$get_extornos[$j]['monto_fraccionado'] = $get_extornos[$j]['monto_fraccionado'] - $ventas[$i]['comision_total'];
							$ventas[$i]['comision_total'] = $ventas[$i]['comision_total'] - $ventas[$i]['comision_total'];
						}else{
							$ventas[$i]['comision_total'] = $ventas[$i]['comision_total'] - $get_extornos[$j]['monto_fraccionado'];
							$get_extornos[$j]['monto_fraccionado'] = $get_extornos[$j]['monto_fraccionado'] - $get_extornos[$j]['monto_fraccionado'];
						}

						if ($get_extornos[$j]['monto_fraccionado'] == 0) {
							if ($get_extornos[$j]['monto_extornable'] > $ventas[$i]['comision_total']) {
								$get_extornos[$j]['monto_extornable'] = $get_extornos[$j]['monto_extornable'] - $ventas[$i]['comision_total'];
								$ventas[$i]['comision_total'] = $ventas[$i]['comision_total'] - $ventas[$i]['comision_total'];
							}else{
								$ventas[$i]['comision_total'] = $ventas[$i]['comision_total'] - $get_extornos[$j]['monto_extornable'];
								$get_extornos[$j]['monto_extornable'] = $get_extornos[$j]['monto_extornable'] - $get_extornos[$j]['monto_extornable'];
							}
		
							if ($get_extornos[$j]['monto_extornable'] == 0) {
		
								$data_extorno = array(
									'id_estatus' => 1
								);
		
								$this->db->where('t_extornos.id_vendedor', $ventas[$i]['id_vendedor']);
								$update_ventas = $this->db->update('t_extornos', $data_extorno);
							}
						}
					}
				}
			}
		

			$data = array(
				'id_vendedor'=> $ventas[$i]['id_vendedor'],
				'id_venta'=> $ventas[$i]['id_venta'],	
				'id_semana'=> $ventas[$i]['id_semana'],	
				'comision_liquidada' => $ventas[$i]['comision_total'],
				'comision_coordinador' => $ventas[$i]['comision_coordinador']
			);
	
			$this->db->insert('public.t_liquidacion',$data);
		}

		return array(
			'mensaje' => 'Venta liquidada con exito',
			'tipo' => 'success'
		);
	}
}
