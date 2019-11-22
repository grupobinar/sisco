<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');

class Liquidacion_model extends CI_Model{
    function __construct(){
        parent::__construct();
        $this->load->database();
    }    


	function listventas($estatus)
	{
		$this->db->distinct();
		$this->db->select('t_vendedores.id_vendedor,identificacion, nsem, desde, hasta, nombres, apellidos, telefono, t_semanas.id_semana');
		$this->db->join('t_vendedores','t_vendedores.id_vendedor = t_ventas.id_vendedor','left');
		$this->db->join('t_semanas','t_semanas.id_semana = t_ventas.id_semana','left');
		$this->db->where('t_semanas.estatus','1');
		$this->db->where('t_ventas.estatus_venta',$estatus);
		$listusuarios = $this->db->get('public.t_ventas');

		//echo $this->db->last_query();

		if($listusuarios->num_rows()>0)
		{
			 return $listusuarios->result();
		}

	}

	function comision_coordinador(){

		$listusuarios = $this->db->get('public.t_ccoordinador');

		if($listusuarios->num_rows()>0)
		{
			 return $listusuarios->row();
		}
	}

	function contar($id,$sem,$estatus)
	{
		$this->db->select('COUNT(*) as total');
		$this->db->where('id_vendedor',$id);
		$this->db->where('estatus_venta',$estatus);
		$this->db->where('id_semana',$sem);
		$listusuarios = $this->db->get('public.t_ventas');

		if($listusuarios->num_rows()>0)
		{
			 return $listusuarios->row()->total;
		}

	}

	function detallePreliquidacion($id,$sem,$estatus){

		$this->db->select('id_venta, cuotas_canceladas, tplan, suma, factor, tpoliza, tventa, id_vendedor, id_semana');
		$this->db->join('t_plan','t_plan.id_tplan = t_ventas.id_plan','left');
		$this->db->join('t_polizas','t_polizas.id_poliza = t_ventas.id_poliza','left');
		$this->db->join('t_tpoliza','t_tpoliza.id_tpoliza = t_ventas.id_tpoliza','left');
		$this->db->where('id_vendedor',$id);
		$this->db->where('id_semana',$sem);
		$this->db->where('estatus_venta',$estatus);
		$listusuarios = $this->db->get('public.t_ventas');


		if($listusuarios->num_rows()>0)
		{

			return $listusuarios->result();
			
		}

	}

	function contar_adicionales($id){

		$this->db->select('COUNT(*) as total');
		$this->db->where('id_venta',$id);
		$adicionales_count = $this->db->get('public.t_adicionales');

		return $adicionales_count->row()->total;
	}

	function anular($id){

		$data = array(
				'estatus_venta'=>'X'
			);

			$this->db->where('id_venta', $id);
			$this->db->update('t_ventas', $data);

			return "Venta Anulada";

	}

