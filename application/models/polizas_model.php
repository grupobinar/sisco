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
			return $listusuarios->result();
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
			 return $listusuarios->result();
		}

	}

	function buscarventa($id)
	{
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
			 return $listusuarios->row();
		}

	}

	function listtpoliza()
	{
		$this->db->order_by('id_tpoliza','desc');
		$listusuarios = $this->db->get('public.t_tpoliza');


		
		if($listusuarios->num_rows()>0)
		{
			return $listusuarios->result();
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
			return $listusuarios->result();
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

			//break;


			$data = array(
				'tventa'=>$tventas,
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
				'fecha_registro'=>$fecha,
				'ult_mod'=>$fecha,
			);

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
				'id_usuario'=>$usuario,
				'fecha_registro'=>$fecha,
				'ult_mod'=>$fecha,
			);

			$this->db->insert('public.t_adicionales',$data);

				}
			}



			$retorno="Poliza Vendida";


		} else {

			$data = array(
				'referencia_pago'=>$rpago,
				'monto'=>$monto,
				'cuotas_canceladas'=>$ccancelada,
				'fecha_registro'=>$fecha,
				'tplan'=>$tplan,
				'cobertura'=>$cobertura,
				'tpoliza'=>$tpoliza,
				'id_tomador'=>$id_tomador,
				'tpago'=>$tpago,
			);

			$this->db->insert('public.t_ventas',$data);

			$retorno="Poliza Vendida";
		}

			return $retorno;

	}

	public function getVendedoresVentasPolizas($semana){
		$this->db->where('id_semana',$semana);
		$list_ventas_vendedores = $this->db->get('public.vendedores_ventas_detalles');

		return $list_ventas_vendedores->result_array();
	}

	public function calculoComisionBase($ventas){

		//Añadir la cantidad de ventas por cada poliza de dicho tipo. Y las personas adicionales. Defino tambien el tipo de ventas.
		$adicionales_ventas = $this->adicionalesVentasTotal($ventas);
		$cantidad_polizas_vendidas = count($ventas) + $adicionales_ventas;

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

			if ($poliza['poliza']['poliza_adicional_familiar'] > 0) {
				$cantidad_polizas_vendidas = $cantidad_polizas_vendidas + $poliza['poliza']['poliza_adicional_familiar'];
			}

			$poliza['poliza']['coutas_pagadas_poliza'] = $ventas[$i]['cuotas_canceladas'];

			//Primas Anuales y Mensual
			$poliza['poliza']['prima_anual'] = round(($poliza['poliza']['suma_poliza'] * $poliza['poliza']['factor_poliza'])/1000, 2);
			$poliza['poliza']['prima_mensual'] = round($poliza['poliza']['prima_anual']/12, 2);

			$planes_comision = $this->db->get('public.t_plan_comision')->result_array();

			switch (true) {
				case $cantidad_polizas_vendidas > 0 && $cantidad_polizas_vendidas < $planes_comision[1]['ventas_min']:
					$porcentaje = (80/100);
					$poliza['poliza']['comision_base'] = round(($poliza['poliza']['prima_mensual'] * $porcentaje), 2);
					$calculos = $this->preprocesarComision($poliza);
					$poliza['poliza']['comision_preprocesada'] = $calculos['poliza']['comision_preprocesada'];
					$ventas[$i]['comision_preprocesada'] = $poliza['poliza']['comision_preprocesada'];
				break;

				case $cantidad_polizas_vendidas < $planes_comision[2]['ventas_min']:
					$porcentaje = (100/100);
					$poliza['poliza']['comision_base'] = round(($poliza['poliza']['prima_mensual'] * $porcentaje), 2);
					$calculos = $this->preprocesarComision($poliza);
					$poliza['poliza']['comision_preprocesada'] = $calculos['poliza']['comision_preprocesada'];
					$ventas[$i]['comision_preprocesada'] = $poliza['poliza']['comision_preprocesada'];
				break;

				case $cantidad_polizas_vendidas >= $planes_comision[2]['ventas_min']:
					$porcentaje = (110/100);
					$poliza['poliza']['comision_base'] = round(($poliza['poliza']['prima_mensual'] * $porcentaje), 2);
					$calculos = $this->preprocesarComision($poliza);
					$poliza['poliza']['comision_preprocesada'] = $calculos['poliza']['comision_preprocesada'];
					$ventas[$i]['comision_preprocesada'] = $poliza['poliza']['comision_preprocesada'];
				break;
			}
		}

		$comision_total = 0;

		for ($i=0; $i < count($ventas); $i++) { 
			$comision_total += $ventas[$i]['comision_preprocesada'];
		}

		$comision_total = round($comision_total, 2);
		return $comision_total;
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
		if ($poliza['poliza']['coutas_pagadas_poliza'] >= 3) {

			$porcentaje_cuotas = $poliza['poliza']['comision_base'] * (10/100);
			$poliza['poliza']['comision_preprocesada'] = round($poliza['poliza']['comision_base'] + $porcentaje_cuotas, 2); 

		}else{
			$poliza['poliza']['comision_preprocesada'] = round($poliza['poliza']['comision_base'], 2);
		}

		$poliza['poliza']['comision_preprocesada'] = $poliza['poliza']['comision_preprocesada'] + (3500 * $poliza['poliza']['poliza_adicional_familiar']);
			
		if($poliza['poliza']['tipo_venta'] == 2){
			$poliza['poliza']['comision_preprocesada'] = $poliza['poliza']['comision_preprocesada'][$i] + 1000;
		}

		return $poliza;
	}

	public function getVendedoresData($cod_vendedores){
		$this->db->where_in('t_vendedores.cod_vendedor', $cod_vendedores);
		$adicionales_venta = $this->db->get('public.t_vendedores')->result_array();
		return $adicionales_venta; die();
	}
}