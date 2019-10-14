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
		$this->load->library('mail_master');
    }
	
	public function sendMail(){
		try {
			//Server settings
			//$this->mail->SMTPDebug = SMTP::DEBUG_SERVER;                      // Enable verbose debug output
			$this->mail->isSMTP();                                            // Send using SMTP
			$this->mail->Host       = 'smtp.gmail.com';                    // Set the SMTP server to send through
			$this->mail->SMTPAuth   = true;                                   // Enable SMTP authentication
			$this->mail->Username   = 'grupobinar@gmail.com';                     // SMTP username
			$this->mail->Password   = 'Cotufas#85';                               // SMTP password
			//$this->mail->SMTPSecure = PHPMailer::ENCRYPTION_STARTTLS;         // Enable TLS encryption; `PHPMailer::ENCRYPTION_SMTPS` also accepted
			$this->mail->Port       = 587;                                    // TCP port to connect to
		
			//Recipients
			$this->mail->setFrom('from@example.com', 'Mailer');
			$this->mail->addAddress('brujidat@gmail.com', 'Katherine');     // Add a recipient
			$this->mail->addReplyTo('info@example.com', 'Information');
			//***************************************************************
			$html="";
			$html.='<div style="background: #cecece">';
			$html.='<br>';
			$html.='<table width="60%" style="margin:0 auto; background: white;">';
				$html.='<tr>';
					$html.='<td colspan="2">';
						$html.='<table width="100%" style="background: #044767; height: 100px; color: white; font-size: 25px; font-weight: bold; ">';
							$html.='<tr>';
								$html.='<td style="padding: 5px; padding-left: 25;">Ventas realizadas</td>';
								$html.='<td style="padding: 5px; padding-right: 25; text-align: right;">:::</td>';
							$html.='</tr>';
						$html.='</table>';
					$html.='</td>';
				$html.='</tr>';
				$html.='<tr>';
					$html.='<th style="vertical-align: middle;" colspan="2">';
						$html.='<br>';
						$html.='<img src="./sisco/assets/check.png" style="margin: 0 auto;" width="20%">';
					$html.='</th>';
				$html.='</tr>';
				$html.='<tr style="vertical-align: middle;  color: #000000">';
					$html.='<td style="padding: 15px;"> Vendedor: [nombre_del_vendedor] </td>';
					$html.='<td style="padding: 15px; text-align: right;"> [correo] <br> [telefono] </td>';
				$html.='</tr>';
				$html.='<tr style="vertical-align: middle;  color: #666666">';
					$html.='<td style="padding: 15px;"> [cedula_tomador][nombre_apellido_tomador] <br> [tipo_venta] [tipo_poliza] [num_poliza] </td>';
					$html.='<td style="padding: 15px; text-align: right;"> [comision_a_cancelar] </td>';
				$html.='</tr>';
				$html.='<tr style="vertical-align: middle;  color: #666666">';
					$html.='<td style="padding: 15px;"> [cedula_tomador][nombre_apellido_tomador] <br> [tipo_venta] [tipo_poliza] [num_poliza] [semana] </td>';
					$html.='<td style="padding: 15px; text-align: right;"> [-monto_extornado] </td>';
				$html.='</tr>';
				$html.='<tr style="vertical-align: middle;  color: #000000">';
					$html.='<td style="padding: 15px;"> <b>TOTAL</b> </td>';
					$html.='<td style="padding: 15px; text-align: right;"> [comision_a_cancelar_total] </td>';
				$html.='</tr>';
			$html.='</table>';
			$html.='<br>';
			$html.='</div>';

//*************************************************************************************************************
	
			// Content
			$this->mail->isHTML(true);                                  // Set email format to HTML
			$this->mail->Subject = 'Here is the subject';
			$this->mail->Body    = $html;
			$this->mail->AltBody = 'This is the body in plain text for non-HTML mail clients';
		
			$this->mail->send();
			echo 'Message has been sent';
		} catch (Exception $e) {
			echo "Message could not be sent. Mailer Error: {mail->ErrorInfo}";
		}	
	}

	public function rpt_por_coordinador(){
		
		$data['coordinadores'] = $this->reportes_model->e_listcoord();
		$data['sem'] = $this->reportes_model->e_listsemana();
		
		$this->load->view('layout/header');
		$this->load->view('layout/nav');
		$this->load->view('reportes/comisiones_general', $data);
		$this->load->view('layout/footer');
	}


	public function comisiones_general(){
		$data = $this->polizas_model->getSemanaDetalle(0,0);		
		$this->load->view('layout/header');
		$this->load->view('layout/nav');
		$this->load->view('reportes/comisiones_general', $data);
		$this->load->view('layout/footer');
	}

    public function porcoordinador(){


    	$sem = $this->reportes_model->semana($_POST['sem']);
    	$coordinador = $this->reportes_model->coordinador($_POST['cod_vendedor']);

    	$vendedores = $this->reportes_model->vendedores_rpt_general($coordinador['id_user'],$sem['id_semana']);


		$this->fpdf->AddPage();
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
			$cvendedor=$cvendedor+$comision[$i]['sum'];
			$ccoordinador=$ccoordinador+($comision[$i]['sum']*0.2);
			$this->fpdf->Cell(40,6,utf8_decode($value['concepto']),1,0,'C');
			$this->fpdf->Cell(25,6,$cel[$i]['total'],1,0,'C');
			$this->fpdf->Cell(20,6,number_format($comision[$i]['sum'], 2, ',', '.') ,1,0,'C');
			$this->fpdf->Cell(23,6,number_format($comision[$i]['sum']*0.2, 2, ',', '.'),1,0,'C');

			$this->fpdf->Ln(6);
			$i++;

		}


		$this->fpdf->Ln(8);
		$this->fpdf->SetFont('Arial','B',8);

		$this->fpdf->Cell(127,6,utf8_decode('Total asignaciones'), 0, 0, 'R');
		$this->fpdf->Cell(25,6,$total,1,0,'C');
		$this->fpdf->Cell(20,6,number_format($cvendedor, 2, ',', '.'),1,0,'C');
		$this->fpdf->Cell(23,6,number_format($ccoordinador, 2, ',', '.'),1,0,'C');

		$this->fpdf->Ln(10);
		$this->fpdf->SetFont('Arial','',12);

		// DEDUCCIONES **************************************************************************


		$this->fpdf->Cell(275,10,'Deducciones',0,0,'L');

		$this->fpdf->Ln(15);

		$this->fpdf->SetFont('Arial','B',8);
		$this->fpdf->SetFillColor(148, 196, 241); 

		$this->fpdf->Cell(40,8,'Tomador', 0, 0, 'C', True);
		$this->fpdf->Cell(20,8,'Cedula',0,0,'C', True);
		$this->fpdf->Cell(37,8,'Causa',0,0,'C', True);
		$this->fpdf->Cell(15,8,'Familiares',0,0,'C', True);
		$this->fpdf->Cell(25,8,'S.A',0,0,'C', True);
		$this->fpdf->Cell(15,8,'Cuotas',0,0,'C', True);
		$this->fpdf->Cell(20,8,'Comision',0,0,'C', True);
		$this->fpdf->Cell(23,8,'Coordinador',0,0,'C', True);

		$this->fpdf->Ln(8);
		$this->fpdf->SetFont('Arial','',8);

		/*$this->fpdf->Cell(40,6,'Katherine', 1, 0, 'C');
		$this->fpdf->Cell(20,6,'21072511',1,0,'C');
		$this->fpdf->Cell(37,6,'No pago',1,0,'C');
		$this->fpdf->Cell(15,6,'4',1,0,'C');
		$this->fpdf->Cell(25,6,'100.000.000,00',1,0,'C');
		$this->fpdf->Cell(15,6,'4',1,0,'C');
		$this->fpdf->Cell(20,6,'100.000,00',1,0,'C');
		$this->fpdf->Cell(23,6,'1.000,00',1,0,'C');*/

		$this->fpdf->Ln(8);
		$this->fpdf->SetFont('Arial','B',8);

		$this->fpdf->Cell(152,6,utf8_decode('Total deducciones'), 0, 0, 'R');
		$this->fpdf->Cell(20,6,'0,00',1,0,'C');
		$this->fpdf->Cell(23,6,'0,00',1,0,'C');

		$this->fpdf->Ln(8);

		$this->fpdf->Cell(152,6,utf8_decode('Total General'), 0, 0, 'R');
		$this->fpdf->Cell(20,6,number_format($cvendedor, 2, ',', '.'),1,0,'C');
		$this->fpdf->Cell(23,6,number_format($ccoordinador, 2, ',', '.'),1,0,'C');

		
		$this->fpdf->Output();
	}
	
	public function estado_comisiones(){
		$data = $this->reportes_model->listVendedores($_GET['id_vendedor']);
		$ventas_vendedores = $this->polizas_model->getVendedoresVentasPolizas(0, intval($data[0]['cod_vendedor']), 'L');
		if (count($ventas_vendedores)) {
			$vendedor_name = $data[0]['apellidos'].' '.$data[0]['nombres'];
			$vendedores_orden = array();
	
			foreach ($ventas_vendedores as $key => $item) {
				$vendedores_orden[$item['id_semana']][$key] = $item;
			}
	
			$keys_semanas = array_keys($vendedores_orden); 
			$size_semanas = sizeof($vendedores_orden);
	
			for ($i=0; $i < $size_semanas; $i++) { 
				$semana_detalle = $this->polizas_model->getSemanaDetalle($keys_semanas[$i], 1);
				$nsem = $semana_detalle[0]['nsem'];
				$desde = $semana_detalle[0]['desde'];
				$hasta = $semana_detalle[0]['hasta'];
	
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
				$this->fpdf->Cell(80,8,"SEM $nsem DEL $desde AL $hasta",0,0,'C');
	
				$this->fpdf->Line(10,36,285,36);
				// ASIGNACIONES **************************************************************************
	
				$this->fpdf->Ln(10);
				$this->fpdf->SetFont('Arial','',14);
	
				$this->fpdf->Cell(275,10,'a) Asignaciones',0,0,'L');
	
				$this->fpdf->Ln(15);
	
				$this->fpdf->SetFont('Arial','B',10);
				$this->fpdf->Cell(45,8,'Asegurado', 0, 0, 'C', True);
				$this->fpdf->Cell(30,8,'Cedula',0,0,'C', True);
				$this->fpdf->Cell(45,8,'Tipo Venta',0,0,'C', True);
				$this->fpdf->Cell(30,8,'Plan',0,0,'C', True);
				$this->fpdf->Cell(20,8,'Adicionales',0,0,'C', True);
				$this->fpdf->Cell(35,8,'Suma',0,0,'C', True);
				$this->fpdf->Cell(35,8,'Cuotas',0,0,'C', True);
				$this->fpdf->Cell(35,8,'Comision',0,0,'C', True);
	
				$vendedores_orden[$keys_semanas[$i]] = array_values($vendedores_orden[$keys_semanas[$i]]);
				for ($j=0; $j < count($vendedores_orden[$keys_semanas[$i]]); $j++) { 
	
					$this->db->where('t_adicionales.id_venta',$vendedores_orden[$keys_semanas[$i]][$j]['id_venta']);
					$adicionales_venta = $this->db->get('public.t_adicionales')->result_array();
	
					$this->db->where('t_liquidacion.id_venta',$vendedores_orden[$keys_semanas[$i]][$j]['id_venta']);
					$liquidacion_venta = $this->db->get('public.t_liquidacion')->result_array();
	
					$this->fpdf->Ln(8);
					$this->fpdf->SetFont('Arial','',10);
			
					$this->fpdf->Cell(45,8, $vendedores_orden[$keys_semanas[$i]][$j]['tomador_nombre'],1,0, 'C');
					$this->fpdf->Cell(30,8, $vendedores_orden[$keys_semanas[$i]][$j]['tomador_cedula'],1,0,'C');
					$this->fpdf->Cell(45,8, utf8_decode($vendedores_orden[$keys_semanas[$i]][$j]['concepto_venta']),1,0,'C');
					$this->fpdf->Cell(30,8, $vendedores_orden[$keys_semanas[$i]][$j]['descripcion_plan'],1,0,'C');
					$this->fpdf->Cell(20,8, count($adicionales_venta),1,0,'C');
					$this->fpdf->Cell(35,8, $vendedores_orden[$keys_semanas[$i]][$j]['suma_asegurada'],1,0,'C');
					$this->fpdf->Cell(35,8, $vendedores_orden[$keys_semanas[$i]][$j]['cuotas_canceladas'],1,0,'C');
					$this->fpdf->Cell(35,8, $liquidacion_venta[0]['comision_liquidada'],1,0,'C');
				}
			
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
			}
			
			$this->fpdf->Output();		
		}else{
			echo "<script>window.close();</script>";
		}
	}

	/*public function produccion_por_coordinador(){

		$data = $this->reportes_model->listVendedores($_GET['id_vendedor']);

		//var_dump($data); die();
		$vendedor_name = $data[0]['apellidos'].' '.$data[0]['nombres'];

		$this->fpdf->AddPage();
		$this->fpdf->SetFont('Arial','B',16);
		$this->fpdf->Cell(275,10,utf8_decode('REPORTE SEMANAL DE PRODUCCIÓN POR COORDINADOR'),0,0,'C');
		$this->fpdf->SetFont('Arial','B',12);
		$this->fpdf->Ln(10);
		$this->fpdf->Cell(275,8,'SEM 38 DEL 23/09/19 AL 29/09/19',0,0,'C');

		
		$this->fpdf->Ln(10);
		$this->fpdf->SetFont('Arial','B',10);

		// DATOS DEL COORDINADOR *****************************************************************

		$this->fpdf->SetFillColor(148, 196, 241); 
		$this->fpdf->Cell(275,8,'COORDINADOR: PEDRO PEREZ',0,0,'L');
		$this->fpdf->Ln(8);
		$this->fpdf->Line(10,38,285,38);

		// CUADRO RESUMEN ************************************************************************

		$this->fpdf->Ln(10);
		$this->fpdf->SetFont('Arial','',14);

		$this->fpdf->SetFont('Arial','B',8);
		$this->fpdf->Cell(50,16,'ASESOR', 1, 0, 'C');
		$this->fpdf->Cell(8,16,'VTAS',1,0,'C');
		$this->fpdf->Cell(8,16,'I1',1,0,'C');
		$this->fpdf->Cell(8,16,'I2',1,0,'C');
		$this->fpdf->Cell(8,16,'I3',1,0,'C');
		$this->fpdf->Cell(8,16,'I4',1,0,'C');
		$this->fpdf->Cell(8,16,'I5',1,0,'C');
		$this->fpdf->Cell(8,16,'I6',1,0,'C');
		$this->fpdf->Cell(8,16,'I10',1,0,'C');
		$this->fpdf->Cell(8,16,'TCH',1,0,'C');
		$this->fpdf->Cell(8,16,'TCHP',1,0,'C');
		$this->fpdf->Cell(8,16,'ADC',1,0,'C');
		$this->fpdf->Cell(64,8,'S.A (MILES)', 1, 0, 'C');
		$this->fpdf->Cell(8,16,'AC',1,0,'C');
		$this->fpdf->Cell(8,16,'TSV',1,0,'C');
		$this->fpdf->Cell(8,16,'IN',1,0,'C');
		$this->fpdf->Cell(8,16,'CC',1,0,'C');
		$this->fpdf->Cell(8,16,'CP',1,0,'C');
		$this->fpdf->Cell(33,16,'COMISIONES',1,0,'C');

		$this->fpdf->Ln(8);

		$this->fpdf->Cell(138,8,'', 0, 0, 'C');
		$this->fpdf->Cell(8,8,'200',1,0,'C');
		$this->fpdf->Cell(8,8,'1000',1,0,'C');
		$this->fpdf->Cell(8,8,'1500',1,0,'C');
		$this->fpdf->Cell(8,8,'2000',1,0,'C');
		$this->fpdf->Cell(8,8,'2500',1,0,'C');
		$this->fpdf->Cell(8,8,'3500',1,0,'C');
		$this->fpdf->Cell(8,8,'5000',1,0,'C');
		$this->fpdf->Cell(8,8,'6500',1,0,'C');

		$this->fpdf->Ln(8);

		// VENDEDORES *********************************************************************************

		$this->fpdf->Cell(50,8,'', 1, 0, 'C');
		$this->fpdf->Cell(8,8,'',1,0,'C');
		$this->fpdf->Cell(8,8,'',1,0,'C');
		$this->fpdf->Cell(8,8,'',1,0,'C');
		$this->fpdf->Cell(8,8,'',1,0,'C');
		$this->fpdf->Cell(8,8,'',1,0,'C');
		$this->fpdf->Cell(8,8,'',1,0,'C');
		$this->fpdf->Cell(8,8,'',1,0,'C');
		$this->fpdf->Cell(8,8,'',1,0,'C');
		$this->fpdf->Cell(8,8,'',1,0,'C');
		$this->fpdf->Cell(8,8,'',1,0,'C');
		$this->fpdf->Cell(8,8,'',1,0,'C');
		$this->fpdf->Cell(8,8,'',1,0,'C');
		$this->fpdf->Cell(8,8,'',1,0,'C');
		$this->fpdf->Cell(8,8,'',1,0,'C');
		$this->fpdf->Cell(8,8,'',1,0,'C');
		$this->fpdf->Cell(8,8,'',1,0,'C');
		$this->fpdf->Cell(8,8,'',1,0,'C');
		$this->fpdf->Cell(8,8,'',1,0,'C');
		$this->fpdf->Cell(8,8,'',1,0,'C');
		$this->fpdf->Cell(8,8,'',1,0,'C');
		$this->fpdf->Cell(8,8,'',1,0,'C');
		$this->fpdf->Cell(8,8,'',1,0,'C');
		$this->fpdf->Cell(8,8,'',1,0,'C');
		$this->fpdf->Cell(8,8,'',1,0,'C');
		$this->fpdf->Cell(33,8,'0,00',1,0,'R');

		// TOTALES *****************************************************************************************

		$this->fpdf->Ln(8);

		$this->fpdf->Cell(50,8,'TOTALES	', 1, 0, 'C');
		$this->fpdf->Cell(8,8,'',1,0,'C');
		$this->fpdf->Cell(8,8,'',1,0,'C');
		$this->fpdf->Cell(8,8,'',1,0,'C');
		$this->fpdf->Cell(8,8,'',1,0,'C');
		$this->fpdf->Cell(8,8,'',1,0,'C');
		$this->fpdf->Cell(8,8,'',1,0,'C');
		$this->fpdf->Cell(8,8,'',1,0,'C');
		$this->fpdf->Cell(8,8,'',1,0,'C');
		$this->fpdf->Cell(8,8,'',1,0,'C');
		$this->fpdf->Cell(8,8,'',1,0,'C');
		$this->fpdf->Cell(8,8,'',1,0,'C');
		$this->fpdf->Cell(8,8,'',1,0,'C');
		$this->fpdf->Cell(8,8,'',1,0,'C');
		$this->fpdf->Cell(8,8,'',1,0,'C');
		$this->fpdf->Cell(8,8,'',1,0,'C');
		$this->fpdf->Cell(8,8,'',1,0,'C');
		$this->fpdf->Cell(8,8,'',1,0,'C');
		$this->fpdf->Cell(8,8,'',1,0,'C');
		$this->fpdf->Cell(8,8,'',1,0,'C');
		$this->fpdf->Cell(8,8,'',1,0,'C');
		$this->fpdf->Cell(8,8,'',1,0,'C');
		$this->fpdf->Cell(8,8,'',1,0,'C');
		$this->fpdf->Cell(8,8,'',1,0,'C');
		$this->fpdf->Cell(8,8,'',1,0,'C');
		$this->fpdf->Cell(33,8,'0,00',1,0,'R');

		$this->fpdf->Ln(20);

		$this->fpdf->Cell(68,8,'__________________________________',0,0,'C');
		$this->fpdf->Cell(68,8,'__________________________________',0,0,'C');
		$this->fpdf->Cell(68,8,'__________________________________',0,0,'C');
		$this->fpdf->Cell(68,8,'__________________________________',0,0,'C');

		$this->fpdf->Ln(8);

		$this->fpdf->Cell(68,8,'COORDINADOR',0,0,'C');
		$this->fpdf->Cell(68,8,'AUDITOR',0,0,'C');
		$this->fpdf->Cell(68,8,'SUPERVISOR',0,0,'C');
		$this->fpdf->Cell(68,8,'GERENTE DE VENTAS',0,0,'C');

		$this->fpdf->Output();
	}*/


	public function metricas(){

		$this->fpdf->AddPage();
		$this->fpdf->SetFont('Arial','B',16);
		$this->fpdf->Cell(275,10,utf8_decode('METRICAS SEMANALES'),0,0,'C');
		$this->fpdf->SetFont('Arial','B',12);
		$this->fpdf->Ln(10);
		$this->fpdf->Cell(275,8,'SEM 38 DEL 23/09/19 AL 29/09/19',0,0,'C');

		
		$this->fpdf->Ln(10);
		$this->fpdf->SetFont('Arial','B',10);

		// METRICAS POR TIPO DE PAGO *****************************************************************

		$data = $this->reportes_model->metrica_tpago();



		//print_r($data);

		$this->fpdf->SetFillColor(148, 196, 241); 
		$this->fpdf->Cell(130,8,'Metricas por tipo de pago',1,0,'L', true);
		$this->fpdf->Ln(8);
		$this->fpdf->Cell(50,8,'Tipo de pago',1,0,'L', true);
		$this->fpdf->Cell(40,8,'Num. Ventas',1,0,'L', true);
		$this->fpdf->Cell(40,8,'Monto Total Cobrado',1,0,'L', true);
		$this->fpdf->Ln(8);

		foreach ($data as $key) {
			$this->fpdf->Cell(50,8,$key['tpago'],1,0,'L');
			$this->fpdf->Cell(40,8,$key['total'],1,0,'L');
			$this->fpdf->Cell(40,8,$key['suma'],1,0,'L');
			$this->fpdf->Ln(8);
		}
		
		$this->fpdf->Ln(6);


		// METRICAS POR TIPO DE VENTA *****************************************************************

		$data = $this->reportes_model->metrica_tventa();

		$this->fpdf->SetFillColor(148, 196, 241); 
		$this->fpdf->Cell(90,8,'Metricas por tipo de venta',1,0,'L', true);
		$this->fpdf->Ln(8);
		$this->fpdf->Cell(50,8,'Tipo de venta',1,0,'L', true);
		$this->fpdf->Cell(40,8,'Num. Ventas',1,0,'L', true);
		$this->fpdf->Ln(8);

		foreach ($data as $key) {
			$this->fpdf->Cell(50,8,$key['tventa'],1,0,'L');
			$this->fpdf->Cell(40,8,$key['total'],1,0,'L');
			$this->fpdf->Ln(8);
		}

		// CUADRO RESUMEN *****************************************************************************

		$this->fpdf->Output();
	}

}