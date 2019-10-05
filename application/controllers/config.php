<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');

class Config extends CI_Controller {

	public function __construct()
	{
		parent::__construct();
		$this->load->helper('url');
    	$this->load->helper('form');
    	$this->load->model('config_model');
    	$this->load->library('session');
    	$this->load->helper('date');
	}

	// Tipo de poliza ---------------------------------------------------------------------------------

	public function tpoliza()
	{ //lleva a la vista del tipo de poliza
		//echo 'hola'; die();
		$data = $this->config_model->listtpoliza();

		$i=0;

		if ($data<>"") {
		foreach($data as $sheet) {	

			$i++;		
			
			$lista[$i]["id_tpoliza"]=$sheet->id_tpoliza;
			$lista[$i]["tpoliza"]=$sheet->tpoliza;
			$lista[$i]["factor"]=$sheet->factor;
			
			}
		}

		$datos['tpolizas']=$lista;

		$this->load->view('layout/header');
		$this->load->view('layout/nav');
		$this->load->view('config/tpoliza',$datos);
		$this->load->view('layout/footer');
	}

	public function guardar_tpoliza(){

		$tpoliza=$_POST['tpoliza'];
		$factor=$_POST['factor'];
		

		$fecha=date("d/m/Y");
		$usuario=$this->session->userdata('id_usuario');	
		
		$guser = $this->config_model->guardar_tpoliza(
			$tpoliza,
			$factor,
			$fecha,
			$usuario
		);

		echo "<script> alert('".$guser."') </script>";

		
		redirect('/config/tpoliza', 'refresh');

	}

	public function guardar_edad(){

		$edad=$_POST['edad'];
		$factor=$_POST['factor'];
		

		$fecha=date("d/m/Y");
		$usuario=$this->session->userdata('id_usuario');	
		
		$guser = $this->config_model->guardar_edad(
			$edad,
			$factor,
			$fecha,
			$usuario
		);

		echo "<script> alert('".$guser."') </script>";

		
		redirect('/config/edad', 'refresh');

	}

	// Tipo de Cobro -----------------------------------------------------------------------------------

	public function tpagos()
	{ //lleva a la vista de tipo de cobro

		$data = $this->config_model->listtpagos();

		$i=0;

		if ($data<>"") {
		foreach($data as $sheet) {	

			$i++;		
			
			$lista[$i]["id_tpago"]=$sheet->id_tpago;
			$lista[$i]["tpago"]=$sheet->tpago;
			
			}
		}

		$datos['tpagos']=$lista;


		$this->load->view('layout/header');
		$this->load->view('layout/nav');
		$this->load->view('config/tpagos',$datos);
		$this->load->view('layout/footer');
	}

	public function guardar_tpago()
	{ //guardar tipo de cobro

		$tpago=$_POST['tpago'];
		

		$fecha=date("d/m/Y");
		$usuario=$this->session->userdata('id_usuario');
		
		$guser = $this->config_model->guardar_tpago(
			$tpago,
			$fecha,
			$usuario
		);

		echo "<script> alert('".$guser."') </script>";

		
		redirect('/config/tpagos', 'refresh');

	}


	public function eliminarRegistros()
	{ // eliminar tipo de cobro

		$guser = $this->config_model->eliminarRegistros($_POST['id'],$_POST['tb'],$_POST['id_name']);

		echo "Registro Eliminado";
		//echo $guser;
	}	

	// planes de las polizas

	public function plan()
	{ // lleva a la vista de los planesa

		$data = $this->config_model->listplan();

		$i=0;

		if ($data<>"") {
		foreach($data as $sheet) {	

			$i++;		
			
			$lista[$i]["id_plan"]=$sheet->id_tplan;
			$lista[$i]["plan"]=$sheet->tplan;
			
			}
		}

		$datos['planes']=$lista;


		$this->load->view('layout/header');
		$this->load->view('layout/nav');
		$this->load->view('config/tplan',$datos);
		$this->load->view('layout/footer');
	}

	public function guardar_plan(){

		$plan=$_POST['plan'];
		

		$fecha=date("d/m/Y");
		$usuario=$this->session->userdata('id_usuario');	
		
		$guser = $this->config_model->guardar_plan(
			$plan,
			$fecha,
			$usuario
		);

		echo "<script> alert('".$guser."') </script>";

		
		redirect('/config/plan', 'refresh');

	}

	// Configuracion de comisiones ------------------------------------------------------------------------

