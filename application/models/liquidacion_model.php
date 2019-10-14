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

		$this->db->select('cuotas_canceladas, suma, tventa, factor, t_ventas.id_plan, id_venta, t_ventas.id_poliza');
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

				//echo $this->db->last_query();

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
							$c=((($key['suma']*$key['factor'])/1000)/12)*($val['cuota']/100);

						}
						elseif ($val['id_basec']==2) {

							$a=($c*($val['cuota']/100));
							//echo "..".$c."aqui";
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
									$x=((($key['suma']*$key['factor'])/1000)/12) * ($cfg_adicicionales->row()->cuota / 100);
								}
							}
							elseif ($cfg_adicicionales->row()->id_tcalculo==2) {
								$x=$cfg_adicicionales->row()->cuota;
							}

					}

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

			if ($e==1) {

				$data = array(
					'id_venta'=>$key['id_venta'],
					'suma'=>$key['suma'],
					'comision_liquidada'=>$c,
					'id_venta'=>$key['id_venta'],
					'fecha_registro'=>date("d/m/Y"),
					'ult_mod'=>date("d/m/Y"),
					'usuario'=>$this->session->userdata('id_usuario')
				);

				$this->db->insert('public.t_liquidacion',$data);

				$data = array(
					'estatus_venta'=>'L'
				);

				$this->db->where('id_venta', $key['id_venta']);
				$this->db->update('t_ventas', $data);
				
			}

			$comision=$comision + $c;
			$x=0; $a=0;

			//echo "c. >> ".$c."<br>";
			//echo "comision. >> ".$comision."<br>";

			

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

	

}