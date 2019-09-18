<?php ?>

<!-- #lista de usuarios ############################################################################-->
<div class="col-lg-12"> 
 <div class="col-lg-12"><br></div>
 <div class="col-lg-10"><br></div>
 <div class="col-lg-2"><a href="#" class="btn btn-primary btn-xm" data-toggle="modal" data-target="#myModal"><b><i class="fa fa-user"></i> Nueva Comisión</b></a></div>
</div>
<div class="col-lg-12"><br></div>


<div class="col-lg-12 box"> 
 <div class="col-lg-12"><br></div>
 <table id="example1" class="table table-bordered table-striped" style="padding: 10px;">
    <thead>
     <tr>
      <th>Plan</th>
      <th>Concepto</th>
      <th>Tipo Comisión</th>
      <th>Tasa comisión</th>
      <th>Desde</th>
      <th>Hasta</th>
      <th><center><i class="fa fa-cog"></i> Opciones</center></th>
    </tr>
    </thead>
    <tbody>
    <?php if ($_ci_vars[comisiones]<>"") { foreach ($_ci_vars[comisiones] as $key) { ?>
    <tr>
      <td><?php echo ucwords($key['planc']);?></td>
      <td><?php echo ucwords($key['concepto']);?></td>
      <td><?php echo ucwords($key['calculo']);?></td>
      <td><?php echo number_format($key['cuota'], 2, ',', '.');?></td>
      <td><?php echo $key['min'];?></td>
      <td><?php echo $key['max'];?></td>
      <td>
        <div class="btn-group">
        <center>
          <a class="btn btn-sm btn-default editUsuario" id="<?php echo $key['id_comision']?>" data-toggle="modal" data-target="#editarUsuario" href="<?php echo base_url();?>index.php/usuarios/modificar" title="editar"><i class="fa fa-pencil"></i></a>

          <a class="btn btn-sm btn-default desactivar" id="<?php echo $key['id_comision']?>" data-toggle="modal" data-target="#DesactivarPoliza" href="<?php echo base_url();?>index.php/usuarios/desactivar" title="Eliminar"><i class="fa fa-close"></i></a>

        </center>
        </div>
      </td>  
    </tr>
    <?php }} ?>
    </tfoot>
  </table>
  
<!-- #Agregar Usuario ############################################################################-->

<?=form_open_multipart(base_url().'index.php/config/guardar_comision')?>
  <div class="modal fade" id="myModal" role="dialog">
    <div class="modal-dialog">
    
      <!-- Modal content-->
      <div class="modal-content">
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal">&times;</button>
          <h4 class="modal-title"><i class="fa fa-bank"></i> Agregar Comisión</h4>
        </div>
        <div class="modal-body">
          <div class="container-fluid">
            <div class="row">
              <div class="col-lg-6"><b>Concepto</b></div>
              <div class="col-lg-6"><b>Tipo de calculo</b></div>
              <div class="col-lg-6">
                <select class="form-control" name="calculo" id="calculo">
                  <?php foreach ($_ci_vars[calculos] as $key) {
                    echo "<option value='".$key[id_calculo]."'>".$key[calculo]."</option>";
                  } ?>
                </select>
              </div>
              <div class="col-lg-6">
                <select class="form-control" name="concepto" id="concepto">
                  <?php foreach ($_ci_vars[conceptos] as $key) {
                    echo "<option value='".$key[id_concepto]."'>".$key[concepto]."</option>";
                  } ?>
                </select>
              </div>

              <div class="col-lg-6"><b>Cuota</b></div>
              <div class="col-lg-6"><b>Plan</b></div>
              <div class="col-lg-6"><input type="text" name="cuota" id="cuota" class="form-control decimales"></div>
               <div class="col-lg-6">
                <select class="form-control" name="planc" id="planc">
                  <?php foreach ($_ci_vars[planc] as $key) {
                    echo "<option value='".$key[id_planc]."'>".$key[planc]."</option>";
                  } ?>
                </select>
              </div>

              <div class="col-lg-6"><b>Desde</b></div>
              <div class="col-lg-6"><b>Hasta</b></div>
              <div class="col-lg-6"><input type="text" name="min" id="min" class="form-control numero"></div>
              <div class="col-lg-6"><input type="text" name="max" id="max" class="form-control numero"></div>
        </div>
        <div class="modal-footer">
          <input type="submit" name="guardar" id="guardar" class="btn btn-primary" value="Guardar Comisión">
        </div>
      </div>
      
    </div>
  </div>