	public function comisiones()
	{ //lleva a la vista de las comisiones

		$data = $this->config_model->listplanc();

		$i=0;

		if ($data<>"") {
		foreach($data as $sheet) {	

			$i++;		
			
			$lista[$i]["id_planc"]=$sheet->id_planc;
			$lista[$i]["planc"]=$sheet->planc;
			
			}
		}


		$datos['planc']=$lista;

		$data = $this->config_model->listconcepto();

		$i=0;

		if ($data<>"") {
		foreach($data as $sheet) {	

			$i++;		
			
			$lista[$i]["id_concepto"]=$sheet->id_concepto;
			$lista[$i]["concepto"]=$sheet->concepto;
			
			}
		}


		$datos['conceptos']=$lista;


		$data = $this->config_model->listtcalculo();


		$i=0;

		if ($data<>"") {
		foreach($data as $sheet) {	

			$i++;		
			
			$lista1[$i]["id_calculo"]=$sheet->id_calculo;
			$lista1[$i]["calculo"]=$sheet->calculo;
			
			}
		}

		$datos['calculos']=$lista1;

		$data = $this->config_model->listcomisiones();


		$i=0;

		if ($data<>"") {
		foreach($data as $sheet) {	

			$i++;		
			
			$lista2[$i]["id_comision"]=$sheet->id_comision;
			$lista2[$i]["calculo"]=$sheet->calculo;
			$lista2[$i]["concepto"]=$sheet->concepto;
			$lista2[$i]["cuota"]=$sheet->cuota;
			$lista2[$i]["min"]=$sheet->min;
			$lista2[$i]["max"]=$sheet->max;
			$lista2[$i]["planc"]=$sheet->planc;
			$lista2[$i]["base"]=$sheet->id_basec;
			
			}
		}

		$datos['comisiones']=$lista2;

		$this->load->view('layout/header');
		$this->load->view('layout/nav');
		$this->load->view('config/comisiones',$datos);
		$this->load->view('layout/footer');
	}

	
	public function guardar_comision()
	{ // guarda las comisiones

		$concepto=$_POST['concepto'];
		$calculo=$_POST['calculo'];
		$cuota=$_POST['cuota'];
		$min=$_POST['min'];
		$max=$_POST['max'];
		$planc=$_POST['planc'];
		$id_basec=$_POST['id_basec'];
		

		$fecha=date("d/m/Y");
		$usuario=$this->session->userdata('id_usuario');	
		
		$guser = $this->config_model->guardar_comision(
			$concepto,
			$calculo,
			$cuota,
			$min,
			$max,
			$fecha,
			$usuario,
			$planc,
			$id_basec

		);

		echo "<script> alert('".$guser."') </script>";

		redirect('/config/comisiones', 'refresh');

	}

	public function modificar_comision()
	{ // guarda las comisiones
		/*echo "<pre>";
		print_r($_POST);
		echo "</pre>";*/

		//break;


		$concepto=$_POST['concepto_e'];
		$calculo=$_POST['calculo_e'];
		$cuota=$_POST['cuota_e'];
		$min=$_POST['min_e'];
		$max=$_POST['max_e'];
		$planc=$_POST['planc_e'];
		$id_basec=$_POST['id_basec_e'];
		$id_comision=$_POST['id_comision'];
		

		$fecha=date("d/m/Y");
		$usuario=$this->session->userdata('id_usuario');	
		
		$guser = $this->config_model->modificar_comision(
			$concepto,
			$calculo,
			$cuota,
			$min,
			$max,
			$fecha,
			$usuario,
			$planc,
			$id_basec,
			$id_comision

		);

		echo "<script> alert('".$guser."') </script>";

		redirect('/config/comisiones', 'refresh');

	}

	public function buscarComision(){

		$guser = $this->config_model->buscarComision($_POST['id']);

		//print_r($guser);

		echo $guser->id_comision.':'.$guser->id_concepto.':'.$guser->id_calculo.':'.$guser->min.':'.$guser->max.':'.$guser->cuota;
	}
	

	// Usuarios ----------------------------------------------------------------------------------------
	//FIXME: REVISAR
	/*public function editar(){

		print_r($_POST);
		break;

		$nombres=$_POST['nombres'];
		$apellidos=$_POST['apellidos'];
		$correo=$_POST['correo'];
		$telefono=$_POST['telefono'];
		$rol=$_POST['roles'];
		$fecha=date("d/m/Y");
		$usuario=$this->session->userdata('id_usuario');	
		
		$guser = $this->usuarios_model->editar(
			$nombres,
			$apellidos,
			$correo,
			$telefono,
			$rol,
			$fecha,
			$usuario
		);

		echo "<script> alert('".$guser."') </script>";

		
		redirect('/config/', 'refresh');

	}*/

	public function buscarUsuario(){

		$guser = $this->usuarios_model->buscarUsuario($_POST['id']);

		echo $guser->identificacion.':'.$guser->apellidos.':'.$guser->nombres.':'.$guser->correo.':'.$guser->telefono.':'.$guser->username.':'.$guser->id_rol.':'.$guser->estatus;
	}


	// Tipo de Concepto -----------------------------------------------------------------------------------

	public function tconcepto()
	{ //lleva a la vista de tipo de conceptp

		$data = $this->config_model->listconcepto();

		$i=0;

		if ($data<>"") {
		foreach($data as $sheet) {	

			$i++;		
			
			$lista[$i]["id_concepto"]=$sheet->id_concepto;
			$lista[$i]["concepto"]=$sheet->concepto;
			
			}
		}

		$datos['conceptos']=$lista;


		$this->load->view('layout/header');
		$this->load->view('layout/nav');
		$this->load->view('config/tconcepto',$datos);
		$this->load->view('layout/footer');
	}

	// Tipo de Concepto -----------------------------------------------------------------------------------

	public function edad()
	{ //lleva a la vista de tipo de conceptp

		$data = $this->config_model->listEdadFactor();

		//print_r($data);
		//break;


		$this->load->view('layout/header');
		$this->load->view('layout/nav');
		$this->load->view('config/edad',$data);
		$this->load->view('layout/footer');
	}


	public function semana(){
		$data['semanas'] = $this->config_model->listSemanas();

		$this->load->view('layout/header');
		$this->load->view('layout/nav');
		$this->load->view('config/semana',$data);
		$this->load->view('layout/footer');
	}

	/*	public function registrarSemana(){
		$registro = $this->config_model->registrarSemana();
		$this->session->set_flashdata('message', ['Semana creada con exito', 'success']);
		header('Location: '.$_SERVER['HTTP_REFERER']);
	}*/

	public function cerrarSemana(){
		$result = $this->config_model->registrarSemana($_POST['semana']);

		echo $result;

	}

	public function reabrirSemana(){
		$result = $this->config_model->reabrirSemana($_POST['semana']);

		echo $result;

	}
	
}
