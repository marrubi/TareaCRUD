<?php
class Crud_controller extends CI_Controller{
	//Constructor
	public function __construct(){
		parent::__construct();
		$this->load->helper('url');
		$this->load->helper('form');
		$this->load->model('crud_model');
		$this->load->library('form_validation');
		$this->load->library('javascript');
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

	/* ++++++++++ ---------- AGREGAR ---------- ++++++++++ */

	//Agregar Nueva Reserva
	public function agregar(){
		$array = array(
			'rut_add' => '',
			'laboratorio_add' => '',
			'periodo_add' => '',
			'fecha_add' => '',
			'asignatura_add' => '',

		);
		$this->load->view('header');
		$this->load->view('addreserva',$array);
		$this->load->view('footer');
	}

	//Validador de agregar reservas
	public function validar_agregar(){
		$this->form_validation->set_rules('rut','Rut','required|trim|xss_clean|callback_validar_rut');
		$this->form_validation->set_rules('fecha', 'Fecha','required|callback_validar_fecha');
		$this->form_validation->set_rules('periodo','Periodo', 'callback_validardb');
		$this->form_validation->set_message('required','Ingrese %s');

		if($this->form_validation->run() == false){
			$array = array(
				'rut_add' => $this->input->post('rut'),
				'laboratorio_add' => $this->input->post('laboratorio'),
				'periodo_add' => $this->input->post('periodo'),
				'fecha_add' => $this->input->post('fecha'),
				'asignatura_add' => $this->input->post('asignatura'),
			);
			$this->load->view('header');
			$this->load->view('addreserva',$array);
			$this->load->view('footer');
		}
		else{
			$array = array(
				'academico_fk' => $this->crud_model->getID($this->input->post('rut')),
				'lab_fk' => $this->input->post('laboratorio'),
				'periodo_fk' => $this->input->post('periodo'),
				'fecha_dest' => $this->input->post('fecha'),
				'asignatura_fk' => $this->input->post('asignatura'),
			);
			$this->crud_model->addReserva($array);
			redirect(base_url(),'refresh');
		}
	}

	/* ++++++++++ ---------- EDITAR ---------- ++++++++++ */

	//Editar Nueva Reserva
	public function editar($id){
		$id_profesor = $this->crud_model->getIDProfesor($id);
		$datos = $this->crud_model->getReserva($id);
		
		$array = array(
			'id' => $datos['id'],
			'rut_edit' => $this->crud_model->getRut($id_profesor),
			'laboratorio_edit' => $datos['laboratorio'],
			'periodo_edit' => $datos['periodo'],
			'fecha_edit' => $datos['fecha'],
			'asignatura_edit' => $datos['asignatura'],

		);

		$this->load->view('header');
		$this->load->view('edreserva',$array);
		$this->load->view('footer');
	}
	//Validador de la edición
	public function validar_editar(){
		$this->form_validation->set_rules('rut','Rut','required|trim|xss_clean|callback_validar_rut');
		$this->form_validation->set_rules('fecha', 'Fecha','required|callback_validar_fecha');
		$this->form_validation->set_rules('periodo','Periodo', 'callback_validardb');
		$this->form_validation->set_message('required','Ingrese %s');

		if($this->form_validation->run() == false){
			$array = array(
				'id' => $this->input->post('id'),
				'rut_edit' => $this->input->post('rut'),
				'laboratorio_edit' => $this->input->post('laboratorio'),
				'periodo_edit' => $this->input->post('periodo'),
				'fecha_edit' => $this->input->post('fecha'),
				'asignatura_edit' => $this->input->post('asignatura'),
			);
			$this->load->view('header');
			$this->load->view('edreserva',$array);
			$this->load->view('footer');
		}
		else{
			$id = $this->input->post('id');
			$array = array(
				'academico_fk' => $this->crud_model->getID($this->input->post('rut')),
				'lab_fk' => $this->input->post('laboratorio'),
				'periodo_fk' => $this->input->post('periodo'),
				'fecha_dest' => $this->input->post('fecha'),
				'asignatura_fk' => $this->input->post('asignatura'),
			);
			$this->crud_model->editReserva($id,$array);
			redirect(base_url(),'refresh');
		}
	}


	/* ++++++++++ ---------- VALIDACIONES ---------- ++++++++++ */
	//Validación del campo rut
	public function validar_rut(){
		$rut = $this->input->post('rut');
		if($this->crud_model->buscar($rut)){
			return true;
		}
		else{
			$this->form_validation->set_message('validar_rut','El rut ingresado no existe');
			return false;
		}

	}

	//Validación del campo fecha
	public function validar_fecha(){
        $fecha = $this->input->post('fecha');
        //Fecha actual
        /* ¡¡¡OJO!!!, Recuerde cambiar 'date.timezone' a 'date.timezone = "Chile/Continental"' en php.ini, y reiniciar el servidor!! */
        $actual = date("Y-m-d");

        if($fecha < $actual){
            //Validación de fecha desde con fecha actual
            $this->form_validation->set_message('validar_fecha','Fecha desde debe ser mayor o igual que fecha actual');
            return false;
        }
        else{
            return true;
        }
	}

	//Validación contra base de datos
	public function validardb(){
		$datos = array(
			'laboratorio' => $this->input->post('laboratorio'),
			'periodo' => $this->input->post('periodo'),
			'fecha' => $this->input->post('fecha'),
		);

		if($this->crud_model->verificar_coincidencia($datos)){
			$this->form_validation->set_message('validardb','Existe una reserva asignada con los mismos datos');
			return false;
		}
		else{
			return true;
		}
	}

	/* ++++++++++ ---------- ELIMINAR ---------- ++++++++++ */

	//Eliminar Nueva Reserva
	public function eliminar($id){

		$this->crud_model->deleteReserva($id);
		
		redirect(base_url(),'refresh');
	}

	/* ++++++++++ ---------- BUSCAR ---------- ++++++++++ */

	//Buscar una reserva dentro de la db
	public function buscar(){
		$rut = $this->input->post('reserva');
		$id = $this->crud_model->buscar($rut);
	
		if($id){
			$arreglo = array(
				'reservas' => $this->crud_model->getReserva($id),
				'academicos' => $this->crud_model->getDatosAcademicos(),
				'asignaturas' => $this->crud_model->getAsignaturas()
			);
			$this->load->view('header');
			$this->load->view('verreservas', $arreglo, 'refresh');
			$this->load->view('footer');
		}
		else{
			$arreglo = array(
				'reservas' => '',
				'academicos' => '',
				'asignaturas' => ''
			);
			$this->load->view('header');
			$this->load->view('verreservas',$arreglo, 'refresh');
			$this->load->view('footer');
		}
		
	}
}
?>