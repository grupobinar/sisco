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
<?php } //print_r($_ci_vars); echo "sfgfdg";?>

<div class="col-lg-12"> <br> </div>
<div class="col-lg-5"> 
  <div class="box box-primary">
   <div class="box-header with-border">
     <h3 class="box-title">Agregar Parentesco</h3>
   </div>
   <?=form_open_multipart(base_url().'index.php/config/guardar_parentesco')?>

   <div class="box-body">
     <div class="row">
       <div class="col-xs-12"><b>Parentesco</b></div>
       <div class="col-xs-12">
         <input class="form-control" placeholder="Parentesco" name="parentesco" id="parentesco" type="text">
       </div>
       
       <div class="col-lg-12"> <br> </div>
       
       <div class="col-lg-12">      
         <button type="submit" class="btn btn-primary" id="guardar">Agregar</button>
      </div>   
     </div>
   </div>
 </div>
 </div>

 <div class="col-lg-6">

<div class="box" style="padding: 10px">

 <div class="col-lg-12"><br></div>
 
 <table id="example1" class="table" >
    <thead>
     <tr>
      <th>N°</th>
      <th>Parentesco</th>
      <th><center><i class="fa fa-cog"></i> Opciones</center></th>
    </tr>
    </thead>
    <tbody>
    <?php if ($_ci_vars<>"") { foreach ($_ci_vars as $key) { ?>
      <tr id="fila_<?php echo $key['id_parentesco']?>">
        <td><?php echo $key['id_parentesco']?></td>
        <td><?php echo $key['parentesco']?></td>
        <td>
        <center>

          <a class="btn btn-sm btn-default desactivar" id="<?php echo $key['id_parentesco']?>" data-toggle="modal" data-target="#Desactivar" href="<?php echo base_url();?>index.php/usuarios/desactivar" title="Eliminar"><i class="fa fa-close"></i></a>

        </center>
      </td>
      </tr>
    <?php }} ?>
    </tfoot>
  </table>
  </div>
</div>

<div class="modal fade" id="Desactivar" role="dialog">
    <div class="modal-dialog">
    
      <!-- Modal content-->
      <div class="modal-content">
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal">&times;</button>
          <h4 class="modal-title"><i class="fa fa-spinner"></i> Eliminar Motivo</h4>
        </div>
        <div class="modal-body">
          <div class="container-fluid">
            <div class="row" id="row_desactivar">
              <div class="col-lg-12">Una vez eliminado el Parentesco no podra utilizarlo ni recuperarlo.</div>
              <div class="col-lg-12">¿Desea continuar?</div>
              <input type="hidden" name="id_desactivar" id="id_desactivar">
            </div>
          </div>
        </div>
        <div class="modal-footer">
          <input type="button" name="btn_desactivar" id="btn_desactivar" class="btn btn-primary" value="Eliminar">
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

     $(".desactivar").click(function() {

      var id=$(this).attr("id");

        $("#id_desactivar").val(id);

    });

   $("#guardar").click(function() {
      if ($("input").val() == "") { alert("Todos los campos son obligatorios"); return false; }
    });

   $('.decimales').on('input', function () { 
        this.value = this.value.replace(/[^0-9\.]/g,'');
    });


    $("#btn_desactivar").click(function() {

      var ide = $("#id_desactivar").val();

      $.post("<?php echo base_url() ?>/index.php/config/eliminarRegistros", { id:$("#id_desactivar").val(), tb: 't_parentesco', id_name:'id_parentesco' }, function(data){

        $("#row_desactivar").html("<div><p class='text-light-blue'>"+data+"</p></div>");

        $("#fila_"+ide).hide();

        $("#btn_desactivar").css("display", "none").delay(1000);


        $("#_desctivar").val("Cerrar");


      });

    });

  });
</script>