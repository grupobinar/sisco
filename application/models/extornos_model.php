<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');

class Extornos_model extends CI_Model{
    function __construct(){
        parent::__construct();
        $this->load->database();
    }    


	function listventas($id,$sem)
	{
		$this->db->select('t_tomadores.identificacion, t_tomadores.apellidos, t_tomadores.nombres, tventa, cuotas_canceladas, suma, tpoliza');
		$this->db->join('t_polizas','t_polizas.id_poliza = t_ventas.id_poliza','left');
		$this->db->join('t_tpoliza','t_tpoliza.id_tpoliza = t_ventas.id_tpoliza','left');
		$this->db->join('t_tomadores','t_tomadores.id_tomador = t_ventas.id_tomador','left');
		$this->db->join('t_vendedores','t_vendedores.id_vendedor = t_ventas.id_vendedor','left');
		$this->db->join('t_semanas','t_semanas.id_semana = t_ventas.id_semana','left');
		$this->db->where('cod_vendedor',$id);
		$this->db->where('nsem',$sem);
		$this->db->where('estatus_venta','A');
		$listusuarios = $this->db->get('public.t_ventas');

		//echo $this->db->last_query();


		if($listusuarios->num_rows()>0)
		{
			 return $listusuarios->result_array();
		}

	}

}