<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');

class Config_model extends CI_Model{
    function __construct(){
        parent::__construct();
		$this->load->database();
		$this->load->library('session');
		$this->load->helper('date');
    }    

    function eliminarRegistros($id,$tb,$name_id){


		  	$data = array(
				'estatus'=>'1'
			);

			$this->db->where($name_id, $id);
			$this->db->update($tb, $data);
			//echo $this->db->last_query();

	}

	function guardar_tpago($tpago,$fecha,$usuario){

		  	$data = array(
			'tpago'=>$tpago,
			'fecha_registro'=>$fecha,
			'ult_mod'=>$fecha,
			'id_usuario'=>$usuario,
			);


			$this->db->insert('public.t_tpago',$data);

			$retorno="Tipo de pago creado";

			return $retorno;

	}

	function guardar_edad($edad,$factor,$fecha,$usuario){

		  	$data = array(
				'edad'=>$edad,
				'factor'=>$factor,
				'fecha_registro'=>$fecha,
				'ult_mod'=>$fecha,
				'id_usuario'=>$usuario,
			);


			$this->db->insert('public.t_factor_edad',$data);

			$retorno="Guardado con exito";

			return $retorno;

	}

	function guardar_comision($concepto,$calculo,$cuota,$min,$max,$fecha,$usuario,$planc,$id_basec){

		  	$data = array(
			'id_tcomision'=>$concepto,
			'id_tcalculo'=>$calculo,
			'cuota'=>$cuota,
			'min'=>$min,
			'max'=>$max,
			'fecha_registro'=>$fecha,
			'ult_mod'=>$fecha,
			'id_usuario'=>$usuario,
			'id_plan'=>$planc,
			'id_basec'=>$id_basec,
			);



			$this->db->insert('public.t_comisiones',$data);

			//echo $this->db->last_query();

			$retorno="Comision Creada";

			return $retorno;

	}
	function modificar_comision($concepto,$calculo,$cuota,$min,$max,$fecha,$usuario,$planc,$id_basec,$id_comision){

		  	$data = array(
			'id_tcomision'=>$concepto,
			'id_tcalculo'=>$calculo,
			'cuota'=>$cuota,
			'min'=>$min,
			'max'=>$max,
			'fecha_registro'=>$fecha,
			'ult_mod'=>$fecha,
			'id_usuario'=>$usuario,
			'id_plan'=>$planc,
			'id_basec'=>$id_basec,
			);



			$this->db->where('id_comision',$id_comision);
			$this->db->update('public.t_comisiones',$data);

			//echo $this->db->last_query();

			$retorno="Comisión Modificada";

			return $retorno;

	}

	function guardar_tpoliza($tpoliza,$factor,$fecha,$usuario){

		  	$data = array(
			'tpoliza'=>$tpoliza,
			'factor'=>$factor,
			'fecha_registro'=>$fecha,
			'ult_mod'=>$fecha,
			'id_usuario'=>$usuario,
			);


			$this->db->insert('public.t_tpoliza',$data);

			$retorno="Tipo de poliza creado";

			return $retorno;

	}

		function guardar_plan($plan,$fecha,$usuario){

		  	$data = array(
			'tplan'=>$plan,
			'fecha_registro'=>$fecha,
			'ult_mod'=>$fecha,
			'id_usuario'=>$usuario,
			);


			$this->db->insert('public.t_plan',$data);

			$retorno="Tipo de plan creado";

			return $retorno;

	}


	function editar($id_persona,$nombres,$apellidos,$correo,$telefono,$rol,$fecha,$usuario,$estatus){

		  $q = $this->db->query("SELECT id_persona FROM t_personas WHERE identificacion='".$nac."-".$cedula."'");
		  $count = $q->num_rows(); 
		  //break;
		  if($count==0){ 

		  	$data = array(
			'apellidos'=>$apellidos,
			'nombres'=>$nombres,	
			'correo'=>$correo,	
			'telefono'=>$telefono,	
			'ult_mod'=>$fecha,
			'id_usuario'=>$usuario,
			);


			$this->db->where('id_persona', $id_persona);
			$this->db->update('t_personas', $data);

			$data = array(
			'id_rol'=>$rol,	
			'ult_mod'=>$fecha,
			'id_usuario'=>$usuario,
			'estatus'=>$estatus
			);

			$this->db->where('id_persona', $id_persona);
			$this->db->update('t_usuarios', $data); 

			$retorno="Usuario Modificado";

		  } 
		  	else 
		  { 

		  	$retorno="Error 487";

		  } 

			return $retorno;

	}
	
	
	function listtpoliza()
	{
		$this->db->where('estatus','0');
		$listusuarios = $this->db->get('public.t_tpoliza');
		
		if($listusuarios->num_rows()>0)
		{
			return $listusuarios->result();
		}

	}

