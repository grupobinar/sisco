<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');

class Liquidacion extends CI_Controller {

	public function __construct()
	{
		parent::__construct();
		$this->load->helper('url');
    	$this->load->helper('form');
    	$this->load->model('liquidacion_model');
    	$this->load->library('session');
	}

	public function index()
	{

		$data = $this->liquidacion_model->listventas();


		$i=0;

		if ($data<>"") {
		foreach($data as $sheet) {
			$i++;		
			
			$lista[$i]["id_vendedor"]=$sheet->id_vendedor;
			$lista[$i]["identificacion"]=$sheet->identificacion;
			$lista[$i]["nsem"]=$sheet->nsem;
			$lista[$i]["desde"]=$sheet->desde;
			$lista[$i]["hasta"]=$sheet->hasta;
			$lista[$i]["nombres"]=$sheet->nombres;
			$lista[$i]["apellidos"]=$sheet->apellidos;
			$lista[$i]["telefono"]=$sheet->telefono;
			$lista[$i]["ventas"]=$this->liquidacion_model->contar($sheet->id_vendedor);		
			$lista[$i]["comision"]=$this->liquidacion_model->ventas_vendedor($sheet->id_vendedor);		
			}
		}

		$datos['ventas']=$lista;


		$this->load->view('layout/header');
		$this->load->view('layout/nav');
		$this->load->view('liquidacion',$datos);
		$this->load->view('layout/footer');
	}

	public function ver(){

		$id=$_GET['id'];

		$datos=$this->liquidacion_model->detalleLiquidacion($id);

		//print_r($datos);

		$this->load->view('layout/header');
		$this->load->view('layout/nav');
		$this->load->view('ver',$datos);
		$this->load->view('layout/footer');
	}


}

