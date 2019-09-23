<?php ?>
<table class="table" style="background-color: white; margin-bottom: 10px;">
	<tr>
		<th colspan="4">Datos del tomador</th>
	</tr>
	<tr style="font-size: 13px;">
		<th>Cedula:</th>
		<th>Apellidos y Nombres:</th>
		<th>Telefono:</th>
		<th>Correo:</th>
	</tr>
	<tr style="font-size: 13px;">
		<td><?php echo $_ci_vars['poliza']['identificacion'];?></td>
		<td><?php echo ucwords($_ci_vars['poliza']['apellidos'].' '.$_ci_vars['poliza']['nombres']);?></td>
		<td><?php echo $_ci_vars['poliza']['telefono'];?></td>
		<td><?php echo strtolower($_ci_vars['poliza']['correo']);?></td>
	</tr>
</table>

<table class="table" style="background-color: white; margin-bottom: 10px;">
	<tr>
		<th colspan="4">Datos de la poliza</th>
	</tr>
	<tr style="font-size: 13px;">
		<th>Solicitud N°:</th>
		<th>Tipo de venta:</th>
		<th>Vendedor:</th>
		<th>Semana:</th>
	</tr>

	<tr style="font-size: 13px;">
		<td><?php echo $_ci_vars['poliza']['solicitud'];?></td>
		<td><?php echo strtolower($_ci_vars['poliza']['correo']);?></td>
		<td><?php echo ucwords($_ci_vars['poliza']['lastname_vendedor'].' '.$_ci_vars['poliza']['name_vendedor']);?></td>
		<td><?php echo $_ci_vars['poliza']['nsem'].' ['.$_ci_vars['poliza']['desde'].' / '.$_ci_vars['poliza']['hasta'].']';?></td>
	</tr>

	<tr style="font-size: 13px;">
		<th>Plan:</th>
		<th>Tipo de poliza:</th>
		<th>Cobertura:</th>
		<th>Suma asegurada:</th>
	</tr>

	<tr style="font-size: 13px;">
		<td><?php echo ucwords($_ci_vars['poliza']['tplan']);?></td>
		<td><?php echo ucwords($_ci_vars['poliza']['tpoliza']);?></td>
		<td><?php echo ucwords($_ci_vars['poliza']['num_poliza'].' | '.$_ci_vars['poliza']['cobertura']);?></td>
		<td><?php echo number_format($_ci_vars['poliza']['suma'], 2, ',', '.');?></td>
	</tr>

	<tr style="font-size: 13px;">
		<th>Tipo de pago:</th>
		<th>N° Referencia:</th>
		<th>Monto:</th>
		<th>Cuotas canceladas:</th>
	</tr>

	<tr style="font-size: 13px;">
		<td><?php echo ucwords($_ci_vars['poliza']['tpago']);?></td>
		<td><?php echo $_ci_vars['poliza']['referencia_pago'];?></td>
		<td><?php echo number_format($_ci_vars['poliza']['monto'], 2, ',', '.');?></td>
		<td><?php echo $_ci_vars['poliza']['cuotas_canceladas'];?></td>
	</tr>

</table>

<table class="table" style="background-color: white; margin-bottom: 10px;">
	<tr>
		<th colspan="4">Personas Adicionales</th>
	</tr>
	<tr style="font-size: 13px;">
		<th>#</th>
		<th>Cedula:</th>
		<th>Apellidos y Nombres</th>
		<th>Edad:</th>
		<th>Parentesco:</th>
	</tr>

	<?php 
		$i=1;
		foreach ($_ci_vars['adicionales'] as $key) {
	?>

	<tr style="font-size: 13px;">
		<td><?php echo $i;?></td>
		<td><?php echo $key['identificacion'];?></td>
		<td><?php echo $key['nombres'];?></td>
		<td><?php echo $key['edad'];?></td>
		<td><?php echo $key['parentesco'];?></td>
	</tr>

	<?php $i++; }  ?>

</table>