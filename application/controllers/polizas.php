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
			
			$lista[$i]["id_venta"]=$sheet->id_venta;
			$lista[$i]["cedula"]=$sheet->identificacion;
			$lista[$i]["nombres"]=$sheet->nombres;
			$lista[$i]["apellidos"]=$sheet->apellidos;
			$lista[$i]["telefono"]=$sheet->telefono;
			$lista[$i]["correo"]=$sheet->correo;

			$lista[$i]["tplan"]=$sheet->tplan;
			$lista[$i]["cobertura"]=$sheet->cobertura;
			$lista[$i]["tpoliza"]=$sheet->tpoliza;
			$lista[$i]["tpago"]=$sheet->tpago;	

			$lista[$i]["nsem"]=$sheet->nsem;	
			$lista[$i]["desde"]=$sheet->desde;	
			$lista[$i]["hasta"]=$sheet->hasta;	

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

	public function ver_ventas(){
		$data = $this->polizas_model->buscarventa($_GET['id']);

		$i=0;


		if ($data<>"") {
			
			$lista_w["referencia_pago"]=$data->referencia_pago;
			$lista_w["monto"]=$data->monto;
			$lista_w["cuotas_canceladas"]=$data->cuotas_canceladas;
			$lista_w["solicitud"]=$data->solicitud;
			$lista_w["cedula"]=$data->identificacion;
			$lista_w["nombres"]=$data->apellidos.' '.$data->nombres;
			$lista_w["telefono"]=$data->telefono;
			$lista_w["correo"]=$data->correo;
			$lista_w["plan"]=$data->tplan;
			$lista_w["cobertura"]=$data->cobertura;
			$lista_w["suma"]=$data->suma;
			$lista_w["num_poliza"]=$data->num_poliza;
			$lista_w["tpoliza"]=$data->tpoliza;
			$lista_w["tpago"]=$data->tpago;
			$lista_w["nsem"]=$data->nsem;
			$lista_w["desde"]=$data->desde;
			$lista_w["hasta"]=$data->hasta;


		}

		$this->load->view('layout/header');
		$this->load->view('layout/nav');
		$this->load->view('polizas/addventas',$lista_w);
		$this->load->view('layout/footer');
	}

	public function liquidacionVendedores($semana){
		$ventas = $this->polizas_model->getVendedoresVentasPolizas($semana);

		$vendedores_orden = array();

		/*foreach ($ventas as $key => $item) {
			$vendedores_orden[$item['cod_vendedor']][$item['id_poliza']][$item['id_cobertura']][$item['id_plan']][$key] = $item;
		}*/

		foreach ($ventas as $key => $item) {
			$vendedores_orden[$item['cod_vendedor']][$item['id_poliza']][$item['id_cobertura']][$key] = $item;
		}
		
		$keys_vendedor = array_keys($vendedores_orden); 
		$size_vendedor = sizeof($vendedores_orden); 

		for($x = 0; $x < $size_vendedor; $x++ ) {
			$keys_poliza = array_keys($vendedores_orden[$keys_vendedor[$x]]); 
			$size_poliza = sizeof($vendedores_orden[$keys_vendedor[$x]]);

			for ($i=0; $i < $size_poliza; $i++) { 
				$keys_tpoliza = array_keys($vendedores_orden[$keys_vendedor[$x]][$keys_poliza[$i]]); 
				$size_tpoliza = sizeof($vendedores_orden[$keys_vendedor[$x]][$keys_poliza[$i]]);

				for ($j=0; $j < $size_tpoliza; $j++) { 
					$result = $this->polizas_model->calculoComisionBase($vendedores_orden[$keys_vendedor[$x]][$keys_poliza[$i]][$keys_tpoliza[$i]]);
					$vendedores_orden[$keys_vendedor[$x]][$keys_poliza[$i]][$keys_tpoliza[$i]]['comision_total'] = $result;
					$vendedores_orden[$keys_vendedor[$x]][$keys_poliza[$i]][$keys_tpoliza[$i]]['ventas_totales'] = count($vendedores_orden[$keys_vendedor[$x]][$keys_poliza[$i]][$keys_tpoliza[$i]]) - 1;
				}
			}
		} 
		
		return $vendedores_orden;
	}

	public function liquidacion(){
		$semana = 1;
		//$semana_detalles = $this->getSemanaDetalle($semana);
		$vendedores_ventas_semana = $this->liquidacionVendedores($semana);
		$vendedores_cod = array_keys($vendedores_ventas_semana);
		
		$keys_vendedor = array_keys($vendedores_ventas_semana); 
		$size_vendedor = sizeof($vendedores_ventas_semana); 

		for($x = 0; $x < $size_vendedor; $x++ ) {
			$keys_poliza = array_keys($vendedores_ventas_semana[$keys_vendedor[$x]]); 
			$size_poliza = sizeof($vendedores_ventas_semana[$keys_vendedor[$x]]);

			for ($i=0; $i < $size_poliza; $i++) { 
				$keys_tpoliza = array_keys($vendedores_ventas_semana[$keys_vendedor[$x]][$keys_poliza[$i]]); 
				$size_tpoliza = sizeof($vendedores_ventas_semana[$keys_vendedor[$x]][$keys_poliza[$i]]);

				for ($j=0; $j < $size_tpoliza; $j++) {
					$vendedores_ventas_semana[$keys_vendedor[$x]]['ventas_totales'] +=  $vendedores_ventas_semana[$keys_vendedor[$x]][$keys_poliza[$i]][$keys_tpoliza[$j]]['ventas_totales'];
					$vendedores_ventas_semana[$keys_vendedor[$x]]['comision_total'] +=  $vendedores_ventas_semana[$keys_vendedor[$x]][$keys_poliza[$i]][$keys_tpoliza[$j]]['comision_total'];
					//echo '<pre>' . var_export($vendedores_ventas_semana[$keys_vendedor[$x]], true) . '</pre>'; die();
				}
			}
		} 

		$vendedores_data = $this->polizas_model->getVendedoresData($vendedores_cod);

		for ($i=0; $i < count($vendedores_cod); $i++) { 
			$vendedores_data[$i]['ventas_totales'] = $vendedores_ventas_semana[$vendedores_cod[$i]]['ventas_totales'];
			$vendedores_data[$i]['comision_total'] = $vendedores_ventas_semana[$vendedores_cod[$i]]['comision_total'];
		}

		//echo '<pre>' . var_export($vendedores_data, true) . '</pre>'; die();
		$this->load->view('layout/header');
		$this->load->view('layout/nav');
		$this->load->view('polizas/liquidacion',$vendedores_data);
		$this->load->view('layout/footer');
	}
	
}

/* End of file welcome.php */
/* Location: ./application/controllers/welcome.php */