<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');

class Liquidacion extends CI_Controller {

	public function __construct()
	{
		parent::__construct();
		$this->load->helper('url');
    	$this->load->helper('form');
    	$this->load->model('liquidacion_model');
    	$this->load->library('session');
		$this->load->library('mail_master');

	}

	public function index()
	{

		$data = $this->liquidacion_model->listventas('A');

		$cc = $this->liquidacion_model->comision_coordinador();

		$i=0;

		if ($data<>"") {
		foreach($data as $sheet) {
			$i++;		
			
			$lista[$i]["id_vendedor"]=$sheet->id_vendedor;
			$lista[$i]["identificacion"]=$sheet->identificacion;
			$lista[$i]["nsem"]=$sheet->nsem;
			$lista[$i]["id_semana"]=$sheet->id_semana;
			$lista[$i]["desde"]=$sheet->desde;
			$lista[$i]["hasta"]=$sheet->hasta;
			$lista[$i]["nombres"]=$sheet->nombres;
			$lista[$i]["apellidos"]=$sheet->apellidos;
			$lista[$i]["telefono"]=$sheet->telefono;
			$lista[$i]["ventas"]=$this->liquidacion_model->contar($sheet->id_vendedor,$sheet->id_semana,'X');		
			$lista[$i]["comision"]=$this->liquidacion_model->ventas_vendedor($sheet->id_vendedor,$sheet->id_semana,0,'X',0);
			$lista[$i]["comision_c"]=$lista[$i]["comision"]*($cc->comision_c/100);		

			}
		}

		$datos['ventas']=$lista;


		$this->load->view('layout/header');
		$this->load->view('layout/nav');
		$this->load->view('preliquidacion',$datos);
		$this->load->view('layout/footer');
	}

