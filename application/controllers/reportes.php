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
			$this->mail->Username   = 'thomasro10@gmail.com';                     // SMTP username
			$this->mail->Password   = 'Thomasro_2903';                               // SMTP password
			//$this->mail->SMTPSecure = PHPMailer::ENCRYPTION_STARTTLS;         // Enable TLS encryption; `PHPMailer::ENCRYPTION_SMTPS` also accepted
			$this->mail->Port       = 587;                                    // TCP port to connect to
		
			//Recipients
			$this->mail->setFrom('from@example.com', 'Mailer');
			$this->mail->addAddress('thisaparattusmoved@gmail.com', 'Thomas Romero');     // Add a recipient
			$this->mail->addReplyTo('info@example.com', 'Information');
		
			// Attachments
			//$this->mail->addAttachment('/var/tmp/file.tar.gz');         // Add attachments
			//$this->mail->addAttachment('/tmp/image.jpg', 'new.jpg');    // Optional name
		
			// Content
			$this->mail->isHTML(true);                                  // Set email format to HTML
			$this->mail->Subject = 'Here is the subject';
			$this->mail->Body    = 'This is the HTML message body <b>in bold!</b>';
			$this->mail->AltBody = 'This is the body in plain text for non-HTML mail clients';
		
			$this->mail->send();
			echo 'Message has been sent';
		} catch (Exception $e) {
			echo "Message could not be sent. Mailer Error: {mail->ErrorInfo}";
		}		
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


	public function comisiones_general(){
		$data = $this->polizas_model->getSemanaDetalle(0,0);		
		$this->load->view('layout/header');
		$this->load->view('layout/nav');
		$this->load->view('reportes/comisiones_general', $data);
		$this->load->view('layout/footer');
	}

    public function estado_general(){
		$data = $this->reportes_model->listVendedores('I', $_GET['id_semana']);

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

		for ($x=0; $x < count($data); $x++) { 
			$data_ventas = $this->polizas_model->getVendedoresVentasPolizas($_GET['id_semana'], 'vendedores', 'L');

			foreach ($data_ventas as $key => $item) {
				$data_ventas_orden[$item['id_vendedor']][$item['id_concepto_venta']][$key] = $item;
			}
	
			$keys_vendedor = array_keys($data_ventas_orden); 
			$size_vendedor = sizeof($data_ventas_orden);
	
			for ($j=0; $j < $size_vendedor; $j++) { 
				$keys_semanas = array_keys($data_ventas_orden[$keys_vendedor[$j]]); 
				$size_semanas = sizeof($data_ventas_orden[$keys_vendedor[$j]]); 
		
				for ($i=0; $i < $size_semanas; $i++) { 
					$tipo_count = array_count_values(array_column($data_ventas_orden[$keys_vendedor[$j]][$keys_semanas[$i]], 'id_concepto_venta'));
				}		
			}
	
			$celdas_multi = count($tipo_count) * 6;
			$tipo_count_keys = array_keys($tipo_count);

			$this->fpdf->Ln(8);
			$this->fpdf->SetFont('Arial','',10);
	
			$this->fpdf->Cell(65,$celdas_multi,utf8_decode($data[$x]['nombres'].' '.$data[$x]['apellidos']), 1, 0, 'C');
			$this->fpdf->Cell(30,$celdas_multi,'30756',1,0,'C');

			for ($y=0; $y < count($tipo_count_keys); $y++) {
				if ($y === 0) {
					switch ($tipo_count_keys[$y]) {
						case 1:
							$this->fpdf->Cell(60,6,utf8_decode('Emisión'),1,0,'C');
							$this->fpdf->Cell(50,6, $tipo_count[$tipo_count_keys[$y]],1,0,'C');
							$this->fpdf->Cell(35,6,'102.441,50',1,0,'C');
							$this->fpdf->Cell(35,6,'20.488,30',1,0,'C');
							break;
						
						case 2:
							$this->fpdf->Cell(60,6,utf8_decode('Actualización de Datos'),1,0,'C');
							$this->fpdf->Cell(50,6,'8',1,0,'C');
							$this->fpdf->Cell(35,6,'8.000,00',1,0,'C');
							$this->fpdf->Cell(35,6,'1.600,00',1,0,'C');
							break;
	
						case 3:
							$this->fpdf->Cell(60,6,utf8_decode('Persona Adicional'),1,0,'C');
							$this->fpdf->Cell(50,6,'8',1,0,'C');
							$this->fpdf->Cell(35,6,'8.000,00',1,0,'C');
							$this->fpdf->Cell(35,6,'1.600,00',1,0,'C');
							break;
					}
				}else{
					switch ($tipo_count[$y]) {
						case 1:
							$this->fpdf->Ln(6);
							$this->fpdf->Cell(65,6,utf8_decode(''), 0, 0, 'C');
							$this->fpdf->Cell(30,6,'',0,0,'C');
							$this->fpdf->Cell(60,6,utf8_decode('Emisión'),1,0,'C');
							$this->fpdf->Cell(50,6,'2',1,0,'C');
							$this->fpdf->Cell(35,6,'102.441,50',1,0,'C');
							$this->fpdf->Cell(35,6,'20.488,30',1,0,'C');
							break;
						
						case 2:
							$this->fpdf->Ln(6);
							$this->fpdf->Cell(65,6,utf8_decode(''), 0, 0, 'C');
							$this->fpdf->Cell(30,6,'',0,0,'C');
							$this->fpdf->Cell(60,6,utf8_decode('Actualización de Datos'),1,0,'C');
							$this->fpdf->Cell(50,6,'8',1,0,'C');
							$this->fpdf->Cell(35,6,'8.000,00',1,0,'C');
							$this->fpdf->Cell(35,6,'1.600,00',1,0,'C');
							break;
	
						case 3:
							$this->fpdf->Ln(6);
							$this->fpdf->Cell(65,6,utf8_decode(''), 0, 0, 'C');
							$this->fpdf->Cell(30,6,'',0,0,'C');
							$this->fpdf->Cell(60,6,utf8_decode('Persona Adicional'),1,0,'C');
							$this->fpdf->Cell(50,6,'8',1,0,'C');
							$this->fpdf->Cell(35,6,'8.000,00',1,0,'C');
							$this->fpdf->Cell(35,6,'1.600,00',1,0,'C');
							break;
					}
				}
			}

			$this->fpdf->Ln(8);
			$this->fpdf->SetFont('Arial','B',10);
	
			$this->fpdf->Cell(155,6,utf8_decode('Total asignaciones'), 0, 0, 'R');
			$this->fpdf->Cell(50,6,'12',1,0,'C');
			$this->fpdf->Cell(35,6,'suma total',1,0,'C');
			$this->fpdf->Cell(35,6,'suma total',1,0,'C');
		}

		
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
}

/* End of file welcome.php */
/* Location: ./application/controllers/welcome.php */