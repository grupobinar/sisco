<?php 
if ( ! defined('BASEPATH')) exit('No direct script access allowed');

class Reportes extends CI_Controller {

	public function __construct()
	{
		parent::__construct();
		$this->load->helper('url');
    	$this->load->helper('form');
    	$this->load->model('polizas_model');
		//$this->load->model('config_model');
		$this->load->model('reportes_model');
        $this->load->library('session');
		$this->load->library('fpdf_master');
    }

	public function rpt_por_coordinador(){
		
		$data['coordinadores'] = $this->reportes_model->e_listcoord();
		$data['sem'] = $this->reportes_model->e_listsemana();
		
		$this->load->view('layout/header');
		$this->load->view('layout/nav');
		$this->load->view('reportes/comisiones_general', $data);
		$this->load->view('layout/footer');
	}

	public function estadisticas(){
		
		$data['coordinadores'] = $this->reportes_model->e_listcoord();
		$data['sem'] = $this->reportes_model->e_listsemana();
		
		$this->load->view('layout/header');
		$this->load->view('layout/nav');
		$this->load->view('reportes/metricas', $data);
		$this->load->view('layout/footer');
	}

	public function rpt_diario(){
		
		$this->load->view('layout/header');
		$this->load->view('layout/nav');
		$this->load->view('reportes/diario');
		$this->load->view('layout/footer');
	}

	public function rpt_cierre(){

		$data['sem'] = $this->reportes_model->e_listsemana();
		
		$this->load->view('layout/header');
		$this->load->view('layout/nav');
		$this->load->view('reportes/cierre',$data);
		$this->load->view('layout/footer');
	}

	public function rpt(){

		$data['sem'] = $this->reportes_model->e_listsemana();
		
		$this->load->view('layout/header');
		$this->load->view('layout/nav');
		$this->load->view('reportes/reporte',$data);
		$this->load->view('layout/footer');
	}


	public function rpt_por_vendedor(){
		
		$data['vendedores'] = $this->reportes_model->e_listvendedores();
		$data['sem'] = $this->reportes_model->e_listsemana();	

		$this->load->view('layout/header');
		$this->load->view('layout/nav');
		$this->load->view('reportes/comisiones_vendedores', $data);
		$this->load->view('layout/footer');
	}

