<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');

class Login_model extends CI_Model{
   
    function __construct(){
        parent::__construct();
        $this->load->database();
    }    


	function login($usuario,$clave)
	{
		$this->db->where('t_usuarios.username',$usuario);
		$this->db->where('t_usuarios.clave',$clave);
		$this->db->where('t_usuarios.estatus','0');
		$persona = $this->db->get('public.t_usuarios');
//		echo $this->db->last_query(); die();
//
		if($persona->num_rows()>0)
		{
			return $persona->row();
		}
		else
		{
			$x="NO";
			return $x;
		}

	}

	function menu ($rol) {
		$this->db->select('t_menu.id_menu, id_padre, item, icono, orden, ruta, hijos');
		$this->db->join('t_menu','t_menu.id_menu = menu_rol.id_menu');
		$this->db->where('menu_rol.id_rol',$rol);
		$this->db->order_by('t_menu.orden','asc');

		$menu = $this->db->get('public.menu_rol');


		if($menu->num_rows()>0)
		{
			return $menu->result();
		}

	}

}