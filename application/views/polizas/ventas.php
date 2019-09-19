<?php //echo "<pre>"; print_r($_ci_vars); echo "</pre>";?>

<!-- #lista de usuarios ############################################################################-->
<div class="col-lg-12"> 
 <div class="col-lg-12"><br></div>
 <div class="col-lg-10"><br></div>
 <div class="col-lg-2"><a href="#" class="btn btn-primary btn-xm" data-toggle="modal" data-target="#myModal"><b><i class="fa fa-user"></i> Agregar Venta</b></a></div>
</div>
<div class="col-lg-12"><br></div>


<div class="col-lg-12 box"> 
 <div class="col-lg-12"><br></div>
 <table id="example1" class="table table-bordered table-striped" style="padding: 10px;">
    <thead>
     <tr>
      <th>Tomador</th>
      <th>Tipo Poliza</th>
      <th>Plan</th>
      <th>cobertura</th>
      <th>Ref. pago</th>
      <th>Monto</th>
      <th>Cuotas canceladas</th>
      <th>Tipo de pago</th>
      <th>Fecha</th>
    </tr>
    </thead>
    <tbody>
    <?php if ($_ci_vars[ventas]<>"") { foreach ($_ci_vars[ventas] as $key) { ?>
    <tr>
      <td><?php echo ucwords($key['apellidos'].' '.$key['nombres']);?></td>
      <td><?php echo ucwords($key['tpoliza']);?></td>
      <td><?php echo ucwords($key['tplan']);?></td>
      <td><?php echo ucwords($key['cobertura']);?></td>
      <td><?php echo ucwords($key['referencia_pago']);?></td>
      <td><?php echo number_format($key['monto'], 2, ',', '.');?></td>
      <td><?php echo ucwords($key['cuotas_canceladas']);?></td>
      <td><?php echo ucwords($key['tpago']);?></td>
      <td><?php echo ucwords($key['fecha_registro']);?></td>
    </tr>
    <?php }} ?>
    </tfoot>
  </table>

  
<!-- #Agregar Usuario ############################################################################-->

<?=form_open_multipart(base_url().'index.php/polizas/guardar_venta')?>
  <div class="modal fade" id="myModal" role="dialog">
    <div class="modal-dialog">
    
      <!-- Modal content-->
      <div class="modal-content">
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal">&times;</button>
          <h4 class="modal-title"><i class="fa fa-user"></i> Agregar Poliza</h4>
        </div>
        <div class="modal-body">
          <div class="container-fluid">
            <div class="row">
              <div class="col-lg-12"><b>Tipo de venta</b></div>
              <div class="col-lg-6">
                <select class="form-control" name="tventa" id="tventa">
                    <option value="1">Venta de poliza</option>
                    <option value="2">Adicionales</option>
                    <option value="3">Actualización de datos</option>
                </select>
              </div>
              <div class="col-lg-12"><b class="text-light-blue">Datos del tomador</b></div>
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
              <div class="col-lg-6"><input type="text" name="correo" id="correo" class="form-control letras"></div>
              <div class="col-lg-6"><input type="text" name="telefono" id="telefono" class="form-control numero"></div>

              <div class="col-lg-12"><b class="text-light-blue">Datos de la poliza</b></div>

              <div class="col-lg-6 esconder"><b>Tipo de Poliza</b></div>
              <div class="col-lg-6 esconder"><b>Plan</b></div>
              <div class="col-lg-6 esconder">
                <select class="form-control" name="tpoliza" id="tpoliza">
                  <?php foreach ($_ci_vars[tpoliza] as $key) {
                    echo "<option value='".$key[id_tpoliza]."'>".$key[tpoliza]."</option>";
                  } ?>
                </select>
              </div>
              <div class="col-lg-6 esconder">
                <select class="form-control" name="plan" id="plan">
                  <option value="">--</option>
                  <?php foreach ($_ci_vars[plan] as $key) {
                    echo "<option value='".$key[id_tplan]."'>".$key[tplan]."</option>";
                  } ?>
                </select>
              </div>

              <div class="col-lg-6 esconder"><b>Cobertura</b></div>
              <div class="col-lg-6 _rpago"><b>Ref de pago</b></div>
              <div class="col-lg-6 esconder">
                <select class="form-control letras" name="cobertura" id="cobertura">
                  
                </select>
              </div>
              <div class="col-lg-6 _rpago"><input type="text" name="rpago" id="rpago" class="form-control"></div>
              <div class="col-lg-6"><b>Monto</b></div>
              <div class="col-lg-6"><b>Cuotas Canceladas</b></div>
              <div class="col-lg-6"><input type="text" name="monto" id="monto" class="form-control decimales"></div>
              <div class="col-lg-6"><input type="text" name="ccancelada" id="ccancelada" class="form-control numero"></div>

              <div class="col-lg-6"><b>Tipo de pago</b></div>
              <div class="col-lg-6"><b>Cod. Vendedor</b></div>
              <div class="col-lg-6">
                <select class="form-control" name="tpago" id="tpago">
                  <?php foreach ($_ci_vars[tpago] as $key) {
                    echo "<option value='".$key[id_tpago]."'>".$key[tpago]."</option>";
                  } ?>
                </select>
              </div>
              <div class="col-lg-6">
                 <select class="selectpicker" data-show-subtext="true" data-live-search="true" id="cod_vendedor" name="cod_vendedor">
                  <?php foreach ($_ci_vars[vendedores] as $key) {
                    echo "<option value='".$key[id_vendedores]."' data-subtext='".$key[cod_vendedor]."'>".$key[apellidos].' '.$key[nombres]."</option>";
                  } ?>
               </select> 
