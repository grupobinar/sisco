<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');

class Rpt_excel extends CI_Controller {


	public function __construct()
	{
		parent::__construct();
		$this->load->helper('url');
    	$this->load->helper('form');
    	$this->load->model('reportes_model');
    	$this->load->library('session');
    	$this->load->library('excel');

	}

	public function porvendedor(){
		$this->excel->setActiveSheetIndex(0);
        $this->excel->getActiveSheet()->setTitle('Reporte de vendedor');
        //$this->excel->getActiveSheet()->setCellValue('A1', 'Un poco de texto');
        //$this->excel->getActiveSheet()->getStyle('A1')->getFont()->setBold(true);
        $this->excel->getActiveSheet()->getDefaultRowDimension()->setRowHeight(15); 

        $sem = $this->reportes_model->semana($_POST['sem']);
        
        $vendedor = $this->reportes_model->vendedores_rpt_i($_POST['cod_vendedor'],$_POST['sem']);

	    $coordinador = $this->reportes_model->coordinador_($vendedor['id_coordinador']);

	    $ventas = $this->reportes_model->ventas($vendedor['id_vendedor'],$sem['id_semana']);

        $style = array(
	        'alignment' => array('horizontal' => PHPExcel_Style_Alignment::HORIZONTAL_CENTER, ),
	        'borders' => array(
            	'allborders' => array(
	                'style' => PHPExcel_Style_Border::BORDER_THIN,
	                'color' => array('rgb' => '000000')
	            )
	        ),
	        'font'  => array(
	            'bold'  => true,
	            'color' => array('rgb' => '000000'),
	            'size'  => 7
        	),
	    );
	    $style2 = array(
	        'alignment' => array('horizontal' => PHPExcel_Style_Alignment::HORIZONTAL_CENTER, ),
	        'font'  => array(
	            'bold'  => true,
	            'color' => array('rgb' => '000000'),
	            'size'  => 7
        	),
	    );

        $style3 = array(
            'alignment' => array('horizontal' => PHPExcel_Style_Alignment::HORIZONTAL_CENTER, ),
            'font'  => array(
                'bold'  => false,
                'color' => array('rgb' => '000000'),
                'size'  => 7
            ),
        );

        $this->excel->getDefaultStyle()->applyFromArray($style3);
        $this->excel->getActiveSheet()->setCellValue('A2', 'Estado de Cuenta de Comisiones');
        $this->excel->getActiveSheet()->mergeCells('A2:G2');

        $this->excel->getActiveSheet()->setCellValue('A3', 'SEM '.$sem['nsem'].' '.$sem['desde'].' AL '.$sem['hasta']);
        $this->excel->getActiveSheet()->mergeCells('A3:G3');

        $this->excel->getActiveSheet()->setCellValue('A4', 'Vendedor: ['.$vendedor['cod_vendedor'].'] '.$vendedor['apellidos'].' '.$vendedor['nombres']);
        $this->excel->getActiveSheet()->mergeCells('A4:G4');

        $this->excel->getActiveSheet()->setCellValue('A5', 'Coordinador: '.$coordinador['apellidos'].' '.$coordinador['nombres']);
        $this->excel->getActiveSheet()->mergeCells('A5:G5');

        $this->excel->getActiveSheet()->setCellValue('A7', 'ASIGNACIONES');
        $this->excel->getActiveSheet()->mergeCells('A7:B7');
        $this->excel->getActiveSheet()->getStyle('A2:G5')->applyFromArray($style2);
        $this->excel->getActiveSheet()->getStyle('A7:B7')->applyFromArray($style2);


        $this->excel->getActiveSheet()->setCellValue('A9', 'Semana');
        $this->excel->getActiveSheet()->setCellValue('B9', 'Asegurado');
        $this->excel->getActiveSheet()->setCellValue('C9', 'Cedula');
        $this->excel->getActiveSheet()->setCellValue('D9', 'Tipo de Venta');
        $this->excel->getActiveSheet()->setCellValue('E9', 'Plan');
        $this->excel->getActiveSheet()->setCellValue('F9', 'S.A');
        $this->excel->getActiveSheet()->setCellValue('G9', 'Cuotas');
        $this->excel->getActiveSheet()->setCellValue('H9', 'Comisión');
        $this->excel->getActiveSheet()->getStyle("A9:H9")->applyFromArray($style);
        $comision_l=0;

        $i=10;
        if(count($ventas)>0){
        foreach ($ventas as $key) {
            if(isset($key['tpoliza'])) $tpoliza = $key['tpoliza']; else  $tpoliza = 'NO APLICA';

            $this->excel->getActiveSheet()->setCellValue('A'.$i, $key['nsem']);
        	$this->excel->getActiveSheet()->setCellValue('B'.$i, strtoupper($key['apellidos'].' '.$key['nombres']));
	        $this->excel->getActiveSheet()->setCellValue('C'.$i, $key['identificacion']);
	        $this->excel->getActiveSheet()->setCellValue('D'.$i, strtoupper($key['concepto']));
	        $this->excel->getActiveSheet()->setCellValue('E'.$i, $tpoliza);
	        $this->excel->getActiveSheet()->setCellValue('F'.$i, number_format($key['suma'], 2, ',', '.'));
	        $this->excel->getActiveSheet()->setCellValue('G'.$i, number_format($key['cuotas_canceladas'], 2, ',', '.'));
	        $this->excel->getActiveSheet()->setCellValue('H'.$i, number_format($key['comision_liquidada'], 2, ',', '.'));
            
            if ($key['id_semana']!=$key['id_sem']) {
                $this->excel->getActiveSheet()->setCellValue('I'.$i, 'DOMICILIADA');
            }

	        $i++;
			$comision_l=$comision_l+$key['comision_liquidada'];

	    }

        }else{
        	$this->excel->getActiveSheet()->setCellValue('A'.$i, 'No hay nada que reportar');
        	$this->excel->getActiveSheet()->mergeCells('A'.$i.':H'.$i);
       		$this->excel->getActiveSheet()->getStyle('A'.$i.':H'.$i)->applyFromArray($style);
        }
        $i++;

        $this->excel->getActiveSheet()->setCellValue('A'.$i, 'DEDUCCIONES');
        $this->excel->getActiveSheet()->mergeCells('A'.$i.':B'.$i);
        $this->excel->getActiveSheet()->getStyle('A'.$i.':B'.$i)->applyFromArray($style2);


        $i=$i+2;

        $this->excel->getActiveSheet()->setCellValue('B'.$i, 'Asegurado');
        $this->excel->getActiveSheet()->setCellValue('C'.$i, 'Cedula');
        $this->excel->getActiveSheet()->setCellValue('D'.$i, 'Tipo de Venta');
        $this->excel->getActiveSheet()->setCellValue('E'.$i, 'Poliza');
        $this->excel->getActiveSheet()->setCellValue('F'.$i, 'S.A');
        $this->excel->getActiveSheet()->setCellValue('G'.$i, 'Cuotas');
        $this->excel->getActiveSheet()->setCellValue('H'.$i, 'Comisión');
        $this->excel->getActiveSheet()->getStyle('B'.$i.':H'.$i)->applyFromArray($style);

        $extornos_l=0;

    	$extornos = $this->reportes_model->extornos_rpt_i($vendedor['id_vendedor'],$vendedor['id_semana']);

    	$i++;
    	if(count($extornos)>0){

    	foreach ($extornos as $key) {

            if(isset($key['tpoliza'])) $tpoliza = $key['tpoliza']; else  $tpoliza = 'NO APLICA';

        	$this->excel->getActiveSheet()->setCellValue('B'.$i, strtoupper($key['apellidos'].' '.$key['nombres']));
	        $this->excel->getActiveSheet()->setCellValue('C'.$i, $key['identificacion']);
	        $this->excel->getActiveSheet()->setCellValue('D'.$i, strtoupper($key['concepto']));
	        $this->excel->getActiveSheet()->setCellValue('E'.$i, $tpoliza);
	        $this->excel->getActiveSheet()->setCellValue('F'.$i, number_format($key['suma'], 2, ',', '.'));
	        $this->excel->getActiveSheet()->setCellValue('G'.$i, number_format($key['cuotas_canceladas'], 2, ',', '.'));
	        $this->excel->getActiveSheet()->setCellValue('H'.$i, number_format($key['monto_fraccionar'], 2, ',', '.'));
	        $i++;

	        $extornos_l = $extornos_l + $key['monto_fraccionar'];

        }
    	}else{
        	$this->excel->getActiveSheet()->setCellValue('B'.$i, 'No hay nada que reportar');
        	$this->excel->getActiveSheet()->mergeCells('B'.$i.':H'.$i);
       		$this->excel->getActiveSheet()->getStyle('B'.$i.':H'.$i)->applyFromArray($style);
    	$i++;

        }

    	$i++;
    	$total=$comision_l-$extornos_l;

        $this->excel->getActiveSheet()->setCellValue('G'.$i, 'TOTAL');
        $this->excel->getActiveSheet()->setCellValue('H'.$i, number_format($total, 2, ',', '.'));
        $this->excel->getActiveSheet()->getStyle('G'.$i.':H'.$i)->applyFromArray($style);

        $i=$i+2;


        $ventasd = $this->reportes_model->ventasd($vendedor['id_vendedor'],$vendedor['id_semana']);
        $this->excel->getActiveSheet()->setCellValue('A'.$i, 'VENTAS CON DOMICILIACION DE PAGO');
        $this->excel->getActiveSheet()->mergeCells('A'.$i.':D'.$i);
        $this->excel->getActiveSheet()->getStyle('A'.$i.':D'.$i)->applyFromArray($style2);


        $i=$i+2;

        $this->excel->getActiveSheet()->setCellValue('B'.$i, 'Asegurado');
        $this->excel->getActiveSheet()->mergeCells('B'.$i.':C'.$i);
        $this->excel->getActiveSheet()->setCellValue('D'.$i, 'Cedula');
        $this->excel->getActiveSheet()->setCellValue('E'.$i, 'Tipo de Venta');
        $this->excel->getActiveSheet()->setCellValue('F'.$i, 'Plan');
        $this->excel->getActiveSheet()->setCellValue('G'.$i, 'S.A');
        $this->excel->getActiveSheet()->setCellValue('H'.$i, 'Cuotas');
        $this->excel->getActiveSheet()->getStyle('B'.$i.':H'.$i)->applyFromArray($style);

        $i++;

    if(count($ventasd)>0){
        foreach ($ventasd as $key) {
            if(isset($key['tpoliza'])) $tpoliza = $key['tpoliza']; else  $tpoliza = 'NO APLICA';

            $this->excel->getActiveSheet()->setCellValue('B'.$i, strtoupper($key['apellidos'].' '.$key['nombres']));
            $this->excel->getActiveSheet()->mergeCells('B'.$i.':C'.$i);
            $this->excel->getActiveSheet()->setCellValue('D'.$i, $key['identificacion']);
            $this->excel->getActiveSheet()->setCellValue('E'.$i, strtoupper($key['concepto']));
            $this->excel->getActiveSheet()->setCellValue('F'.$i, $tpoliza);
            $this->excel->getActiveSheet()->setCellValue('G'.$i, number_format($key['suma'], 2, ',', '.'));
            $this->excel->getActiveSheet()->setCellValue('H'.$i, number_format($key['cuotas_canceladas'], 2, ',', '.'));

            
            $i++;


        }

    }else{
            $this->excel->getActiveSheet()->setCellValue('B'.$i, 'No hay nada que reportar');
            $this->excel->getActiveSheet()->mergeCells('B'.$i.':H'.$i);
            $this->excel->getActiveSheet()->getStyle('B'.$i.':H'.$i)->applyFromArray($style);
    }

        header('Content-Type: application/vnd.ms-excel');
        header('Content-Disposition: attachment;filename="'.$vendedor['cod_vendedor'].'_'.$vendedor['nsem'].'_'.$vendedor['apellidos'].'_'.$vendedor['nombres'].'.xls"');
        header('Cache-Control: max-age=0'); //no cache
        $objWriter = PHPExcel_IOFactory::createWriter($this->excel, 'Excel5');
        // Forzamos a la descarga
        $objWriter->save('php://output');
	}


