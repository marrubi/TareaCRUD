<section>
	<h4>Lista de Reservas</h4>
	<br/>
	<?php
	echo "<table>";
		echo "<tr>";
			echo "<th>Laboratorio</th>";
			echo "<th>Período</th>";
			echo "<th>Fecha Solicitada</th>";
			echo "<th>Fecha-Hora Solicitud</th>";
			echo "<th>Rut Academico</th>";
			echo "<th>Nombre</th>";
			echo "<th>Asignatura</th>";
			echo "<th>Editar</th>";
			echo "<th>Eliminar</th>";
		echo "</tr>";
		foreach($reservas as $row){
			echo "<tr>";
				echo "<td>".$row['lab_fk']."</td>";
				echo "<td>".$row['periodo_fk']."</td>";
				echo "<td>".$row['fecha_dest']."</td>";
				echo "<td>".$row['fecha_sol']."</td>";
				foreach($academicos as $row2){
					if($row2['id_profesor'] == $row['academico_fk']){
						echo "<td>".$row2['rut']."</td>";
						echo "<td>".$row2['nombre']."</td>";
					}
				}
				foreach($asignaturas as $row3){
					if($row3['id_asig'] == $row['asignatura_fk']){
						echo "<td>".$row3['nombre']."</td>";
					}
				}
				echo "<td><a href='crud_controller/editar/".$row['id_res']."'>Editar</a></td>";
				echo "<td><a href='crud_controller/eliminar/".$row['id_res']."'>Eliminar</a></td>";
			echo "</tr>";
		}
	echo "</table>";
	?>
	<br/>
	<a id="boton" href="crud_controller/agregar">Agregar Nueva Reserva</a>
	<br/>
</section>