<!--                <input type="text" name="cod_vendedor" id="cod_vendedor" class="form-control numero">
 -->              </div>

        </div>
        <div class="modal-footer">
          <input type="submit" name="guardar" id="guardar" class="btn btn-primary" value="Guardar Venta">
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
          <h4 class="modal-title"><i class="fa fa-user"></i> Modificar Poliza</h4>
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
                  <?php foreach ($_ci_vars[plan] as $key) {
                    echo "<option value='".$key[id_tplan]."'>".$key[tplan]."</option>";
                  } ?>
                </select>
              </div>

              <div class="col-lg-6"><b>Cobertura</b></div>
              <div class="col-lg-6"><b>Ref de pago</b></div>
              <div class="col-lg-6">
                <select class="form-control letras" name="cobertura" id="cobertura">
                  
                </select>
              </div>
              <div class="col-lg-6"><input type="text" name="rpago" id="rpago" class="form-control letras"></div>

              <div class="col-lg-6"><b>Monto</b></div>
              <div class="col-lg-6"><b>Cuotas Canceladas</b></div>
              <div class="col-lg-6"><input type="text" name="monto" id="monto" class="form-control decimales"></div>
              <div class="col-lg-6"><input type="text" name="ccancelada" id="ccancelada" class="form-control numero"></div>

              <div class="col-lg-12"><b>Tipo de pago</b></div>
              <div class="col-lg-6">
                <select class="form-control" name="tpago" id="tpago">
                  <?php foreach ($_ci_vars[tpago] as $key) {
                    echo "<option value='".$key[id_tpago]."'>".$key[tpago]."</option>";
                  } ?>
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

    $("#tventa").click(function(){
      if ($("#tventa").val()==2) {
        $(".esconder").css("display","none");
        $("._rpago").removeClass("col-lg-6");
        $("._rpago").addClass("col-lg-12");

      }else{
        $(".esconder").css("display","block");
        $("._rpago").removeClass("col-lg-12");
        $("._rpago").addClass("col-lg-6");
      }
    });

   

    $("#guardar").click(function() {
      if ($("#cobertura").val() == "") { alert("Todos los campos son obligatorios"); return false; }
      if ($("#suma").val() == "") { alert("Todos los campos son obligatorios"); return false; }
    });

    $("#plan").change(function() {
      $("#cobertura").html("");
        $.post("<?php echo base_url() ?>/index.php/polizas/buscarCobertura", { plan:$("#plan").val(), tpoliza:$("#tpoliza").val()}, function(data){
            var r=data.split('|');
            $.each(r, function (index, value) {
              var v=value.split(':');
              if (v!="") {
                $("#cobertura").html($("#cobertura").html()+'<option value="'+v[0]+'">'+v[2]+'-'+v[1]+'</option>');
              }
            });
        });

    });

    $(".editUsuario").click(function() {


      $.post("<?php echo base_url() ?>/index.php/polizas/buscarVenta", { id:$(this).attr("id") }, function(data){
        
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
});
</script>

