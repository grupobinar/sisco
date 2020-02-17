<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');

class Email extends CI_Controller {

	public function __construct()
	{
		parent::__construct();
		$this->load->helper('url');
    	$this->load->helper('form');
    	$this->load->model('reportes_model');
    	$this->load->library('session');
		$this->load->library('mail_master');
		$this->load->library('fpdf_master');

	}

	public function index()
	{
		$data['emails'] = $this->reportes_model->emails();
		$this->load->view('layout/header');
		$this->load->view('layout/nav');
		$this->load->view('email/email',$data);
		$this->load->view('layout/footer');
	}

	public function cierre(){	

    	$sem = $this->reportes_model->semanaMail();

		$cierre = $this->reportes_model->cierre('L',$sem['id_semana']);


		$this->fpdf->AddPage('L');
		$this->fpdf->Image(base_url().'assets/0.fw_.png',8,10,60);

		$this->fpdf->SetFont('Arial','B',14);
		$this->fpdf->Ln(10);
		$this->fpdf->Cell(280,10,utf8_decode('REPORTE DE CIERRE'),0,0,'C');
		$this->fpdf->SetFont('Arial','',10);
		$this->fpdf->Ln(5);
		$this->fpdf->SetFont('Arial','',9);

		$this->fpdf->Cell(280,10,'SEM '.$sem['nsem'].' desde: '.$sem['desde'].' hasta: '.$sem['hasta'] ,0,0,'C');
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
		$dest='/var/www/html/sisco/assets/cierre_prueba.pdf';
		$this->fpdf->Output('F', $dest);
		$data = $this->reportes_model->emails();
		foreach ($data as $key => $val) {
			$this->sendMail($dest,$val['email']);
		}
	}

	public function sendMail($pdf,$e){
			$this->mail->SMTPDebug = 0;                      // Enable verbose debug output
			$this->mail->isSMTP();                                            // Send using SMTP
			$this->mail->Host       = 'smtp.gmail.com';                    // Set the SMTP server to send through
			$this->mail->SMTPAuth   = true;                                   // Enable SMTP authentication
			$this->mail->Username   = 'grupobinar@gmail.com';                     // SMTP username
			$this->mail->Password   = 'Guitarrita86!';                               // SMTP password
			//$this->mail->SMTPSecure = PHPMailer::ENCRYPTION_STARTTLS;         // Enable TLS encryption; `PHPMailer::ENCRYPTION_SMTPS` also accepted
			$this->mail->Port       = 587;                                    // TCP port to connect to
		
			$this->mail->setFrom('grupobinar@gmail.com', 'SISCO MAIL');
			$this->mail->addAddress($e,$e);     // Add a recipient
			$this->mail->addReplyTo('grupobinar@gmail.com', 'SISCO MAIL');
			$this->mail->AddAttachment($pdf);
			
			// Content
			$this->mail->isHTML(true);                                  // Set email format to HTML
			$this->mail->Subject = 'Prueba de envio de adjunto';
			$this->mail->Body    = "Adjunto";
		
			$mail = $this->mail->send();
			$mail = $this->mail->ClearAllRecipients();
			
	}


}

