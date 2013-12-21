<section>
	<?php
		$atributos_form = array(
			'class'=>'form'
			);
		echo form_open('crud_controller/validar_agregar',$atributos_form);
		$titulo = array(
			'class' => 'label-titulo'
			);
		echo "<div id='titulo'>";
		echo form_label('Agregar Reserva','add',$titulo);
		echo "</div>";
		echo "<div id='contenido'>";
		echo form_label('Rut');
		echo "<br/>";
		echo form_input();
		echo "<br/>";
		echo "<br/>";
		echo form_label('Asignatura');
		echo "<br/>";
		echo form_input();
		echo "<br/>";
		echo "<br/>";
		echo form_label('Laboratorio');
		echo "<br/>";
		echo form_input();
		echo "<br/>";
		echo "<br/>";
		echo form_label('Periodo');
		echo "<br/>";
		echo form_input();
		echo "<br/>";
		echo "<br/>";
		echo "</div>";
		echo form_close();
	?>
</section>