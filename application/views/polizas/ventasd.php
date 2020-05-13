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
      <th><i class="fa fa-cogs"></i> Opciones</th>
    </tr>
    </thead>
    <tbody>
    <?php if ($_ci_vars[ventas]<>"") { foreach ($_ci_vars[ventas] as $key) { 
      if($key['tventa']==1) $tventa = "Venta de poliza";
      elseif($key['tventa']==2) $tventa = "Adicionales";
      elseif($key['tventa']==3) $tventa = "Actualización de Datos";
    ?>
    <tr class="<?php echo $clase?>">
      <td><?php echo ucwords($key['identificacion']);?></td>
      <td><?php echo ucwords($key['apellidos'].' '.$key['nombres']);?></td>
      <td><?php echo ucwords($tventa);?></td>
      <td><?php if(isset($key['tpoliza'])) echo ucwords($key['tpoliza']); else echo "N/A";?></td>
      <td><?php if(isset($key['tplan'])) echo ucwords($key['tplan']); else echo "N/A";?></td>
<!--       <td><?php // if(isset($key['cobertura'])) echo ucwords($key['cobertura']); else echo "N/A";?></td> -->      
      <td><a href="#" title="<?php echo $key['desde'].' | '.$key['hasta'] ?>"><?php echo ucwords($key['nsem']);?></a></td>
      <td>
        <a href="<?php echo base_url().'index.php/polizas/procesar?id='.$key['id_venta'].'&op=A'?>" title="APROBAR" class="btn btn-default" type="button" id="aprobar"><i class="fa fa-check"></i></a>
        <a href="<?php echo base_url().'index.php/polizas/procesar?id='.$key['id_venta'].'&op=X'?>" title="ANULAR" class="btn btn-default" type="button" id="anular"><i class="fa fa-close"></i></a>
      </td>
    </tr>
    <?php }} ?>
    </tfoot>
  </table>


<!-- #Editar Usuario ############################################################################-->

<script type="text/javascript">
  $(document).ready(function(){

    $("#aprobar").click(function(){

       var confirmacion = confirm("Una vez aprobada la venta, este proceso no se puede revertir, desea aprobar esta venta?");

        return confirmacion;

    });

    $("#anular").click(function(){

       var confirmacion = confirm("Una vez anulada la venta, este proceso no se puede revertir, desea anular esta venta?");

        return confirmacion;

    });

  });    
</script>



