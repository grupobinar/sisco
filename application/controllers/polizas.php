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
			$lista[$i]["tventa"]=$sheet->tventa;
			$lista[$i]["cobertura"]=$sheet->cobertura;
			$lista[$i]["suma"]=$sheet->suma;
			$lista[$i]["num_poliza"]=$sheet->num_poliza;
			$lista[$i]["ult_mod"]=$sheet->ult_mod;
			$lista[$i]["tpoliza"]=$sheet->tpoliza;		
			}
		}

		$datos['polizas']=$lista;

		$datos['tpoliza'] = $this->polizas_model->listtpoliza();


		$datos['planes'] = $this->polizas_model->listplan();


		$this->load->view('layout/header');
		$this->load->view('layout/nav');
		$this->load->view('polizas/polizas',$datos);
		$this->load->view('layout/footer');
	}


	public function guardar_venta(){


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

		
		//FIXME: ACOMODAR LAS FECHAS A DIAS MES Y AÑO
		$fecha=date("Y-m-d");
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

		
		redirect('/polizas', 'refresh');
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

		$datos['vendedores'] = $this->polizas_model->listvendedores();

		$datos['ventas'] = $this->polizas_model->listventas();

		$datos['tpoliza'] = $this->polizas_model->listtpoliza();

		$datos['plan'] = $this->polizas_model->listplan();

		$datos['parentesco'] = $this->polizas_model->listparent();

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
		$data['poliza'] = $this->polizas_model->buscarventa($_GET['id']);
		
		$data['adicionales'] = $this->polizas_model->listadicionales($_GET['id']);


		$this->load->view('layout/header');
		$this->load->view('layout/nav');
		$this->load->view('polizas/addventas',$data);
		$this->load->view('layout/footer');

	}

	public function buscartomador(){

		$data = $this->polizas_model->buscartomador($_POST['n'],$_POST['c']);

       echo json_encode($data);

	}
	
	public function liquidacionVendedores($semana = 2, $cod_vendedor = 'ventas', $preliquidacion = 0, $estatus_venta = 'A'){
		if ($_POST['codigo_vendedor']) {
			if (intval($_POST['codigo_vendedor'])) {
				$cod_vendedor = intval($_POST['codigo_vendedor']);
			}else{
				$cod_vendedor = $_POST['codigo_vendedor'];
			}

			$semana_numero = intval($_POST['semana']);

			$semana = $this->polizas_model->getSemanaDetalle($semana_numero, 1)[0]['id_semana'];

			if ($_POST['preliquidacion']) {
				$preliquidacion = $_POST['preliquidacion'];
			}

			if ($_POST['estatus_venta']) {
				$estatus_venta = $_POST['estatus_venta'];
			}
		}
		
		if (!is_string($cod_vendedor)) {
			$ventas = $this->polizas_model->getVendedoresVentasPolizas($semana, $cod_vendedor, $estatus_venta);
		}else{
			$ventas = $this->polizas_model->getVendedoresVentasPolizas($semana, 'vendedores', $estatus_venta);
		}

		$vendedores_orden = array();
		$vendedor_datos = '';
		//echo $cod_vendedor; die();
		if (!is_string($cod_vendedor)) {
				foreach ($ventas as $key => $item) {
					$vendedores_orden[$item['cod_vendedor']][$item['concepto_venta']][$key] = $item;
				}
	
				$keys_vendedor = array_keys($vendedores_orden); 
				$size_vendedor = sizeof($vendedores_orden);
	
				for($x = 0; $x < $size_vendedor; $x++ ) {
					$keys_tipo_venta = array_keys($vendedores_orden[$keys_vendedor[$x]]); 
					$size_tipo_venta = sizeof($vendedores_orden[$keys_vendedor[$x]]);
	
					for ($i=0; $i < $size_tipo_venta; $i++) { 
						$size_tpoliza = sizeof($vendedores_orden[$keys_vendedor[$x]][$keys_tipo_venta[$i]]);
	
						for ($j=0; $j < $size_tpoliza; $j++) {
							$vendedores_orden[$keys_vendedor[$x]][$keys_tipo_venta[$i]] = array_values($vendedores_orden[$keys_vendedor[$x]][$keys_tipo_venta[$i]]); 
							$datos_venta = $this->polizas_model->calculoComisionBase($vendedores_orden[$keys_vendedor[$x]][$keys_tipo_venta[$i]][$j], 1);
							$vendedores_orden[$keys_vendedor[$x]][$keys_tipo_venta[$i]][$j]['comision_calculada'] = $datos_venta['comision_total'];
							$vendedores_orden[$keys_vendedor[$x]][$keys_tipo_venta[$i]][$j]['prima_mensual'] = ($datos_venta['prima_mensual'] == 0) ? 'NO APLICA' : $datos_venta['prima_mensual'];
							$vendedores_orden[$keys_vendedor[$x]][$keys_tipo_venta[$i]][$j]['suma_asegurada'] = (is_null($datos_venta['suma_asegurada'])) ? 'NO APLICA' : $datos_venta['suma_asegurada'];
							$vendedor_datos = $datos_venta['vendedor_data'];
							if ($vendedores_orden[$keys_vendedor[$x]][$keys_tipo_venta[$i]][$j]['id_poliza'] == '30000') {
								$vendedores_orden[$keys_vendedor[$x]][$keys_tipo_venta[$i]][$j]['comision_calculada'] = $vendedores_orden[$keys_vendedor[$x]][$keys_poliza[$i]][$j]['comision_calculada'] + 3500;
							}
						}
					}
				}
	
				$data[0] = $vendedores_orden[$cod_vendedor];
				$data[1] = $vendedor_datos;
				echo json_encode($data);
		} else {
			if ($preliquidacion == 2) {
				for ($i=0; $i < count($ventas); $i++) { 
					$result = $this->polizas_model->calculoComisionBase($ventas[$i], 1);

					if (intval($ventas[$i]['id_poliza']) == 30000) {
						$ventas[$i]['comision_total'] = $result['comision_total'] + 3500;
					}else{
						$ventas[$i]['comision_total'] = $result['comision_total'];
					}
				}
				$liquidacion_result = $this->polizas_model->liquidacion($ventas);
				echo json_encode($liquidacion_result);
			} elseif($preliquidacion == 1) {
				for ($i=0; $i < count($ventas); $i++) { 
					$result = $this->polizas_model->calculoComisionBase($ventas[$i], 1);

					if (intval($ventas[$i]['id_poliza']) == 30000) {
						$ventas[$i]['comision_total'] = $result['comision_total'] + 3500;
					}
				}

				$preliquidacion_result = $this->polizas_model->preliquidacion($ventas);
				echo json_encode($preliquidacion_result);
			}else{
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
							$result = $this->polizas_model->calculoComisionBase($vendedores_orden[$keys_vendedor[$x]][$keys_poliza[$i]][$keys_tpoliza[$j]], 0);
							if ($keys_tpoliza[$j] == 30000) {
								$vendedores_orden[$keys_vendedor[$x]][$keys_poliza[$i]][$keys_tpoliza[$j]]['comision_total'] = $result + (3500 * count($vendedores_orden[$keys_vendedor[$x]][$keys_poliza[$i]][$keys_tpoliza[$j]]));
							} else {
								$vendedores_orden[$keys_vendedor[$x]][$keys_poliza[$i]][$keys_tpoliza[$j]]['comision_total'] = $result;
							}
							$vendedores_orden[$keys_vendedor[$x]][$keys_poliza[$i]][$keys_tpoliza[$j]]['ventas_totales'] = count($vendedores_orden[$keys_vendedor[$x]][$keys_poliza[$i]][$keys_tpoliza[$j]]) - 1;
						}
					}
				} 
	
				return $vendedores_orden;
			}
		}
	}

	public function preliquidacion(){
		$semana = intval($this->polizas_model->getSemanaDetalle()[0]['id_semana']);
		$vendedores_data = $this->arrayVentasBuild($semana, 'A');
		$this->load->view('layout/header');
		$this->load->view('layout/nav');
		$this->load->view('polizas/preliquidacion',$vendedores_data);
		$this->load->view('layout/footer');
	}

	public function liquidacion(){
		$semana = intval($this->polizas_model->getSemanaDetalle()[0]['id_semana']);
		$vendedores_data = $this->arrayVentasBuild($semana, 'P');

		$this->load->view('layout/header');
		$this->load->view('layout/nav');
		$this->load->view('polizas/liquidacion',$vendedores_data);
		$this->load->view('layout/footer');
	}

	public function anularVenta($vendedor_id = 0, $venta_id = 0){
		$vendedor_id = $_POST['vendedor_id'];
		$venta_id = $_POST['venta_id'];
		$result = $this->polizas_model->anularVenta($vendedor_id, $venta_id);
		echo json_encode($result);
	}	

	public function arrayVentasBuild($semana, $estatus_venta){
		$semana_numero = $this->polizas_model->getSemanaDetalle($semana, 0)[0]['nsem'];

		$ventas_semana = $this->liquidacionVendedores($semana, 'ventas', 0, $estatus_venta);
		$vendedores_cod = array_keys($ventas_semana);
		$keys_vendedor = array_keys($ventas_semana); 
		$size_vendedor = sizeof($ventas_semana); 

		for($x = 0; $x < $size_vendedor; $x++ ) {
			$keys_poliza = array_keys($ventas_semana[$keys_vendedor[$x]]); 
			$size_poliza = sizeof($ventas_semana[$keys_vendedor[$x]]);

			for ($i=0; $i < $size_poliza; $i++) { 
				$keys_tpoliza = array_keys($ventas_semana[$keys_vendedor[$x]][$keys_poliza[$i]]);
				$size_tpoliza = sizeof($ventas_semana[$keys_vendedor[$x]][$keys_poliza[$i]]);

				for ($j=0; $j < $size_tpoliza; $j++) {
					$ventas_semana[$keys_vendedor[$x]]['ventas_totales'] +=  $ventas_semana[$keys_vendedor[$x]][$keys_poliza[$i]][$keys_tpoliza[$j]]['ventas_totales'];
					$ventas_semana[$keys_vendedor[$x]]['comision_total'] +=  $ventas_semana[$keys_vendedor[$x]][$keys_poliza[$i]][$keys_tpoliza[$j]]['comision_total'];
					$ventas_semana[$keys_vendedor[$x]]['semana'] =  $semana_numero;
				}
			}
		} 
		
		if (count($vendedores_cod)) {
			$vendedores_data = $this->polizas_model->getVendedoresData($vendedores_cod);
		}else{
			$vendedores_data = 'No hay ventas por liquidar.';
		}
		//FIXME: AGREGAR LA SEMANA EN DETALLE NO ID
		for ($i=0; $i < count($vendedores_cod); $i++) { 
			$vendedor_index = array_search($vendedores_cod[$i], array_column($vendedores_data, 'cod_vendedor'));
			$vendedores_data[$vendedor_index]['ventas_totales'] = $ventas_semana[$vendedores_cod[$i]]['ventas_totales'];
			$vendedores_data[$vendedor_index]['comision_total'] = $ventas_semana[$vendedores_cod[$i]]['comision_total'];
			$vendedores_data[$vendedor_index]['semana'] = $semana;
			$vendedores_data[$vendedor_index]['numero_semana'] = $ventas_semana[$vendedores_cod[$i]]['semana'];
		}
		
		//var_dump($vendedores_data); die();
		return $vendedores_data;
	}
}

/* End of file welcome.php */
/* Location: ./application/controllers/welcome.php */