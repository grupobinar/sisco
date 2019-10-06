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
		$tedad=$_POST['tedad'];

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
			$tedad,
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
	
	/**
	 * Funcion que se encarga principalmente de obtener todas las ventas por medio de parametros
	 * Donde ademas se calculan las comisiones correspondientes a cada una de las ventas de forma general
	 * o indivual segun correspondan los parametros enviados.
	 *
	 * Tambien se encarga segun el parametro de preliquidacion, de ejecutar los procesos
	 * 
	 * 1) Preliquidacion
	 * 2) Liquidacion
	 * 
	 * Ambos de forma general para cada uno de los vendedores por las semanas involucradas.
	 * @param integer $semana
	 * @param string $cod_vendedor
	 * @param integer $preliquidacion
	 * @param string $estatus_venta
	 * @return void
	*/
	public function liquidacionVendedores($semana = 0, $cod_vendedor = 'ventas', $preliquidacion = 0, $estatus_venta = 'A'){
		/**
		 * Si la ejecucion de esta funcion se realiza por un ajax se ajustan los valores segun lo solicitado
		 * 
		 * 1) Se formatea el valor del codigo de vendedor que inicia la ejecucion de las condiciones.
		 * 
		 * 2) La semana puede llegar como un arreglo segun sea el caso para ejecutar procesos o sencillamente
		 * se formatea a tipo int para la consulta de sus detalles.
		 * 
		 * 3)Se asignan los valores segun lo requerido inicialmente por la funcion para tomar los caminos
		 * ya definidos en el codigo.
		*/
		if (isset($_POST['codigo_vendedor'])) {
			if (intval($_POST['codigo_vendedor'])) {
				$cod_vendedor = intval($_POST['codigo_vendedor']);
			}else{
				$cod_vendedor = $_POST['codigo_vendedor'];
			}

			if (is_array($_POST['semana'])) {
				$semana_array = [];

				for ($i=0; $i < count($_POST['semana']); $i++) { 
					$semana = $this->polizas_model->getSemanaDetalle($_POST['semana'][$i], 1)[0]['id_semana'];
					array_push($semana_array, $semana);
				}
			}else{
				$semana_numero = intval($_POST['semana']);
				$semana = $this->polizas_model->getSemanaDetalle($semana_numero, 1)[0]['id_semana'];
			}

			if ($_POST['preliquidacion']) {
				$preliquidacion = $_POST['preliquidacion'];
			}

			if ($_POST['estatus_venta']) {
				$estatus_venta = $_POST['estatus_venta'];
			}
		}
		

		/**
		 * Condicion que identifica si la consulta de las ventas por vendedor debe ser general o especifica
		 * para un vendedor por medio de su codigo el cual debe si esta especificado debe venir como integer
		*/
		if (!is_string($cod_vendedor)) {
			$ventas = $this->polizas_model->getVendedoresVentasPolizas($semana, $cod_vendedor, $estatus_venta);
		}elseif(isset($semana_array)){
			$ventas_array = array();
			for ($i=0; $i < count($semana_array); $i++) { 
				$ventas = $this->polizas_model->getVendedoresVentasPolizas($semana_array[$i], 'vendedores', $estatus_venta);
				array_push($ventas_array, $ventas);
			}
		}else{
			$ventas = $this->polizas_model->getVendedoresVentasPolizas($semana, 'vendedores', $estatus_venta);
		}

		/**
		 * Variables de Retorno.
		*/
		$vendedores_orden = array();
		$vendedor_datos = '';

		/**
		 * Condicional principal que define el comportamiento de la funcion segun el tipo de dato que trae
		 * el codigo de vendedor. 
		 * 
		 * 1)Si es un codigo especificado entonces traera detalles de la venta y detalles del vendedor.
		 * 2)Si es general empezara a ejecutar los procesos segun la variable preliquidacion o traera una consulta general.
		*/
		if (!is_string($cod_vendedor)) {

				/**
				 * Si el codigo del vendedor esta especifido entrada por esta condicion.
				 * Lo primero que se realiza es la definicion del orden que deben tener las ventas.
				 * Agrupandolas por el codigo de los vendedores y por el concepto de las ventas:
				 * 
				 * 1) Venta de Poliza
				 * 2) Persona Adicional
				 * 3) Actualizacion de Datos
				*/
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
							/**
							 * Este aparado se encarga de organizar las ventas segun la posicion del concepto venta que se encuentren.
							 * Tambien permite el conteo de las coberturas para asignarselas a cada venta asi poder asignar la suma
							 * de porcentaje correspondiente segun la cantidad de ventas de dicha cobertura.
							 * 
							 * Ejecuta la funcion que se encarga de realizar los calculos de las comisiones y una vez realizado esto.
							 * Se encarga de asignar las variables adicionales sobre las ventas para mostrar en la tabla.
							*/
							$vendedores_orden[$keys_vendedor[$x]][$keys_tipo_venta[$i]] = array_values($vendedores_orden[$keys_vendedor[$x]][$keys_tipo_venta[$i]]); 
							$cobertura_count = array_count_values(array_column($vendedores_orden[$keys_vendedor[$x]][$keys_tipo_venta[$i]], 'id_cobertura'));
							$vendedores_orden[$keys_vendedor[$x]][$keys_tipo_venta[$i]][$j]['cantidad_cobertura'] = $cobertura_count[$vendedores_orden[$keys_vendedor[$x]][$keys_tipo_venta[$i]][$j]['id_cobertura']];
							$datos_venta = $this->polizas_model->calculoComisionBase($vendedores_orden[$keys_vendedor[$x]][$keys_tipo_venta[$i]][$j], 1);
							$vendedores_orden[$keys_vendedor[$x]][$keys_tipo_venta[$i]][$j]['comision_calculada'] = $datos_venta['comision_total'];
							$vendedores_orden[$keys_vendedor[$x]][$keys_tipo_venta[$i]][$j]['descripcion_plan'] = ($datos_venta['descripcion_plan'] == 0) ? 'NO APLICA' : $datos_venta['descripcion_plan'];
							$vendedores_orden[$keys_vendedor[$x]][$keys_tipo_venta[$i]][$j]['prima_mensual'] = ($datos_venta['prima_mensual'] == 0) ? 'NO APLICA' : $datos_venta['prima_mensual'];
							$vendedores_orden[$keys_vendedor[$x]][$keys_tipo_venta[$i]][$j]['suma_asegurada'] = (is_null($datos_venta['suma_asegurada'])) ? 'NO APLICA' : $datos_venta['suma_asegurada'];
							$vendedor_datos = $datos_venta['vendedor_data'];
						}
					}
				}
	
				/**
				 * Ya construidos los arreglos de las ventas y los datos del vendedor.
				 * Se imprime un json ya que la solicitud es por medio de un ajax.
				*/
				$data[0] = $vendedores_orden[$cod_vendedor];
				$data[1] = $vendedor_datos;

				echo json_encode($data);
		} else {
			if ($preliquidacion == 2) {
				for ($j=0; $j < count($ventas_array); $j++) { 
					$cobertura_count = array_count_values(array_column($ventas_array[$j], 'id_cobertura'));

					for ($i=0; $i < count($ventas_array[$j]); $i++) {
						$ventas_array[$j][$i]['cantidad_cobertura'] = $cobertura_count[$ventas_array[$j][$i]['id_cobertura']];
						$result = $this->polizas_model->calculoComisionBase($ventas_array[$j][$i], 1);
						$ventas_array[$j][$i]['comision_total'] = $result['comision_total'];
					}
					
					$liquidacion_result = $this->polizas_model->liquidacion($ventas_array[$j]);
				}

				echo json_encode($liquidacion_result);
			} elseif($preliquidacion == 1) {
				
				for ($j=0; $j < count($ventas_array); $j++) { 
					for ($i=0; $i < count($ventas_array[$j]); $i++) { 
						$result = $this->polizas_model->calculoComisionBase($ventas_array[$j][$i], 1);
					}

					$preliquidacion_result = $this->polizas_model->preliquidacion($ventas_array[$j]);
				}

				echo json_encode($preliquidacion_result);
			}else{

				/**
				 * Se organizan las ventas por el vendedor, las polizas y las coberturas que participan en la consulta.
				 * Para mandarlas agrupadas a la funcion que realizara el calculo de las comisiones esto para tener 
				 * incluida la cantidad de ventas que seran contadas para sumarle a la comision el porcentaje por ventas
				 * realizadas.
				*/
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
							/**
							 * En caso de que las ventas de dicha cobertura vengan con sus indices desordenados
							 * Lo que genera un bucle infinito, se utiliza la funcion array_values para organizarlos
							 * a partir del 0 y evitar este error.
							 * 
							 * Ya luego del calculo de la comision se añaden variables adicionales y se termina
							 * de preparar el arreglo para enviarlo a la vista
							*/
							$vendedores_orden[$keys_vendedor[$x]][$keys_poliza[$i]][$keys_tpoliza[$j]] = array_values($vendedores_orden[$keys_vendedor[$x]][$keys_poliza[$i]][$keys_tpoliza[$j]]);
							$result = $this->polizas_model->calculoComisionBase($vendedores_orden[$keys_vendedor[$x]][$keys_poliza[$i]][$keys_tpoliza[$j]], 0);
							$vendedores_orden[$keys_vendedor[$x]][$keys_poliza[$i]][$keys_tpoliza[$j]]['comision_total'] = $result;
							$vendedores_orden[$keys_vendedor[$x]][$keys_poliza[$i]][$keys_tpoliza[$j]]['ventas_totales'] = count($vendedores_orden[$keys_vendedor[$x]][$keys_poliza[$i]][$keys_tpoliza[$j]]);
						}
					}
				}
				return $vendedores_orden;
			}
		}
	}

	/**
	 * 1) Obtiene las semanas cerradas para luego mediante un ciclo
	 * obtener las ventas de dichas semanas y guardar cada iteracion
	 * dentro de un arreglo que sera publicado dentro de una tabla
	 * en la vista views/polizas/preliquidacion.php
	 *
	 * @return views
	*/
	public function preliquidacion(){
		$semana = $this->polizas_model->getSemanaDetalle();
		$vendedores = array();

		if ($semana != 'No hay ventas con semanas cerradas') {
			for ($i=0; $i < count($semana); $i++) { 
				$vendedores_data = $this->arrayVentasBuild($semana[$i]['id_semana'], 'A');
				array_push($vendedores, $vendedores_data);
			}
		}

		$this->load->view('layout/header');
		$this->load->view('layout/nav');
		$this->load->view('polizas/preliquidacion',$vendedores);
		$this->load->view('layout/footer');
	}

	/**
	 * 1) Obtiene las semanas cerradas para luego mediante un ciclo
	 * obtener las ventas de dichas semanas y guardar cada iteracion
	 * dentro de un arreglo que sera publicado dentro de una tabla
	 * en la vista views/polizas/preliquidacion.php
	 *
	 * @return views
	*/
	public function liquidacion(){
		$semana = $this->polizas_model->getSemanaDetalle();
		$vendedores = array();
				
		if ($semana != 'No hay ventas con semanas cerradas') {
			for ($i=0; $i < count($semana); $i++) { 
				$vendedores_data = $this->arrayVentasBuild($semana[$i]['id_semana'], 'P');
				array_push($vendedores, $vendedores_data);
			}
		}

		$this->load->view('layout/header');
		$this->load->view('layout/nav');
		$this->load->view('polizas/liquidacion',$vendedores);
		$this->load->view('layout/footer');
	}

	public function anularVenta($vendedor_id = 0, $venta_id = 0){
		$vendedor_id = $_POST['vendedor_id'];
		$venta_id = $_POST['venta_id'];
		$result = $this->polizas_model->anularVenta($vendedor_id, $venta_id);
		echo json_encode($result);
	}	

	/**
	 * Para las vistas de liquidacion y preliquidacion, esta funcion se encarga de construir
	 * el arreglo que dichas vistas mostraran al usuario. Se obtienen detalles de la semana pasada por
	 * parametro y a partir de dichos datos se consultan las ventas acompañadas por el estatus.
	 * 
	 * A de activas para la preliquidacion.
	 * P de preliquidadas para la liquidacion.
	 * 'ventas' hace referencia a que sera una consulta general de las ventas sin filtrado
	 * 0 hace referencia a que no sera un proceso de liquidacion o preliquidacion como tal si no consulta.
	 *
	 * @param [integer] $semana
	 * @param [string] $estatus_venta
	 * @return array
	*/
	public function arrayVentasBuild($semana, $estatus_venta){
		$semana_numero = $this->polizas_model->getSemanaDetalle($semana, 1)[0]['nsem'];

		/**
		 * El arreglo de ventas resultantes por cada vendedor se empieza a diseccionar
		 * Ya que no se necesita el detalle de las ventas en este apartado, si no la suma de los totales
		 * para los vendedores al igual de la semana que se les va a liquidar o preliquidar segun la vista mostrada
		 */
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
		
		/**
		 * Ya con los totales definidos, ahora hace falta los datos de los vendedores que se van a liquidar o preliquidar
		 * Usando una de las variables resultantes de la diseccion del arreglo de ventas tenemos los codigos de
		 * los vendedores con los cuales vamos a empezar alimentar el arreglo de vendedores_data el cual sera
		 * enviado a la vista. 
		 * 
		 * Por medio de un ciclo asociamos los totales previamente calculados al vendedor correspondiente y
		 * retornamos el valor solicitado por la vista.
		 */
		if (count($vendedores_cod)) {
			$vendedores_data = $this->polizas_model->getVendedoresData($vendedores_cod);
		}else{
			$vendedores_data = 'No hay ventas por liquidar.';
		}
		for ($i=0; $i < count($vendedores_cod); $i++) { 
			$vendedor_index = array_search($vendedores_cod[$i], array_column($vendedores_data, 'cod_vendedor'));
			$vendedores_data[$vendedor_index]['ventas_totales'] = $ventas_semana[$vendedores_cod[$i]]['ventas_totales'];
			$vendedores_data[$vendedor_index]['comision_total'] = $ventas_semana[$vendedores_cod[$i]]['comision_total'];
			$vendedores_data[$vendedor_index]['semana'] = $semana;
			$vendedores_data[$vendedor_index]['numero_semana'] = $ventas_semana[$vendedores_cod[$i]]['semana'];
		}
		
		return $vendedores_data;
	}
}

/* End of file welcome.php */
/* Location: ./application/controllers/welcome.php */