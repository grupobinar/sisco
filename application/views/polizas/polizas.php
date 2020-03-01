<script src="https://cdn.jsdelivr.net/npm/sweetalert2@8"></script>

<script>
  function message(mensaje, tipo){
    Swal.fire(
      mensaje,
      'Click en el boton para cerrar',
      tipo
    );
  }

</script>

<?php if ($this->session->flashdata('message') != '') { ?>
  <script>
    message('<?= $this->session->flashdata('message')[0] ?>', '<?= $this->session->flashdata('message')[1] ?>');
  </script>
<?php } ?>
<!-- #lista de usuarios ############################################################################-->
<div class="col-lg-12"> 
 <div class="col-lg-12"><br></div>
 <div class="col-lg-10"><br></div>
 <div class="col-lg-2"><a href="#" class="btn btn-primary btn-xm" data-toggle="modal" data-target="#myModal"><b><i class="fa fa-user"></i> Agregar Poliza</b></a></div>
</div>
<div class="col-lg-12"><br></div>


<div class="col-lg-12 box"> 
 <div class="col-lg-12"><br></div>
 <table id="example1" class="table table-bordered table-striped" style="padding: 10px;">
    <thead>
     <tr>
      <th>Tipo</th>
      <th>Plan</th>
      <th>Cobertura</th>
      <th>Suma Asegurada</th>
      <th><center><i class="fa fa-cog"></i> Opciones</center></th>
    </tr>
    </thead>
    <tbody>
    <?php if ($_ci_vars[polizas]<>"") { foreach ($_ci_vars[polizas] as $key) { ?>
    <tr id="fila_<?php echo $key['id_poliza']?>">
      <td><?php echo strtoupper($key['tpoliza']);?></td>
      <td><?php echo strtoupper($key['plan']);?></td>
      <td><?php echo ucwords('['.$key['num_poliza'].'] '.$key['cobertura']);?></td>
      <td><?php echo number_format($key['suma'], 2, ',', '.');?></td>
      <td>
        <div class="btn-group">
        <center>
          <a class="btn btn-sm btn-default editUsuario" id="<?php echo $key['id_poliza']?>" data-toggle="modal" data-target="#editarUsuario" href="<?php echo base_url();?>index.php/usuarios/modificar" title="editar"><i class="fa fa-pencil"></i></a>

          <a class="btn btn-sm btn-default desactivar" id="<?php echo $key['id_poliza']?>" data-toggle="modal" data-target="#DesactivarPoliza" href="<?php echo base_url();?>index.php/usuarios/desactivar" title="Eliminar"><i class="fa fa-close"></i></a>

        </center>
        </div>
      </td>  
    </tr>
    <?php }} ?>
    </tfoot>
  </table>
  
<!-- #Agregar Usuario ############################################################################-->

<?=form_open_multipart(base_url().'index.php/polizas/guardar')?>
  <div class="modal fade" id="myModal" role="dialog">
    <div class="modal-dialog">
    
      <!-- Modal content-->
      <div class="modal-content">
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal">&times;</button>
          <h4 class="modal-title"><i class="fa fa-spinner"></i> Agregar Poliza</h4>
        </div>
        <div class="modal-body">
          <div class="container-fluid">
            <div class="row">

              <div class="col-lg-6"><b>Tipo de Poliza</b></div>
              <div class="col-lg-6"><b>Plan</b></div>
              <div class="col-lg-6">
                <select class="form-control" name="tpoliza" id="tpoliza">
                  <?php foreach ($_ci_vars[tpoliza] as $key) {
                    echo "<option value='".$key[id_tpoliza]."'>".$key[tpoliza]."</option>";
                  } ?>
                </select>
              </div>
              <div class="col-lg-6">
                <select class="form-control" name="plan" id="plan">
                  <?php foreach ($_ci_vars[planes] as $key) {
                    echo "<option value='".$key[id_tplan]."'>".$key[tplan]."</option>";
                  } ?>
                </select>
              </div>

              <div class="col-lg-6"><b>Cobertura</b></div>
              <div class="col-lg-6"><b>Suma asegurada</b></div>
              <div class="col-lg-6"><input type="text" name="cobertura" id="cobertura" class="form-control letras"></div>
              <div class="col-lg-6"><input type="text" name="suma" id="suma" class="form-control decimales"></div>

        </div>
        <div class="modal-footer">
          <input type="submit" name="guardar" id="guardar" class="btn btn-primary" value="Guardar Poliza">
        </div>
      </div>
      
    </div>
  </div>
