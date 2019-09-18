<?php //print_r($_ci_vars);?>

<!-- #lista de usuarios ############################################################################-->
<div class="col-lg-12"> 
 <div class="col-lg-12"><br></div>
 <div class="col-lg-10"><br></div>
 <div class="col-lg-2"><a href="#" class="btn btn-primary btn-xm" data-toggle="modal" data-target="#myModal"><b><i class="fa fa-user"></i> Agregar Usuario</b></a></div>
</div>
<div class="col-lg-12"><br></div>


<div class="col-lg-12 box"> 
 <div class="col-lg-12"><br></div>
 <table id="example2" class="table table-bordered table-striped" style="padding: 10px">
    <thead>
     <tr>
      <th>Cedula</th>
      <th>Apellidos y Nombres</th>
      <th>Usuario</th>
      <th>Correo</th>
      <th>Telefono</th>
      <th>Rol</th>
      <th>Estatus</th>
      <th><center><i class="fa fa-cog"></i> Opciones</center></th>
    </tr>
    </thead>
    <tbody>
    <?php if ($_ci_vars<>"") { foreach ($_ci_vars[usuarios] as $key) { ?>
    <tr>
      <td><?php echo strtoupper($key['identificacion']);?></td>
      <td><?php echo ucwords($key['apellidos'].' '.$key['nombres']);?></td>
      <td><?php echo strtolower($key['username']);?></td>
      <td><?php echo strtolower($key['correo']);?></td>
      <td><?php echo strtoupper($key['telefono']);?></td>
      <td><?php echo ucwords($key['rol']);?></td>  
      <td><?php if ($key['estatus']==0)  echo '<p style="color:green">ACTIVO</p>'; else echo '<p style="color:red">BLOQUEADO</p>'?></td>  
      <td>
        <center>
          <a class="btn btn-sm btn-default editUsuario" id="<?php echo $key['id_persona']?>" data-toggle="modal" data-target="#editarUsuario" href="<?php echo base_url();?>index.php/usuarios/modificar?cta=<?php echo $key['id_persona']?>" title="editar"><i class="fa fa-pencil"></i></a>
        </center>
      </td>  
    </tr>
    <?php }} ?>
    </tfoot>
  </table>
<!-- #Agregar Usuario ############################################################################-->

<?=form_open_multipart(base_url().'index.php/usuarios/guardar')?>
  <div class="modal fade" id="myModal" role="dialog">
    <div class="modal-dialog">
    
      <!-- Modal content-->
      <div class="modal-content">
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal">&times;</button>
          <h4 class="modal-title"><i class="fa fa-user"></i> Agregar Usuario</h4>
        </div>
        <div class="modal-body">
          <div class="container-fluid">
            <div class="row">

              <div class="col-lg-12"><b>Cedula</b></div>
              <div class="col-lg-2">
                <select class="form-control" id="nac" name="nac">
                  <option value="V">V</option>
                  <option value="E">E</option>
                  <option value="J">J</option>
                  <option value="G">G</option>
                </select>
              </div>
              <div class="col-lg-4"><input type="text" name="cedula" id="cedula" class="form-control numero"></div>
              <div class="col-lg-12"></div>

              <div class="col-lg-6"><b>Apellidos</b></div>
              <div class="col-lg-6"><b>Nombres</b></div>
              <div class="col-lg-6"><input type="text" name="apellidos" id="apellidos" class="form-control letras"></div>
              <div class="col-lg-6"><input type="text" name="nombres" id="nombres" class="form-control letras"></div>

              <div class="col-lg-6"><b>Correo</b></div>
              <div class="col-lg-6"><b>Telefono</b></div>
              <div class="col-lg-6"><input type="text" name="correo" id="correo" class="form-control"></div>
              <div class="col-lg-6"><input type="text" name="telefono" id="telefono" class="form-control numero"></div>

              <div class="col-lg-6"><b>Rol</b></div>
              <div class="col-lg-6"><b>Nombre de usuario</b></div>
              <div class="col-lg-6">
                <select class="form-control" id="roles" name="roles">
                  <?php foreach ($_ci_vars[roles] as $key) {
                    echo "<option value='".$key[id_rol]."'>".$key[rol]."</option>";
                  } ?>
                </select>
              </div>
              <div class="col-lg-6"><input type="text" name="username" id="username" class="form-control"></div>

              <div class="col-lg-6"><b>Clave</b></div>
              <div class="col-lg-6"><b>Confirmar Clave</b></div>
              <div class="col-lg-6"><input type="password" name="clave" id="clave" class="form-control"></div>
              <div class="col-lg-6"><input type="password" name="rclave" id="rclave" class="form-control"></div>
        </div>
        <div class="modal-footer">
          <input type="submit" name="guardar" id="guardar" class="btn btn-primary" value="Guardar Usuario">
        </div>
      </div>
      
    </div>
  </div>