    public function porcoordinador(){


    	$sem = $this->reportes_model->semana($_POST['sem']);
    	$coordinador = $this->reportes_model->coordinador($_POST['cod_vendedor']);

    	$vendedores = $this->reportes_model->vendedores_rpt_general($coordinador['id_user'],$sem['id_semana']);


		$this->fpdf->AddPage();
		$this->fpdf->Image(base_url().'assets/0.fw_.png',10,10,60);
		$this->fpdf->SetFont('Arial','B',14);
		$this->fpdf->Ln(8);
		$this->fpdf->Cell(200,10,'Estado de cuenta General de Comisiones',0,0,'C');
		
		$this->fpdf->Ln(5);
		$this->fpdf->SetFont('Arial','',9);

		$this->fpdf->Cell(200,10,'SEM '.$sem['nsem'].' desde: '.$sem['desde'].' hasta: '.$sem['hasta'] ,0,0,'C');
		$this->fpdf->Ln(5);
		$this->fpdf->Cell(200,10,'Coordinador: '.$coordinador['apellidos'].' '.$coordinador['nombres'] ,0,0,'C');

		$this->fpdf->SetFont('Arial','',12);
		
		$this->fpdf->Ln(10);

		// ASIGNACIONES **************************************************************************

		$this->fpdf->Cell(275,10,'Asignaciones',0,0,'L');

		$this->fpdf->Ln(15);

		$this->fpdf->SetFont('Arial','B',8);
		$this->fpdf->SetFillColor(148, 196, 241); 

		$this->fpdf->Cell(67,8,'Vendedor', 0, 0, 'C', True);
		$this->fpdf->Cell(20,8,'Codigo',0,0,'C', True);
		$this->fpdf->Cell(40,8,'Tipo Venta',0,0,'C', True);
		$this->fpdf->Cell(25,8,'Operaciones',0,0,'C', True);
		$this->fpdf->Cell(20,8,utf8_decode('Comisión'),0,0,'C', True);
		$this->fpdf->Cell(23,8,'Coordinador',0,0,'C', True);

		$this->fpdf->Ln(8);
		$this->fpdf->SetFont('Arial','',8);
		$i=0;
		$n=1;

		/*echo "<pre>";
		print_r($vendedores);
		echo "</pre>";*/


		foreach ($vendedores as $value) {

			if(($i==0) or ($n!=$value['id_vendedor'])){
    			$cel = $this->reportes_model->hcell($value['id_vendedor'],$sem['id_semana']);

    			$comision = $this->reportes_model->comisiones($value['id_vendedor'],$sem['id_semana']);

    			//print_r($comision);
    			$cell=count($cel)*6;
    			$this->fpdf->Cell(67,$cell,utf8_decode($value['apellidos'].' '.$value['nombres']), 1, 0, 'C');
				$this->fpdf->Cell(20,$cell,$value['cod_vendedor'] ,1,0,'C');

				$i=0;	
				
			} else {

				$this->fpdf->Cell(67,6,utf8_decode(''), 0, 0, 'C');
				$this->fpdf->Cell(20,6,'',0,0,'C');

			}

			$n=$value['id_vendedor'];
			$total=$total+$cel[$i]['total'];
			$cvendedor=$cvendedor+$comision[$i]['comision'];
			$ccoordinador=$ccoordinador+($comision[$i]['comision_c']);
			$this->fpdf->Cell(40,6,utf8_decode($value['concepto']),1,0,'C');
			$this->fpdf->Cell(25,6,$cel[$i]['total'],1,0,'C');
			$this->fpdf->Cell(20,6,number_format($comision[$i]['comision'], 2, ',', '.') ,1,0,'C');
			$this->fpdf->Cell(23,6,number_format($comision[$i]['comision_c'], 2, ',', '.'),1,0,'C');

			$this->fpdf->Ln(6);
			$i++;

		}


		//$this->fpdf->Ln(8);
		$this->fpdf->SetFont('Arial','B',8);

		$this->fpdf->Cell(127,6,utf8_decode('Total asignaciones'), 0, 0, 'R');
		$this->fpdf->Cell(25,6,number_format($total, 2, ',', '.'),1,0,'C');
		$this->fpdf->Cell(20,6,number_format($cvendedor, 2, ',', '.'),1,0,'C');
		$this->fpdf->Cell(23,6,number_format($ccoordinador, 2, ',', '.'),1,0,'C');

		$this->fpdf->Ln(10);
		$this->fpdf->SetFont('Arial','',12);

		// DEDUCCIONES **************************************************************************

    	$extornos = $this->reportes_model->extornos_rpt_g($coordinador['id_user'],$sem['id_semana']);


		$this->fpdf->Cell(275,10,'Deducciones',0,0,'L');

		$this->fpdf->Ln(15);

		$this->fpdf->SetFont('Arial','B',8);
		$this->fpdf->SetFillColor(148, 196, 241); 

		$this->fpdf->Cell(55,8,'Tomador', 0, 0, 'C', True);
		$this->fpdf->Cell(20,8,'Cedula',0,0,'C', True);
		$this->fpdf->Cell(37,8,'Causa',0,0,'C', True);
		$this->fpdf->Cell(25,8,'S.A',0,0,'C', True);
		$this->fpdf->Cell(15,8,'Cuotas',0,0,'C', True);
		$this->fpdf->Cell(20,8,'Comision',0,0,'C', True);
		$this->fpdf->Cell(23,8,'Coordinador',0,0,'C', True);

		$this->fpdf->Ln(8);
		$this->fpdf->SetFont('Arial','',8);

		if ($extornos) {
		foreach ($extornos as $value) {
			$this->fpdf->Cell(55,6,utf8_decode($value['apellidos'].' '.$value['nombres']),1,0, 'C');
			$this->fpdf->Cell(20,6,$value['identificacion'],1,0,'C');
			$this->fpdf->Cell(37,6,$value['motivo'],1,0,'C');
			$this->fpdf->Cell(25,6,number_format($value['suma'], 2, ',', '.'),1,0,'C');
			$this->fpdf->Cell(15,6,'',1,0,'C');
			$this->fpdf->Cell(20,6,number_format($value['monto_fraccionado']),1,0,'C');
			$this->fpdf->Cell(23,6,number_format($value['monto_fraccionado_c']),1,0,'C');
		$this->fpdf->Ln(6);

		$evendedor = $evendedor + $value['monto_fraccionado'];
		$ecoordinador = $ecoordinador + $value['monto_fraccionado_c'];

		}

		

		//$this->fpdf->Ln(5);
		$this->fpdf->SetFont('Arial','B',8);

		$this->fpdf->Cell(152,6,utf8_decode('Total deducciones'), 0, 0, 'R');
		$this->fpdf->Cell(20,6,number_format($evendedor, 2, ',', '.'),1,0,'C');
		$this->fpdf->Cell(23,6,number_format($ecoordinador, 2, ',', '.'),1,0,'C');

		}else{
		$this->fpdf->Cell(195,6,utf8_decode('No hay nada que deducir'), 1, 0, 'C');
		}
		$totalv = $cvendedor - $evendedor;
		$totalc = $ccoordinador - $ecoordinador;
		$this->fpdf->Ln(10);

		$this->fpdf->SetFont('Arial','B',8);


		$this->fpdf->Cell(152,6,utf8_decode('Total General'), 0, 0, 'R');
		$this->fpdf->Cell(20,6,number_format($totalv, 2, ',', '.'),1,0,'C');
		$this->fpdf->Cell(23,6,number_format($totalc, 2, ',', '.'),1,0,'C');

		
		$this->fpdf->Output();
	}

	
	public function porvendedor(){

	$this->fpdf->AddPage();
	$this->fpdf->SetFont('Arial','B',14);
	$this->fpdf->Ln(6);

	$this->fpdf->Cell(200,10,'Estado de cuenta de Comisiones',0,0,'C');
	
	$this->fpdf->Ln(6);

	// DATOS DEL VENDEDOR ********************************************************************
	//print_r($_POST);

	$vendedor = $this->reportes_model->vendedores_rpt_i($_POST['cod_vendedor'],$_POST['sem']);

    $coordinador = $this->reportes_model->coordinador_($vendedor['id_coordinador']);

    $ventas = $this->reportes_model->ventas($vendedor['id_vendedor'],$vendedor['id_semana']);


	//print_r(($ventas));

	$this->fpdf->SetFont('Arial','',9);
	$this->fpdf->SetFillColor(148, 196, 241); 
	$this->fpdf->Cell(200,8,'SEM '.$vendedor['nsem'].' '.$vendedor['desde'].' AL '.$vendedor['hasta'],0,0,'C');
	$this->fpdf->Ln(4);
	$this->fpdf->Cell(200,8,utf8_decode('Vendedor: ['.$vendedor['cod_vendedor'].'] '.$vendedor['apellidos'].' '.$vendedor['nombres']), 0, 0, 'C');
	$this->fpdf->Ln(4);
	$this->fpdf->Cell(200,8,utf8_decode('Coordinador: '.$coordinador['apellidos'].' '.$coordinador['nombres']),0,0,'C');

	// ASIGNACIONES **************************************************************************Image('logo.png',10,10,-300);

	$this->fpdf->Ln(8);
	$this->fpdf->SetFont('Arial','',12);

	$this->fpdf->Cell(275,10,'Asignaciones',0,0,'L');
	$this->fpdf->Image(base_url().'assets/0.fw_.png',10,10,60);

	$this->fpdf->Ln(15);

	$this->fpdf->SetFont('Arial','B',8);
	$this->fpdf->Cell(40,8,'Asegurado', 0, 0, 'C', True);
	$this->fpdf->Cell(20,8,'Cedula',0,0,'C', True);
	$this->fpdf->Cell(40,8,'Tipo Venta',0,0,'C', True);
	$this->fpdf->Cell(30,8,'Poliza',0,0,'C', True);
	$this->fpdf->Cell(20,8,'Suma',0,0,'C', True);
	$this->fpdf->Cell(20,8,'Cuotas',0,0,'C', True);
	$this->fpdf->Cell(20,8,'Comision',0,0,'C', True);

	$this->fpdf->Ln(8);
	$this->fpdf->SetFont('Arial','',6);
	$comision_l=0;

	foreach ($ventas as $key) {

		if(isset($key['tpoliza'])) $tpoliza = $key['tpoliza'].' '.$key['num_poliza']; else  $tpoliza = 'NO APLICA';
		
		$this->fpdf->Cell(40,6,strtoupper(utf8_decode($key['apellidos'].' '.$key['nombres'])),1,0, 'C');
		$this->fpdf->Cell(20,6,$key['identificacion'],1,0,'C');
		$this->fpdf->Cell(40,6,strtoupper(utf8_decode($key['concepto'])),1,0,'C');
		$this->fpdf->Cell(30,6, $tpoliza,1,0,'C');
		$this->fpdf->Cell(20,6,number_format($key['suma'], 2, ',', '.'),1,0,'C');
		$this->fpdf->Cell(20,6,number_format($key['cuotas_canceladas'], 2, ',', '.'),1,0,'C');
		$this->fpdf->Cell(20,6,number_format($key['comision_liquidada'], 2, ',', '.'),1,0,'C');

		$comision_l=$comision_l+$key['comision_liquidada'];
	
		$this->fpdf->Ln(6);
	}

    $extornos = $this->reportes_model->extornos_rpt_i($vendedor['id_vendedor'],$vendedor['id_semana']);

    //print_r($extornos);

	$this->fpdf->SetFont('Arial','',12);

	// DEDUCCIONES **************************************************************************


	$this->fpdf->Cell(275,10,'Deducciones',0,0,'L');

	$this->fpdf->Ln(15);

	$this->fpdf->SetFont('Arial','B',8);

	$this->fpdf->Cell(40,8,'Asegurado', 0, 0, 'C', True);
	$this->fpdf->Cell(20,8,'Cedula',0,0,'C', True);
	$this->fpdf->Cell(40,8,'Tipo Venta',0,0,'C', True);
	$this->fpdf->Cell(30,8,'Poliza',0,0,'C', True);
	$this->fpdf->Cell(20,8,'Suma',0,0,'C', True);
	$this->fpdf->Cell(20,8,'Cuotas',0,0,'C', True);
	$this->fpdf->Cell(20,8,'Comision',0,0,'C', True);

	$this->fpdf->Ln(8);
	$this->fpdf->SetFont('Arial','',6);

	$extornos_l = 0;

	if (count($extornos)>0) {
	foreach ($extornos as $key) {

		if(isset($key['tpoliza'])) $tpoliza = $key['tpoliza'].' '.$key['num_poliza']; else  $tpoliza = 'NO APLICA';


		$this->fpdf->Cell(40,6,strtoupper(utf8_decode($key['apellidos'].' '.$key['nombres'])),1,0, 'C');
		$this->fpdf->Cell(20,6,$key['identificacion'],1,0,'C');
		$this->fpdf->Cell(40,6,strtoupper(utf8_decode($key['concepto'])),1,0,'C');
		$this->fpdf->Cell(30,6,$tpoliza,1,0,'C');
		$this->fpdf->Cell(20,6,number_format($key['suma'], 2, ',', '.'),1,0,'C');
		$this->fpdf->Cell(20,6,number_format($key['cuotas_canceladas'], 2, ',', '.'),1,0,'C');
		$this->fpdf->Cell(20,6,number_format($key['monto_fraccionado'], 2, ',', '.'),1,0,'C');
		$this->fpdf->Ln(6);
		$extornos_l=$extornos_l+$key['monto_fraccionado'];
	}
	}else{
		$this->fpdf->Cell(190,6,'NO HAY NADA QUE REPORTAR',1,0,'C');

	}
	$this->fpdf->Ln(15);

	$this->fpdf->SetFont('Arial','B',8);

	$total = $comision_l - $extornos_l;

	$this->fpdf->Cell(170,8,utf8_decode('Total a pagar'), 0, 0, 'R');
	$this->fpdf->Cell(20,8,number_format($total, 2, ',', '.'),1,0,'C');

	$this->fpdf->Ln(8);
	$this->fpdf->SetFont('Arial','',12);

	$this->fpdf->Cell(275,10,'Ventas con domiciliacion de pago',0,0,'L');

	$this->fpdf->Ln(15);

	$this->fpdf->SetFont('Arial','B',8);
	$this->fpdf->Cell(50,8,'Asegurado', 0, 0, 'C', True);
	$this->fpdf->Cell(20,8,'Cedula',0,0,'C', True);
	$this->fpdf->Cell(40,8,'Tipo Venta',0,0,'C', True);
	$this->fpdf->Cell(30,8,'Poliza',0,0,'C', True);
	$this->fpdf->Cell(30,8,'Suma',0,0,'C', True);
	$this->fpdf->Cell(20,8,'Cuotas',0,0,'C', True);

	$this->fpdf->Ln(8);
	$this->fpdf->SetFont('Arial','',6);


	$ventas = $this->reportes_model->ventasd($vendedor['id_vendedor'],$vendedor['id_semana']);
	if (count($ventas)>0) {
	foreach ($ventas as $key) {

		if(isset($key['tpoliza'])) $tpoliza = $key['tpoliza'].' '.$key['num_poliza']; else  $tpoliza = 'NO APLICA';
		
		$this->fpdf->Cell(50,6,strtoupper(utf8_decode($key['apellidos'].' '.$key['nombres'])),1,0, 'C');
		$this->fpdf->Cell(20,6,$key['identificacion'],1,0,'C');
		$this->fpdf->Cell(40,6,strtoupper(utf8_decode($key['concepto'])),1,0,'C');
		$this->fpdf->Cell(30,6, $tpoliza,1,0,'C');
		$this->fpdf->Cell(30,6,number_format($key['suma'], 2, ',', '.'),1,0,'C');
		$this->fpdf->Cell(20,6,number_format($key['cuotas_canceladas'], 2, ',', '.'),1,0,'C');
	
		$this->fpdf->Ln(6);
	}}else{
		$this->fpdf->Cell(190,6,'NO HAY NADA QUE REPORTAR',1,0,'C');
		$this->fpdf->Ln(6);


	}

	$this->fpdf->SetFont('Arial','B',8);

	$this->fpdf->Cell(275,10,':: La comision de las ventas con domiciliacion de pago sera calculada una vez comprobado el pago',0,0,'L');


	
	$this->fpdf->Output();
	}

	

