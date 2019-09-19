<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');

class Usuarios extends CI_Controller {

	public function __construct()
	{
		parent::__construct();
		$this->load->helper('url');
    	$this->load->helper('form');
    	$this->load->model('usuarios_model');
    	$this->load->library('session');
	}
	public function index()
	{

		$data = $this->usuarios_model->listusuarios();

		$i=0;

		if ($data<>"") {
		foreach($data as $sheet) {	

			$i++;		
			
			$lista[$i]["id_persona"]=$sheet->id_persona;
			$lista[$i]["identificacion"]=$sheet->identificacion;
			$lista[$i]["apellidos"]=$sheet->apellidos;
			$lista[$i]["nombres"]=$sheet->nombres;
			$lista[$i]["username"]=$sheet->username;
			$lista[$i]["correo"]=$sheet->correo;
			$lista[$i]["telefono"]=$sheet->telefono;
			$lista[$i]["rol"]=$sheet->rol;
			$lista[$i]["id"]=$sheet->id_persona;
			$lista[$i]["estatus"]=$sheet->estatus;
			
			}
		}

		$datos['usuarios']=$lista;

		$data = $this->usuarios_model->listrol();

		$i=0;


		if ($data<>"") {
		foreach($data as $sheet) {	

			$i++;		
			
			$roles[$i]["id_rol"]=$sheet->id_rol;
			$roles[$i]["rol"]=$sheet->rol;
			
			}
		}


		$datos['roles']=$roles;		


		$this->load->view('layout/header');
		$this->load->view('layout/nav');
		$this->load->view('usuarios/usuarios',$datos);
		$this->load->view('layout/footer');
	}	

	public function guardar(){

		$nac=$_POST['nac'];
		$cedula=$_POST['cedula'];
		$nombres=$_POST['nombres'];
		$apellidos=$_POST['apellidos'];
		$correo=$_POST['correo'];
		$telefono=$_POST['telefono'];
		$rol=$_POST['roles'];
		$username=$_POST['username'];
		$clave=$_POST['clave'];

		$fecha=date("d/m/Y");
		$usuario = $this->session->userdata('id_usuario');	
		
		$guser = $this->usuarios_model->guardar(
			$nac,
			$cedula,
			$nombres,
			$apellidos,
			$correo,
			$telefono,
			$rol,
			$username,
			$clave,
			$fecha,
			$usuario
		);

		echo "<script> alert('".$guser."') </script>";

		
		redirect('/usuarios', 'refresh');
	}

	public function guardar_vendedor(){

		$nac=$_POST['nac'];
		$cedula=$_POST['cedula'];
		$nombres=$_POST['nombres'];
		$apellidos=$_POST['apellidos'];
		$correo=$_POST['correo'];
		$telefono=$_POST['telefono'];
		$codvendedor=$_POST['cod_vendedor'];

		$fecha=date("d/m/Y");
		$usuario = $this->session->userdata('id_usuario');	
		
		$guser = $this->usuarios_model->guardar_vendedor(
			$nac,
			$cedula,
			$nombres,
			$apellidos,
			$correo,
			$telefono,
			$fecha,
			$codvendedor,
			$usuario
		);

		echo "<script> alert('".$guser."') </script>";

		
		redirect('/usuarios/vendedores', 'refresh');
	}

	public function editar(){

		$id_vendedor=$_POST['id_p'];
		$nombres=$_POST['nombres_e'];
		$apellidos=$_POST['apellidos_e'];
		$correo=$_POST['correo_e'];
		$telefono=$_POST['telefono_e'];
		$rol=$_POST['roles_e'];
		$estatus=$_POST['estatus_e'];
		$fecha=date("d/m/Y");
		$usuario = $this->session->userdata('id_usuario');	
		
		$guser = $this->usuarios_model->editar(
			$id_vendedor,
			$nombres,
			$apellidos,
			$correo,
			$telefono,
			$rol,
			$fecha,
			$usuario,
			$estatus
		);

		echo "<script> alert('".$guser."') </script>";

		
		redirect('/usuarios', 'refresh');
	}

	public function editar_vendedor(){

		$id_vendedor=$_POST['id_p'];
		$nombres=$_POST['nombres_e'];
		$apellidos=$_POST['apellidos_e'];
		$correo=$_POST['correo_e'];
		$telefono=$_POST['telefono_e'];
		$telefono=$_POST['cod_vendedor_e'];
		$fecha=date("d/m/Y");
		$usuario = $this->session->userdata('id_usuario');	
		
		$guser = $this->usuarios_model->editar_vendedor(
			$id_vendedor,
			$nombres,
			$apellidos,
			$correo,
			$telefono,
			$fecha,
			$usuario
		);

		echo "<script> alert('".$guser."') </script>";

		
		redirect('/usuarios/vendedores', 'refresh');
	}

	public function buscarUsuario(){

		$guser = $this->usuarios_model->buscarUsuario($_POST['id']);

		echo $guser->identificacion.':'.$guser->apellidos.':'.$guser->nombres.':'.$guser->correo.':'.$guser->telefono.':'.$guser->username.':'.$guser->id_rol.':'.$guser->estatus.':'.$guser->id_persona;
	}

	public function buscarVendedor(){

		//print_r($_POST);

		$guser = $this->usuarios_model->buscarVendedor($_POST['id']);

		echo $guser->identificacion.':'.$guser->apellidos.':'.$guser->nombres.':'.$guser->correo.':'.$guser->telefono.':'.$guser->id_vendedor;
	}


	public function vendedores(){

		$data = $this->usuarios_model->listvendedores();

		$i=0;

		if ($data<>"") {
		foreach($data as $sheet) {	

			$i++;		
			
			$lista[$i]["id_vendedor"]=$sheet->id_vendedor;
			$lista[$i]["cod_vendedor"]=$sheet->cod_vendedor;
			$lista[$i]["identificacion"]=$sheet->identificacion;
			$lista[$i]["apellidos"]=$sheet->apellidos;
			$lista[$i]["nombres"]=$sheet->nombres;
			$lista[$i]["correo"]=$sheet->correo;
			$lista[$i]["telefono"]=$sheet->telefono;
			
			}
		}

		$datos['usuarios']=$lista;

		$this->load->view('layout/header');
		$this->load->view('layout/nav');
		$this->load->view('usuarios/vendedores',$datos);
		$this->load->view('layout/footer');
	}


	public function roles(){

		$data = $this->usuarios_model->listRoles();

		$i=0;

		if ($data<>"") {
		foreach($data as $sheet) {	

			$i++;		
			
			$listar[$i]["rol"]=$sheet->rol;
			$listar[$i]["id_rol"]=$sheet->id_rol;

			
			}
		}

		$datos['roles']=$listar;

		$data = $this->usuarios_model->listOpMenu();

		$i=0;

		if ($data<>"") {
		foreach($data as $sheet) {	

			$i++;		
			
			$lista[$i]["id_menu"]=$sheet->id_menu;
			$lista[$i]["id_padre"]=$sheet->id_padre;
			$lista[$i]["item"]=$sheet->item;
			$lista[$i]["hijos"]=$sheet->hijos;
			
			}
		}

		$datos['opmenu']=$lista;

		$this->load->view('layout/header');
		$this->load->view('layout/nav');
		$this->load->view('usuarios/roles',$datos);
		$this->load->view('layout/footer');

	}
	
}

/* End of file welcome.php */
/* Location: ./application/controllers/welcome.php */