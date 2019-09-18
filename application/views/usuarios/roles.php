<?php //print_r($_ci_vars) ?>
<div class="col-lg-12"> <br> </div>
<div class="col-lg-4"> 
  <div class="box box-primary">
   <div class="box-header with-border">
     <h3 class="box-title">Agregar rol</h3>
   </div>
   <?=form_open_multipart(base_url().'index.php/config/guardar_tpago')?>

   <div class="box-body">
     <div class="row">
       <div class="col-xs-12"><b>Rol</b></div>
       
       <div class="col-xs-12">
         <input class="form-control" placeholder="Rol" name="rol" id="rol" type="text">
       </div>
       
       <div class="col-lg-12"> <br> </div>
       <div class="col-lg-12"><b>Opciones de menú</b></div>
       <div class="col-lg-12"> 
       <?php foreach($_ci_vars['opmenu'] as $opmenu){ 

                if ($opmenu['id_padre']==0) {
                  echo '
                        <div class="checkbox">
                          <label>
                            <input type="checkbox" '.$d.' value="'.$opmenu['id_menu'].' name="opciones[]" id="p_'.$opmenu['id_menu'].'">
                            '.$opmenu['item'].'
                          </label>
                        </div>
                  ';
                }
                if ($opmenu['hijos']>0) {
                  echo '

                  ';
                  foreach($_ci_vars['opmenu'] as $opsubmenu){ 
                  if ($opmenu['id_menu']==$opsubmenu['id_padre']) {
                  echo '
                        
                        <div class="checkbox" style="padding-left:20px">
                          <label>
                          <input type="checkbox" class="hijo" value="'.$opsubmenu['id_menu'].'" name="opciones[]" id="'.$opsubmenu['id_padre'].'">
                            '.$opsubmenu['item'].'
                          </label>
                        </div>
                  ';
                  }}
                }
       
        } ?> 
        </div>

       <div class="col-lg-12">      
         <button type="submit" class="btn btn-primary">Agregar</button>
      </div>   
     </div>
   </div>
 </div>
 </div>

 <div class="col-lg-8">

<div class="box" style="padding: 10px">

 <div class="col-lg-12"><br></div>
 
 <table id="example1" class="table" >
    <thead>
     <tr>
      <th>N°</th>
      <th>Rol</th>
      <th><center><i class="fa fa-cog"></i> Opciones</center></th>
    </tr>
    </thead>
    <tbody>
    <?php if ($_ci_vars<>"") { foreach ($_ci_vars['roles'] as $key) { ?>
      <tr id="fila_<?php echo $key['id_rol']?>">
        <td><?php echo $key['id_rol']?></td>
        <td><?php echo ucwords($key['rol'])?></td>
        <td>
        <center>

          <a class="btn btn-sm btn-default desactivar" id="<?php echo $key['id_tpago']?>" data-toggle="modal" data-target="#Desactivar" href="<?php echo base_url();?>index.php/usuarios/desactivar" title="Eliminar"><i class="fa fa-close"></i></a>

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
          <h4 class="modal-title"><i class="fa fa-spinner"></i> Eliminar tipo de cobro</h4>
        </div>
        <div class="modal-body">
          <div class="container-fluid">
            <div class="row" id="row_desactivar">
              <div class="col-lg-12">Una vez eliminado el tipo de cobro no podra utilizarlo ni recuperarlo.</div>
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

     $(".desactivar").click(function() {

      var id=$(this).attr("id");

        $("#id_desactivar").val(id);

    });

     $(".hijo").click(function() {

        var id=$(this).attr("id");

        $("#p_"+id).prop("checked", true);
     });






    $("#btn_desactivar").click(function() {

      var ide = $("#id_desactivar").val();

      $.post("<?php echo base_url() ?>/index.php/config/eliminarTpago", { id:$("#id_desactivar").val() }, function(data){

        $("#row_desactivar").html("<div><p class='text-light-blue'>"+data+"</p></div>");

        $("#fila_"+ide).hide();

        $("#btn_desactivar").css("display", "none").delay(1000);


        $("#_desctivar").val("Cerrar");


      });

    });

  });
</script>