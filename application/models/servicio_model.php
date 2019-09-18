<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');

class Servicio_model extends CI_Model{
    function __construct(){
        parent::__construct();
        $this->load->database();
    }    

	function guardar_pago($cedula,$fullname,$importe,$colaborador,$fecha,$usuario,$postal,$correo,$ruta){

		  $q = $this->db->query("SELECT id_persona FROM table_personas WHERE identificacion='$cedula'");
		  $count = $q->num_rows(); 
		  //break;
		  if($count==0){ 

		  	$data = array(
			'identificacion'=>$cedula,
			'apellidos_nombres'=>$fullname,
			'colaborador'=>$colaborador,	
			'fecha_registro'=>$fecha,
			'ult_mod'=>$fecha,
			'ult_pago'=>$fecha,
			'id_usuario'=>$usuario,
			'codigo_postal'=>$postal,
			'correo'=>$correo
			);


			$this->db->insert('public.table_personas',$data);
			$id_persona =  $this->db->insert_id(); 

		  } 
		  	else 
		  { 
		  	$update = array(
			'ult_pago'=>$fecha
			);
		  	$this->db->where('identificacion',$cedula);
        	$this->db->update('table_personas',$update);


		  	$query = $this->db->query("SELECT id_persona FROM table_personas WHERE identificacion='$cedula'"); 
		 	$row = $query->row();
		 	$id_persona = $row->id_persona;

		  } 


		  $data = array(
			'id_persona'=>$id_persona,
			'monto'=>$importe,
			'ruta_comprobante'=>$ruta,	
			'fecha_registro'=>$fecha,
			'ult_mod'=>$fecha,
			'usuario'=>$usuario
			);

			$this->db->insert('public.table_pagos',$data);
			$id_pago =  $this->db->insert_id();
			return $id_pago;

	}
	
	
	function listar_pagos()
	{
		$this->db->order_by('table_personas.ult_pago','desc');
		$inventario = $this->db->get('public.table_personas');

		
		if($inventario->num_rows()>0)
		{
			return $inventario->result();
		}

	}

	function buscar_persona($cedula)
	{
		$this->db->where('table_personas.identificacion',$cedula);
		$persona = $this->db->get('public.table_personas');

		
		if($persona->num_rows()>0)
		{
			return $persona->result();
		}

	}

	function pago($id)
	{
		$this->db->where('table_pagos.id_persona',$id)->order_by('table_pagos.fecha_registro','desc');
		$inventario = $this->db->get('public.table_pagos');

		
		if($inventario->num_rows()>0)
		{
			return $inventario->result();
		}

	}

}