	function ventas_vendedor($id,$sem,$v,$estatus,$e){

		$this->db->select('cuotas_canceladas, suma, tventa, factor, t_ventas.id_plan, id_venta, t_ventas.id_poliza, t_ventas.id_tpoliza, tedad');
		$this->db->join('t_tomadores','t_tomadores.id_tomador = t_ventas.id_tomador','left');
		$this->db->join('t_plan','t_plan.id_tplan = t_ventas.id_plan','left');
		$this->db->join('t_polizas','t_polizas.id_poliza = t_ventas.id_poliza','left');
		$this->db->join('t_tpoliza','t_tpoliza.id_tpoliza = t_ventas.id_tpoliza','left');
		$this->db->where('estatus_venta',$estatus);
			if($v>0) 
			{
				$this->db->where('id_venta',$v);
			}else{
				$this->db->where('id_semana',$sem);
				$this->db->where('id_vendedor',$id);
			}
		 

		$listusuarios = $this->db->get('public.t_ventas');


		$this->db->where('estatus','0');
		$this->db->order_by('id_comision','asc');
		$cfg_comisiones = $this->db->get('public.t_comisiones');


		if($listusuarios->num_rows()>0)
		{

			$comision=0;


			foreach ($listusuarios->result_array() as $key) {

				$this->db->select('id_plan,id_poliza, COUNT(*) as total');
				$this->db->group_by('id_plan, id_poliza');
				$this->db->where('id_vendedor',$id);
				$this->db->where('estatus_venta',$estatus);
				$this->db->where('id_semana',$sem);
				$this->db->where('id_plan',$key['id_plan']);
				$this->db->where('id_poliza',$key['id_poliza']);
				$ventas_plan = $this->db->get('public.t_ventas');

				$this->db->select('COUNT(*) as total');
				$this->db->where('id_venta',$key['id_venta']);
				$adicionales_count = $this->db->get('public.t_adicionales');


			foreach ($cfg_comisiones->result_array() as $val) {


				/**
				 * Evalua si es por numero de ventas = 0, o si es por numero de cuotas canceladas = 1
				*/ 

				if ($val['c_minmax']==0) $nval=$ventas_plan->row()->total;
				elseif($val['c_minmax']==1) $nval=$key['cuotas_canceladas'];

				
				/**
				 * Evalua si el numero de ventas esta entre el rango del minimo y maximo
				*/ 

				if(($nval>=$val['min']) && ($nval<=$val['max'])){ 

					//echo "aqui";
				/**
				 * Evalua si el tipo de comision es igual al tipo de ventas.
				*/ 

				if(($key['tventa']==$val['id_tcomision'])){

					//echo "aqui";


					/**
				 	 * Evalua si el tipo de calculo es porcentual = 1 o monto fijo = 0
				 	 * si es porcentual se evalua si es sobre la suma asegurada = 1, o sobre la comision generada = 0
					*/ 
					

					if ($val['id_tcalculo']==1) {


						if ($val['id_basec']==1) {
							if ($key['id_tpoliza']==5) {

								$tiempo = strtotime($key['tedad']); 
							    $ahora = time(); 
							    $edad = ($ahora-$tiempo)/(60*60*24*365.25); 
							    $edad = floor($edad); 

								$this->db->select('factor');
								$this->db->where('edad',$edad);
								$edadf = $this->db->get('public.t_factor_edad');
								$factor = $edadf->row()->factor;

							}
							else {
								$factor=$key['factor'];
							} 
							$c=((($key['suma']*$factor)/1000)/12)*($val['cuota']/100);


						}
						elseif ($val['id_basec']==2) {

							$a=($c*($val['cuota']/100));

						}	
					}
					elseif ($val['id_tcalculo']==2) {
						$c=$val['cuota'];

					}

					if ($key['tventa']==1) {
					$x=0;
					if ($adicionales_count!="null") {


					if($adicionales_count->row()->total>0){

							$this->db->where('estatus','0');
							$this->db->where('id_tcomision','2');
							$cfg_adicicionales = $this->db->get('public.t_comisiones');


							if ($cfg_adicicionales->row()->id_tcalculo==1) {
								if ($cfg_adicicionales->row()->id_basec==1) {
									$x=((($key['suma']*$factor)/1000)/12) * ($cfg_adicicionales->row()->cuota / 100);
								}
							}
							elseif ($cfg_adicicionales->row()->id_tcalculo==2) {
								$x=$cfg_adicicionales->row()->cuota;
							}



					}
					$x=$adicionales_count->row()->total * $x;

					$adicionales_count="null";

					}


					$c = $c + $x + $a;



					}elseif ($key['tventa']==2) {

						
						if($adicionales_count->num_rows()>0)
						{
			 				$c = $c * $adicionales_count->row()->total;
						}


					}
					
				}

				}


				}

			$this->db->select('comision_c');
			$comision_co = $this->db->get('public.t_ccoordinador');

			$cco=$c*($comision_co->row()->comision_c/100);

			$comision=$comision + $c;
			$comision_c=$comision_c + $cco;

			if ($e==1) {

				

				$data = array(
					'id_venta'=>$key['id_venta'],
					'suma'=>$key['suma'],
					'comision_liquidada'=>$c,
					'comision_c'=>$cco,
					'id_venta'=>$key['id_venta'],
					'usuario'=>$this->session->userdata('id_usuario')
				);

				$this->db->insert('public.t_liquidacion',$data);

				$data = array(
					'estatus_venta'=>'L'
				);

				$this->db->where('id_venta', $key['id_venta']);
				$this->db->update('t_ventas', $data);

				$cex=$comision;
				$cex_c=$comision_c;

				$this->db->select('id_venta, cuotas_fraccionar, id_extorno, monto_fraccionado as extorno, monto_fraccionado_c as extorno_c');
				$this->db->where('id_vendedor', $id);
				$this->db->where('id_estatus', '0');
				$ex = $this->db->get('public.t_extornos');

				if($ex->num_rows()>0){
				foreach ($ex->result_array() as $key) {
					if ($key['extorno']>$cex) {

						$nex=$key['extorno']-$cex;
						$nex_c=$key['extorno_c']-$cex_c;
						$cf=$key['cuotas_fraccionar']+1;

						$data = array(
							'monto_fraccionado'=>$cex,
							'monto_fraccionado_c'=>$cex_c,
							'cuotas_fraccionar'=> $cf,
							'observacion'=> 'fraccionado',
							'id_semana'=> $sem,
						);

						$this->db->where('id_extorno', $key['id_extorno']);
						$this->db->update('t_extornos', $data);

						$data = array(
							'id_venta'=>$key['id_venta'],
							'id_vendedor'=>$id,
							'monto_extornable'=>$nex,
							'monto_extornable_c'=>$nex_c,
							'cuotas_fraccionar'=>'1',
							'monto_fraccionado'=> $nex,
							'monto_fraccionado_c'=> $nex_c,
							'id_usuario'=> '0',
							'fraccionar'=> $key['id_extorno'],
							'observacion'=> 'fraccion de extorno anterior',
							'id_estatus'=> '-1'

						);

						$this->db->insert('public.t_extornos',$data);

						

					}elseif($cex==0){

						$data = array(
							'id_semana'=> $sem,
							'id_estatus'=>'1'
						);

						$this->db->where('id_extorno', $key['id_extorno']);
						$this->db->update('t_extornos', $data);

					}else{

						$data = array(
							'id_semana'=> $sem,
							'id_estatus'=>'1'
						);

						$this->db->where('id_extorno', $key['id_extorno']);
						$this->db->update('t_extornos', $data);

						$cex = $cex - $key['extorno'];
					}
						$cex=0;

				}
				}
				
			}

			$x=0; $a=0;

			/*echo "c. >> ".$c."<br>";
			echo "comision. >> ".$comision."<br>";*/

			

			}

			return $comision;
		}

	}