	public function metricas(){	

		$s_desde = $this->reportes_model->semana($_POST['desde']);
		$s_hasta = $this->reportes_model->semana($_POST['hasta']);

		$this->fpdf->AddPage();
		$this->fpdf->Image(base_url().'assets/0.fw_.png',8,10,60);

		$this->fpdf->SetFont('Arial','B',16);
		$this->fpdf->Ln(10);
		$this->fpdf->Cell(180,10,utf8_decode('ESTADISTICAS'),0,0,'C');
		$this->fpdf->SetFont('Arial','',10);
		$this->fpdf->Ln(5);
		$this->fpdf->Cell(180,8,'Desde '.$s_desde[desde].' hasta '.$s_hasta[hasta],0,0,'C');
		
		$this->fpdf->Ln(15);
		$this->fpdf->SetFont('Arial','B',10);

		// METRICAS POR TIPO DE PAGO *****************************************************************

		$data = $this->reportes_model->metrica_tpago($s_desde['id_semana'], $s_hasta['id_semana'], $_POST['coo']);



		//print_r($data);

		$this->fpdf->SetFillColor(148, 196, 241); 
		$this->fpdf->Cell(180,8,'Metricas por tipo de pago',1,0,'L', true);
		$this->fpdf->Ln(8);
		$this->fpdf->Cell(60,8,'Tipo de pago',1,0,'L', true);
		$this->fpdf->Cell(60,8,'Num. Ventas',1,0,'L', true);
		$this->fpdf->Cell(60,8,'Monto Total Cobrado',1,0,'L', true);
		$this->fpdf->Ln(8);

		foreach ($data as $key) {
			$this->fpdf->Cell(60,6,$key['tpago'],1,0,'L');
			$this->fpdf->Cell(60,6,$key['total'],1,0,'L');
			$this->fpdf->Cell(60,6,number_format($key['suma'], 2, ',', '.'),1,0,'L');
			$this->fpdf->Ln(6);
		}
		
		$this->fpdf->Ln(6);


		// METRICAS POR TIPO DE VENTA *****************************************************************

		$data = $this->reportes_model->metrica_tventa($s_desde['id_semana'], $s_hasta['id_semana'], $_POST['coo']);

		$this->fpdf->SetFillColor(148, 196, 241); 
		$this->fpdf->Cell(180,8,'Metricas por tipo de venta',1,0,'L', true);
		$this->fpdf->Ln(8);
		$this->fpdf->Cell(90,8,'Tipo de venta',1,0,'L', true);
		$this->fpdf->Cell(90,8,'Numero de Ventas',1,0,'L', true);
		$this->fpdf->Ln(8);

		foreach ($data as $key) {
			$this->fpdf->Cell(90,6,$key['concepto'],1,0,'L');
			$this->fpdf->Cell(90,6,$key['total'],1,0,'L');
			$this->fpdf->Ln(6);
		}
		$this->fpdf->Ln(6);


		// METRICAS POR TIPO DE POLIZA *****************************************************************

		$data = $this->reportes_model->metrica_tpoliza($s_desde['id_semana'], $s_hasta['id_semana'], $_POST['coo']);

		$this->fpdf->SetFillColor(148, 196, 241); 
		$this->fpdf->Cell(180,8,'Metricas por tipo de poliza',1,0,'L', true);
		$this->fpdf->Ln(8);
		$this->fpdf->Cell(90,8,'Tipo de poliza',1,0,'L', true);
		$this->fpdf->Cell(90,8,'Numero de Ventas',1,0,'L', true);
		$this->fpdf->Ln(8);

		foreach ($data as $key) {
			$this->fpdf->Cell(90,6,$key['tpoliza'],1,0,'L');
			$this->fpdf->Cell(90,6,$key['total'],1,0,'L');
			$this->fpdf->Ln(6);
		}
		$this->fpdf->Ln(6);


		// METRICAS POR TIPO DE POLIZA Y MODULO ********************************************************

		$data = $this->reportes_model->metrica_tpolizam($s_desde['id_semana'], $s_hasta['id_semana'], $_POST['coo']);

		$this->fpdf->SetFillColor(148, 196, 241); 
		$this->fpdf->Cell(180,8,'Metricas por tipo de poliza',1,0,'L', true);
		$this->fpdf->Ln(8);
		$this->fpdf->Cell(60,8,'Tipo de poliza',1,0,'L', true);
		$this->fpdf->Cell(60,8,'Modulo',1,0,'L', true);
		$this->fpdf->Cell(60,8,'Numero de Ventas',1,0,'L', true);
		$this->fpdf->Ln(8);

		foreach ($data as $key) {
			$this->fpdf->Cell(60,6,$key['tpoliza'],1,0,'L');
			$this->fpdf->Cell(60,6,$key['num_poliza'],1,0,'L');
			$this->fpdf->Cell(60,6,$key['total'],1,0,'L');
			$this->fpdf->Ln(6);
		}

		// CUADRO RESUMEN *****************************************************************************

		$this->fpdf->Output();
	}

