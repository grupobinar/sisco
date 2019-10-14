<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');

class Reportes_model extends CI_Model{
    function __construct(){
        parent::__construct();
        $this->load->database();
    }    


	function metrica_tpago()
	{
		$this->db->select('tpago, count(*) as total, sum(monto) as suma');
		$this->db->join('t_tpago','t_tpago.id_tpago = t_ventas.tipo_pago','left');
		$this->db->group_by('tpago');

		$data = $this->db->get('public.t_ventas'); 

		return $data->result_array();


	}

	function metrica_tventa()
	{
		$this->db->select('tventa, count(*) as total');
		$this->db->group_by('tventa');

		$data = $this->db->get('public.t_ventas'); 

		return $data->result_array();


	}

	function semana($sem)
	{

		$this->db->where('nsem',$sem); 
		$data = $this->db->get('public.t_semanas'); 

		return $data->row_array();


	}

	function coordinador($id)
	{

		$this->db->where('t_usuarios.id_persona',$id); 
		$this->db->join('t_personas','t_personas.id_persona = t_usuarios.id_persona','left');
		$data = $this->db->get('public.t_usuarios'); 

		return $data->row_array();


	}

	function hcell($vendedor,$sem){

		$this->db->select('tventa, count(*) as total');
		$this->db->where('id_vendedor',$vendedor); 
		$this->db->where('id_semana',$sem); 
		$this->db->group_by('tventa');

		$data = $this->db->get('public.t_ventas'); 

		return $data->result_array();

	}

	function vendedores_rpt_general($coordinador,$sem)
	{
		$this->db->select('t_vendedores.id_vendedor, apellidos, nombres, cod_vendedor, concepto');
		$this->db->where('id_coordinador',$coordinador); 
		$this->db->where('t_ventas.id_semana',$sem); 
		$this->db->join('t_ventas','t_ventas.id_vendedor = t_vendedores.id_vendedor','left');
		$this->db->join('t_concepto','t_concepto.id_concepto = t_ventas.tventa','left');
		$this->db->group_by('t_vendedores.id_vendedor, apellidos, nombres, cod_vendedor, concepto');

		$data = $this->db->get('public.t_vendedores'); 

		return $data->result_array();

	}

	function comisiones($vendedor,$sem){

		$this->db->select('tventa, sum(comision_liquidada)');
		$this->db->join('t_ventas','t_ventas.id_venta = t_liquidacion.id_venta','left');
		$this->db->where('id_vendedor',$vendedor); 
		$this->db->where('t_ventas.id_semana',$sem); 
		$this->db->group_by('tventa'); 
		
		$data = $this->db->get('public.t_liquidacion'); 

		return $data->result_array();


	}

	function e_listcoord()
	{

		$data=$this->db->query("SELECT * FROM t_usuarios as u, t_personas as p where p.id_persona = u.id_persona and id_rol = 3 and id_user in (select id_coordinador from t_vendedores)");
		
		//echo $this->db->last_query();

		if($data->num_rows()>0)
		{
			 return $data->result_array();
		}
		
	}

	function e_listsemana()
	{
		$data=$this->db->query("SELECT * FROM t_semanas where estatus=1 and id_semana in (select id_semana from t_ventas where estatus_venta='L') order by nsem asc");

		if($data->num_rows()>0)
		{
			 return $data->result_array();
		}
		
	}
}