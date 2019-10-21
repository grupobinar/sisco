<?php //echo "<pre>"; print_r($_ci_vars); echo "</pre>"; ?>

<!-- #lista de usuarios ############################################################################-->
<div class="col-lg-12"> 
 <div class="col-lg-12"><br></div>
 <div class="col-lg-10"><br></div>
 <div class="col-lg-2"><a href="#" class="btn btn-primary btn-xm" data-toggle="modal" data-target="#myModal"><b><i class="fa fa-user"></i> Agregar Vendedor</b></a></div>
</div>
<div class="col-lg-12"><br></div>


<div class="col-lg-12 box"> 
 <div class="col-lg-12"><br></div>
 <table id="example1" class="table table-bordered table-striped" style="padding: 10px">
    <thead>
     <tr>
      <th>Cedula</th>
      <th>Cod. Vendedor</th>
      <th>Vendedor</th>
      <th>Correo</th>
      <th>Telefono</th>
      <th>Coordinador</th>
      <th><center><i class="fa fa-cog"></i> Opciones</center></th>
    </tr>
    </thead>
    <tbody>
    <?php if ($_ci_vars<>"") { foreach ($_ci_vars as $key) { 
      if($key[estatus]==0) {$clase="fa fa-unlock"; $titulo="Bloquear";}
      elseif($key[estatus]==1) {$clase="fa fa-lock"; $titulo="Desbloquear";}
      ?>
    <tr>
      <td><?php echo strtoupper($key['identificacion']);?></td>
      <td><?php echo strtoupper($key['cod_vendedor']);?></td>
      <td><?php echo ucwords($key['apellidos'].' '.$key['nombres']);?></td>
      <td><?php echo strtolower($key['correo']);?></td>
      <td><?php echo strtoupper($key['telefono']);?></td>
      <td><?php echo ucwords($key['namec'].' '.$key['fnamec']);?></td>
      <td>
        <center>
          <a class="btn btn-sm btn-default editUsuario" id="<?php echo $key['id_vendedor']?>" data-toggle="modal" data-target="#editarUsuario" title="Editar"><i class="fa fa-pencil"></i></a>

          <a class="btn btn-sm btn-default bloquear <?php echo 'estatus_'.$key['estatus']?>" id="<?php echo $key['id_vendedor']?>" title="<?php echo $titulo;?>"><i class="<?php echo $clase;?>"></i></a>
        </center>
      </td>  
    </tr>
    <?php }} ?>
    </tfoot>
  </table>
<!-- #Agregar Usuario ############################################################################-->

<?=form_open_multipart(base_url().'index.php/usuarios/guardar_vendedor')?>
  <div class="modal fade" id="myModal" role="dialog">
    <div class="modal-dialog">
    
      <!-- Modal content-->
      <div class="modal-content">
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal">&times;</button>
          <h4 class="modal-title"><i class="fa fa-user"></i> Agregar Vendedor</h4>
        </div>
        <div class="modal-body">
          <div class="container-fluid">
            <div class="row">

              <div class="col-lg-6"><b>Cedula</b></div>
              <div class="col-lg-6"><b>Cod. vendedor</b></div>
              <div class="col-lg-2">
                <select class="form-control" id="nac" name="nac">
                  <option value="V">V</option>
                  <option value="E">E</option>
                  <option value="J">J</option>
                  <option value="G">G</option>
                </select>
              </div>
              <div class="col-lg-4"><input type="text" name="cedula" id="cedula" class="form-control numero"></div>
              <div class="col-lg-6"><input type="text" name="cod_vendedor" id="cod_vendedor" class="form-control numero"></div>
              <div class="col-lg-12"></div>

              <div class="col-lg-6"><b>Apellidos</b></div>
              <div class="col-lg-6"><b>Nombres</b></div>
              <div class="col-lg-6"><input type="text" name="apellidos" id="apellidos" class="form-control letras"></div>
              <div class="col-lg-6"><input type="text" name="nombres" id="nombres" class="form-control letras"></div>

              <div class="col-lg-6"><b>Correo</b></div>
              <div class="col-lg-6"><b>Telefono</b></div>
              <div class="col-lg-6"><input type="text" name="correo" id="correo" class="form-control mail"></div>
              <div class="col-lg-6"><input type="text" name="telefono" id="telefono" class="form-control numero"></div>
        </div>
        <div class="modal-footer">
          <input type="submit" name="guardar" id="guardar" class="btn btn-primary" value="Guardar Vendedor">
        </div>
      </div>
      
    </div>
  </div>
