<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');

class Extornos extends CI_Controller {


	public function __construct()
	{
		parent::__construct();
		$this->load->helper('url');
    	$this->load->helper('form');
    	$this->load->model('extornos_model');
    	$this->load->library('session');
	}

	public function index()
	{
		$data['vendedores'] = $this->extornos_model->e_listvendedores();
		$data['sem'] = $this->extornos_model->e_listsemana();

		$this->load->view('layout/header');
		$this->load->view('layout/nav');
		$this->load->view('extornos/extornos',$data);
		$this->load->view('layout/footer');
	}

	public function vextornos()
	{
		$data['v'] = $this->extornos_model->listventas($_POST['cod_vendedor'],$_POST['sem']);

		$data['m'] = $this->extornos_model->motivos();

		$this->load->view('layout/header');
		$this->load->view('layout/nav');
		$this->load->view('extornos/vextornos',$data);
		$this->load->view('layout/footer');
	}

	public function guardar(){

		$c_extornar = $_POST['c_extornar'];
		$m_extornar = $_POST['m_extornar'];
		$m_extornar_c = $_POST['comision_c'];
		$motivo = $_POST['motivo'];
		$id_venta = $_POST['id_venta'];
		$id_vendedor = $_POST['id_vendedor'];

		$fecha=date("d/m/Y");
		$usuario = $this->session->userdata('id_usuario');	
		
		$extorno = $this->extornos_model->guardar($c_extornar, $m_extornar, $m_extornar_c, $motivo, $id_venta, $id_vendedor, $fecha, $usuario);

		echo "<script> alert('".$extorno."') </script>";

		redirect('/extornos/extornos', 'refresh');
	}

	public function view_extornos(){

		$extorno = $this->extornos_model->buscarExtornos();

		$this->load->view('layout/header');
		$this->load->view('layout/nav');
		$this->load->view('extornos/ver_extornos',$extorno);
		$this->load->view('layout/footer');

	}


}

