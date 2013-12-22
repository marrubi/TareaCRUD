<?php
class Crud_controller extends CI_Controller{
	//Constructor
	public function __construct(){
		parent::__construct();
		$this->load->helper('url');
		$this->load->helper('form');
		$this->load->model('crud_model');
	}

	//Carga Inicial de la página
	public function index(){
		$this->load->view('header');
		
		$array= array(
			'reservas' => $this->crud_model->getReservas(),
			'academicos' => $this->crud_model->getDatosAcademicos(),
			'asignaturas' => $this->crud_model->getAsignaturas()
		);

		$this->load->view('verreservas',$array, 'refresh');

		$this->load->view('footer');
	}

	//Agregar Nueva Reserva
	public function agregar(){
		$this->load->view('header');
		$this->load->view('addreserva');
		$this->load->view('footer');
	}

	public function validar_agregar(){
		redirect(base_url(),'refresh');
	}

	//Editar Nueva Reserva
	public function editar($id){
		$this->load->view('header');
		$this->load->view('edreserva');
		$this->load->view('footer');
	}

	public function validar_editar(){
		redirect(base_url(),'refresh');
	}

	//Eliminar Nueva Reserva
	public function eliminar($id){

		$this->crud_model->deleteReserva($id);
		
		redirect(base_url(),'refresh');
	}

	public function buscar(){
		$rut = $this->input->post('reserva');
		$id = $this->crud_model->buscar($rut);

		
	}
}
?>