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

		$data = $this->liquidacion_model->listventas('A');

		$cc = $this->liquidacion_model->comision_coordinador();

		$i=0;

		if ($data<>"") {
		foreach($data as $sheet) {
			$i++;		
			
			$lista[$i]["id_vendedor"]=$sheet->id_vendedor;
			$lista[$i]["identificacion"]=$sheet->identificacion;
			$lista[$i]["nsem"]=$sheet->nsem;
			$lista[$i]["id_semana"]=$sheet->id_semana;
			$lista[$i]["desde"]=$sheet->desde;
			$lista[$i]["hasta"]=$sheet->hasta;
			$lista[$i]["nombres"]=$sheet->nombres;
			$lista[$i]["apellidos"]=$sheet->apellidos;
			$lista[$i]["telefono"]=$sheet->telefono;
			$lista[$i]["ventas"]=$this->liquidacion_model->contar($sheet->id_vendedor,$sheet->id_semana,'A');		
			$lista[$i]["comision"]=$this->liquidacion_model->ventas_vendedor($sheet->id_vendedor,$sheet->id_semana,0,'A',0);
			$lista[$i]["comision_c"]=$lista[$i]["comision"]*($cc->comision_c/100);		

			}
		}

		$datos['ventas']=$lista;


		$this->load->view('layout/header');
		$this->load->view('layout/nav');
		$this->load->view('preliquidacion',$datos);
		$this->load->view('layout/footer');
	}

	public function ver(){

		$id=$_GET['id'];
		$sem=$_GET['sem'];

		$data=$this->liquidacion_model->detallePreliquidacion($id,$sem,'A');

		$cc = $this->liquidacion_model->comision_coordinador();

		$i=0;

		if ($data<>"") {
		foreach($data as $sheet) {
			$i++;		
			
			$lista[$i]["id_venta"]=$sheet->id_venta;
			$lista[$i]["id_vendedor"]=$id;
			$lista[$i]["tventa"]=$sheet->tventa;
			$lista[$i]["tpoliza"]=$sheet->tpoliza;
			$lista[$i]["tplan"]=$sheet->tplan;
			$lista[$i]["suma"]=$sheet->suma;
			$lista[$i]["semm"]=$sem;
			$lista[$i]["factor"]=$sheet->factor;
			$lista[$i]["cpagadas"]=$sheet->cuotas_canceladas;
			$lista[$i]["adicionales"]=$this->liquidacion_model->contar_adicionales($sheet->id_venta);
			$lista[$i]["comision"]=$this->liquidacion_model->ventas_vendedor($sheet->id_vendedor,$sheet->id_semana,$sheet->id_venta,'A',0);
			$lista[$i]["comision_c"]=$lista[$i]["comision"]*($cc->comision_c/100);		

			}
		}

		

		$this->load->view('layout/header');
		$this->load->view('layout/nav');
		$this->load->view('ver',$lista);
		$this->load->view('layout/footer');
	}

	public function anular(){

		$guser = $this->liquidacion_model->anular($_GET['id_2']);

		echo "<script> alert('".$guser."') </script>";

		redirect('liquidacion/ver?id='.$_GET['id'].'&sem='.$_GET['sem'] , 'refresh');

	}

	public function preliquidar(){

		$guser = $this->liquidacion_model->preliquidar();

		echo "<script> alert('".$guser."') </script>";

		redirect('liquidacion' , 'refresh');

	}

	public function liquidar(){

		$data = $this->liquidacion_model->listventas('P');

		if ($data<>"") {
		foreach($data as $sheet) {

			$this->liquidacion_model->ventas_vendedor($sheet->id_vendedor,$sheet->id_semana,0,'P',1);

		}
		}

		echo "<script> alert('Liquidacion ejecutada') </script>";

		redirect('liquidacion/view_liquidacion' , 'refresh');

	}

	public function view_liquidacion(){

		$data = $this->liquidacion_model->listventas('P');

		$cc = $this->liquidacion_model->comision_coordinador();

		$i=0;

		if ($data<>"") {
		foreach($data as $sheet) {
			$i++;		
			
			$lista[$i]["id_vendedor"]=$sheet->id_vendedor;
			$lista[$i]["identificacion"]=$sheet->identificacion;
			$lista[$i]["nsem"]=$sheet->nsem;
			$lista[$i]["id_semana"]=$sheet->id_semana;
			$lista[$i]["desde"]=$sheet->desde;
			$lista[$i]["hasta"]=$sheet->hasta;
			$lista[$i]["nombres"]=$sheet->nombres;
			$lista[$i]["apellidos"]=$sheet->apellidos;
			$lista[$i]["telefono"]=$sheet->telefono;
			$lista[$i]["ventas"]=$this->liquidacion_model->contar($sheet->id_vendedor,$sheet->id_semana,'P');		
			$lista[$i]["comision"]=$this->liquidacion_model->ventas_vendedor($sheet->id_vendedor,$sheet->id_semana,0,'P',0);
			$lista[$i]["comision_c"]=$lista[$i]["comision"]*($cc->comision_c/100);		

			}
		}

		$datos['ventas']=$lista;


		$this->load->view('layout/header');
		$this->load->view('layout/nav');
		$this->load->view('liquidacion',$datos);
		$this->load->view('layout/footer');

	}


}

