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
		$this->db->select('referencia_pago, monto, cuotas_canceladas, t_ventas.fecha_registro, nombres, apellidos, telefono, correo, tplan, cobertura, tpoliza, tpago');
		$this->db->join('t_tomadores','t_tomadores.id_tomador = t_ventas.id_tomador');
		$this->db->join('t_plan','t_plan.id_tplan = t_ventas.id_plan');
		$this->db->join('t_polizas','t_polizas.id_poliza = t_ventas.id_poliza');
		$this->db->join('t_tpoliza','t_tpoliza.id_tpoliza = t_ventas.id_tpoliza');
		$this->db->join('t_tpago','t_tpago.id_tpago = t_ventas.tipo_pago');
		$listusuarios = $this->db->get('public.t_ventas');

		//echo $this->db->last_query();


		if($listusuarios->num_rows()>0)
		{
			 return $listusuarios->result();
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

	function guardar_venta($nac,$cedula,$rpago,$monto,$ccancelada,$nombres,$apellidos,$tplan,$cobertura,$tpoliza,$tpago,$fecha,$usuario){ 

		$q = $this->db->query("SELECT id_tomador FROM t_tomadores WHERE identificacion='".$nac."-".$cedula."'");
		  $count = $q->num_rows(); 

		 $id_tomador = $q->row()->id_tomador;

		 
		  if($count==0){ 

		  	$identificacion=$nac.'-'.$cedula;

			$data = array(
				'nombres'=>$nombres,
				'apellidos'=>$apellidos,
				'identificacion'=>$identificacion,
			);

			$this->db->insert('public.t_tomadores',$data);
			$id_tomador =  $this->db->insert_id(); 



			$data = array(
				'referencia_pago'=>$rpago,
				'monto'=>$monto,
				'cuotas_canceladas'=>$ccancelada,
				'fecha_registro'=>$fecha,
				'id_plan'=>$tplan,
				'id_poliza'=>$cobertura,
				'id_tpoliza'=>$tpoliza,
				'id_tomador'=>$id_tomador,
				'tipo_pago'=>$tpago,
			);

			$this->db->insert('public.t_ventas',$data);

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
}