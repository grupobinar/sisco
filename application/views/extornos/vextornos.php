
<?php// print_r($_ci_vars); ?>
<div class="col-lg-12"> <br> </div>
<div class="col-lg-12"> 
  <div class="box box-primary" style="padding: 10px">
   <?=form_open_multipart(base_url().'index.php/extornos/extornar')?>

   <div class="box-body">
     <div class="row">
       <table id="example1" class="table" >
          <thead>
           <tr>
            <th>Tomador</th>
            <th>Cedula</th>
            <th>Tipo de venta</th>
            <th>Tipo de poliza</th>
            <th>S.A</th>
            <th>Cuotas</th>
            <th>Comisión</th>
            <th><center><i class="fa fa-cogs"></i> Opciones</center></th>
          </tr>
          </thead>
          <tbody>
          <?php if ($_ci_vars<>"") { foreach ($_ci_vars as $key) { 
            if($key['tventa']==1) $tventa = "Venta de poliza";
            elseif($key['tventa']==2) $tventa = "Adicionales";
            elseif($key['tventa']==3) $tventa = "Actualización de Datos";

            ?>
            <tr>
              <td><?php echo $key['apellidos'].' '.$key['nombres']?></td>
              <td><?php echo $key['identificacion']?></td>
              <td><?php echo $tventa?></td>
              <td><?php if(isset($key['tpoliza'])) echo ucwords($key['tpoliza']); else echo "N/A";?></td>
              <td><?php if(isset($key['suma'])) echo ucwords($key['suma']); else echo "N/A";?></td>
              <td><?php echo $key['cuotas_canceladas']?></td>
              <td><?php echo $key['comision']?></td>
              <td>
              <center>

                <a class="btn btn-sm btn-default" id="<?php echo $key['id_fedad']?>" data-toggle="modal" data-target="#Extornar" href="#" title="Extornar"><i class="fa fa-undo"></i></a>

              </center>
            </td>
            </tr>
          <?php }} ?>
          </tfoot>
        </table>
     </div>
   </div>
 </div>
 </div>





 <div class="modal fade" id="Extornar" role="dialog">
    <div class="modal-dialog">
    
      <!-- Modal content-->
      <div class="modal-content">
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal">&times;</button>
          <h4 class="modal-title"><i class="fa fa-undo"></i> Extornar comisión</h4>
        </div>
        <div class="modal-body">
          <div class="container-fluid">
            <div class="row">
              <div class="col-lg-12"></div>
              <div class="col-lg-12"></div>
              <input type="hidden" name="id_desactivar" id="id_desactivar">
            </div>
          </div>
        </div>
        <div class="modal-footer">
          <input type="button" name="btn_desactivar" id="btn_desactivar" class="btn btn-primary" value="Extornar">
          <input type="button" class="btn btn-default"  data-dismiss="modal" value="Cancelar" id="_desctivar" name="_desctivar">
        </div>
      </div>
      <!-- /.modal-content -->
    </div>




 
 <script type="text/javascript">
  $(document).ready(function(){

 
   $("#ver").click(function() {
      if ($("input").val() == "") { alert("Todos los campos son obligatorios"); return false; }
    });

  });
</script>