	public function diario(){	

		$this->fpdf->AddPage();
		$this->fpdf->Image(base_url().'assets/0.fw_.png',8,10,60);

		$this->fpdf->SetFont('Arial','B',16);
		$this->fpdf->Ln(10);
		$this->fpdf->Cell(200,10,utf8_decode('REPORTE DIARIO'),0,0,'C');
		$this->fpdf->SetFont('Arial','',10);
		$this->fpdf->Ln(5);
		$this->fpdf->Cell(200,8,'De '.$_POST[fecha],0,0,'C');
		
		$this->fpdf->Ln(15);
		$this->fpdf->SetFont('Arial','B',10);

		// DIARIO *****************************************************************

		$this->fpdf->Ln(8);
		$this->fpdf->Cell(5,8,'',0,0,'C');
		$this->fpdf->Cell(15,8,'Solicitud',0,0,'C');
		$this->fpdf->Cell(20,8,'Cedula',0,0,'C');
		$this->fpdf->Cell(40,8,'Tomador',0,0,'C');
		$this->fpdf->Cell(30,8,'Tipo de venta',0,0,'C');
		$this->fpdf->Cell(15,8,'Poliza',0,0,'C');
		$this->fpdf->Cell(15,8,'Plan',0,0,'C');
		$this->fpdf->Cell(10,8,'Ad.',0,0,'C');
		$this->fpdf->Cell(15,8,'Sem.',0,0,'C');
		$this->fpdf->Cell(25,8,'Estatus',0,0,'C');
		$this->fpdf->Ln(8);

		$datos = $this->polizas_model->listventas2($_POST['fecha']);

		$this->fpdf->SetFont('Arial','',6);

		//contar_adicionales

		$i=0;
		if (count($datos)>0) {
			foreach ($datos as $key) {
				  $i++;
				  $adicionales = $this->polizas_model->contar_adicionales($key['id_venta']);
				  if($key['estatus_venta']=="P") $estatus_venta="Preliquidada";
			      elseif($key['estatus_venta']=="X") $estatus_venta="Anulada";
			      elseif($key['estatus_venta']=="A") $estatus_venta="Activa";
			      elseif($key['estatus_venta']=="L") $estatus_venta="Liquidada";
			      elseif($key['estatus_venta']=="O") $estatus_venta="Liquidada";
			      elseif($key['estatus_venta']=="E") $estatus_venta="Extornada";
			      elseif($key['estatus_venta']=="D") $estatus_venta="Pendiente de pago";

				$this->fpdf->Cell(5,6,$i,0,0,'L');
				$this->fpdf->Cell(15,6,$key['solicitud'],1,0,'L');
				$this->fpdf->Cell(20,6,$key['identificacion'],1,0,'L');
				$this->fpdf->Cell(40,6,strtoupper(utf8_decode($key['apellidos'].' '.$key['nombres'])),1,0,'L');
				$this->fpdf->Cell(30,6,utf8_decode($key['concepto']),1,0,'L');
				$this->fpdf->Cell(15,6,utf8_decode($key['tpoliza']),1,0,'L');
				$this->fpdf->Cell(15,6,utf8_decode($key['tplan']),1,0,'L');
				$this->fpdf->Cell(10,6,utf8_decode($adicionales),1,0,'L');
				$this->fpdf->Cell(15,6,utf8_decode($key['nsem']),1,0,'L');
				$this->fpdf->Cell(25,6,$estatus_venta,1,0,'L');
				$this->fpdf->Ln(6);
			}
		}else{
		$this->fpdf->Cell(190,10,utf8_decode('NO HAY NADA QUE REPORTAR'),1,0,'C');

		}

		

		$this->fpdf->Output();
	}

