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
      <th>Base de Calculo</th>
      <th>Tasa comisión</th>
      <th>Desde</th>
      <th>Hasta</th>
      <th><center><i class="fa fa-cog"></i> Opciones</center></th>
    </tr>
    </thead>
    <tbody>
    <?php if ($_ci_vars[comisiones]<>"") { foreach ($_ci_vars[comisiones] as $key) { ?>
    <tr id="fila_<?php echo $key['id_comision']?>">
      <td><?php echo ucwords($key['planc']);?></td>
      <td><?php echo ucwords($key['concepto']);?></td>
      <td><?php echo ucwords($key['calculo']);?></td>
      <td><?php if ($key['base']==1) echo "Sobre la suma asegurada"; elseif($key['base']==2) echo "sobre la comisión"; ?></td>
      <td><?php echo number_format($key['cuota'], 2, ',', '.');?></td>
      <td><?php echo $key['min'];?></td>
      <td><?php echo $key['max'];?></td>
      <td>
        <div class="btn-group">
        <center>
          <a class="btn btn-sm btn-default editUsuario" id="<?php echo $key['id_comision']?>" data-toggle="modal" data-target="#editarUsuario"><i class="fa fa-pencil"></i></a>

          <a class="btn btn-sm btn-default desactivar" id="<?php echo $key['id_comision']?>" data-toggle="modal" data-target="#Desactivar" title="Eliminar"><i class="fa fa-close"></i></a>

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
                <select class="form-control" name="concepto" id="concepto">
                  <?php foreach ($_ci_vars[conceptos] as $key) {
                    echo "<option value='".$key[id_concepto]."'>".$key[concepto]."</option>";
                  } ?>
                </select>
              </div>
              <div class="col-lg-6">
                <select class="form-control" name="calculo" id="calculo">
                  <option value=''>--</option>;
                  <?php foreach ($_ci_vars[calculos] as $key) {
                    echo "<option value='".$key[id_calculo]."'>".$key[calculo]."</option>";
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

              <div class="col-lg-6"><b>Base de calculo</b></div>
              <div class="col-lg-3"><b>Desde</b></div>
              <div class="col-lg-3"><b>Hasta</b></div>

              <div class="col-lg-6">
                <select class="form-control" name="id_basec" id="id_basec">
                  <option value="3"> NO APLICA</option>
                  <option value="1"> Sobre la suma asegurada</option>
                  <option value="2"> Sobre la comisión</option>
                </select>
              </div>
              <div class="col-lg-3"><input type="text" name="min" id="min" class="form-control numero"></div>
              <div class="col-lg-3"><input type="text" name="max" id="max" class="form-control numero"></div>
        </div>
        <div class="modal-footer">
          <input type="submit" name="guardar" id="guardar" class="btn btn-primary" value="Guardar Comisión">
        </div>
      </div>
      
    </div>
  </div>
</div>
</div>

</form>
<?=form_open_multipart(base_url().'index.php/config/modificar_comision')?>
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
                <select class="form-control" name="concepto_e" id="concepto_e">
                  <?php foreach ($_ci_vars[conceptos] as $key) {
                    echo "<option value='".$key[id_concepto]."'>".$key[concepto]."</option>";
                  } ?>
                </select>
              </div>
              <div class="col-lg-6">
                <select class="form-control" name="calculo_e" id="calculo_e">
                <option value=''>--</option>
                  <?php foreach ($_ci_vars[calculos] as $key) {
                    echo "<option value='".$key[id_calculo]."'>".$key[calculo]."</option>";
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
              <div class="col-lg-6"><b>Base de calculo</b></div>
              <div class="col-lg-3"><b>Desde</b></div>
              <div class="col-lg-3"><b>Hasta</b></div>

              <div class="col-lg-6">
                <select class="form-control" name="id_basec_e" id="id_basec_e">
                   <option value="3"> NO APLICA</option>
                  <option value="1"> Sobre la suma asegurada</option>
                  <option value="2"> Sobre la comisión</option>
                </select>
              </div>
              
              <div class="col-lg-3"><input type="text" name="min_e" id="min_e" class="form-control numero"></div>
              <div class="col-lg-3"><input type="text" name="max_e" id="max_e" class="form-control numero"></div>
              <input type="hidden" name="id_comision" id="id_comision">

        </div>
        <div class="modal-footer">
          <input type="submit" name="guardar" id="guardar" class="btn btn-primary" value="Guardar Comisión">
        </div>
      </div>
      
    </div>
  </div>
</div>
</div>


<div class="modal fade" id="Desactivar" role="dialog">
    <div class="modal-dialog">
    
      <!-- Modal content-->
      <div class="modal-content">
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal">&times;</button>
          <h4 class="modal-title"><i class="fa fa-spinner"></i> Eliminar Comision</h4>
        </div>
        <div class="modal-body">
          <div class="container-fluid">
            <div class="row" id="row_desactivar">
              <div class="col-lg-12">Una vez eliminado no podra utilizarlo ni recuperarlo.</div>
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
        $("#id_comision").val(result[0]);

        result="";

      });
    });

    $("#calculo_e").change(function(){
        if ($("#calculo_e").val()==2) {
          $("#id_basec_e").html('<option value="3"> NO APLICA</option>'); 
          $("#planc_e option[value='4']").attr('selected', 'selected');
          $('#planc_e option:not(:selected)').attr('disabled',true);

        }else{
          $("#id_basec_e").html('<option value="1"> Sobre la suma asegurada</option><option value="2"> Sobre la comisión</option>'); 
          $('#planc_e option:not(:selected)').attr('disabled',false);
        }
    });
    $("#calculo").change(function(){
        if ($("#calculo").val()==2) {
          $("#id_basec").html('<option value="3"> NO APLICA</option>'); 
          $("#planc option[value='4']").attr('selected', 'selected');
          $('#planc option:not(:selected)').attr('disabled',true);

        }else{
          $("#id_basec").html('<option value="1"> Sobre la suma asegurada</option><option value="2"> Sobre la comisión</option>'); 
          $('#planc option:not(:selected)').attr('disabled',false);

        }
    });

    $(".desactivar").click(function() {

      var id=$(this).attr("id");

        $("#id_desactivar").val(id);

    });

    $("#btn_desactivar").click(function() {

      var ide = $("#id_desactivar").val();

        $.post("<?php echo base_url() ?>/index.php/config/eliminarRegistros", { id:$("#id_desactivar").val(), tb:'t_comisiones', id_name: 'id_comision' }, function(data){
        $("#row_desactivar").html("<div><p class='text-light-blue'>"+data+"</p></div>");

        $("#fila_"+ide).hide();

        $("#btn_desactivar").css("display", "none").delay(1000);


        $("#_desctivar").val("Cerrar");


      });


      });

    });
</script>