	public function porcoordinador(){
		$this->excel->setActiveSheetIndex(0);
        $this->excel->getActiveSheet()->setTitle('Reporte de Coordinador');
        $this->excel->getActiveSheet()->getDefaultRowDimension()->setRowHeight(15); 


        $sem = $this->reportes_model->semana($_POST['sem']);
    	$coordinador = $this->reportes_model->coordinador($_POST['cod_vendedor']);

    	$vendedores = $this->reportes_model->vendedores_rpt_general($coordinador['id_user'],$sem['id_semana']);

    	/*print_r($vendedores);
    	echo count($vendedores);
    	break;*/

        $style = array(
	        'alignment' => array('horizontal' => PHPExcel_Style_Alignment::HORIZONTAL_CENTER, ),
	        'borders' => array(
            	'allborders' => array(
	                'style' => PHPExcel_Style_Border::BORDER_THIN,
	                'color' => array('rgb' => '000000')
	            )
	        ),
	        'font'  => array(
	            'bold'  => true,
	            'color' => array('rgb' => '000000'),
	            'size'  => 7
        	),
	    );
	    $style2 = array(
	        'alignment' => array('horizontal' => PHPExcel_Style_Alignment::HORIZONTAL_CENTER,
	        					 'vertical' => PHPExcel_Style_Alignment::VERTICAL_CENTER, ),
	        'font'  => array(
	            'bold'  => true,
	            'color' => array('rgb' => '000000'),
	            'size'  => 7
        	),
	    );

        $this->excel->getDefaultStyle()->applyFromArray($style2);
        $this->excel->getActiveSheet()->setCellValue('A2', 'Estado de Cuenta de Comisiones General');
        $this->excel->getActiveSheet()->mergeCells('A2:G2');

        $this->excel->getActiveSheet()->setCellValue('A3', 'SEM '.$sem['nsem'].' '.$sem['desde'].' AL '.$sem['hasta']);
        $this->excel->getActiveSheet()->mergeCells('A3:G3');

        $this->excel->getActiveSheet()->setCellValue('A4', 'Coordinador: '.$coordinador['apellidos'].' '.$coordinador['nombres']);
        $this->excel->getActiveSheet()->mergeCells('A4:G4');

        $this->excel->getActiveSheet()->setCellValue('A7', 'ASIGNACIONES');
        $this->excel->getActiveSheet()->mergeCells('A7:B7');

        $this->excel->getActiveSheet()->setCellValue('A9', 'Vendedor');
        $this->excel->getActiveSheet()->mergeCells('A9:B9');
        $this->excel->getActiveSheet()->setCellValue('C9', 'Codigo');
        $this->excel->getActiveSheet()->setCellValue('D9', 'Tipo de Venta');
        $this->excel->getActiveSheet()->setCellValue('E9', 'Operaciones');
        $this->excel->getActiveSheet()->setCellValue('F9', 'Comisión');
        $this->excel->getActiveSheet()->setCellValue('G9', 'Coordinador');
        $this->excel->getActiveSheet()->getStyle("A9:G9")->applyFromArray($style);
        $comision_l=0;

        $i=10;
        $x=0;
        $n=0;
        if(count($vendedores)>0){
        foreach ($vendedores as $value) {

            if(($x==0) or ($n!=$value['id_vendedor'])){

    			$cel = $this->reportes_model->hcell($value['id_vendedor'],$sem['id_semana']);
    			$comision = $this->reportes_model->comisiones($value['id_vendedor'],$sem['id_semana']);

    			//print_r($comision);
    			if (count($cel)>1) $cell=count($cel)+$i;
    			else $cell=$i;

    			$this->excel->getActiveSheet()->setCellValue('A'.$i, $value['apellidos'].' '.$value['nombres']);
	        	$this->excel->getActiveSheet()->mergeCells('A'.$i.':B'.$cell);
	        	$this->excel->getActiveSheet()->setCellValue('C'.$i, $value['cod_vendedor']);
	        	$this->excel->getActiveSheet()->mergeCells('C'.$i.':C'.$cell);

                $x=0;
				
			} 

            $n=$value['id_vendedor'];
			$total=$total+$cel[$x]['total'];
			$cvendedor=$cvendedor+$comision[$x]['comision'];
			$ccoordinador=$ccoordinador+($comision[$x]['comision_c']);

        	
	        $this->excel->getActiveSheet()->setCellValue('D'.$i, $value['concepto']);
	        $this->excel->getActiveSheet()->setCellValue('E'.$i, $cel[$x]['total']);
	        $this->excel->getActiveSheet()->setCellValue('F'.$i, number_format($comision[$x]['comision'], 2, ',', '.'));
	        $this->excel->getActiveSheet()->setCellValue('G'.$i, number_format($comision[$x]['comision_c'], 2, ',', '.'));
	        $i++;
	        $x++;

	    }

        }else{
        	$this->excel->getActiveSheet()->setCellValue('A'.$i, 'No hay nada que reportar');
        	$this->excel->getActiveSheet()->mergeCells('A'.$i.':G'.$i);
       		$this->excel->getActiveSheet()->getStyle('A'.$i.':G'.$i)->applyFromArray($style);
        }
        $i++;

        $this->excel->getActiveSheet()->setCellValue('D'.$i, 'Total Asignaciones');
        $this->excel->getActiveSheet()->setCellValue('E'.$i, number_format($total, 2, ',', '.'));
        $this->excel->getActiveSheet()->setCellValue('F'.$i, number_format($cvendedor, 2, ',', '.'));
        $this->excel->getActiveSheet()->setCellValue('G'.$i, number_format($ccoordinador, 2, ',', '.'));
        $this->excel->getActiveSheet()->getStyle('E'.$i.':G'.$i)->applyFromArray($style);



        $i=$i+2;

        $this->excel->getActiveSheet()->setCellValue('A'.$i, 'DEDUCCIONES');
        $this->excel->getActiveSheet()->mergeCells('A'.$i.':B'.$i);

        $i=$i+2;

        $this->excel->getActiveSheet()->setCellValue('A'.$i, 'Tomador');
        $this->excel->getActiveSheet()->setCellValue('B'.$i, 'Cedula');
        $this->excel->getActiveSheet()->setCellValue('C'.$i, 'Causa');
        $this->excel->getActiveSheet()->setCellValue('D'.$i, 'S.A');
        $this->excel->getActiveSheet()->setCellValue('E'.$i, 'Cuotas');
        $this->excel->getActiveSheet()->setCellValue('F'.$i, 'Comisión');
        $this->excel->getActiveSheet()->setCellValue('G'.$i, 'Coordinador');
        $this->excel->getActiveSheet()->getStyle('A'.$i.':G'.$i)->applyFromArray($style);


    	$extornos = $this->reportes_model->extornos_rpt_g($coordinador['id_user'],$sem['id_semana']);


    	$i++;
    	if(count($extornos)>0){

    	foreach ($extornos as $value) {
        	$this->excel->getActiveSheet()->setCellValue('A'.$i, $value['apellidos'].' '.$value['nombres']);
	        $this->excel->getActiveSheet()->setCellValue('B'.$i, $value['identificacion']);
	        $this->excel->getActiveSheet()->setCellValue('C'.$i, $value['motivo']);
	        $this->excel->getActiveSheet()->setCellValue('D'.$i, number_format($value['suma'], 2, ',', '.'));
	        $this->excel->getActiveSheet()->setCellValue('E'.$i, '');
	        $this->excel->getActiveSheet()->setCellValue('F'.$i, number_format($value['monto_fraccionado'], 2, ',', '.'));
	        $this->excel->getActiveSheet()->setCellValue('G'.$i, number_format($value['monto_fraccionado_c'], 2, ',', '.'));
	        $i++;

	        $evendedor = $evendedor + $value['monto_fraccionado'];
			$ecoordinador = $ecoordinador + $value['monto_fraccionado_c'];

        }
    	}else{
        	$this->excel->getActiveSheet()->setCellValue('A'.$i, 'No hay nada que reportar');
        	$this->excel->getActiveSheet()->mergeCells('A'.$i.':G'.$i);
       		$this->excel->getActiveSheet()->getStyle('A'.$i.':G'.$i)->applyFromArray($style);
    	$i++;

        }

    	$i++;

        $this->excel->getActiveSheet()->setCellValue('E'.$i, 'Total Deducciones');
        $this->excel->getActiveSheet()->setCellValue('F'.$i, number_format($evendedor, 2, ',', '.'));
        $this->excel->getActiveSheet()->setCellValue('G'.$i, number_format($ecoordinador, 2, ',', '.'));
        $this->excel->getActiveSheet()->getStyle('F'.$i.':G'.$i)->applyFromArray($style);
        $totalv = $cvendedor - $evendedor;
		$totalc = $ccoordinador - $ecoordinador;


        $i=$i+2;

        $this->excel->getActiveSheet()->setCellValue('E'.$i, 'TOTAL');
        $this->excel->getActiveSheet()->setCellValue('F'.$i, number_format($totalv, 2, ',', '.'));
        $this->excel->getActiveSheet()->setCellValue('G'.$i, number_format($totalc, 2, ',', '.'));
        $this->excel->getActiveSheet()->getStyle('F'.$i.':G'.$i)->applyFromArray($style);




        //-------------------------------------------------------------------------------------------
        /*$gdImage = imagecreatefromjpeg(base_url().'assets/0.fw_.jpg');
		// Add a drawing to the worksheetecho date('H:i:s') . " Add a drawing to the worksheet\n";
		$objDrawing = new PHPExcel_Worksheet_MemoryDrawing();
		$objDrawing->setName('Sample image');$objDrawing->setDescription('Sample image');
		$objDrawing->setImageResource($gdImage);
		$objDrawing->setRenderingFunction(PHPExcel_Worksheet_MemoryDrawing::RENDERING_JPEG);
		$objDrawing->setMimeType(PHPExcel_Worksheet_MemoryDrawing::MIMETYPE_DEFAULT);
		$objDrawing->setHeight(50);
		$objDrawing->setCoordinates('A1');
		$objDrawing->setWorksheet($this->excel->getActiveSheet());
		$objWriter = PHPExcel_IOFactory::createWriter($this->excel, 'Excel2007');$objWriter->save(str_replace('.php', '.xlsx', __FILE__));*/

 
        header('Content-Type: application/vnd.ms-excel');
        header('Content-Disposition: attachment;filename="Reporte_por_coordinador.xls"');
        header('Cache-Control: max-age=0'); //no cache
        $objWriter = PHPExcel_IOFactory::createWriter($this->excel, 'Excel5');
        // Forzamos a la descarga
        $objWriter->save('php://output');
	}

