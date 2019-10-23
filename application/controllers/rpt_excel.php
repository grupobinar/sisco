<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');

class Rpt_excel extends CI_Controller {


	public function __construct()
	{
		parent::__construct();
		$this->load->helper('url');
    	$this->load->helper('form');
    	$this->load->model('rpt_excel_model');
    	$this->load->library('session');
    	$this->load->library('excel');

	}

	public function porvendedor(){
		$this->excel->setActiveSheetIndex(0);
        $this->excel->getActiveSheet()->setTitle('Reporte de vendedor');
        //$this->excel->getActiveSheet()->setCellValue('A1', 'Un poco de texto');
        //$this->excel->getActiveSheet()->getStyle('A1')->getFont()->setBold(true);
        $this->excel->getActiveSheet()->getDefaultRowDimension()->setRowHeight(15); 


        $vendedor = $this->rpt_excel_model->vendedores_rpt_i($_POST['cod_vendedor'],$_POST['sem']);

	    $coordinador = $this->rpt_excel_model->coordinador_($vendedor['id_coordinador']);

	    $ventas = $this->rpt_excel_model->ventas($vendedor['id_vendedor'],$vendedor['id_semana']);

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
	            'size'  => 11
        	),
	    );
	    $style2 = array(
	        'alignment' => array('horizontal' => PHPExcel_Style_Alignment::HORIZONTAL_CENTER, ),
	        'font'  => array(
	            'bold'  => true,
	            'color' => array('rgb' => '000000'),
	            'size'  => 11
        	),
	    );

        $this->excel->getDefaultStyle()->applyFromArray($style2);
        $this->excel->getActiveSheet()->setCellValue('A2', 'Estado de Cuenta de Comisiones');
        $this->excel->getActiveSheet()->mergeCells('A2:G2');

        $this->excel->getActiveSheet()->setCellValue('A3', 'SEM '.$vendedor['nsem'].' '.$vendedor['desde'].' AL '.$vendedor['hasta']);
        $this->excel->getActiveSheet()->mergeCells('A3:G3');

        $this->excel->getActiveSheet()->setCellValue('A4', utf8_decode('Vendedor: ['.$vendedor['cod_vendedor'].'] '.$vendedor['apellidos'].' '.$vendedor['nombres']));
        $this->excel->getActiveSheet()->mergeCells('A4:G4');

        $this->excel->getActiveSheet()->setCellValue('A5', utf8_decode('Coordinador: '.$coordinador['apellidos'].' '.$coordinador['nombres']));
        $this->excel->getActiveSheet()->mergeCells('A5:G5');

        $this->excel->getActiveSheet()->setCellValue('A7', 'ASIGNACIONES');
        $this->excel->getActiveSheet()->mergeCells('A7:B7');

        $this->excel->getActiveSheet()->setCellValue('A9', 'Asegurado');
        $this->excel->getActiveSheet()->setCellValue('B9', 'Cedula');
        $this->excel->getActiveSheet()->setCellValue('C9', 'Tipo de Venta');
        $this->excel->getActiveSheet()->setCellValue('D9', 'Plan');
        $this->excel->getActiveSheet()->setCellValue('E9', 'S.A');
        $this->excel->getActiveSheet()->setCellValue('F9', 'Cuotas');
        $this->excel->getActiveSheet()->setCellValue('G9', 'Comisión');
        $this->excel->getActiveSheet()->getStyle("A9:G9")->applyFromArray($style);
        $comision_l=0;

        $i=10;
        if(count($ventas)>0){
        foreach ($ventas as $key) {
        	$this->excel->getActiveSheet()->setCellValue('A'.$i, strtoupper(utf8_decode($key['apellidos'].' '.$key['nombres'])));
	        $this->excel->getActiveSheet()->setCellValue('B'.$i, $key['identificacion']);
	        $this->excel->getActiveSheet()->setCellValue('C'.$i, strtoupper(utf8_decode($key['concepto'])));
	        $this->excel->getActiveSheet()->setCellValue('D'.$i, $key['tplan']);
	        $this->excel->getActiveSheet()->setCellValue('E'.$i, number_format($key['suma'], 2, ',', '.'));
	        $this->excel->getActiveSheet()->setCellValue('F'.$i, number_format($key['cuotas_canceladas'], 2, ',', '.'));
	        $this->excel->getActiveSheet()->setCellValue('G'.$i, number_format($key['comision_liquidada'], 2, ',', '.'));
	        $i++;
			$comision_l=$comision_l+$key['comision_liquidada'];

	    }

        }else{
        	$this->excel->getActiveSheet()->setCellValue('A'.$i, 'No hay nada que reportar');
        	$this->excel->getActiveSheet()->mergeCells('A'.$i.':G'.$i);
       		$this->excel->getActiveSheet()->getStyle('A'.$i.':G'.$i)->applyFromArray($style);
        }
        $i++;

        $this->excel->getActiveSheet()->setCellValue('A'.$i, 'DEDUCCIONES');
        $this->excel->getActiveSheet()->mergeCells('A'.$i.':B'.$i);

        $i=$i+2;

        $this->excel->getActiveSheet()->setCellValue('A'.$i, 'Asegurado');
        $this->excel->getActiveSheet()->setCellValue('B'.$i, 'Cedula');
        $this->excel->getActiveSheet()->setCellValue('C'.$i, 'Tipo de Venta');
        $this->excel->getActiveSheet()->setCellValue('D'.$i, 'Poliza');
        $this->excel->getActiveSheet()->setCellValue('E'.$i, 'S.A');
        $this->excel->getActiveSheet()->setCellValue('F'.$i, 'Cuotas');
        $this->excel->getActiveSheet()->setCellValue('G'.$i, 'Comisión');
        $this->excel->getActiveSheet()->getStyle('A'.$i.':G'.$i)->applyFromArray($style);

        $extornos_l=0;

    	$extornos = $this->rpt_excel_model->extornos_rpt_i($vendedor['id_vendedor'],$vendedor['id_semana']);

    	$i++;
    	if(count($extornos)>0){

    	foreach ($extornos as $key) {
        	$this->excel->getActiveSheet()->setCellValue('A'.$i, strtoupper(utf8_decode($key['apellidos'].' '.$key['nombres'])));
	        $this->excel->getActiveSheet()->setCellValue('B'.$i, $key['identificacion']);
	        $this->excel->getActiveSheet()->setCellValue('C'.$i, strtoupper(utf8_decode($key['concepto'])));
	        $this->excel->getActiveSheet()->setCellValue('D'.$i, $key['tpoliza']);
	        $this->excel->getActiveSheet()->setCellValue('E'.$i, number_format($key['suma'], 2, ',', '.'));
	        $this->excel->getActiveSheet()->setCellValue('F'.$i, number_format($key['cuotas_canceladas'], 2, ',', '.'));
	        $this->excel->getActiveSheet()->setCellValue('G'.$i, number_format($key['monto_fraccionar'], 2, ',', '.'));
	        $i++;

	        $extornos_l = $extornos_l + $key['monto_fraccionar'];

        }
    	}else{
        	$this->excel->getActiveSheet()->setCellValue('A'.$i, 'No hay nada que reportar');
        	$this->excel->getActiveSheet()->mergeCells('A'.$i.':G'.$i);
       		$this->excel->getActiveSheet()->getStyle('A'.$i.':G'.$i)->applyFromArray($style);
    	$i++;

        }

    	$i++;
    	$total=$comision_l-$extornos_l;

        $this->excel->getActiveSheet()->setCellValue('F'.$i, 'TOTAL');
        $this->excel->getActiveSheet()->setCellValue('G'.$i, number_format($total, 2, ',', '.'));
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
        header('Content-Disposition: attachment;filename="'.$vendedor['cod_vendedor'].'_'.$vendedor['nsem'].'_'.$vendedor['apellidos'].'_'.$vendedor['nombres'].'.xlsx"');
        header('Cache-Control: max-age=0'); //no cache
        $objWriter = PHPExcel_IOFactory::createWriter($this->excel, 'Excel5');
        // Forzamos a la descarga
        $objWriter->save('php://output');
	}


	public function porcoordinador(){
		$this->excel->setActiveSheetIndex(0);
        $this->excel->getActiveSheet()->setTitle('Reporte de Coordinador');
        $this->excel->getActiveSheet()->getDefaultRowDimension()->setRowHeight(15); 


        $sem = $this->rpt_excel_model->semana($_POST['sem']);
    	$coordinador = $this->rpt_excel_model->coordinador($_POST['cod_vendedor']);

    	$vendedores = $this->rpt_excel_model->vendedores_rpt_general($coordinador['id_user'],$sem['id_semana']);

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
	            'size'  => 11
        	),
	    );
	    $style2 = array(
	        'alignment' => array('horizontal' => PHPExcel_Style_Alignment::HORIZONTAL_CENTER,
	        					 'vertical' => PHPExcel_Style_Alignment::VERTICAL_CENTER, ),
	        'font'  => array(
	            'bold'  => true,
	            'color' => array('rgb' => '000000'),
	            'size'  => 11
        	),
	    );

        $this->excel->getDefaultStyle()->applyFromArray($style2);
        $this->excel->getActiveSheet()->setCellValue('A2', 'Estado de Cuenta de Comisiones General');
        $this->excel->getActiveSheet()->mergeCells('A2:G2');

        $this->excel->getActiveSheet()->setCellValue('A3', 'SEM '.$sem['nsem'].' '.$sem['desde'].' AL '.$sem['hasta']);
        $this->excel->getActiveSheet()->mergeCells('A3:G3');

        $this->excel->getActiveSheet()->setCellValue('A4', utf8_decode('Coordinador: '.$coordinador['apellidos'].' '.$coordinador['nombres']));
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
        if(count($vendedores)>0){
        foreach ($vendedores as $value) {

        	if($x==0){

    			$cel = $this->rpt_excel_model->hcell($value['id_vendedor'],$sem['id_semana']);
    			$comision = $this->rpt_excel_model->comisiones($value['id_vendedor'],$sem['id_semana']);

    			//print_r($comision);
    			if (count($cel)>1) $cell=count($cel)+$i;
    			else $cell=$i;

    			$this->excel->getActiveSheet()->setCellValue('A'.$i, utf8_decode($value['apellidos'].' '.$value['nombres']));
	        	$this->excel->getActiveSheet()->mergeCells('A'.$i.':B'.$cell);
	        	$this->excel->getActiveSheet()->setCellValue('C'.$i, $value['cod_vendedor']);
	        	$this->excel->getActiveSheet()->mergeCells('C'.$i.':C'.$cell);
				
			} 

			$total=$total+$cel[$x]['total'];
			$cvendedor=$cvendedor+$comision[$x]['comision'];
			$ccoordinador=$ccoordinador+($comision[$x]['comision_c']);

        	
	        $this->excel->getActiveSheet()->setCellValue('D'.$i, utf8_decode($value['concepto']));
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


    	$extornos = $this->rpt_excel_model->extornos_rpt_g($coordinador['id_user'],$sem['id_semana']);


    	$i++;
    	if(count($extornos)>0){

    	foreach ($extornos as $value) {
        	$this->excel->getActiveSheet()->setCellValue('A'.$i, utf8_decode($value['apellidos'].' '.$value['nombres']));
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
        header('Content-Disposition: attachment;filename="nombredelfichero.xlsx"');
        header('Cache-Control: max-age=0'); //no cache
        $objWriter = PHPExcel_IOFactory::createWriter($this->excel, 'Excel5');
        // Forzamos a la descarga
        $objWriter->save('php://output');
	}

}

