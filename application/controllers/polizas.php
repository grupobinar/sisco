<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');

class Polizas extends CI_Controller {

	public function __construct()
	{
		parent::__construct();
		$this->load->helper('url');
    	$this->load->helper('form');
    	$this->load->model('polizas_model');
    	$this->load->model('config_model');
    	$this->load->library('session');
	}
	public function index()
	{

		$data = $this->polizas_model->listpoliza();

		$i=0;

		if ($data<>"") {
		foreach($data as $sheet) {
			$i++;		
			
			$lista[$i]["id_poliza"]=$sheet->id_poliza;
			$lista[$i]["plan"]=$sheet->tplan;
			$lista[$i]["cobertura"]=$sheet->cobertura;
			$lista[$i]["suma"]=$sheet->suma;
			$lista[$i]["num_poliza"]=$sheet->num_poliza;
			$lista[$i]["ult_mod"]=$sheet->ult_mod;
			$lista[$i]["tpoliza"]=$sheet->tpoliza;		
			}
		}

		$datos['polizas']=$lista;

		$data = $this->polizas_model->listtpoliza();

		$i=0;

		if ($data<>"") {
		foreach($data as $sheet) {	

			$i++;		
			
			$lista_p[$i]["id_tpoliza"]=$sheet->id_tpoliza;
			$lista_p[$i]["tpoliza"]=$sheet->tpoliza;
			
			}
		}

		$datos['tpoliza']=$lista_p;

		$data = $this->polizas_model->listplan();

		$i=0;

		if ($data<>"") {
		foreach($data as $sheet) {	

			$i++;		
			
			$lista_q[$i]["id_tplan"]=$sheet->id_tplan;
			$lista_q[$i]["tplan"]=$sheet->tplan;
			
			}
		}

		$datos['planes']=$lista_q;


		$this->load->view('layout/header');
		$this->load->view('layout/nav');
		$this->load->view('polizas/polizas',$datos);
		$this->load->view('layout/footer');
	}


	public function guardar_venta(){

		echo "<pre>"; print_r($_POST); echo "</pre>";
		//break;

		$nac=$_POST['nac'];
		$cedula=$_POST['cedula'];
		$rpago=$_POST['rpago'];
		$monto=$_POST['monto'];
		$ccancelada=$_POST['ccancelada'];
		$nombres=$_POST['nombres'];
		$apellidos=$_POST['apellidos'];
		$tplan=$_POST['plan'];
		$cobertura=$_POST['cobertura'];
		$tpoliza=$_POST['tpoliza'];
		$tpago=$_POST['tpago'];

		$tventa=$_POST['tventa'];
		$nsolicitud=$_POST['nsolicitud'];
		$correo=$_POST['correo'];
		$telefono=$_POST['telefono'];
		$cod_vendedor=$_POST['cod_vendedor'];
		$adicionales=$_POST['adicionales'];
		$ad_nac=$_POST['ad_nac'];
		$ad_cedula=$_POST['ad_cedula'];
		$ad_name=$_POST['ad_name'];
		$ad_edad=$_POST['adicional_edad'];
		$ad_parent=$_POST['adicional_parent'];

		

		$fecha=date("d/m/Y");
		$usuario = $this->session->userdata('id_usuario');	
		
		$guser = $this->polizas_model->guardar_venta(
			$nac,
			$cedula,
			$rpago,
			$monto,
			$ccancelada,
			$nombres,
			$apellidos,
			$tplan,
			$cobertura,
			$tpoliza,
			$tpago,
			$fecha,
			$usuario,
			$tventa,
			$nsolicitud,
			$correo,
			$telefono,
			$cod_vendedor,
			$adicionales,
			$ad_nac,
			$ad_cedula,
			$ad_name,
			$ad_edad,
			$ad_parent
		);

		echo "<script> alert('".$guser."') </script>";

		
		redirect('/polizas/ventas', 'refresh');
	}

	public function editar(){

		$tpoliza=$_POST['tpoliza_e'];
		$plan=$_POST['plan_e'];
		$cobertura=$_POST['cobertura_e'];
		$suma=$_POST['suma_e'];
		$id_poliza=$_POST['id_poliza'];
		$fecha=date("d/m/Y");
		$usuario = $this->session->userdata('id_usuario');	
		
		$guser = $this->polizas_model->editar(
			$tpoliza,
			$plan,
			$cobertura,
			$suma,
			$id_poliza,
			$fecha,
			$usuario
		);

		echo "<script> alert('".$guser."') </script>";

		
		redirect('/polizas', 'refresh');
	}

