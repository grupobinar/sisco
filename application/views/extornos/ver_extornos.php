<?php?>

<div class="col-lg-12"> 
 <div class="col-lg-12"><br></div>

<div class="col-lg-12 box"> 
 <div class="col-lg-12"><br></div>
 <table id="example1" class="table table-bordered table-striped" style="padding: 10px">
    <thead>
     <tr>
      <th>N° Solicitud</th>
      <th>Monto Comision</th>
      <th>Monto Extornado</th>
      <th>Fraccionado</th>
      <th>Motivo</th>
      <th>Semana</th>
      <th>Cod. Vendedor</th>
      <th>Vendedor</th>
      <th>Telefono</th>
      <th>Estatus</th>
    </tr>
    </thead>
    <tbody>
    <?php if ($_ci_vars<>"") { foreach ($_ci_vars as $key) { ?>
    <tr>
      <td><?php echo ($key['solicitud']);?></td>
      <td><?php echo ($key['comision_liquidada']);?></td>
      <td><?php echo ($key['monto_fraccionado']);?></td>
      <td><?php if($key['cuotas_fraccionar']==1) echo 'No'; else echo 'Si'; ?></td>
      <td><?php echo ($key['motivo']);?></td>
      <td><?php if($key['nsem']!="") echo $key['nsem']; else echo "--"; ?></td>
      <td><?php echo ($key['cod_vendedor']);?></td>
      <td><?php echo ($key['apellidos'].' '.$key['nombres']);?></td>
      <td><?php echo ($key['telefono']);?></td> 
      <td><?php if($key['id_estatus']==0) echo 'Pendiente'; else echo "Cobrado"; ?></td>
    </tr>
    <?php }} ?>
    </tfoot>
  </table>

<script type="text/javascript">
$(document).ready(function(){
});
</script>

