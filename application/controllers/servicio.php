<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');

class Servicio extends CI_Controller {

	
	public function __construct()
	{
		parent::__construct();
		$this->load->helper('url');
    	$this->load->helper('form');
    	$this->load->model('servicio_model');
    	$this->load->library('session');
	}
	public function index()
	{
		
		$this->load->view('layout/header');
		$this->load->view('layout/nav');
		$this->load->view('servicio');
		$this->load->view('layout/footer');
	}
	

	public function guardar()
	{


		$nac=$_POST['nac'];
		$cedula=$_POST['cedula'];
		$nombres=$_POST['nombres'];
		$apellidos=$_POST['apellidos'];
		$correo=$_POST['correo'];
		$telefono=$_POST['telefono'];
		$rol=$_POST['rol'];
		$username=$_POST['username'];
		$clave=$_POST['clave'];

		$fecha=date("d/m/Y");
		$usuario = $this->session->userdata('id_usuario');	
		
		$guser = $this->servicio_model->guardar_pago(
			$nac,
			$cedula,
			$nombres,
			$apellidos,
			$correo,
			$telefono,
			$rol,
			$username,
			$clave
		);

		
		if($guser>0) $msj ='Guardado con exito';
		else $msj ='Error intente mas tarde';

		 $this->load->view('layout/header');
		 $this->load->view('layout/nav');
		 $this->load->view('usuarios/usuarios',$msj);
		 $this->load->view('layout/footer');
		
		}
	}

	public function consultar() {


		
		$data = $this->servicio_model->listar_pagos();

		$i=0;

		if ($data<>"") {

		
		foreach($data as $sheet) {	

			$i++;		
			
			$lista[$i]["identificacion"]=$sheet->identificacion;
			$lista[$i]["apellidos_nombres"]=$sheet->apellidos_nombres;
			$lista[$i]["codigo_postal"]=$sheet->codigo_postal;
			$lista[$i]["colaborador"]=$sheet->colaborador;
			$lista[$i]["correo"]=$sheet->correo;
			$lista[$i]["ult_pago"]=$sheet->ult_pago;
			
			
			
		}


		}
		
	
		$this->load->view('layout/header');
		$this->load->view('layout/nav');
		$this->load->view('consultar',$lista);
		$this->load->view('layout/footer');

	}

	public function listar_pagos()
	{
		
		$data = $this->servicio_model->buscar_persona($_GET['cta']);
		

		$i=0;


		if ($data<>"") {

		
		foreach($data as $sheet) {	

			$i++;		
			
			$lista[$i]["identificacion"]=$sheet->identificacion;
			$lista[$i]["apellidos_nombres"]=$sheet->apellidos_nombres;
			$lista[$i]["codigo_postal"]=$sheet->codigo_postal;
			$lista[$i]["colaborador"]=$sheet->colaborador;
			$lista[$i]["correo"]=$sheet->correo;
			$id=$sheet->id_persona;
			
			
			
		}

		

		$data1 = $this->servicio_model->pago($id);

		foreach($data1 as $sheet) {	

			$i++;		
			
			$lista[$i]["monto"]=$sheet->monto;
			$lista[$i]["fecha_registro"]=$sheet->fecha_registro;
			$lista[$i]["ruta_comprobante"]=$sheet->ruta_comprobante;
		
			
		}


		}
		

	
		$this->load->view('layout/header');
		$this->load->view('layout/nav');
		$this->load->view('listar_pagos',$lista);
		$this->load->view('layout/footer');

	}
}

/* End of file welcome.php */
/* Location: ./application/controllers/welcome.php */