	function preliquidar(){

		$data = array(
				'estatus_venta'=>'P'
			);

			$this->db->where('estatus_venta', 'A');
			$this->db->update('t_ventas', $data);

			return "Pre-Liquidación ejecutada";

	}

	function mail_vendedores($id,$sem){

		$this->db->select('identificacion, apellidos, nombres, concepto, tpoliza, num_poliza, comision_liquidada, id_liquidacion');
		$this->db->join('t_tpoliza','t_tpoliza.id_tpoliza = t_ventas.id_tpoliza','left');
		$this->db->join('t_polizas','t_polizas.id_poliza = t_ventas.id_poliza','left');
		$this->db->join('t_concepto','t_concepto.id_concepto = t_ventas.tventa','left');
		$this->db->join('t_tomadores','t_tomadores.id_tomador = t_ventas.id_tomador','left');
		$this->db->join('t_liquidacion','t_liquidacion.id_venta = t_ventas.id_venta','left');
		$this->db->where('estatus_venta','L');
		$this->db->where('estatus_l','0');
		$this->db->where('id_vendedor',$id);
		$this->db->where('id_semana',$sem);

		$listusuarios = $this->db->get('public.t_ventas');
		$datos['vt']=$listusuarios->result_array();

		$this->db->select('identificacion, apellidos, nombres, correo, telefono');
		$this->db->where('id_vendedor',$id);
		$listusuarios = $this->db->get('public.t_vendedores');
		$datos['v']=$listusuarios->row_array();

		$this->db->select('identificacion, apellidos, nombres, concepto,  num_poliza, monto_fraccionado, nsem, id_extorno');
		$this->db->join('t_tpoliza','t_tpoliza.id_tpoliza = t_ventas.id_tpoliza','left');
		$this->db->join('t_polizas','t_polizas.id_poliza = t_ventas.id_poliza','left');
		$this->db->join('t_concepto','t_concepto.id_concepto = t_ventas.tventa','left');
		$this->db->join('t_tomadores','t_tomadores.id_tomador = t_ventas.id_tomador','left');
		$this->db->join('t_extornos','t_extornos.id_venta = t_ventas.id_venta','left');
		$this->db->join('t_semanas','t_semanas.id_semana = t_ventas.id_semana','left');
		$this->db->where('estatus_venta','E');
		$this->db->where('t_extornos.id_estatus','0');
		$this->db->where('t_ventas.id_vendedor',$id);
		$this->db->where('t_extornos.id_estatus','0');

		$listusuarios = $this->db->get('public.t_ventas');
		$datos['e']=$listusuarios->result_array();

		$this->db->select('nsem, desde, hasta');
		$this->db->where('id_semana',$sem);
		$listusuarios = $this->db->get('public.t_semanas');
		$datos['s']=$listusuarios->row_array();

		return $datos;
	}

	function reporter_null($id){

		$data = array(
			'estatus_l'=>'1'
		);

		$this->db->where('id_liquidacion', $id);
		$this->db->update('t_liquidacion', $data);

	}

	function extorno_status($id){

		$data = array(
			'id_estatus'=>'1'
		);

		$this->db->where('id_extorno', $id);
		$this->db->update('t_extornos', $data);

	}

	

}