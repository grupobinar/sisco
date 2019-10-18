<?php?>

<div class="col-lg-12"> 
 <div class="col-lg-12"><br></div>

<div class="col-lg-12 box"> 
 <div class="col-lg-12"><br></div>
 <table id="example1" class="table table-bordered table-striped" style="padding: 10px">
    <thead>
     <tr>
      <th>N° Solicitud</th>
      <th>Monto</th>
      <th>Observación</th>
      <th>Cod. Vendedor</th>
      <th>Apellidos y Nombres</th>
      <th>Telefono</th>
    </tr>
    </thead>
    <tbody>
    <?php if ($_ci_vars<>"") { foreach ($_ci_vars as $key) { ?>
    <tr>
      <td><?php echo ($key['solicitud']);?></td>
      <td><?php echo ($key['monto_fraccionado']);?></td>
      <td><?php echo ($key['motivo']);?></td>
      <td><?php echo ($key['cod_vendedor']);?></td>
      <td><?php echo ($key['apellidos'].' '.$key['nombres']);?></td>
      <td><?php echo ($key['telefono']);?></td> 
    </tr>
    <?php }} ?>
    </tfoot>
  </table>

<script type="text/javascript">
$(document).ready(function(){
});
</script>

