<section>
	<?php
		$atributos_form = array(
			'class'=>'form'
			);
		echo form_open('crud_controller/validar_agregar',$atributos_form);
		echo "<div id='titulo'>";
			echo "<h5>Agregar Reserva</h5>";
		echo "</div>";
		echo "<div id='contenido'>";
			$submit = array(
				'class' => 'submit2',
				'value' => 'Agregar'
			);
			echo form_label('Rut');
			echo "<br/>";
			echo form_input('rut', $rut_add);
			echo "<br/>";
			echo "<br/>";
			echo form_error('rut');
			echo form_label('Asignatura');
			$asig = array(
				'1'=> 'Análisis de Algoritmos',
				'2'=> 'Arquitectura de Computadores',
				'3'=> 'Auditoría de Sistemas',
				'4'=> 'Bases de Datos',
				'5'=> 'Ciencias de la Computación',
				'6'=> 'Computación Paralela',
				'7'=> 'Desempeño de Sistemas Computacionales',
				'8'=> 'Estructura de Datos',
				'9'=> 'Estructuras Discretas',
				'10'=> 'Gestión de Personal Informático',
				'11'=> 'Gestión de Proyectos Informáticos',
				'12'=> 'Gestión Informática',
				'13'=> 'Gestión Financiera de TI',
				'14'=> 'Informática Industrial',
				'15'=> 'Ingeniería de Software',
				'16'=> 'Lenguajes de Programación',
				'17'=> 'Programación',
				'18'=> 'Optimización de Sistemas',
				'19'=> 'Organización de Computadores',
				'20'=> 'Sistemas de Información',
				'21'=> 'Sistemas Distribuidos',
				'22'=> 'Sistemas Integrados de Información',
				'23'=> 'Sistemas Operativos',
				'24'=> 'Taller de SIA',
				'25'=> 'Tecnología de Equipos',
				'26'=> 'Teoría de Autómatas',	
				'27'=> 'Electivo de Formación Especializada',
			);
			echo form_dropdown('asignatura',$asig, $asignatura_add);
			echo "<br/>";
			echo "<br/>";
			echo form_label('Fecha');
			echo "<br/>";
			echo "<input type='date' name='fecha' value='".$fecha_add."'>";
			echo "<br/>";
			echo "<br/>";
			echo form_error('fecha');
			echo form_label('Laboratorio');
			echo "<br/>";
			$labs = array(
				'1'=> 'Laboratorio 1',
				'2'=> 'Laboratorio 2',
				'3'=> 'Laboratorio 3',
				'4'=> 'Laboratorio 4',
				'5'=> 'Laboratorio 5',
				'6'=> 'Laboratorio 6',
				'7'=> 'Laboratorio 7',
				'8'=> 'Laboratorio 8',
			);
			echo form_dropdown('laboratorio',$labs, $laboratorio_add);
			echo "<br/>";
			echo "<br/>";
			echo form_label('Periodo');
			echo "<br/>";
			$per = array(
				'1'=> 'I - Desde 8:15 Hasta 9:35',
				'2'=> 'II - Desde 9:35 Hasta 11:05',
				'3'=> 'III - Desde 11:15 Hasta 12:35',
				'4'=> 'IV - Desde 12:35 Hasta 14:05',
				'5'=> 'V - Desde 14:15 Hasta 15:35',
				'6'=> 'VI - Desde 15:45 Hasta 17:05',
				'7'=> 'VII - Desde 17:15 Hasta 18:35',
				'8'=> 'VIII - Desde 19:00 Hasta 20:30',
			);
			echo form_dropdown('periodo',$per, $periodo_add);
			echo "<br/>";
			echo "<br/>";
			echo form_error('periodo');
			echo form_submit($submit);
			echo "</div>";
		echo form_close();
	?>
</section>