	public function reporte(){	

		//print_r($_POST);

		$this->fpdf->AddPage();
		$this->fpdf->Image(base_url().'assets/0.fw_.png',8,10,60);

		$this->fpdf->SetFont('Arial','B',16);
		$this->fpdf->Ln(15);
		$this->fpdf->Cell(180,10,utf8_decode('VENTAS SEMANA XX DEL XX/XX/XX AL XX/XX/XX'),0,0,'C');
		$this->fpdf->Ln(8);

		
		$coo = $this->reportes_model->e_listcoord();

		foreach ($coo as $key) {

			$this->fpdf->SetFont('Arial','',10);
			$this->fpdf->Ln(8);
			$this->fpdf->Cell(5,5,'',0,0,'C');
			$this->fpdf->Cell(180,5,'COORDINADOR: '.$key['apellidos'].' '.$key['nombres'],1,0,'L');

			$this->fpdf->SetFont('Arial','B',6);

			$this->fpdf->Ln(8);
			$this->fpdf->Cell(5,8,'',0,0,'C');
			$this->fpdf->Cell(60,8,'ASESOR',0,0,'C');
			$this->fpdf->Cell(30,8,'FUN.',0,0,'C');
			$this->fpdf->Cell(30,8,'AD.',0,0,'C');
			$this->fpdf->Cell(30,8,'VIDA',0,0,'C');
			$this->fpdf->Cell(30,8,'ACT.',0,0,'C');
			$this->fpdf->Ln(8);

			$datos = $this->reportes_model->e_listvendedores2($key['id_user'],$_POST['sem']);

			//print_r($datos);

			$this->fpdf->SetFont('Arial','',6);

			$i=0;
			if (count($datos)>0) {
				foreach ($datos as $v) {
			//print_r($v);

					$this->fpdf->SetFont('Arial','',6);
					$planes = $this->reportes_model->rpt($v['id_vendedor'],$_POST['sem']);
					if (count($planes)>0) {
					$i++;
					$this->fpdf->Cell(5,6,$i,0,0,'L');
					$this->fpdf->Cell(60,6,utf8_decode($v['apellidos'].' '.$v['nombres']),1,0,'L');
					$this->fpdf->Ln(6);

						foreach ($planes as $p) {

							$this->fpdf->Cell(5,6,'',0,0,'L');
							$this->fpdf->Cell(60,6,$p['tplan'],1,0,'L');
							$this->fpdf->Cell(30,6,$p['total'],1,0,'L');
							$this->fpdf->Cell(30,6,'N/A',1,0,'L');
							$this->fpdf->Cell(30,6,'N/A',1,0,'L');
							$this->fpdf->Cell(30,6,'N/A',1,0,'L');
							$this->fpdf->Ln(6);
							$sum = $sum + $p['total'];
						}
					    $ad = $this->reportes_model->contar_adicionales2($v['id_vendedor'],$_POST['sem']);
					    $vi = $this->reportes_model->contar_vida($v['id_vendedor'],$_POST['sem']);
					    $ac = $this->reportes_model->contar_act($v['id_vendedor'],$_POST['sem']);
						$this->fpdf->SetFont('Arial','B',6);


						$this->fpdf->Cell(5,6,'',0,0,'L');
						$this->fpdf->Cell(60,6,'TOTAL',1,0,'L');
						$this->fpdf->Cell(30,6,$sum,1,0,'L');
						$this->fpdf->Cell(30,6,$ad,1,0,'L');
						$this->fpdf->Cell(30,6,$vi,1,0,'L');
						$this->fpdf->Cell(30,6,$ac,1,0,'L');
						$this->fpdf->Ln(7);
						$sum = 0;
					}

				}
			}
		}

		$this->fpdf->Output();
	}

