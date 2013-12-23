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
	//Reserva obtenida a partir de un id
	public function getReserva($id){
		$this->db->select('*');
		$this->db->from('tb-reserva');
		$this->db->where('academico_fk',$id);

		$query = $this->db->get();
		
		if($query->num_rows() > 0){
			
			return $query->result_array();
		}
		else{
			return false;
		}
	}

	public function getIDProfesor($id_res){
		$this->db->select('academico_fk');
		$this->db->from('tb-reserva');
		$this->db->where('id_res',$id_res);
		$this->db->order_by('id_res');

		$query = $this->db->get();

		if($query->num_rows() > 0){
			$row = $query->row();
			return $row->academico_fk;
		}
		else{
			return false;
		}
	}


	public function getID($rut){
		$this->db->select('id_profesor');
		$this->db->from('tb-profesor');
		$this->db->where('rut',$rut);
		$this->db->order_by('id_profesor');

		$query = $this->db->get();

		if($query->num_rows() > 0){
			$row = $query->row();
			return $row->id_profesor;
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

	public function getRut($id_prof){
		$this->db->select('rut');
		$this->db->from('tb-profesor');
		$this->db->where('id_profesor',$id_prof);
		$this->db->order_by('id_profesor');

		$query = $this->db->get();

		if($query->num_rows() > 0){
			$row = $query->row();
			return $row->rut;
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

	public function getAsignAsoc($id_profesor){
		$this->db->select('*');
		$this->db->from('tb-profesor-asignatura');
		$this->db->where('profesor_fk',$id_profesor);
		$this->db->order_by('id');

		$query = $this->db->get();

		if($query->num_rows() > 0){
			return $query->result_array();
		}
		else{
			return false;
		}

	}

	//Agregar una reserva a la base de datos
	public function addReserva($dato){
		if($this->db->insert('tb-reserva',$dato)){
			return true;
		}
		else{
			return false;
		}
	}

	public function editReserva($id,$datos){
		$this->db->where('id_res',$id);
		$this->db->update('tb-reserva',$datos);
		return true;
	}

	public function deleteReserva($id){
		$this->db->where('id_res', $id);
		$this->db->delete('tb-reserva');

		return true;
	}

	/* ++++++++++ ---------- BUSCAR ---------- ++++++++++ */

	public function buscar($rut){
		$this->db->select('id_profesor');
		$this->db->from('tb-profesor');
		$this->db->where('rut',$rut);

		$query = $this->db->get();

		if($query->num_rows() > 0){
			$row = $query->row();
			return $row->id_profesor;
		}
		else{
			return false;
		}
	}

	//Verificar datos repetidos
	public function verificar_coincidencia($datos){
		$this->db->select('*');
		$this->db->from('tb-reserva');
		$this->db->where('lab_fk',$datos['laboratorio']);
		$this->db->where('periodo_fk',$datos['periodo']);
		$this->db->where('fecha_dest',$datos['fecha']);

		$query = $this->db->get();

		if($query->num_rows() > 0){
			return true;
		}
		else{
			return false;
		}
	}
}
?>