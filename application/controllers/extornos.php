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
		$this->load->view('layout/header');
		$this->load->view('layout/nav');
		$this->load->view('extornos/extornos');
		$this->load->view('layout/footer');
	}

	public function vextornos()
	{
		$data = $this->extornos_model->listventas($_POST['cod'],$_POST['sem']);

		$this->load->view('layout/header');
		$this->load->view('layout/nav');
		$this->load->view('extornos/vextornos',$data);
		$this->load->view('layout/footer');
	}


}