</div>
</div>
<!-- #Editar Usuario ############################################################################-->
</form>
<?=form_open_multipart(base_url().'index.php/usuarios/editar')?>

<div class="modal fade" id="editarUsuario">
  <div class="modal-dialog">
      <div class="modal-content">
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal" aria-label="Close">
            <span aria-hidden="true">&times;</span></button>
          <h4 class="modal-title">Editar Usuario</h4>
        </div>
        <div class="modal-body">
              <div class="row">

              <div class="col-lg-12"><b>Cedula</b></div>
              <div class="col-lg-6"><input type="text" name="cedula_e" id="cedula_e" class="form-control" readonly=""></div>
              <div class="col-lg-12"></div>

              <div class="col-lg-6"><b>Apellidos</b></div>
              <div class="col-lg-6"><b>Nombres</b></div>
              <div class="col-lg-6"><input type="text" name="apellidos_e" id="apellidos_e" class="form-control letras"></div>
              <div class="col-lg-6"><input type="text" name="nombres_e" id="nombres_e" class="form-control letras"></div>

              <div class="col-lg-6"><b>Correo</b></div>
              <div class="col-lg-6"><b>Telefono</b></div>
              <div class="col-lg-6"><input type="text" name="correo_e" id="correo_e" class="form-control"></div>
              <div class="col-lg-6"><input type="text" name="telefono_e" id="telefono_e" class="form-control numero"></div>

              <div class="col-lg-6"><b>Rol</b></div>
              <div class="col-lg-6"><b>Nombre de usuario</b></div>
              <div class="col-lg-6">
                <select class="form-control" id="roles_e" name="roles_e">
                  <?php foreach ($_ci_vars[roles] as $key) {
                    echo "<option value='".$key[id_rol]."'>".$key[rol]."</option>";
                  } ?>
                </select>
              </div>
              <div class="col-lg-6"><input type="text" name="username_e" id="username_e" class="form-control" readonly=""></div>

              <input type="hidden" name="id_p" id="id_p">

              <div class="col-lg-12"><b>Estatus</b></div>
              <div class="col-lg-12">
                <select class="form-control" id="estatus_e" name="estatus_e">
                  <option value="0">Activo</option>
                  <option value="1">Bloqueado</option>
                </select>
              </div>
        </div>
        </div>
        <div class="modal-footer">
          <input type="submit" name="editar" id="editar" class="btn btn-primary" value="Modificar Usuario">
        </div>
      </div>
      <!-- /.modal-content -->
    </div>
    <!-- /.modal-dialog -->
  </div>





<script type="text/javascript">
$(document).ready(function(){
    $('.numero').on('input', function () { 
        this.value = this.value.replace(/[^0-9]/g,'');
    });

    $('.letras').on('input', function () { 
        this.value = this.value.replace(/[^a-zA-Z ]+$/,'');
    });

    $("#guardar").click(function() {
      if ($("#nombres").val() == "") { alert("Todos los campos son obligatorios"); return false; }
      if ($("#apellidos").val() == "") { alert("Todos los campos son obligatorios"); return false; }
      if ($("#cedula").val() == "") { alert("Todos los campos son obligatorios"); return false; }
      if ($("#correo").val() == "") { alert("Todos los campos son obligatorios"); return false; }
      if ($("#username").val() == "") { alert("Todos los campos son obligatorios"); return false; }
      if ($("#clave").val() == "") { alert("Todos los campos son obligatorios"); return false; }
      if ($("#rclave").val() == "") { alert("Todos los campos son obligatorios"); return false; }
      if ($("#clave").val() != $("#rclave").val()) { alert("Las claves deben coincidir"); return false; }
    });

    $(".editUsuario").click(function() {
      $.post("<?php echo base_url() ?>/index.php/usuarios/buscarUsuario", { id:$(this).attr("id") }, function(data){
        
        var result=data.split(':');

        console.log(result);

        $("#estatus_e option[value='"+result[7]+"']").attr('selected', 'selected');

         

        $("#nombres_e").val(result[1]);
        $("#roles_e option[value='"+result[6]+"']").attr('selected', 'selected');

        $("#apellidos_e").val(result[2]);
        $("#cedula_e").val(result[0]);
        $("#correo_e").val(result[3]);
        $("#username_e").val(result[5]);
        $("#telefono_e").val(result[4]);
        $("#id_p").val(result[8]);

        result="";

      });
    });
});
</script>