	function listEdadFactor()
	{
		$this->db->where('estatus','0');
		$listusuarios = $this->db->get('public.t_factor_edad');
		
		if($listusuarios->num_rows()>0)
		{
			return $listusuarios->result_array();
		}

	}

	function listplanc()
	{
		$this->db->where('estatus','0');
		$listusuarios = $this->db->get('public.t_plan_comision');
		
		if($listusuarios->num_rows()>0)
		{
			return $listusuarios->result();
		}

	}

	function listconcepto()
	{
		$this->db->order_by('id_concepto','desc');
		$listusuarios = $this->db->get('public.t_concepto');


		
		if($listusuarios->num_rows()>0)
		{
			return $listusuarios->result();
		}

	}


	function listtcalculo()
	{
		$this->db->order_by('id_calculo','desc');
		$listusuarios = $this->db->get('public.t_calculo');


		
		if($listusuarios->num_rows()>0)
		{
			return $listusuarios->result();
		}

	}

	function listplan()
	{
		$this->db->order_by('id_tplan','desc');
		$listusuarios = $this->db->get('public.t_plan');


		
		if($listusuarios->num_rows()>0)
		{
			return $listusuarios->result();
		}

	}


	function listtpagos()
	{
		$this->db->where('estatus','0');
		$listusuarios = $this->db->get('public.t_tpago');


		
		if($listusuarios->num_rows()>0)
		{
			return $listusuarios->result();
		}

	}

	function buscarUsuario($id)
	{
		$this->db->where('t_usuarios.id_persona',$id);
		$this->db->join('t_personas','t_personas.id_persona = t_usuarios.id_persona');
		$this->db->join('t_roles','t_roles.id_rol = t_usuarios.id_rol');
		$persona = $this->db->get('public.t_usuarios');

		
		if($persona->num_rows()>0)
		{
			return $persona->row();
		}

	}

	function listcomisiones()
	{
		$this->db->join('t_calculo','t_calculo.id_calculo = t_comisiones.id_tcalculo');
		$this->db->join('t_concepto','t_concepto.id_concepto = t_comisiones.id_tcomision');
		$this->db->join('t_plan_comision','t_plan_comision.id_planc = t_comisiones.id_plan');
		$this->db->where('t_comisiones.estatus','0');
		$persona = $this->db->get('public.t_comisiones');

		//echo $this->db->last_query();
		//break;
		
		if($persona->num_rows()>0)
		{
			return $persona->result();
		}

	}

	function buscarComision($id)
	{
		$this->db->where('id_comision',$id);
		$this->db->join('t_calculo','t_calculo.id_calculo = t_comisiones.id_tcalculo');
		$this->db->join('t_concepto','t_concepto.id_concepto = t_comisiones.id_tcomision');
		$persona = $this->db->get('public.t_comisiones');

		//echo $this->db->last_query();

		
		if($persona->num_rows()>0)
		{
			return $persona->row();
		}

	}

	function listrol()
	{
		$this->db->where('t_roles.estatus_rol','0')->order_by('id_rol','desc');
		$inventario = $this->db->get('public.t_roles');

		
		if($inventario->num_rows()>0)
		{
			return $inventario->result();
		}

	}


	public function listSemanas(){
		$this->db->order_by('id_semana', 'asc');
		$semanas = $this->db->get('public.t_semanas')->result_array();
		return $semanas;
	}

