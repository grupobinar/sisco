<?php 
if ( ! defined('BASEPATH')) exit('No direct script access allowed');

class Reportes extends CI_Controller {

	public function __construct()
	{
		parent::__construct();
		$this->load->helper('url');
    	$this->load->helper('form');
    	//$this->load->model('polizas_model');
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
		$this->fpdf->Image(base_url().'assets/0.fw_.png',125,10,80);
		$this->fpdf->SetFont('Arial','B',14);
		$this->fpdf->Cell(200,10,'Estado de cuenta General de Comisiones',0,0,'L');
		
		$this->fpdf->Ln(5);
		$this->fpdf->SetFont('Arial','',9);

		$this->fpdf->Cell(200,10,'SEM '.$sem['nsem'].' desde: '.$sem['desde'].' hasta: '.$sem['hasta'] ,0,0,'L');
		$this->fpdf->Ln(5);
		$this->fpdf->Cell(200,10,'Coordinador: '.$coordinador['apellidos'].' '.$coordinador['nombres'] ,0,0,'L');

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

		foreach ($vendedores as $value) {
			if($i==0){

    			$cel = $this->reportes_model->hcell($value['id_vendedor'],$sem['id_semana']);
    			$comision = $this->reportes_model->comisiones($value['id_vendedor'],$sem['id_semana']);

    			//print_r($comision);
    			$cell=count($cel)*6;
    			$this->fpdf->Cell(67,$cell,utf8_decode($value['apellidos'].' '.$value['nombres']), 1, 0, 'C');
				$this->fpdf->Cell(20,$cell,$value['cod_vendedor'] ,1,0,'C');
				
			} else {

				$this->fpdf->Cell(67,6,utf8_decode(''), 0, 0, 'C');
				$this->fpdf->Cell(20,6,'',0,0,'C');

			}
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
			$this->fpdf->Cell(15,6,'Cuotas',1,0,'C');
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
	$this->fpdf->Cell(200,10,'Estado de cuenta de Comisiones',0,0,'L');
	
	$this->fpdf->Ln(6);

	// DATOS DEL VENDEDOR ********************************************************************
	//print_r($_POST);

	$vendedor = $this->reportes_model->vendedores_rpt_i($_POST['cod_vendedor'],$_POST['sem']);

    $coordinador = $this->reportes_model->coordinador_($vendedor['id_coordinador']);

    $ventas = $this->reportes_model->ventas($vendedor['id_vendedor'],$vendedor['id_semana']);


	//print_r(($ventas));

	$this->fpdf->SetFont('Arial','',9);
	$this->fpdf->SetFillColor(148, 196, 241); 
	$this->fpdf->Cell(60,8,'SEM '.$vendedor['nsem'].' '.$vendedor['desde'].' AL '.$vendedor['hasta'],0,0,'L');
	$this->fpdf->Ln(4);
	$this->fpdf->Cell(200,8,utf8_decode('Vendedor: ['.$vendedor['cod_vendedor'].'] '.$vendedor['apellidos'].' '.$vendedor['nombres']), 0, 0, 'L');
	$this->fpdf->Ln(4);
	$this->fpdf->Cell(50,8,utf8_decode('Coordinador: '.$coordinador['apellidos'].' '.$coordinador['nombres']),0,0,'L');

	// ASIGNACIONES **************************************************************************Image('logo.png',10,10,-300);

	$this->fpdf->Ln(8);
	$this->fpdf->SetFont('Arial','',12);

	$this->fpdf->Cell(275,10,'Asignaciones',0,0,'L');
	$this->fpdf->Image(base_url().'assets/0.fw_.png',125,10,80);

	$this->fpdf->Ln(15);

	$this->fpdf->SetFont('Arial','B',8);
	$this->fpdf->Cell(40,8,'Asegurado', 0, 0, 'C', True);
	$this->fpdf->Cell(20,8,'Cedula',0,0,'C', True);
	$this->fpdf->Cell(40,8,'Tipo Venta',0,0,'C', True);
	$this->fpdf->Cell(30,8,'Plan',0,0,'C', True);
	$this->fpdf->Cell(20,8,'Suma',0,0,'C', True);
	$this->fpdf->Cell(20,8,'Cuotas',0,0,'C', True);
	$this->fpdf->Cell(20,8,'Comision',0,0,'C', True);

	$this->fpdf->Ln(8);
	$this->fpdf->SetFont('Arial','',6);

	foreach ($ventas as $key) {
		
		$this->fpdf->Cell(40,6,strtoupper(utf8_decode($key['apellidos'].' '.$key['nombres'])),1,0, 'C');
		$this->fpdf->Cell(20,6,$key['identificacion'],1,0,'C');
		$this->fpdf->Cell(40,6,strtoupper(utf8_decode($key['concepto'])),1,0,'C');
		$this->fpdf->Cell(30,6,$key['tplan'],1,0,'C');
		$this->fpdf->Cell(20,6,number_format($key['suma'], 2, ',', '.'),1,0,'C');
		$this->fpdf->Cell(20,6,number_format($key['cuotas_canceladas'], 2, ',', '.'),1,0,'C');
		$this->fpdf->Cell(20,6,number_format($key['comision_liquidada'], 2, ',', '.'),1,0,'C');
	
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

	foreach ($extornos as $key) {

		$this->fpdf->Cell(40,6,strtoupper(utf8_decode($key['apellidos'].' '.$key['nombres'])),1,0, 'C');
		$this->fpdf->Cell(20,6,$key['identificacion'],1,0,'C');
		$this->fpdf->Cell(40,6,strtoupper(utf8_decode($key['concepto'])),1,0,'C');
		$this->fpdf->Cell(30,6,$key['tpoliza'],1,0,'C');
		$this->fpdf->Cell(20,6,number_format($key['suma'], 2, ',', '.'),1,0,'C');
		$this->fpdf->Cell(20,6,number_format($key['cuotas_canceladas'], 2, ',', '.'),1,0,'C');
		$this->fpdf->Cell(20,6,number_format($key['monto_fraccionado'], 2, ',', '.'),1,0,'C');
		$this->fpdf->Ln(6);

	}
/*	$this->fpdf->Ln(10);

	$this->fpdf->Cell(240,8,utf8_decode('Total a pagar'), 0, 0, 'R');
	$this->fpdf->Cell(35,8,'asig - deduc',1,0,'C');*/

	
	$this->fpdf->Output();
	}

	

	public function metricas(){	

		$s_desde = $this->reportes_model->semana($_POST['desde']);
		$s_hasta = $this->reportes_model->semana($_POST['hasta']);

		//print_r($sem);


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

		$data = $this->reportes_model->metrica_tpago($s_hasta['id_semana']);



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

		$data = $this->reportes_model->metrica_tventa($s_hasta['id_semana']);

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

		$data = $this->reportes_model->metrica_tpoliza($s_hasta['id_semana']);

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

		$data = $this->reportes_model->metrica_tpolizam($s_hasta['id_semana']);

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

}