	public function sendMail($vendedor,$sem){
	//	try {
			$v = $this->liquidacion_model->mail_vendedores($vendedor,$sem);

			//print_r($v);
			//break;
			//Server settings ClearAllRecipients(
			$this->mail->SMTPDebug = 0;                      // Enable verbose debug output
			$this->mail->isSMTP();                                            // Send using SMTP
			$this->mail->Host       = 'smtp.gmail.com';                    // Set the SMTP server to send through
			$this->mail->SMTPAuth   = true;                                   // Enable SMTP authentication
			$this->mail->Username   = 'grupobinar@gmail.com';                     // SMTP username
			$this->mail->Password   = 'Guitarrita86!';                               // SMTP password
			//$this->mail->SMTPSecure = PHPMailer::ENCRYPTION_STARTTLS;         // Enable TLS encryption; `PHPMailer::ENCRYPTION_SMTPS` also accepted
			$this->mail->Port       = 587;                                    // TCP port to connect to
		
			$vendedor=strtoupper($v['v']['apellidos'].' '.$v['v']['nombres']);
			$this->mail->setFrom('grupobinar@gmail.com', 'SISCO MAIL');
			$this->mail->addAddress($v['v']['correo'], $vendedor);     // Add a recipient
			$this->mail->addReplyTo('grupobinar@gmail.com', 'SISCO MAIL');
			//***************************************************************
			$html="";
			$html.='<div style="background: #cecece">';
			$html.='<br>';
			$html.='<table width="60%" style="margin:0 auto; background: white;">';
				/*$html.='<tr>';
					$html.='<td>';
					$html.='';
					$html.='</td>';
				$html.='</tr>';*/
				$html.='<tr>';
					$html.='<td colspan="2">';
						$html.='<table width="100%" style="background: #044767; height: 100px; color: white; font-size: 25px; font-weight: bold; ">';
							$html.='<tr>';
								$html.='<td style="padding: 5px; padding-left: 25px;">RELACION DE PAGOS<p style="font-size: 13px;">SEM:'.$v['s']['nsem'].' | '.$v['s']['desde'].' - '.$v['s']['hasta'].'</p></td>';
								$html.='<td style="padding: 5px; padding-right: 25px; text-align: right;"><img src="http://grupobinar.com/wp-content/uploads/2019/10/leonardo_right_white.png" alt="Leonardo Tirado" width="200" height="50"></td>';
							$html.='</tr>';
						$html.='</table>';
					$html.='</td>';
				$html.='</tr>';
				$html.='<tr style="vertical-align: middle;  color: #000000">';
					$html.='<td style="padding: 15px;"> VENDEDOR: '.strtoupper($v['v']['apellidos'].' '.$v['v']['nombres']).' </td>';
					$html.='<td style="padding: 15px; text-align: right;"> '.$v['v']['correo'].' <br> '.$v['v']['telefono'].' </td>';
				$html.='</tr>';

				$comision=0;

				foreach ($v['vt'] as $key) {
				
				$html.='<tr style="vertical-align: middle;  color: #666666">';
					$html.='<td style="padding: 15px; padding-top: 1px; padding-bottom: 1px;"> '.strtoupper($key['concepto'].' '.$key['tpoliza'].' '.$key['num_poliza']).' </td>';
					$html.='<td style="padding: 15px; padding-top: 1px; padding-bottom: 1px; text-align: right; color:green"> '.number_format($key['comision_liquidada'], 2, ',', '.').'</td>';
				$html.='</tr>';
				$html.='<tr><td style="padding: 15px; padding-top: 1px; padding-bottom: 1px; color:#cecece" colspan="2"><hr></td></tr>';

				$comision=$comision + $key['comision_liquidada'];

				$this->liquidacion_model->reporter_null($key['id_liquidacion']);

				}

				foreach ($v['e'] as $key) {

				$extornos=0;
				
				$html.='<tr style="vertical-align: middle;  color: #666666">';
					$html.='<td style="padding: 15px; padding-top: 1px; padding-bottom: 1px;"><b style="color:red">[EXT]</b> '.strtoupper($key['concepto'].' '.$key['tpoliza'].' '.$key['num_poliza'].' SEM:'.$key['nsem']).' </td>';
					$html.='<td style="padding: 15px; padding-top: 1px; padding-bottom: 1px; text-align: right; color:red"> - '.number_format($key['monto_fraccionado'], 2, ',', '.').'</td>';
				$html.='</tr>';
				$html.='<tr><td style="padding: 15px; padding-top: 1px; padding-bottom: 1px; color:#cecece" colspan="2"><hr></td></tr>';

				$extornos= $extornos + $key['monto_fraccionado'];

				$this->liquidacion_model->extorno_status($key['id_extorno']);

				}

				$comision = $comision - $extornos;

				$html.='<tr style="vertical-align: middle;  color: #000000">';
					$html.='<td style="padding: 15px;"> <b>TOTAL</b> </td>';
					$html.='<td style="padding: 15px; text-align: right;"> <b>'.number_format($comision, 2, ',', '.').' </b></td>';
				$html.='</tr>';
			$html.='</table>';
			$html.='<br>';
			//$html.='<b>Este correo es generado automaticamente a travez SISCO V1.0, no responder<b>';
			$html.='</div>';

//*************************************************************************************************************
	
			// Content
			$this->mail->isHTML(true);                                  // Set email format to HTML
			$this->mail->Subject = 'Estado de cuenta';
			$this->mail->Body    = $html;
			//$this->mail->AltBody = 'This is the body in plain text for non-HTML mail clients';
		
			$mail = $this->mail->send();
			$mail = $this->mail->ClearAllRecipients();
			//echo 'Message has been sent';ClearAllRecipients(
		//} catch (Exception $e) {
			//echo "Message could not be sent. Mailer Error: {mail->ErrorInfo}";
		//}	
	}

	public function ver(){

		$id=$_GET['id'];
		$sem=$_GET['sem'];

		$data=$this->liquidacion_model->detallePreliquidacion($id,$sem,'X');

		$cc = $this->liquidacion_model->comision_coordinador();

		$i=0;

		if ($data<>"") {
		foreach($data as $sheet) {
			$i++;		
			
			$lista[$i]["id_venta"]=$sheet->id_venta;
			$lista[$i]["id_vendedor"]=$id;
			$lista[$i]["tventa"]=$sheet->tventa;
			$lista[$i]["tpoliza"]=$sheet->tpoliza;
			$lista[$i]["tplan"]=$sheet->tplan;
			$lista[$i]["suma"]=$sheet->suma;
			$lista[$i]["semm"]=$sem;
			$lista[$i]["factor"]=$sheet->factor;
			$lista[$i]["cpagadas"]=$sheet->cuotas_canceladas;
			$lista[$i]["adicionales"]=$this->liquidacion_model->contar_adicionales($sheet->id_venta);
			$lista[$i]["comision"]=$this->liquidacion_model->ventas_vendedor($sheet->id_vendedor,$sheet->id_semana,$sheet->id_venta,'X',0);
			$lista[$i]["comision_c"]=$lista[$i]["comision"]*($cc->comision_c/100);		

			}
		}

		

		$this->load->view('layout/header');
		$this->load->view('layout/nav');
		$this->load->view('ver',$lista);
		$this->load->view('layout/footer');
	}

