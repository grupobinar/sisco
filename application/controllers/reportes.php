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
	
	public function comisiones(){
		if ($_GET['id_vendedor']) {
			$data = $this->reportes_model->listVendedores($_GET['id_vendedor']);
		}else{
			$data = $this->reportes_model->listVendedores();
		}
		
		$this->load->view('layout/header');
		$this->load->view('layout/nav');
		$this->load->view('reportes/comisiones_vendedores', $data);
		$this->load->view('layout/footer');
	}

    public function estado_general(){
		//$pdf = new FPDF('L');
		$this->fpdf->AddPage();
		$this->fpdf->SetFont('Arial','B',16);
		$this->fpdf->Cell(275,10,'Estado de cuenta General de Comisiones',0,0,'C');
		
		$this->fpdf->Ln(10);
		$this->fpdf->SetFont('Arial','',14);

		// ASIGNACIONES **************************************************************************

		$this->fpdf->Cell(275,10,'a) Asignaciones',0,0,'L');

		$this->fpdf->Ln(15);

		$this->fpdf->SetFont('Arial','B',10);
		$this->fpdf->SetFillColor(148, 196, 241); 

		$this->fpdf->Cell(65,8,'Vendedor', 0, 0, 'C', True);
		$this->fpdf->Cell(30,8,'Codigo',0,0,'C', True);
		$this->fpdf->Cell(60,8,'Tipo Venta',0,0,'C', True);
		$this->fpdf->Cell(50,8,'Nro de Operaciones',0,0,'C', True);
		$this->fpdf->Cell(35,8,'Comision',0,0,'C', True);
		$this->fpdf->Cell(35,8,'Coordinador',0,0,'C', True);

		$this->fpdf->Ln(8);
		$this->fpdf->SetFont('Arial','',10);

		$this->fpdf->Cell(65,12,utf8_decode('Alvaro Angulo'), 1, 0, 'C');
		$this->fpdf->Cell(30,12,'30756',1,0,'C');
		$this->fpdf->Cell(60,6,utf8_decode('Emisión'),1,0,'C');
		$this->fpdf->Cell(50,6,'2',1,0,'C');
		$this->fpdf->Cell(35,6,'102.441,50',1,0,'C');
		$this->fpdf->Cell(35,6,'20.488,30',1,0,'C');

		$this->fpdf->Ln(6);

		$this->fpdf->Cell(65,6,utf8_decode(''), 0, 0, 'C');
		$this->fpdf->Cell(30,6,'',0,0,'C');
		$this->fpdf->Cell(60,6,utf8_decode('Actualización de Datos'),1,0,'C');
		$this->fpdf->Cell(50,6,'8',1,0,'C');
		$this->fpdf->Cell(35,6,'8.000,00',1,0,'C');
		$this->fpdf->Cell(35,6,'1.600,00',1,0,'C');

		$this->fpdf->Ln(6);

		$this->fpdf->Cell(65,6,utf8_decode('Ericson Velasco'), 1, 0, 'C');
		$this->fpdf->Cell(30,6,'21022',1,0,'C');
		$this->fpdf->Cell(60,6,utf8_decode('Emisión'),1,0,'C');
		$this->fpdf->Cell(50,6,'2',1,0,'C');
		$this->fpdf->Cell(35,6,'102.441,50',1,0,'C');
		$this->fpdf->Cell(35,6,'20.488,30',1,0,'C');

		$this->fpdf->Ln(8);
		$this->fpdf->SetFont('Arial','B',10);

		$this->fpdf->Cell(155,6,utf8_decode('Total asignaciones'), 0, 0, 'R');
		$this->fpdf->Cell(50,6,'12',1,0,'C');
		$this->fpdf->Cell(35,6,'suma total',1,0,'C');
		$this->fpdf->Cell(35,6,'suma total',1,0,'C');

		$this->fpdf->Ln(10);
		$this->fpdf->SetFont('Arial','',14);

		// DEDUCCIONES **************************************************************************


		$this->fpdf->Cell(275,10,'b) Deducciones',0,0,'L');

		$this->fpdf->Ln(15);

		$this->fpdf->SetFont('Arial','B',10);
		$this->fpdf->SetFillColor(148, 196, 241); 

		$this->fpdf->Cell(40,8,'Tomador', 0, 0, 'C', True);
		$this->fpdf->Cell(25,8,'Cedula',0,0,'C', True);
		$this->fpdf->Cell(50,8,'Causa',0,0,'C', True);
		$this->fpdf->Cell(30,8,'N Familiares',0,0,'C', True);
		$this->fpdf->Cell(30,8,'S.A',0,0,'C', True);
		$this->fpdf->Cell(30,8,'N Cuotas',0,0,'C', True);
		$this->fpdf->Cell(35,8,'Comision',0,0,'C', True);
		$this->fpdf->Cell(35,8,'Coordinador',0,0,'C', True);

		$this->fpdf->Ln(8);
		$this->fpdf->SetFont('Arial','',10);

		$this->fpdf->Cell(40,6,'Katherine', 1, 0, 'C');
		$this->fpdf->Cell(25,6,'21072511',1,0,'C');
		$this->fpdf->Cell(50,6,'No pago',1,0,'C');
		$this->fpdf->Cell(30,6,'4',1,0,'C');
		$this->fpdf->Cell(30,6,'100.000.000,00',1,0,'C');
		$this->fpdf->Cell(30,6,'4',1,0,'C');
		$this->fpdf->Cell(35,6,'100.000,00',1,0,'C');
		$this->fpdf->Cell(35,6,'1.000,00',1,0,'C');

		$this->fpdf->Ln(8);
		$this->fpdf->SetFont('Arial','B',10);

		$this->fpdf->Cell(205,6,utf8_decode('Total deducciones'), 0, 0, 'R');
		$this->fpdf->Cell(35,6,'suma total',1,0,'C');
		$this->fpdf->Cell(35,6,'suma total',1,0,'C');

		$this->fpdf->Ln(8);

		$this->fpdf->Cell(205,6,utf8_decode('Total General'), 0, 0, 'R');
		$this->fpdf->Cell(35,6,'asig - deduc',1,0,'C');
		$this->fpdf->Cell(35,6,'asig - deduc',1,0,'C');

		
		$this->fpdf->Output();
	}
	
	public function estado_comisiones(){
		$data = $this->reportes_model->listVendedores($_GET['id_vendedor']);
		//var_dump($data); die();
		$vendedor_name = $data[0]['apellidos'].' '.$data[0]['nombres'];

		$this->fpdf->AddPage();
		$this->fpdf->SetFont('Arial','B',16);
		$this->fpdf->Cell(275,10,'Estado de cuenta de Comisiones',0,0,'C');
		
		$this->fpdf->Ln(10);
		$this->fpdf->SetFont('Arial','B',10);

		// DATOS DEL VENDEDOR ********************************************************************

		$this->fpdf->SetFillColor(148, 196, 241); 

		$this->fpdf->Cell(80,8,'Vendedor', 0, 0, 'C', True);
		$this->fpdf->Cell(35,8,'Codigo',0,0,'C', True);
		$this->fpdf->Cell(80,8,'Coordinador',0,0,'C', True);
		$this->fpdf->Cell(80,8,'Periodo',0,0,'C', True);

		$this->fpdf->Ln(8);

		$this->fpdf->Cell(80,8, $vendedor_name, 0, 0, 'C');
		$this->fpdf->Cell(35,8, $data[0]['cod_vendedor'],0,0,'C');
		$this->fpdf->Cell(80,8, $data[0]['nombre_coordinador'],0,0,'C');
		$this->fpdf->Cell(80,8,'SEM 38 DEL 23/09/19 AL 29/09/19',0,0,'C');

		$this->fpdf->Line(10,36,285,36);
		// ASIGNACIONES **************************************************************************

		$this->fpdf->Ln(10);
		$this->fpdf->SetFont('Arial','',14);

		$this->fpdf->Cell(275,10,'a) Asignaciones',0,0,'L');

		$this->fpdf->Ln(15);

		$this->fpdf->SetFont('Arial','B',10);
		$this->fpdf->Cell(40,8,'Asegurado', 0, 0, 'C', True);
		$this->fpdf->Cell(30,8,'Cedula',0,0,'C', True);
		$this->fpdf->Cell(40,8,'Tipo Venta',0,0,'C', True);
		$this->fpdf->Cell(30,8,'Plan',0,0,'C', True);
		$this->fpdf->Cell(30,8,'Adicionales',0,0,'C', True);
		$this->fpdf->Cell(35,8,'Suma',0,0,'C', True);
		$this->fpdf->Cell(35,8,'Cuotas',0,0,'C', True);
		$this->fpdf->Cell(35,8,'Comision',0,0,'C', True);

		$this->fpdf->Ln(8);
		$this->fpdf->SetFont('Arial','',10);

		$this->fpdf->Cell(40,8,'Asegurado',1,0, 'C');
		$this->fpdf->Cell(30,8,'Cedula',1,0,'C');
		$this->fpdf->Cell(40,8,'Tipo Venta',1,0,'C');
		$this->fpdf->Cell(30,8,'Plan',1,0,'C');
		$this->fpdf->Cell(30,8,'Adicionales',1,0,'C');
		$this->fpdf->Cell(35,8,'Suma',1,0,'C');
		$this->fpdf->Cell(35,8,'Cuotas',1,0,'C');
		$this->fpdf->Cell(35,8,'Comision',1,0,'C');

		
		$this->fpdf->Ln(10);

		$this->fpdf->SetFont('Arial','',14);

		// DEDUCCIONES **************************************************************************


		$this->fpdf->Cell(275,10,'b) Deducciones',0,0,'L');

		$this->fpdf->Ln(15);

		$this->fpdf->SetFont('Arial','B',10);

		$this->fpdf->SetFont('Arial','B',10);
		$this->fpdf->Cell(40,8,'Asegurado', 0, 0, 'C', True);
		$this->fpdf->Cell(30,8,'Cedula',0,0,'C', True);
		$this->fpdf->Cell(40,8,'Tipo Venta',0,0,'C', True);
		$this->fpdf->Cell(30,8,'Plan',0,0,'C', True);
		$this->fpdf->Cell(30,8,'Adicionales',0,0,'C', True);
		$this->fpdf->Cell(35,8,'Suma',0,0,'C', True);
		$this->fpdf->Cell(35,8,'Cuotas',0,0,'C', True);
		$this->fpdf->Cell(35,8,'Comision',0,0,'C', True);

		$this->fpdf->Ln(8);
		$this->fpdf->SetFont('Arial','',10);

		$this->fpdf->Cell(40,8,'Asegurado',1,0, 'C');
		$this->fpdf->Cell(30,8,'Cedula',1,0,'C');
		$this->fpdf->Cell(40,8,'Tipo Venta',1,0,'C');
		$this->fpdf->Cell(30,8,'Plan',1,0,'C');
		$this->fpdf->Cell(30,8,'Adicionales',1,0,'C');
		$this->fpdf->Cell(35,8,'Suma',1,0,'C');
		$this->fpdf->Cell(35,8,'Cuotas',1,0,'C');
		$this->fpdf->Cell(35,8,'Comision',1,0,'C');

		$this->fpdf->Ln(10);

		$this->fpdf->Cell(240,8,utf8_decode('Total a pagar'), 0, 0, 'R');
		$this->fpdf->Cell(35,8,'asig - deduc',1,0,'C');

		
		$this->fpdf->Output();
	}
}

/* End of file welcome.php */
/* Location: ./application/controllers/welcome.php */