	public function guardar(){

		$tpoliza=$_POST['tpoliza'];
		$plan=$_POST['plan'];
		$cobertura=$_POST['cobertura'];
		$suma=$_POST['suma'];
		$fecha=date("d/m/Y");
		$usuario = $this->session->userdata('id_usuario');	
		
		$guser = $this->polizas_model->guardar(
			$tpoliza,
			$plan,
			$cobertura,
			$suma,
			$fecha,
			$usuario
		);

		echo "<script> alert('".$guser."') </script>";

		
		redirect('/config/polizas', 'refresh');
	}


	public function buscarPoliza(){

		$guser = $this->polizas_model->buscarPoliza($_POST['id']);

		echo $guser->id_poliza.':'.$guser->id_tpoliza.':'.$guser->id_plan.':'.$guser->cobertura.':'.$guser->suma;
	}

	public function desactivarPoliza(){

		$guser = $this->polizas_model->desactivarPoliza($_POST['id']);

		echo "Poliza desacivada";
	}

	public function buscarCobertura(){
		$data = $this->polizas_model->buscarCobertura($_POST['plan'],$_POST['tpoliza']);


		if ($data<>"") {
		foreach($data as $sheet) {	

			$i++;		
			
			echo $sheet->id_poliza.':'.$sheet->cobertura.':'.$sheet->num_poliza.'|';
			
			}
		}

	}



		public function ventas()
	{

		$data = $this->polizas_model->listvendedores();

		$i=0;

		if ($data<>"") {
		foreach($data as $sheet) {
			$i++;		
			
			$listav[$i]["id_vendedor"]=$sheet->id_vendedor;
			$listav[$i]["cod_vendedor"]=$sheet->cod_vendedor;
			$listav[$i]["apellidos"]=$sheet->apellidos;
			$listav[$i]["nombres"]=$sheet->nombres;
	
			}
		}

		$datos['vendedores']=$listav;

		$data = $this->polizas_model->listventas();

		$i=0;

		if ($data<>"") {
		foreach($data as $sheet) {
			$i++;		
			
			$lista[$i]["referencia_pago"]=$sheet->referencia_pago;
			$lista[$i]["monto"]=$sheet->monto;
			$lista[$i]["cuotas_canceladas"]=$sheet->cuotas_canceladas;
			$lista[$i]["fecha_registro"]=$sheet->fecha_registro;

			$lista[$i]["nombres"]=$sheet->nombres;
			$lista[$i]["apellidos"]=$sheet->apellidos;
			$lista[$i]["telefono"]=$sheet->telefono;
			$lista[$i]["correo"]=$sheet->correo;

			$lista[$i]["tplan"]=$sheet->tplan;
			$lista[$i]["cobertura"]=$sheet->cobertura;
			$lista[$i]["tpoliza"]=$sheet->tpoliza;
			$lista[$i]["tpago"]=$sheet->tpago;		
			}
		}

		$datos['ventas']=$lista;

		$data = $this->polizas_model->listtpoliza();

		$i=0;

		if ($data<>"") {
		foreach($data as $sheet) {	

			$i++;		
			
			$lista_p[$i]["id_tpoliza"]=$sheet->id_tpoliza;
			$lista_p[$i]["tpoliza"]=$sheet->tpoliza;
			
			}
		}

		$datos['tpoliza']=$lista_p;

		$data = $this->polizas_model->listplan();

		$i=0;

		if ($data<>"") {
		foreach($data as $sheet) {	

			$i++;		
			
			$lista_q[$i]["id_tplan"]=$sheet->id_tplan;
			$lista_q[$i]["tplan"]=$sheet->tplan;
			
			}
		}

		$datos['plan']=$lista_q;

		$data = $this->polizas_model->listtpago();

		$i=0;

		if ($data<>"") {
		foreach($data as $sheet) {	

			$i++;		
			
			$lista_w[$i]["id_tpago"]=$sheet->id_tpago;
			$lista_w[$i]["tpago"]=$sheet->tpago;
			
			}
		}

		$datos['tpago']=$lista_w;



		$this->load->view('layout/header');
		$this->load->view('layout/nav');
		$this->load->view('polizas/ventas',$datos);
		$this->load->view('layout/footer');
	}
	
}

/* End of file welcome.php */
/* Location: ./application/controllers/welcome.php */