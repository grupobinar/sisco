<?php //print_r($_ci_vars); die(); ?>
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


<div class="col-lg-12"> <br> </div>

<div class="col-lg-4"> 
  <div class="box box-primary">
  
    <div class="box-header with-border">
      <h3 class="box-title">Agregar rol</h3>
    </div>
  
    <?=form_open_multipart(base_url().'index.php/usuarios/guardarRoles')?>

    <div class="box-body">
      <div class="row">
        <div class="col-xs-12"><b>Rol</b></div>
       
        <div class="col-xs-12">
          <input class="form-control" placeholder="Rol" name="rol" id="rol" type="text" required>
        </div>
       
        <div class="col-lg-12"> <br> </div>
        <div class="col-lg-12"><b>Opciones de menú</b></div>
        <div class="col-lg-12"> 
        
          <?php foreach($_ci_vars['opmenu'] as $opmenu){ ?>

            <?php if ($opmenu['id_padre']==0) { ?>
              <div class="checkbox">
                <label>
                  <input type="checkbox" <?= $d ?> value="<?= $opmenu['id_menu'] ?>" name="opciones[]" id="p_<?= $opmenu['id_menu'] ?>">
                    <?= $opmenu['item'] ?>
                </label>
              </div>
            <?php } ?>

            <?php if ($opmenu['hijos']>0) { ?>
            
              <?php foreach($_ci_vars['opmenu'] as $opsubmenu){ ?>
                <?php if ($opmenu['id_menu']==$opsubmenu['id_padre']) { ?>
                                      
                  <div class="checkbox" style="padding-left:20px">
                    <label>
                      <input type="checkbox" class="hijo" value="<?= $opsubmenu['id_menu'] ?>" name="opciones[]" id="<?= $opsubmenu['id_padre'] ?>">
                        <?= $opsubmenu['item'] ?>
                    </label>
                  </div>
                
                <?php } ?> 
              <?php } ?>
            <?php } ?>
          <?php } ?> 
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
            <td id="e_<?= $key['id_rol'] ?>"><?php echo ucwords($key['rol'])?></td>
            <td>
              <center>
                <a class="btn btn-sm btn-default editar" onclick=modal(<?php echo $key['id_rol']?>) data-toggle="modal" data-target="#Editar" title="Editar"><i class="fa fa-edit"></i></a>
                <a class="btn btn-sm btn-default desactivar" id="<?php echo $key['id_rol']?>" data-toggle="modal" data-target="#Desactivar" href="<?php echo base_url();?>index.php/usuarios/desactivar" title="Eliminar"><i class="fa fa-close"></i></a>
              </center>
            </td>
          </tr>
        <?php }} ?>
      </tbody>
    </table>

  </div>
</div>

<div class="modal fade" id="Editar" role="dialog">
    <div class="modal-dialog">
      <!-- Modal content-->
      <div class="modal-content">
        <div class="modal-header">
          <button class="close" data-dismiss="modal">&times;</button>
          <h4 class="modal-title"><i class="fa fa-spinner"></i> Editar Rol </h4>
        </div>
        <div class="modal-body">
          <div class="container-fluid">
            <div class="row" id="row_edita">
              <form method="post" id="edit_menu_rol">
                <div class="col-lg-12">Descripcion del Rol</div>
                <div class="col-xs-12">
                  <input disabled="disabled" required='false' placeholder="Rol" name="rol_edit" id="rol_edit" type="text">
                  <input disabled="disabled" required='false' name="rol_edit_id" id="rol_edit_id" type="hidden">
                </div>
                <div class="col-lg-12"> <br> </div>
                <div class="col-lg-12"><b>Opciones de menú</b></div>
                <div class="col-lg-12">
                  <?php foreach($_ci_vars['opmenu'] as $opmenu){ ?>
                    <?php if ($opmenu['id_padre']==0) { ?>
                      <div class="checkbox">
                        <label>
                          <input type="checkbox" <?= $d ?> value="<?= $opmenu['id_menu'] ?>" name="opciones[]" id="ed_<?= $opmenu['id_menu'] ?>">
                            <?= $opmenu['item'] ?>
                        </label>
                      </div>
                    <?php } ?>

                    <?php if ($opmenu['hijos']>0) { ?>

                      <?php foreach($_ci_vars['opmenu'] as $opsubmenu){ ?>
                        <?php if ($opmenu['id_menu']==$opsubmenu['id_padre']) { ?>
                                              
                          <div class="checkbox" style="padding-left:20px">
                            <label>
                              <input type="checkbox" class="hijo" value="<?= $opsubmenu['id_menu'] ?>" name="opciones[]" id="ed_<?= $opsubmenu['id_menu'] ?>">
                                <?= $opsubmenu['item'] ?>
                            </label>
                          </div>
                        
                        <?php } ?> 
                      <?php } ?>
                    <?php } ?>
                  <?php } ?>
                </div> 
              </form>
            </div>
          </div>
        </div>
        <div class="modal-footer">
          <input name="btn_editar" id="btn_editar" onclick=updateMenuRol() class="btn btn-primary" value="Editar Rol">
          <input class="btn btn-default" data-dismiss="modal" value="Cancelar" id="_editar" name="_editar">
        </div>
      </div>
      <!-- /.modal-content -->
    </div>
    <!-- /.modal-dialog -->
  </div>
