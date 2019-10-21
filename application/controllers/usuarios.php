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

	public function bloquear(){

		$guser = $this->usuarios_model->bloquear($_POST['id'], $_POST['v']);

		echo $guser;
	}

	public function editar_vendedor(){

		$id_vendedor=$_POST['id_p'];
		$nombres=$_POST['nombres_e'];
		$apellidos=$_POST['apellidos_e'];
		$correo=$_POST['correo_e'];
		$telefono=$_POST['telefono_e'];
		$cod_vendedor=$_POST['cod_vendedor_e'];
		$fecha=date("d/m/Y");
		$usuario = $this->session->userdata('id_usuario');	
		
		$guser = $this->usuarios_model->editar_vendedor(
			$id_vendedor,
			$nombres,
			$apellidos,
			$correo,
			$telefono,
			$cod_vendedor,
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

		echo $guser->identificacion.':'.$guser->apellidos.':'.$guser->nombres.':'.$guser->correo.':'.$guser->telefono.':'.$guser->id_vendedor.':'.$guser->cod_vendedor;
	}


	public function vendedores(){
		$data = $this->usuarios_model->listvendedores();

		$this->load->view('layout/header');
		$this->load->view('layout/nav');
		$this->load->view('usuarios/vendedores',$data);
		$this->load->view('layout/footer');
	}


	public function roles($mensaje = false){	

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
		$datos['mensaje_proceso'] = ($mensaje != false) ? $mensaje : '';
		$this->load->view('layout/header');
		$this->load->view('layout/nav');
		$this->load->view('usuarios/roles',$datos);
		$this->load->view('layout/footer');

	}

	public function guardarRoles(){
		if(!preg_match('~[0-9]+~', $_POST['rol']) && is_array($_POST['opciones'])){
			$result = $this->usuarios_model->saveRol();
			if ($result) {
				$this->session->set_flashdata('message', ['Rol creado con exito', 'success']);
				header('Location: '.$_SERVER['HTTP_REFERER']);
			} else {
				$this->roles(['Error de Validacion', 'error']);
			}
		}else{
			$this->roles(['Datos Incorrectos', 'error']);
		}
	}

	public function getMenuRol(){
	 	if (is_int(intval($_REQUEST['id']))) {
			$result = $this->usuarios_model->getMenuRol();
			echo json_encode($result);
	 	} else {
			return false;
		}
	}

	public function updateRol(){
		if ($_POST['rol_descripcion'] != '') {
			if(!preg_match('~[0-9]+~', $_POST['rol_descripcion']) && is_array($_POST['menu_selected'])){
				$result = $this->usuarios_model->updateRol();
				if ($result) {
					echo json_encode(array('Actualizacion Correcta', 'success'));
				} else {
					echo json_encode(array('Error de Validacion', 'error'));
				}
			}else{
				echo json_encode(array('Datos Incorrectos', 'error'));
			}		
		}else{
			echo json_encode(array('La descripcion del Rol no puede estar vacia', 'warning'));
		}

	}

	public function eliminarRol(){
		$result = $this->usuarios_model->getRol();
		if (count($result) > 0) {
			$delete = $this->usuarios_model->deleteRol();
			echo json_encode($delete);
		}else{
			echo json_encode('Error, el rol no existe.', 'error');
		}
	}	

	public function disponibilidad(){

		echo $this->usuarios_model->verificar_username($_POST['username']);

	}
}

/* End of file welcome.php */
/* Location: ./application/controllers/welcome.php */