	public function verl(){

		$id=$_GET['id'];
		$sem=$_GET['sem'];

		$data=$this->liquidacion_model->detallePreliquidacion($id,$sem,'P');

		$cc = $this->liquidacion_model->comision_coordinador();

		$i=0;

		if ($data<>"") {
		foreach($data as $sheet) {
			$i++;		
			
			$lista[$i]["id_venta"]=$sheet->id_venta;
			$lista[$i]["id_vendedor"]=$id;
			$lista[$i]["tventa"]=$sheet->tventa;
			$lista[$i]["tpoliza"]=$sheet->tpoliza;
			$lista[$i]["tplan"]=$sheet->tplan;
			$lista[$i]["suma"]=$sheet->suma;
			$lista[$i]["semm"]=$sem;
			$lista[$i]["factor"]=$sheet->factor;
			$lista[$i]["cpagadas"]=$sheet->cuotas_canceladas;
			$lista[$i]["adicionales"]=$this->liquidacion_model->contar_adicionales($sheet->id_venta);
			$lista[$i]["comision"]=$this->liquidacion_model->ventas_vendedor($sheet->id_vendedor,$sheet->id_semana,$sheet->id_venta,'P',0);
			$lista[$i]["comision_c"]=$lista[$i]["comision"]*($cc->comision_c/100);		

			}
		}

		

		$this->load->view('layout/header');
		$this->load->view('layout/nav');
		$this->load->view('ver',$lista);
		$this->load->view('layout/footer');
	}

	public function anular(){

		$guser = $this->liquidacion_model->anular($_GET['id_2']);

		echo "<script> alert('".$guser."') </script>";

		redirect('liquidacion/ver?id='.$_GET['id'].'&sem='.$_GET['sem'] , 'refresh');

	}

	public function preliquidar(){

		$guser = $this->liquidacion_model->preliquidar('X');

		echo "<script> alert('".$guser."') </script>";

		redirect('liquidacion' , 'refresh');

	}

	public function liquidar(){

		$data = $this->liquidacion_model->listventas('P');

		if ($data<>"") {
		foreach($data as $sheet) {

			$this->liquidacion_model->ventas_vendedor($sheet->id_vendedor,$sheet->id_semana,0,'P',1);

			//$this->sendMail($sheet->id_vendedor,$sheet->id_semana);

		}
		}

		echo "<script> alert('Liquidacion ejecutada') </script>";

		redirect('liquidacion/view_liquidacion' , 'refresh');

	}

	public function view_liquidacion(){

		$data = $this->liquidacion_model->listventas('P');

		$cc = $this->liquidacion_model->comision_coordinador();

		$i=0;

		if ($data<>"") {
		foreach($data as $sheet) {
			$i++;		
			
			$lista[$i]["id_vendedor"]=$sheet->id_vendedor;
			$lista[$i]["identificacion"]=$sheet->identificacion;
			$lista[$i]["nsem"]=$sheet->nsem;
			$lista[$i]["id_semana"]=$sheet->id_semana;
			$lista[$i]["desde"]=$sheet->desde;
			$lista[$i]["hasta"]=$sheet->hasta;
			$lista[$i]["nombres"]=$sheet->nombres;
			$lista[$i]["apellidos"]=$sheet->apellidos;
			$lista[$i]["telefono"]=$sheet->telefono;
			$lista[$i]["ventas"]=$this->liquidacion_model->contar($sheet->id_vendedor,$sheet->id_semana,'P');		
			$lista[$i]["comision"]=$this->liquidacion_model->ventas_vendedor($sheet->id_vendedor,$sheet->id_semana,0,'P',0);
			$lista[$i]["comision_c"]=$lista[$i]["comision"]*($cc->comision_c/100);		

			}
		}

		$datos['ventas']=$lista;


		$this->load->view('layout/header');
		$this->load->view('layout/nav');
		$this->load->view('liquidacion',$datos);
		$this->load->view('layout/footer');

	}


}

