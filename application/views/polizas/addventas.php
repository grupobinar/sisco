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
		<td><?php echo $_ci_vars['cedula'];?></td>
		<td><?php echo $_ci_vars['nombres'];?></td>
		<td><?php echo $_ci_vars['telefono'];?></td>
		<td><?php echo $_ci_vars['correo'];?></td>
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
		<td><?php echo $_ci_vars['solicitud'];?></td>
		<td><?php echo $_ci_vars['correo'];?></td>
		<td><?php echo $_ci_vars['correo'];?></td>
		<td><?php echo $_ci_vars['nsem'].' ['.$_ci_vars['desde'].' / '.$_ci_vars['hasta'].']';?></td>
	</tr>

	<tr style="font-size: 13px;">
		<th>Plan:</th>
		<th>Tipo de poliza:</th>
		<th>Cobertura:</th>
		<th>Suma asegurada:</th>
	</tr>

	<tr style="font-size: 13px;">
		<td><?php echo $_ci_vars['plan'];?></td>
		<td><?php echo $_ci_vars['tpoliza'];?></td>
		<td><?php echo $_ci_vars['num_poliza'].'-'.$_ci_vars['cobertura'];?></td>
		<td><?php echo $_ci_vars['suma'];?></td>
	</tr>

	<tr style="font-size: 13px;">
		<th>Tipo de pago:</th>
		<th>N° Referencia:</th>
		<th>Monto:</th>
		<th>Cuotas canceladas:</th>
	</tr>

	<tr style="font-size: 13px;">
		<td><?php echo $_ci_vars['tpago'];?></td>
		<td><?php echo $_ci_vars['referencia_pago'];?></td>
		<td><?php echo $_ci_vars['monto'];?></td>
		<td><?php echo $_ci_vars['cuotas_canceladas'];?></td>
	</tr>

</table>

<table class="table" style="background-color: white; margin-bottom: 10px;">
	<tr>
		<th colspan="4">Personas Adicionales</th>
	</tr>
	<tr style="font-size: 13px;">
		<th>Cedula:</th>
		<th>Apellidos y Nombres</th>
		<th>Edad:</th>
		<th>Parentesco:</th>
	</tr>

</table>