<?php 

	 
?>
<table class="table table-hover table-bordered" style="background-color: #cecece; margin-bottom: 10px;">
	<tr>
		<th colspan="10">Comision por venta</th>
	</tr>
	<tr style="font-size: 13px;">
		<th>Tipo de venta:</th>
		<th>Tipo de poliza:</th>
		<th>Plan:</th>
		<th>Cuotas :</th>
		<th>Adicionales:</th>
		<th>Suma Asegurada:</th>
		<th>Prima Mensual:</th>
		<th>Comision por venta:</th>
		<th>Comision Coordinador:</th>
		<th>Opciones</th>
	</tr>
	<?php foreach ($_ci_vars as $key) {  
		  if($key['tventa']==1) $tventa = "Venta de poliza";
	      elseif($key['tventa']==2) $tventa = "Adicionales";
	      elseif($key['tventa']==3) $tventa = "Actualización de Datos";

	      $comision=$comision+$key['comision'];
	      $comision_c=$comision_c+$key['comision_c'];
	?>
		<tr style="font-size: 13px;">
			<td><?php echo $tventa;?></td>
			<td><?php if(isset($key['tpoliza'])) echo ucwords($key['tpoliza']); else echo "N/A"?></td>
			<td><?php if(isset($key['tplan'])) echo ucwords($key['tplan']); else echo "N/A"?></td>
			<td><?php echo ucwords($key['cpagadas']); ?></td>
			<td><?php echo ucwords($key['adicionales']); ?></td>
			<td style="text-align: right;"><?php if(isset($key['suma'])) echo number_format($key['suma'], 2, ',', '.'); else echo "N/A"?></td>
			<td style="text-align: right;">
				<?php if ($key['tventa']==1) {
					echo number_format(((($key['suma']*$key['factor'])/1000)/12), 2, ',', '.');
				}elseif($key['tventa']==2){
					echo "0,00";
				}elseif($key['tventa']==3){
					echo "0,00";
				}
				?>	
			</td>
			<td style="text-align: right;"><?php echo number_format($key['comision'], 2, ',', '.'); ?></td>
			<td style="text-align: right;"><?php echo number_format($key['comision_c'], 2, ',', '.'); ?></td>
			<td>
				<a href="<?php echo base_url().'index.php/liquidacion/anular?id='.$key['id_vendedor'].'&sem='.$key['semm'].'&id_2='.$key['id_venta'] ?>" class="btn btn-danger btn-xs anular" title="anular" id="anular"><i class="fa fa-close"></i></a>
			</td>
		</tr>
	<?php }?>
		<tr>
		<th colspan="7" style="text-align: right;">Total:</th>
		<th style="text-align: right;"><?php echo number_format($comision, 2, ',', '.'); ?></th>
		<th style="text-align: right;"><?php echo number_format($comision_c, 2, ',', '.'); ?></th>
		<td></td>
		</tr>
</table>

<script type="text/javascript">
  $(document).ready(function(){

    $(".anular").click(function(){

       var confirmacion = confirm("Una vez anulada la venta, este proceso no se puede revertir, desea anular esta venta?");

        return confirmacion;

    });

  });    
</script>