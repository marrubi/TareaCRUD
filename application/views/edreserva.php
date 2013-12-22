<section>
	<?php
		$atributos_form = array(
			'class'=>'form'
			);
		echo form_open('crud_controller/validar_editar',$atributos_form);
		$titulo = array(
			'class' => 'label-titulo'
			);
		echo "<div id='titulo'>";
			echo form_label('Editar Reserva','ed',$titulo);
		echo "</div>";
		echo "<div id='contenido'>";
			echo form_label('Rut');
			echo "<br/>";
			echo form_input();
			echo "<br/>";
			echo "<br/>";
			echo form_label('Asignatura');
			echo "<br/>";
			$array = array(
				'1'=>'',
				'2'=>'',
				'3'=>'',
				'4'=>'',
				'5'=>'',
				'6'=>'',
				'7'=>'',
				'8'=>'',
				'9'=>'',
				'10'=>'',
				'11'=>'',
				'12'=>'',
				'13'=>'',
				'14'=>'',
				'15'=>'',
				);
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
			echo form_submit();
			echo "</div>";
		echo form_close();
	?>
</section>