
<div class="col-lg-12"> 
 <div class="col-lg-12"><br></div>
 <div class="col-lg-11"><br></div>
 <div class="col-lg-1"><a href="<?php echo base_url().'index.php/liquidacion/liquidar'?>" class="btn btn-primary btn-xm preliquidar" title="Ejecutar liquidación" ><b><i class="fa fa-flash"></i> Liquidar</b></a></div>
</div>
<div class="col-lg-12"><br></div>


<div class="col-lg-12 box"> 
 <div class="col-lg-12"><br></div>
 <table id="example1" class="table table-bordered table-striped" style="padding: 10px;">
    <thead>
     <tr>
      <th>Solicitud</th>
      <th>Cedula</th>
      <th>Vendedor</th>
      <th>Telefono</th>
      <th>N° Ventas</th>
      <th>Semana</th>
      <th>Comisión Acumulada</th>
      <th>Comisión Coordinador</th>
      <th><i class="fa fa-cogs"></i> Opciones</th>
    </tr>
    </thead>
    <tbody>
    <?php if ($_ci_vars[ventas]<>"") { foreach ($_ci_vars[ventas] as $key) { ?>
    <tr>
      <td><?php echo ucwords($key['solicitud']);?></td>
      <td><?php echo ucwords($key['identificacion']);?></td>
      <td><?php echo ucwords($key['apellidos'].' '.$key['nombres']);?></td>
      <td><?php echo ucwords($key['telefono']);?></td>
      <td><?php echo ucwords($key['ventas']);?></td>
      <td><a href="#" title="<?php echo $key['desde'].' | '.$key['hasta'] ?>"><?php echo ucwords($key['nsem']);?></a></td>
      <td><?php echo number_format($key['comision'], 2, ',', '.');?></td>
      <td><?php echo number_format($key['comision_c'], 2, ',', '.');?></td>
      <td><a href="<?php echo base_url().'index.php/liquidacion/verl?id='.$key['id_vendedor'].'&sem='.$key['id_semana'].'&x=L'?>" class="btn btn-default" type="button"><i class="fa fa-eye"></i></a></td>
    </tr>
    <?php }} ?>
    </tfoot>
  </table>

  <script type="text/javascript">
  $(document).ready(function(){

    $(".preliquidar").click(function(){

       var confirmacion = confirm("Una vez ejecutada la liquidacion, este proceso no se puede revertir, desea anular esta accion?");

        return confirmacion;

    });

  });    
</script>