</div>
</div>
<!-- #Editar Usuario ############################################################################-->
</form>
<?=form_open_multipart(base_url().'index.php/polizas/editar')?>

<div class="modal fade" id="editarUsuario" role="dialog">
    <div class="modal-dialog">
    
      <!-- Modal content-->
      <div class="modal-content">
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal">&times;</button>
          <h4 class="modal-title"><i class="fa fa-spinner"></i> Modificar Poliza</h4>
        </div>
        <div class="modal-body">
          <div class="container-fluid">
            <div class="row">

              <div class="col-lg-6"><b>Tipo de Poliza</b></div>
              <div class="col-lg-6"><b>Plan</b></div>
              <div class="col-lg-6">
                <select class="form-control" name="tpoliza_e" id="tpoliza_e">
                  <?php foreach ($_ci_vars[tpoliza] as $key) {
                    echo "<option value='".$key[id_tpoliza]."'>".$key[tpoliza]."</option>";
                  } ?>
                </select>
              </div>
              <div class="col-lg-6">
                <select class="form-control" name="plan_e" id="plan_e">
                  <?php foreach ($_ci_vars[planes] as $key) {
                    echo "<option value='".$key[id_tplan]."'>".$key[tplan]."</option>";
                  } ?>
                </select>
              </div>

              <div class="col-lg-6"><b>Cobertura</b></div>
              <div class="col-lg-6"><b>Suma asegurada</b></div>
              <div class="col-lg-6"><input type="text" name="cobertura_e" id="cobertura_e" class="form-control letras"></div>
              <div class="col-lg-6"><input type="text" name="suma_e" id="suma_e" class="form-control decimales"></div>
              <input type="hidden" name="id_poliza" id="id_poliza">

        </div>
        </div>
        </div>
        <div class="modal-footer">
          <input type="submit" name="editar" id="editar" class="btn btn-primary" value="Modificar Poliza">
        </div>
      </div>
      <!-- /.modal-content -->
    </div>
    <!-- /.modal-dialog -->
  </div>

  <!-- Desactivar poliza ########################################################################################################## -->

  <div class="modal fade" id="DesactivarPoliza" role="dialog">
    <div class="modal-dialog">
    
      <!-- Modal content-->
      <div class="modal-content">
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal">&times;</button>
          <h4 class="modal-title"><i class="fa fa-spinner"></i> Desactivar Poliza</h4>
        </div>
        <div class="modal-body">
          <div class="container-fluid">
            <div class="row" id="row_desactivar">
              <div class="col-lg-12">Una vez eliminada la poliza no podra realizar ventas de la misma.</div>
              <div class="col-lg-12">¿Desea continuar?</div>
              <input type="hidden" name="id_desactivar" id="id_desactivar">
            </div>
          </div>
        </div>
        <div class="modal-footer">
          <input type="button" name="btn_desactivar" id="btn_desactivar" class="btn btn-primary" value="Desactivar Poliza">
          <input type="button" class="btn btn-default"  data-dismiss="modal" value="Cancelar" id="_desctivar" name="_desctivar">
        </div>
      </div>
      <!-- /.modal-content -->
    </div>
    <!-- /.modal-dialog -->
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


      $.post("<?php echo base_url() ?>/index.php/polizas/buscarPoliza", { id:$(this).attr("id") }, function(data){
        
        var result=data.split(':');

        console.log(result);
        $("#tpoliza_e option[value='"+result[1]+"']").attr('selected', 'selected');     

        $("#cobertura_e").val(result[3]);
        $("#plan_e option[value='"+result[2]+"']").attr('selected', 'selected');

        $("#suma_e").val(result[4]);
        $("#id_poliza").val(result[0]);

        result="";

      });
    });

    $(".desactivar").click(function() {

      var id=$(this).attr("id");  
      $("#id_desactivar").val(id);

    });

    $("#btn_desactivar").click(function() {

       var ide = $("#id_desactivar").val();

      $.post("<?php echo base_url() ?>/index.php/polizas/desactivarPoliza", { id:$("#id_desactivar").val() }, function(data){

        $("#row_desactivar").html("<div><p class='text-light-blue'>"+data+"</p></div>");
        $("#fila_"+ide).hide();
        $("#btn_desactivar").css("display", "none").delay(1000);
        $("#_desctivar").val("Cerrar");


      });

    });
});
</script>