</div>
</div>


<?=form_open_multipart(base_url().'index.php/config/guardar_comision')?>
  <div class="modal fade" id="editarUsuario" role="dialog">
    <div class="modal-dialog">
    
      <!-- Modal content-->
      <div class="modal-content">
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal">&times;</button>
          <h4 class="modal-title"><i class="fa fa-bank"></i> Modificar Comisión</h4>
        </div>
        <div class="modal-body">
          <div class="container-fluid">
            <div class="row">
              <div class="col-lg-6"><b>Concepto</b></div>
              <div class="col-lg-6"><b>Tipo de calculo</b></div>
              <div class="col-lg-6">
                <select class="form-control" name="calculo_e" id="calculo_e">
                  <?php foreach ($_ci_vars[calculos] as $key) {
                    echo "<option value='".$key[id_calculo]."'>".$key[calculo]."</option>";
                  } ?>
                </select>
              </div>
              <div class="col-lg-6">
                <select class="form-control" name="concepto_e" id="concepto_e">
                  <?php foreach ($_ci_vars[conceptos] as $key) {
                    echo "<option value='".$key[id_concepto]."'>".$key[concepto]."</option>";
                  } ?>
                </select>
              </div>

              <div class="col-lg-6"><b>Cuota</b></div>
              <div class="col-lg-6"><b>Plan</b></div>
              <div class="col-lg-6"><input type="text" name="cuota_e" id="cuota_e" class="form-control decimales"></div>
              <div class="col-lg-6">
                <select class="form-control" name="planc_e" id="planc_e">
                  <?php foreach ($_ci_vars[planc] as $key) {
                    echo "<option value='".$key[id_planc]."'>".$key[planc]."</option>";
                  } ?>
                </select>
              </div>
              <div class="col-lg-6"><b>Min.</b></div>
              <div class="col-lg-6"><b>Max.</b></div>
              
              <div class="col-lg-6"><input type="text" name="min_e" id="min_e" class="form-control numero"></div>
              <div class="col-lg-6"><input type="text" name="max_e" id="max_e" class="form-control numero"></div>
        </div>
        <div class="modal-footer">
          <input type="submit" name="guardar" id="guardar" class="btn btn-primary" value="Guardar Comisión">
        </div>
      </div>
      
    </div>
  </div>
</div>
</div>

<script type="text/javascript">
$(document).ready(function(){
    $('.numero').on('input', function () { 
        this.value = this.value.replace(/[^0-9]/g,'');
    });

    $('.letras').on('input', function () { 
        this.value = this.value.replace(/[^a-zA-Z ]+$/,'');
    });

    $('.decimales').on('input', function () { 
        this.value = this.value.replace(/[^0-9\.]/g,'');
    });

   

    $("#guardar").click(function() {
      if ($("#cobertura").val() == "") { alert("Todos los campos son obligatorios"); return false; }
      if ($("#suma").val() == "") { alert("Todos los campos son obligatorios"); return false; }
    });

    $(".editUsuario").click(function() {

      $.post("<?php echo base_url() ?>/index.php/config/buscarComision", { id:$(this).attr("id") }, function(data){

        console.log(data);
        
        var result=data.split(':');

        //console.log(result);
        $("#calculo_e option[value='"+result[1]+"']").attr('selected', 'selected');     

        $("#cuota_e").val(result[5]);
        $("#concepto_e option[value='"+result[2]+"']").attr('selected', 'selected');

        $("#min_e").val(result[3]);
        $("#max_e").val(result[4]);

        result="";

      });
    });

    $(".desactivar").click(function() {

      var id=$(this).attr("id");

        $("#id_desactivar").val(id);

    });

    $("#btn_desactivar").click(function() {

      $.post("<?php echo base_url() ?>/index.php/polizas/desactivarPoliza", { id:$("#id_desactivar").val() }, function(data){

        $("#row_desactivar").html("<div><p class='text-light-blue'>"+data+"</p></div>");

        $("#btn_desactivar").css("display", "none").delay(1000);


        $("#_desctivar").val("Cerrar");


      });

    });
});
</script>