	public function checkSemana(){
		$day = date('w');
		$week_start = date('d/m/Y', strtotime('-'.$day.' days'));
		$week_end = date('d/m/Y', strtotime('+'.(6-$day).' days'));

		$week_start_format = DateTime::createFromFormat('d/m/Y', $week_end);

		$this->db->where('t_semanas.nsem',$week_start_format->format("W"));
		$semanas = $this->db->get('public.t_semanas')->result_array();

		if (!count($semanas)) {
			$this->db->where('t_semanas.estatus','0');
			$semana_activa = $this->db->get('public.t_semanas')->result_array();

			$data = array(
				'estatus'=>'1'
			);

			$this->db->where('t_semanas.estatus','0');
			$this->db->update('public.t_semanas', $data);

			$data = array(
				'desde'=> $week_start,
				'hasta'=> $week_end,
				'estatus'=> 0,
				'observaciones'=> 'Activacion de Semana Automatica',
				'nsem' => $week_start_format->format("W")
			);
	
	
			$this->db->insert('public.t_semanas',$data);
		}
	}

	public function registrarSemana($semana_id){

		// evaluar si es una semana reabierta

		$this->db->select("estatus");
		$this->db->where('t_semanas.id_semana', $semana_id);
	    $estatus_sem = $this->db->get('public.t_semanas');

		// Cerrando semana

		$data = array(
			'estatus'=>'1',
			'ult_mod'=>date("d/m/Y")
		);

		$this->db->where('t_semanas.id_semana', $semana_id);
		$this->db->update('public.t_semanas', $data);

		
	    if ($estatus_sem->row()->estatus==2) {

	    // si fue una semana reabierta, se debe cerrar la semana reabierta y abrir la ultima semana que estaba abierta.

	    $this->db->select_max("nsem");
	    $rsem = $this->db->get('public.t_semanas');

	    $data = array(
			'estatus'=>'0',
			'ult_mod'=>date("d/m/Y")
		);

		$this->db->where('t_semanas.nsem', $rsem->row()->nsem);
		$this->db->update('public.t_semanas', $data);

		$result ="Se volvera a abrir la semana ".$rsem->row()->nsem;

	    	
	    }else{

		// calculando cant de semanas que tiene el año

		$semanasyear = new DateTime;

	    $semanasyear->setISODate($year, 53);

	    if($semanasyear->format("W")=="53")
	        $numsemanas = 53;
	    else
	        $numsemanas = 52;

	    // buscando ultima semana en la base de datos para aumentarla en 1, si es la ultima semana del año comienza de nuevo en 1

	    $this->db->select_max("nsem");
	    $nsem = $this->db->get('public.t_semanas');

	    if ($numsemanas<=$nsem->row()->nsem) $numerosemana=1;
	    else $numerosemana=$nsem->row()->nsem+1;


	    // calculando rango de la nueva semana

	    $ano = date("Y");
		if ($numerosemana > 0 and $numerosemana < 60) {
			$numerosemana = $numerosemana;
			$primerdia = $numerosemana * 7 -8;
			$ultimodia = $numerosemana * 7 -2;
			$principioano = "$ano-01-01";
			$fecha1 = date('Y-m-d', strtotime("$principioano + $primerdia DAY"));
			$fecha2 = date('Y-m-d', strtotime ("$principioano + $ultimodia DAY"));
			if ($fecha2 <= date('Y-m-d', strtotime("$ano-12-31"))) {
				$fecha2 = $fecha2;
			} else {
				$fecha2 = date('Y-m-d',strtotime("$ano-12-31"));
			} 
		} 

	    	$data = array(
				'desde'=> $fecha1,
				'hasta'=> $fecha2,
				'estatus'=> 0,
				'observaciones'=> 'REGISTRO DE NUEVA SEMANA',
				'fecha_registro'=> date("d/m/Y"),
				'ult_mod'=> date("d/m/Y"),
				'nsem' => $numerosemana
			);

			$this->db->insert('public.t_semanas',$data);

			$result ="Fue cerrada la semana ".$nsem->row()->nsem." y se acaba de abrir la semana ".$numerosemana;

		}

			return $result; 

	}

	public function reabrirSemana($semana_id){

		$data = array(
			'estatus'=>'1',
			'ult_mod'=>date("d/m/Y")
		);

		$this->db->where('t_semanas.estatus !=','1');
		$this->db->update('public.t_semanas', $data);

		// Reabriendo semana

		$data = array(
			'estatus'=>'2',
			'ult_mod'=>date("d/m/Y")
		);

		$this->db->where('t_semanas.estatus','1');
		$this->db->where('t_semanas.id_semana', $semana_id);
		$this->db->update('public.t_semanas', $data);

		return "Semana Reabierta";

	}
}