	public function cierre(){	

		$cierre = $this->reportes_model->cierre('L',$_POST['sem']);


		$this->fpdf->AddPage('L');
		$this->fpdf->Image(base_url().'assets/0.fw_.png',8,10,60);

		$this->fpdf->SetFont('Arial','B',14);
		$this->fpdf->Ln(10);
		$this->fpdf->Cell(280,10,utf8_decode('REPORTE DE CIERRE'),0,0,'C');
		$this->fpdf->SetFont('Arial','',10);
		$this->fpdf->Ln(6);
		
		$this->fpdf->Ln(15);
		$this->fpdf->SetFont('Arial','B',10);

		$this->fpdf->Cell(42,8,'coordinador',1,0,'L');
		$this->fpdf->Cell(42,8,'vendedor',1,0,'L');
		$this->fpdf->Cell(13,8,'Sol.',1,0,'L');
		$this->fpdf->Cell(20,8,'Cedula',1,0,'L');
		$this->fpdf->Cell(42,8,'Tomador',1,0,'L');
		$this->fpdf->Cell(32,8,'T. venta',1,0,'L');
		$this->fpdf->Cell(13,8,'Poliza',1,0,'L');
		$this->fpdf->Cell(10,8,'Ad.',1,0,'L');
		$this->fpdf->Cell(10,8,'CC.',1,0,'L');
		$this->fpdf->Cell(15,8,'Estatus',1,0,'L');
		$this->fpdf->Cell(21,8,'com vend.',1,0,'L');
		$this->fpdf->Cell(20,8,'com coord.',1,0,'L');
		$this->fpdf->Ln(8);

		$this->fpdf->SetFont('Arial','',8);

		$cc=0; $cv=0; $c_anterior=0; $v_anterior=0; $i=0; $cct=0; $cvt=0;

		if (count($cierre)>0) {

		end($cierre);
		$end=key($cierre);

		foreach ($cierre as $key) {
			$i++;

			$cad=$this->reportes_model->contar_adicionales($key['id_venta']);

			  if($key['estatus_venta']=="P") {$estatus_venta="PRE";}
		      elseif($key['estatus_venta']=="L") {$estatus_venta="LIQ";}
		      elseif($key['estatus_venta']=="O") {$estatus_venta="LIQ"; }
		      elseif($key['estatus_venta']=="D") {$estatus_venta="DOM";}

			if (($v_anterior!=$key['id_vendedor']) and ($v_anterior!=0)) {
				$this->fpdf->SetFont('Arial','B',8);
				$this->fpdf->Ln(2);
				$this->fpdf->Cell(239,6,'Total',0,0,'R');
				$this->fpdf->Cell(21,6,number_format($cv, 2, ',', '.'),1,0,'R');	
				if (($c_anterior!=$key['id_user']) and ($c_anterior!=0)) {
					$this->fpdf->Cell(20,6,number_format($cc, 2, ',', '.'),1,0,'R');	
					$cc=0;
				}
				$this->fpdf->Ln(10);
				$cv=0;
				$this->fpdf->SetFont('Arial','',8);
				
			}

			$cv=$cv+$key['comision_liquidada'];
			$cc=$cc+$key['comision_c'];

			$cvt=$cvt+$key['comision_liquidada'];
			$cct=$cct+$key['comision_c'];

			$this->fpdf->Cell(42,6,ucwords(strtolower($key['ap_c'].' '.$key['name_c'])),1,0,'L');
			$this->fpdf->Cell(42,6,ucwords(strtolower($key['ap_v'].' '.$key['name_v'])),1,0,'L');
			$this->fpdf->Cell(13,6,$key['solicitud'],1,0,'L');
			$this->fpdf->Cell(20,6,$key['identificacion'],1,0,'L');
			$this->fpdf->Cell(42,6,ucwords(strtolower($key['ap_t'].' '.$key['name_t'])),1,0,'L');
			$this->fpdf->Cell(32,6,ucwords(utf8_decode($key['concepto'])),1,0,'L');
			$this->fpdf->Cell(13,6,$key['tpoliza'].' '.$key['num_poliza'],1,0,'L');
			$this->fpdf->Cell(10,6,$cad,1,0,'C');
			$this->fpdf->Cell(10,6,$key['cuotas_canceladas'],1,0,'C');
			$this->fpdf->Cell(15,6,$estatus_venta,1,0,'L');
			$this->fpdf->Cell(21,6,number_format($key['comision_liquidada'], 2, ',', '.'),1,0,'R');
			$this->fpdf->Cell(20,6,number_format($key['comision_c'], 2, ',', '.'),1,0,'R');
			$this->fpdf->Ln(6);

			if($end==$i-1){

				$this->fpdf->SetFont('Arial','B',8);
				$this->fpdf->Ln(2);
				$this->fpdf->Cell(239,6,'Total',0,0,'R');
				$this->fpdf->Cell(21,6,number_format($cv, 2, ',', '.'),1,0,'R');	
				$this->fpdf->Cell(20,6,number_format($cc, 2, ',', '.'),1,0,'R');	
				$this->fpdf->Ln(10);

			}


			$v_anterior = $key['id_vendedor'];
			$c_anterior = $key['id_user'];

		}

		$this->fpdf->Cell(239,6,'Total General',0,0,'R');
		$this->fpdf->Cell(21,6,number_format($cvt, 2, ',', '.'),1,0,'R');	
		$this->fpdf->Cell(20,6,number_format($cct, 2, ',', '.'),1,0,'R');
	}else{
		$this->fpdf->SetFont('Arial','B',9);
		$this->fpdf->Cell(280,6,'NO HAY NADA QUE REPORTAR',1,0,'C');
	}
		$this->fpdf->Output();
	}

}