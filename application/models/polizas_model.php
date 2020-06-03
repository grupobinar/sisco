<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');

class Polizas_model extends CI_Model{
    function __construct(){
        parent::__construct();
        $this->load->database();
    }    

    function anular($id){

		$data = array(
			'estatus'=>'1',
		);

		$this->db->where('id_venta', $id);
		$this->db->update('t_estatus_venta', $data);

		$data = array(
			'id_venta'=>$id,
			'estatus_venta'=>'X',
			'fecha_registro'=>date('Y-m-d'),
			'ult_mod'=>date('Y-m-d')
	
		);
	
		$this->db->insert('public.t_estatus_venta',$data);

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

    function semana()
	{

		$this->db->where('estatus','0'); 
		$data = $this->db->get('public.t_semanas'); 

		return $data->row_array();


	}

	function semana_c()
	{

		$this->db->where('estatus','1'); 
		$this->db->order_by('id_semana','desc'); 
		$data = $this->db->get('public.t_semanas'); 

		return $data->row_array();


	}

	function editar($tpoliza,$plan,$cobertura,$suma,$id_poliza,$fecha,$usuario,$modulo){

			$this->db->where('id_poliza',$id_poliza); 
			$d = $this->db->get('public.t_polizas'); 

			//print_r($data->row()->suma);

			if($d->row()->suma!=$suma)
			{

				$sem = $this->semana();
				$semc = $this->semana_c();

				$dataa = array(
					'estatus'=>'2',
					'id_sem_f'=>$semc['id_semana'],
					'ult_mod'=>date('Y-m-d')
					);

				$this->db->where('id_poliza', $id_poliza);
				$this->db->update('public.t_polizas', $dataa);

				$data = array(
					'id_tpoliza'=>$tpoliza,
					'id_plan'=>$plan,	
					'cobertura'=>$cobertura,	
					'num_poliza'=>$modulo,	
					'suma'=>$suma,	
					'id_usuario'=>$usuario,
					'fecha_registro'=>date('Y-m-d'),
					'ult_mod'=>date('Y-m-d'),
					'id_sem_i'=>$sem['id_semana'],
					'id_rel'=>$d->row()->id_rel,
				);


				$this->db->insert('public.t_polizas', $data);
			}else{
				$dataa = array(
					'id_tpoliza'=>$tpoliza,
					'id_rel'=>$id_poliza,	
					'id_plan'=>$plan,	
					'cobertura'=>$cobertura,	
					'num_poliza'=>$modulo,	
					'suma'=>$suma,	
					'id_usuario'=>$usuario,
					'fecha_registro'=>date('Y-m-d'),
					'ult_mod'=>date('Y-m-d'),
					'id_rel'=>$d->row()->id_rel,
					);

				$this->db->where('id_poliza', $id_poliza);
				$this->db->update('public.t_polizas', $dataa);
			}

			$retorno="Poliza Modificada";


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

	function listestatusventa($id)
	{
		$this->db->where('id_venta',$id);
		$this->db->order_by('id_estatus_venta','DESC');
		$listusuarios = $this->db->get('public.t_estatus_venta');

		//echo $this->db->last_query();	

		if($listusuarios->num_rows()>0)
		{
			return $listusuarios->result_array();
		}

	}

	function listventas()
	{
		$this->db->select('t_ventas.id_venta, t_tomadores.identificacion, nsem, desde, hasta, referencia_pago, monto, cuotas_canceladas, t_ventas.fecha_registro, t_tomadores.nombres, t_tomadores.apellidos, t_tomadores.telefono, t_tomadores.correo, tplan, cobertura, tpoliza, tpago, tventa, t_estatus_venta.estatus_venta, solicitud');
		$this->db->join('t_tomadores','t_tomadores.id_tomador = t_ventas.id_tomador','left');
		$this->db->join('t_plan','t_plan.id_tplan = t_ventas.id_plan','left');
		$this->db->join('t_polizas','t_polizas.id_poliza = t_ventas.id_poliza','left');
		$this->db->join('t_tpoliza','t_tpoliza.id_tpoliza = t_ventas.id_tpoliza','left');
		$this->db->join('t_tpago','t_tpago.id_tpago = t_ventas.tipo_pago','left');
		$this->db->join('t_semanas','t_semanas.id_semana = t_ventas.id_semana','left');
		$this->db->join('t_estatus_venta','t_estatus_venta.id_venta = t_ventas.id_venta','left');

		if ($this->session->userdata('rol')==3) {
			$this->db->join('t_vendedores','t_ventas.id_vendedor = t_vendedores.id_vendedor');
			$this->db->where('t_vendedores.id_coordinador', $this->session->userdata('id_usuario'));
		}

		$this->db->where_in('t_estatus_venta.estatus',['0','2']);
		$this->db->order_by('t_ventas.id_semana, id_estatus_venta','DESC');

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
		$this->db->select('t_ventas.id_venta, t_tomadores.identificacion, nsem, desde, hasta, referencia_pago, monto, cuotas_canceladas, t_ventas.fecha_registro, t_tomadores.nombres, t_tomadores.apellidos, t_tomadores.telefono, t_tomadores.correo, tplan, cobertura, tpoliza, tpago, tventa, t_ventas.estatus_venta, concepto, solicitud, t_vendedores.nombres as namev, t_vendedores.apellidos as apev, t_vendedores.id_vendedor');
		$this->db->join('t_vendedores','t_vendedores.id_vendedor = t_ventas.id_vendedor','left');
		$this->db->join('t_tomadores','t_tomadores.id_tomador = t_ventas.id_tomador','left');
		$this->db->join('t_plan','t_plan.id_tplan = t_ventas.id_plan','left');
		$this->db->join('t_polizas','t_polizas.id_poliza = t_ventas.id_poliza','left');
		$this->db->join('t_tpoliza','t_tpoliza.id_tpoliza = t_ventas.id_tpoliza','left');
		$this->db->join('t_tpago','t_tpago.id_tpago = t_ventas.tipo_pago','left');
		$this->db->join('t_semanas','t_semanas.id_semana = t_ventas.id_semana','left');
		$this->db->join('t_concepto','t_concepto.id_concepto = t_ventas.tventa','left');
		$this->db->join('t_estatus_venta','t_estatus_venta.id_venta = t_ventas.id_venta','left');
		$this->db->where('t_ventas.fecha_registro', $f);
		$this->db->where('t_estatus_venta.estatus', '0');
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
		$this->db->select('t_ventas.id_venta, t_tomadores.identificacion, nsem, desde, hasta, referencia_pago, monto, cuotas_canceladas, t_ventas.fecha_registro, t_tomadores.nombres, t_tomadores.apellidos, tplan, cobertura, tpoliza, tpago, tventa, t_estatus_venta.estatus_venta, concepto, solicitud, desde, hasta');
		$this->db->join('t_vendedores','t_vendedores.id_vendedor = t_ventas.id_vendedor','left');
		$this->db->join('t_tomadores','t_tomadores.id_tomador = t_ventas.id_tomador','left');
		$this->db->join('t_plan','t_plan.id_tplan = t_ventas.id_plan','left');
		$this->db->join('t_polizas','t_polizas.id_poliza = t_ventas.id_poliza','left');
		$this->db->join('t_tpoliza','t_tpoliza.id_tpoliza = t_ventas.id_tpoliza','left');
		$this->db->join('t_tpago','t_tpago.id_tpago = t_ventas.tipo_pago','left');
		$this->db->join('t_semanas','t_semanas.id_semana = t_ventas.id_semana','left');
		$this->db->join('t_concepto','t_concepto.id_concepto = t_ventas.tventa','left');
		$this->db->join('t_estatus_venta','t_estatus_venta.id_venta = t_ventas.id_venta','left');
		$this->db->where_in('t_estatus_venta.estatus_venta', ['D','LP']);
		$this->db->where('t_estatus_venta.estatus', '0');
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
		$this->db->select('t_ventas.id_venta, t_tomadores.identificacion, nsem, desde, hasta, referencia_pago, monto, cuotas_canceladas, t_ventas.fecha_registro, t_tomadores.nombres, t_tomadores.apellidos, t_tomadores.telefono, t_tomadores.correo, tplan, cobertura, tpoliza, tpago, tventa, t_estatus_venta.estatus_venta');
		$this->db->join('t_tomadores','t_tomadores.id_tomador = t_ventas.id_tomador','left');
		$this->db->join('t_plan','t_plan.id_tplan = t_ventas.id_plan','left');
		$this->db->join('t_polizas','t_polizas.id_poliza = t_ventas.id_poliza','left');
		$this->db->join('t_tpoliza','t_tpoliza.id_tpoliza = t_ventas.id_tpoliza','left');
		$this->db->join('t_tpago','t_tpago.id_tpago = t_ventas.tipo_pago','left');
		$this->db->join('t_semanas','t_semanas.id_semana = t_ventas.id_semana','left');
		$this->db->join('t_estatus_venta','t_estatus_venta.id_venta = t_ventas.id_venta','left');

		if ($this->session->userdata('rol')==3) {
			$this->db->join('t_vendedores','t_ventas.id_vendedor = t_vendedores.id_vendedor');
			$this->db->where('t_vendedores.id_coordinador', $this->session->userdata('id_usuario'));
		}

		$this->db->where_in('t_estatus_venta.estatus_venta', ['D','LP']);
		$this->db->where('t_estatus_venta.estatus', '0');



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
			);

	}

	
	$this->db->insert('public.t_ventas',$data);	
	$id_venta =  $this->db->insert_id();

	$data = array(
		'id_venta'=>$id_venta,
		'estatus_venta'=>$estatus,
		'id_usuario'=>$usuario,
		'fecha_registro'=>date('Y-m-d'),
		'ult_mod'=>date('Y-m-d')

	);

	$this->db->insert('public.t_estatus_venta',$data);

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
		echo $this->db->last_query();
		print_r($sem->row());
		//break;
		
		$data = array(
			'estatus'=>'1',
		);
	
		$this->db->where('id_venta', $id);
		$this->db->update('t_estatus_venta', $data);

		$data = array(
			'id_sem'=>$sem->row()->id_semana,
		);

		$this->db->where('id_venta', $id);
		$this->db->update('t_ventas', $data);
			 
		$data = array(
			'id_venta'=>$id,
			'estatus_venta'=>'A',
			'id_usuario'=>$usuario,
			'fecha_registro'=>date('Y-m-d'),
			'ult_mod'=>date('Y-m-d')
		);
		
		$this->db->insert('public.t_estatus_venta',$data);

		return "Operacion realizada con exito";
	}

	

	public function anularVenta($vendedor_id, $venta_id){
		$data = array(
			'id_venta'=>$venta_id,
			'estatus_venta'=>'X',
			'id_usuario'=>$usuario,
			'fecha_registro'=>date('Y-m-d'),
			'ult_mod'=>date('Y-m-d')
	
		);
	
		$this->db->insert('public.t_estatus_venta',$data);

		return array(
			'mensaje' => 'Anulada con exito',
			'tipo' => 'success'
		);
	}

}
