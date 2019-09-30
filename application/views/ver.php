<?php 
/*echo "<pre>";
print_r($_ci_vars);
echo "</pre>";*/
	 
?>
<table class="table" style="background-color: white; margin-bottom: 10px;">
	<tr>
		<th colspan="4">Comision por venta</th>
	</tr>
	<tr style="font-size: 13px;">
		<th>Tipo de venta:</th>
		<th>Tipo de poliza:</th>
		<th>Plan:</th>
		<th>Suma Asegurada:</th>
		<th>Prima Mensual:</th>
		<th>Comision por venta:</th>
	</tr>
	<?php foreach ($_ci_vars as $key) {  
		  if($key['tventa']==1) $tventa = "Venta de poliza";
	      elseif($key['tventa']==2) $tventa = "Adicionales";
	      elseif($key['tventa']==3) $tventa = "Actualización de Datos";
	?>
		<tr style="font-size: 13px;">
			<td><?php echo $tventa;?></td>
			<td><?php if(isset($key['tpoliza'])) echo ucwords($key['tpoliza']); else echo "N/A"?></td>
			<td><?php if(isset($key['tplan'])) echo ucwords($key['tplan']); else echo "N/A"?></td>
			<td><?php if(isset($key['suma'])) echo ucwords($key['suma']); else echo "N/A"?></td>
			<td>
				<?php if ($key['tventa']==1) {
					echo number_format(((($key['suma']*$key['factor'])/1000)/12), 2, ',', '.');
				}elseif($key['tventa']==2){
					echo "0,00";
				}elseif($key['tventa']==3){
					echo "0,00";
				}
				?>	
			</td>
			<td>
				<?php if ($key['tventa']==1) {
					echo number_format((((($key['suma']*$key['factor'])/1000)/12)*0.8), 2, ',', '.');
				}elseif($key['tventa']==2){
					echo "3.500,00";
				}elseif($key['tventa']==3){
					echo "1.000,00";
				}
				?>	
			</td>
		</tr>
	<?php }?>

</table>