<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');

class Login extends CI_Controller {

	public function __construct()
	{
		parent::__construct();
		$this->load->helper('url');
    	$this->load->helper('form');
		$this->load->model('login_model');
		$this->load->model('config_model');
    	$this->load->library('session');
	}
	public function index()
	{
		$this->session->sess_destroy();
		$this->load->view('layout/header_login');
		$this->load->view('login');
		$this->load->view('layout/footer');
	}

	public function home()
	{
		$usuario=$_POST['usuario'];
		$clave=$_POST['clave'];

		$userlogin = $this->login_model->login(
			$usuario,
			$clave
		);
		
		if ($userlogin<>"NO") {

		$menu_user= $this->login_model->menu($userlogin->id_rol);

		$i=0;
		if ($menu_user<>"") {
			foreach($menu_user as $sheet) {	

				$i++;		
			
				$menup[$i]=$sheet->id_menu.':'.$sheet->id_padre.':'.$sheet->item.':'.$sheet->icono.':'.$sheet->ruta.'::'.$sheet->hijos;			
			}
		}

		$semana_check = $this->config_model->checkSemana();

			$this->session->set_userdata('_MENU_',$menup);

			$this->session->set_userdata('usuario',$userlogin->username);
			$this->session->set_userdata('id_usuario',$userlogin->id_user);
			$this->session->set_userdata('rol',$userlogin->id_rol);

			//print_r($this->session->userdata);

			$this->load->view('layout/header');
			$this->load->view('layout/nav');
			$this->load->view('home');
			$this->load->view('layout/footer');

		}else{
			echo "<script> alert('Usuario o clave invalida') </script>";
			$this->load->view('layout/header_login');
			$this->load->view('login');
			$this->load->view('layout/footer');
		}
	}
	

	
}

/* End of file welcome.php */
/* Location: ./application/controllers/welcome.php */