</div>
</div>
<!-- #Editar Usuario ############################################################################-->
</form>
<?=form_open_multipart(base_url().'index.php/usuarios/editar_vendedor')?>

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

              <div class="col-lg-6"><b>Cedula</b></div>
              <div class="col-lg-6"><b>Cod. vendedor</b></div>
              <div class="col-lg-6"><input type="text" name="cedula_e" id="cedula_e" class="form-control" readonly="">
              </div>
              <div class="col-lg-6"><input type="text" name="cod_vendedor_e" id="cod_vendedor_e" class="form-control numero" readonly=""></div>
              <div class="col-lg-12"></div>

              <div class="col-lg-6"><b>Apellidos</b></div>
              <div class="col-lg-6"><b>Nombres</b></div>
              <div class="col-lg-6"><input type="text" name="apellidos_e" id="apellidos_e" class="form-control letras"></div>
              <div class="col-lg-6"><input type="text" name="nombres_e" id="nombres_e" class="form-control letras"></div>

              <div class="col-lg-6"><b>Correo</b></div>
              <div class="col-lg-6"><b>Telefono</b></div>
              <div class="col-lg-6"><input type="text" name="correo_e" id="correo_e" class="form-control mail"></div>
              <div class="col-lg-6"><input type="text" name="telefono_e" id="telefono_e" class="form-control numero"></div>
               <input type="hidden" name="id_p" id="id_p">
        </div>
        </div>
        <div class="modal-footer">
          <input type="submit" name="editar" id="editar" class="btn btn-primary" value="Modificar Vendedor">
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

    $('.mail').blur('input', function () { 
        if($(".mail").val().indexOf('@', 0) == -1 || $(".mail").val().indexOf('.', 0) == -1) {
            alert('El correo electrónico introducido no es correcto.');
            $('.mail').val("");
            return false;
        }
    });

    $("#guardar").click(function() {
      if ($("#nombres").val() == "") { alert("Todos los campos son obligatorios"); return false; }
      if ($("#apellidos").val() == "") { alert("Todos los campos son obligatorios"); return false; }
      if ($("#cedula").val() == "") { alert("Todos los campos son obligatorios"); return false; }
      if ($("#correo").val() == "") { alert("Todos los campos son obligatorios"); return false; }
      if ($("#cod_vendedor").val() == "") { alert("Todos los campos son obligatorios"); return false; }
    });

    $(".editUsuario").click(function() {
      console.log("aqui");
      $.post("<?php echo base_url() ?>/index.php/usuarios/buscarVendedor", { id:$(this).attr("id") }, function(data){
        
        var result=data.split(':');

        console.log(result);
         

        $("#nombres_e").val(result[1]);

        $("#apellidos_e").val(result[2]);
        $("#cedula_e").val(result[0]);
        $("#correo_e").val(result[3]);
        $("#telefono_e").val(result[4]);
        $("#id_p").val(result[5]);
        $("#cod_vendedor_e").val(result[6]);

        result="";

      });
    });

    $(".bloquear").click(function() {

        var status=confirm("Desea bloquear este usuario?");

        var clase = $(this).attr('class').split(" ");

        var v=0;

        if (clase[4]=="estatus_0") v=1; if(clase[4]=="estatus_1") v=0;

        if (status==true) {

          $.post("<?php echo base_url() ?>/index.php/usuarios/bloquear", { id:$(this).attr("id"), v:v }, function(data){
            alert(data);
          });
        }

        location.reload();
    });
});
</script>

