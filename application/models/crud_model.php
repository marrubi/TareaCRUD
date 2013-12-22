<?php
class Crud_model extends CI_Model{
	public function __construct(){
		parent::__construct();
	}

	public function getReservas(){
		$this->db->select('*');
		$this->db->from('tb-reserva');
		$this->db->order_by('id_res');

		$query = $this->db->get();

		if($query->num_rows() > 0){
			return $query->result_array();
		}
		else{
			return false;
		}
	}

	//Devuelve id, rut y nombre de todos los académicos
	//Uso único para mostrar datos específicos en la tabla general de la aplicación
	public function getDatosAcademicos(){
		$this->db->select('id_profesor,rut,nombre');
		$this->db->from('tb-profesor');
		$this->db->order_by('id_profesor');

		$query = $this->db->get();

		if($query->num_rows() > 0){
			return $query->result_array();
		}
		else{
			return false;
		}

	}

	//Devuelve datos de id y nombre, para acoplar datos en la tabla general de la aplicación
	public function getAsignaturas(){
		$this->db->select('id_asig,nombre');
		$this->db->from('tb-asignatura');
		$this->db->order_by('id_asig');

		$query = $this->db->get();

		if($query->num_rows() > 0){
			return $query->result_array();
		}
		else{
			return false;
		}

	}

	//Agregar una reserva a la base de datos
	public function addReservas($dato){
		if($this->db->insert('tb-reserva',$dato)){
			return true;
		}
		else{
			return false;
		}
	}

	public function editReserva($id){
		$this->db->where('id_res',$id);
		$this->db->update('tb-reserva',$arrayedit);
		return true;
	}

	public function deleteReserva($id){
		$this->db->where('id_res', $id);
		$this->db->delete('tb-reserva');

		return true;
	}
}
?>