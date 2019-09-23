<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');

class Config_model extends CI_Model{
    function __construct(){
        parent::__construct();
        $this->load->database();
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

	function guardar_comision($concepto,$calculo,$cuota,$min,$max,$fecha,$usuario,$planc){

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
			);



			$this->db->insert('public.t_comisiones',$data);

			//echo $this->db->last_query();

			$retorno="Comision Creada";

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

}