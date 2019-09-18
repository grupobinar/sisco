<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');

class Usuarios_model extends CI_Model{
    function __construct(){
        parent::__construct();
        $this->load->database();
    }    

	function guardar($nac,$cedula,$nombres,$apellidos,$correo,$telefono,$rol,$username,$clave,$fecha,$usuario){

		  $q = $this->db->query("SELECT id_persona FROM t_personas WHERE identificacion='".$nac."-".$cedula."'");
		  $count = $q->num_rows(); 
		  //break;
		  if($count==0){ 

		  	$identificacion=$nac.'-'.$cedula;

		  	$data = array(
			'identificacion'=>$identificacion,
			'apellidos'=>$apellidos,
			'nombres'=>$nombres,	
			'correo'=>$correo,	
			'telefono'=>$telefono,	
			'fecha_registro'=>$fecha,
			'ult_mod'=>$fecha,
			'id_usuario'=>$usuario,
			);


			$this->db->insert('public.t_personas',$data);
			$id_persona =  $this->db->insert_id(); 

			$data = array(
			'username'=>$username,
			'id_rol'=>$rol,	
			'clave'=>$clave,	
			'id_persona'=>$id_persona,	
			'fecha_registro'=>$fecha,
			'ult_mod'=>$fecha,
			'id_usuario'=>$usuario,
			);

			$this->db->insert('public.t_usuarios',$data);
			$id_persona =  $this->db->insert_id(); 

			$retorno="Usuario Creado";



		  } 
		  	else 
		  { 

		  	$retorno="Usuario ya existe";

		  } 

			return $retorno;

	}

	function guardar_vendedor($nac,$cedula,$nombres,$apellidos,$correo,$telefono,$fecha,$codvendedor,$usuario){

		  $q = $this->db->query("SELECT id_vendedor FROM t_vendedores WHERE identificacion='".$nac."-".$cedula."'");
		  $count = $q->num_rows(); 
		  //break;
		  if($count==0){ 

		  	$identificacion=$nac.'-'.$cedula;

		  	$data = array(
			'identificacion'=>$identificacion,
			'apellidos'=>$apellidos,
			'nombres'=>$nombres,	
			'correo'=>$correo,	
			'telefono'=>$telefono,	
			'fecha_registro'=>$fecha,
			'ult_mod'=>$fecha,
			'id_coordinador'=>$usuario,
			'id_usuario'=>$usuario,
			'cod_vendedor'=>$codvendedor,
			);


			$this->db->insert('public.t_vendedores',$data);


			$retorno="Vendedor Creado";


		  } 
		  	else 
		  { 

		  	$retorno="Vendedor ya existe";

		  } 

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


	function editar_vendedor($id_vendedor,$nombres,$apellidos,$correo,$telefono,$fecha,$usuario,$estatus){


		  	$data = array(
			'apellidos'=>$apellidos,
			'nombres'=>$nombres,	
			'correo'=>$correo,	
			'telefono'=>$telefono,	
			'ult_mod'=>$fecha,
			'id_usuario'=>$usuario,
			);


			$this->db->where('id_vendedor', $id_vendedor);
			$this->db->update('t_vendedores', $data);


			$retorno="Usuario Modificado";


			return $retorno;

	}
	
	
	function listusuarios()
	{
		$this->db->order_by('t_usuarios.id_user','desc');
		$this->db->join('t_personas','t_personas.id_persona = t_usuarios.id_persona');
		$this->db->join('t_roles','t_roles.id_rol = t_usuarios.id_rol');
		$listusuarios = $this->db->get('public.t_usuarios');


		
		if($listusuarios->num_rows()>0)
		{
			return $listusuarios->result();
		}

	}


	function listOpMenu()
	{
		$this->db->select('t_menu.id_menu, id_padre, item, hijos');
		$this->db->join('t_menu','t_menu.id_menu = menu_rol.id_menu');
		$this->db->order_by('t_menu.orden','asc');
		$this->db->group_by('t_menu.id_menu');

		$menu = $this->db->get('public.menu_rol');


		if($menu->num_rows()>0)
		{
			return $menu->result();
		}


		
		if($listusuarios->num_rows()>0)
		{
			return $listusuarios->result();
		}

	}

	function listRoles()
	{
		$listusuarios = $this->db->get('public.t_roles');


		
		if($listusuarios->num_rows()>0)
		{
			return $listusuarios->result();
		}

	}

	function listvendedores()
	{
		if ($this->session->userdata('rol')<>2) {
		$this->db->where('id_coordinador',$this->session->userdata('id_usuario'));
		}

		$listusuarios = $this->db->get('public.t_vendedores');

		
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

	function buscarVendedor($id)
	{
		$this->db->where('t_vendedores.id_vendedor',$id);
		$persona = $this->db->get('public.t_vendedores');

		
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