</div>

<div class="modal fade" id="Desactivar" role="dialog">
    <div class="modal-dialog">
    
      <!-- Modal content-->
      <div class="modal-content">
        <div class="modal-header">
          <button class="close" data-dismiss="modal">&times;</button>
          <h4 class="modal-title"><i class="fa fa-spinner"></i>Eliminar Rol</h4>
        </div>
        <div class="modal-body">
          <div class="container-fluid">
            <div class="row" id="row_desactivar">
              <div class="col-lg-12">Una vez eliminado el rol no podra utilizarlo ni recuperarlo.</div>
              <div class="col-lg-12">¿Desea continuar?</div>
              <input type="hidden" name="id_desactivar" id="id_desactivar">
            </div>
          </div>
        </div>
        <div class="modal-footer">
          <input name="btn_desactivar" id="btn_desactivar" class="btn btn-primary" value="Eliminar Rol">
          <input class="btn btn-default"  data-dismiss="modal" value="Cancelar" id="_desctivar" name="_desctivar">
        </div>
      </div>
      <!-- /.modal-content -->
    </div>
    <!-- /.modal-dialog -->
  </div>
</div>


 <script type="text/javascript">
  function modal(id_rol) {
    rol_descripcion = document.getElementById('e_'+id_rol);
    rol_edit_input  = document.getElementById('rol_edit');
    rol_edit_id     = document.getElementById('rol_edit_id');
    rol_edit_input.value = rol_descripcion.textContent;
    rol_edit_id.value    = id_rol;
    rol_edit_input.removeAttribute("disabled");
    rol_edit_id.removeAttribute("disabled");
    menu_id = getMenuId(id_rol);
  }

  function getMenuId(id_rol) {
    $.post("<?php echo base_url() ?>/index.php/usuarios/getMenuRol", { id:id_rol }, function(data){
      menu_json = JSON.parse(data);
      for (let index = 0; index < menu_json.length; index++) {
        document.getElementById('ed_'+menu_json[index].id_menu).checked = true;
      }
    });
  }

  $('#Editar').on('hidden.bs.modal', function () {
    //FIXME: desactivar todos los check
  })

  function updateMenuRol(){
    var rol_descripcion = document.getElementById('rol_edit').value;
    var rol_id = document.getElementById('rol_edit_id').value;
    var menu_rol = { 'menu_selected[]' : [], 'rol_descripcion' : rol_descripcion, 'rol_id' : rol_id };
    
    $(":checked").each(function() {
      menu_rol['menu_selected[]'].push($(this).val());
    });

    $.post("<?php echo base_url() ?>/index.php/usuarios/updateRol", menu_rol, function(data){
      data_json = JSON.parse(data);
      $('#Editar').modal('hide');

      Swal.fire({
        title: data_json[0],
        text:  'Click en el boton para cerrar',
        type:  data_json[1],
        confirmButtonText: 'Cerrar'
      }).then((result) => {
        window.location.replace('<?= base_url().'index.php/usuarios/guardarRoles' ?>');
      });

    });
  }

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

      $.post("<?php echo base_url() ?>/index.php/usuarios/eliminarRol", { id:$("#id_desactivar").val() }, function(data){
        data_json = JSON.parse(data);
        $('#Desactivar').modal('hide');

        Swal.fire({
          title: data_json[0],
          text:  'Click en el boton para cerrar',
          type:  data_json[1],
          confirmButtonText: 'Cerrar'
        }).then((result) => {
          if (data_json[1] === 'success') {
            location.reload();
          }
        });
      });

    });
  });
</script>