    public function cierre(){
        $this->excel->setActiveSheetIndex(0);
        $sem = $this->reportes_model->semana($_POST['sem']);
        $this->excel->getActiveSheet()->setTitle('Reporte de Cierre');
        $this->excel->getActiveSheet()->getDefaultRowDimension()->setRowHeight(15); 

        $style = array(
            'alignment' => array('horizontal' => PHPExcel_Style_Alignment::HORIZONTAL_CENTER, ),
            'borders' => array(
                'allborders' => array(
                    'style' => PHPExcel_Style_Border::BORDER_THIN,
                    'color' => array('rgb' => '000000')
                )
            ),
            'font'  => array(
                'bold'  => true,
                'color' => array('rgb' => '000000'),
                'size'  => 7
            ),
        );
        $style2 = array(
            'alignment' => array('horizontal' => PHPExcel_Style_Alignment::HORIZONTAL_CENTER,
                                 'vertical' => PHPExcel_Style_Alignment::VERTICAL_CENTER, ),
            'font'  => array(
                'bold'  => true,
                'color' => array('rgb' => '000000'),
                'size'  => 7
            ),
        );

        $this->excel->getDefaultStyle()->applyFromArray($style2);
        $this->excel->getActiveSheet()->setCellValue('A2', 'REPORTE DE CIERRE SEM '.$sem['nsem'].' desde: '.$sem['desde'].' hasta: '.$sem['hasta']);
        $this->excel->getActiveSheet()->mergeCells('A2:L2');

        $this->excel->getActiveSheet()->setCellValue('A4', 'COORDINADOR');
        $this->excel->getActiveSheet()->setCellValue('B4', 'VENDEDOR');
        $this->excel->getActiveSheet()->setCellValue('C4', 'SOLICITUD');
        $this->excel->getActiveSheet()->setCellValue('D4', 'CEDULA');
        $this->excel->getActiveSheet()->setCellValue('E4', 'TOMADOR');
        $this->excel->getActiveSheet()->setCellValue('F4', 'TIPO DE VENTA');
        $this->excel->getActiveSheet()->setCellValue('G4', 'POLIZA');
        $this->excel->getActiveSheet()->setCellValue('H4', 'ADICIONALES');
        $this->excel->getActiveSheet()->setCellValue('I4', 'CUOTAS CANCELADAS');
        $this->excel->getActiveSheet()->setCellValue('J4', 'ESTATUS');
        $this->excel->getActiveSheet()->setCellValue('K4', 'COMISION VENDEDOR');
        $this->excel->getActiveSheet()->setCellValue('L4', 'COMISION COORDINADOR');
        $this->excel->getActiveSheet()->getStyle("A4:L4")->applyFromArray($style);

        $cierre = $this->reportes_model->cierre('L',$sem['id_semana']);
        
        $cc=0; $cv=0; $c_anterior=0; $v_anterior=0; $cct=0; $cvt=0; $i=4; $x=0;

        if (count($cierre)>0) {

        foreach ($cierre as $key) {
            $i++;

            if (($v_anterior!=$key['id_vendedor']) and ($v_anterior!=0)) {
                $i=$i+1;
                $this->excel->getActiveSheet()->setCellValue('J'.$i, 'TOTAL');
                $this->excel->getActiveSheet()->setCellValue('K'.$i, number_format($cv, 2, ',', '.'));
  
                if (($c_anterior!=$key['id_user']) and ($c_anterior!=0)) {
                    $this->excel->getActiveSheet()->setCellValue('L'.$i, number_format($cc, 2, ',', '.'));
                    $cc=0;
                    $this->excel->getActiveSheet()->getStyle("L".$i)->applyFromArray($style);
                }
                $this->excel->getActiveSheet()->getStyle("J".$i.":K".$i)->applyFromArray($style);

                $cv=0;
                $i=$i+2;
                
            }

            $cad=$this->reportes_model->contar_adicionales($key['id_venta']);

              if($key['estatus_venta']=="P") {$estatus_venta="PRE";}
              elseif($key['estatus_venta']=="L") {$estatus_venta="LIQ";}
              elseif($key['estatus_venta']=="O") {$estatus_venta="LIQ"; }
              elseif($key['estatus_venta']=="D") {$estatus_venta="DOM";}

            $cv=$cv+$key['comision_liquidada'];
            $cc=$cc+$key['comision_c'];

            $cvt=$cvt+$key['comision_liquidada'];
            $cct=$cct+$key['comision_c'];

            $this->excel->getActiveSheet()->setCellValue('A'.$i, ucwords(strtolower($key['ap_c'].' '.$key['name_c'])));
            $this->excel->getActiveSheet()->setCellValue('B'.$i, ucwords(strtolower($key['ap_v'].' '.$key['name_v'])));
            $this->excel->getActiveSheet()->setCellValue('C'.$i, $key['solicitud']);
            $this->excel->getActiveSheet()->setCellValue('D'.$i, $key['identificacion']);
            $this->excel->getActiveSheet()->setCellValue('E'.$i, ucwords(strtolower($key['ap_t'].' '.$key['name_t'])));
            $this->excel->getActiveSheet()->setCellValue('F'.$i, ucwords(($key['concepto'])));
            $this->excel->getActiveSheet()->setCellValue('G'.$i, $key['tpoliza'].' '.$key['num_poliza']);
            $this->excel->getActiveSheet()->setCellValue('H'.$i, $cad);
            $this->excel->getActiveSheet()->setCellValue('I'.$i, $key['cuotas_canceladas']);
            $this->excel->getActiveSheet()->setCellValue('J'.$i, $estatus_venta);
            $this->excel->getActiveSheet()->setCellValue('K'.$i, number_format($key['comision_liquidada'], 2, ',', '.'));
            $this->excel->getActiveSheet()->setCellValue('L'.$i, number_format($key['comision_c'], 2, ',', '.'));

            $v_anterior = $key['id_vendedor'];
            $c_anterior = $key['id_user'];

        }

        $i=$i+2;
        $this->excel->getActiveSheet()->setCellValue('J'.$i, 'TOTAL');
        $this->excel->getActiveSheet()->setCellValue('K'.$i, number_format($cv, 2, ',', '.'));
        $this->excel->getActiveSheet()->setCellValue('L'.$i, number_format($cc, 2, ',', '.'));
        $this->excel->getActiveSheet()->getStyle("J".$i.":L".$i)->applyFromArray($style);

        $i=$i+2;
        $this->excel->getActiveSheet()->setCellValue('J'.$i, 'TOTAL GENERAL');
        $this->excel->getActiveSheet()->setCellValue('K'.$i, number_format($cvt, 2, ',', '.'));
        $this->excel->getActiveSheet()->setCellValue('L'.$i, number_format($cct, 2, ',', '.'));
        $this->excel->getActiveSheet()->getStyle("J".$i.":L".$i)->applyFromArray($style);

    }else{
        $this->excel->getActiveSheet()->setCellValue('A'.$i, 'NO HAY NADA QUE REPORTAR');
        $this->excel->getActiveSheet()->getStyle("A".$i.":L".$i)->applyFromArray($style);
        $this->excel->getActiveSheet()->mergeCells("A".$i.":L".$i);
    }

        header('Content-Type: application/vnd.ms-excel');
        header('Content-Disposition: attachment;filename="Reporte_por_coordinador.xls"');
        header('Cache-Control: max-age=0'); //no cache
        $objWriter = PHPExcel_IOFactory::createWriter($this->excel, 'Excel5');
        // Forzamos a la descarga
        $objWriter->save('php://output');
    }

}

