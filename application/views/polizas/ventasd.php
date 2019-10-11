<?php //echo "<pre>"; print_r($_ci_vars); echo "</pre>";?>


<!-- #lista de usuarios ############################################################################-->
<div class="col-lg-12"> 
 <div class="col-lg-12"><br></div>

<div class="col-lg-12 box"> 
 <div class="col-lg-12"><br></div>
 <table id="example1" class="table table-bordered table-striped" style="padding: 10px;">
    <thead>
     <tr>
      <th>Cedula</th>
      <th>Tomador</th>
      <th>Tipo de Venta</th>
      <th>Tipo Poliza</th>
      <th>Plan</th>
     <!--  <th>cobertura</th> -->
      <th>Semana</th>
      <th>Estatus</th>
      <th><i class="fa fa-cogs"></i> Opciones</th>
    </tr>
    </thead>
    <tbody>
    <?php if ($_ci_vars[ventas]<>"") { foreach ($_ci_vars[ventas] as $key) { 
      if($key['tventa']==1) $tventa = "Venta de poliza";
      elseif($key['tventa']==2) $tventa = "Adicionales";
      elseif($key['tventa']==3) $tventa = "Actualización de Datos";

      if($key['estatus_venta']=="P") {$estatus_venta="Preliquidada"; $clase="";}
      elseif($key['estatus_venta']=="X") {$estatus_venta="Anulada"; $clase="text-red";}
      elseif($key['estatus_venta']=="A") {$estatus_venta="Activa"; $clase="text-green";}
      elseif($key['estatus_venta']=="L") {$estatus_venta="Liquidada"; $clase="";}
      elseif($key['estatus_venta']=="E") {$estatus_venta="Extornada"; $clase="text-blue";}
      elseif($key['estatus_venta']=="D") {$estatus_venta="Pendiente de pago"; $clase="text-red";}
    ?>
    <tr class="<?php echo $clase?>">
      <td><?php echo ucwords($key['identificacion']);?></td>
      <td><?php echo ucwords($key['apellidos'].' '.$key['nombres']);?></td>
      <td><?php echo ucwords($tventa);?></td>
      <td><?php if(isset($key['tpoliza'])) echo ucwords($key['tpoliza']); else echo "N/A";?></td>
      <td><?php if(isset($key['tplan'])) echo ucwords($key['tplan']); else echo "N/A";?></td>
<!--       <td><?php // if(isset($key['cobertura'])) echo ucwords($key['cobertura']); else echo "N/A";?></td> -->      
      <td><a href="#" title="<?php echo $key['desde'].' | '.$key['hasta'] ?>"><?php echo ucwords($key['nsem']);?></a></td>
      <td><?php echo ucwords($estatus_venta);?></td>
      <td>
        <a href="<?php echo base_url().'index.php/polizas/ver_ventas?id='.$key['id_venta']?>" class="btn btn-default" type="button"><i class="fa fa-check"></i></a>
        <a href="<?php echo base_url().'index.php/polizas/ver_ventas?id='.$key['id_venta']?>" class="btn btn-default" type="button"><i class="fa fa-close"></i></a>
      </td>
    </tr>
    <?php }} ?>
    </tfoot>
  </table>


<!-- #Editar Usuario ############################################################################-->
<?=form_open_multipart(base_url().'index.php/polizas/editar')?>



<script type="text/javascript">
$(document).ready(function(){

    
</script>



