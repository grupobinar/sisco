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
      <th>Cedula</th>
      <th>Tomador</th>
      <th>Tipo de Venta</th>
      <th>Tipo Poliza</th>
      <th>Plan</th>
      <th>cobertura</th>
      <th>Semana</th>
      <th>Estatus</th>
      <th><i class="fa fa-cogs"></i> Opciones</th>
    </tr>
    </thead>
    <tbody>
    <?php if ($_ci_vars[ventas]<>"") { foreach ($_ci_vars[ventas] as $key) { 
      if($key['tventa']==1) $tventa = "Venta de poliza";
      elseif($key['tventa']==2) $tventa = "Adicionales";
      elseif($key['tventa']==3) $tventa = "Actualización de Datos";

      if($key['estatus_venta']=="P") {$estatus_venta="Preliquidada"; $clase="";}
      elseif($key['estatus_venta']=="X") {$estatus_venta="Anulada"; $clase="text-red";}
      if($key['estatus_venta']=="A") {$estatus_venta="Activa"; $clase="text-green";}
      if($key['estatus_venta']=="L") {$estatus_venta="Liquidada"; $clase="";}
    ?>
    <tr class="<?php echo $clase?>">
      <td><?php echo ucwords($key['identificacion']);?></td>
      <td><?php echo ucwords($key['apellidos'].' '.$key['nombres']);?></td>
      <td><?php echo ucwords($tventa);?></td>
      <td><?php if(isset($key['tpoliza'])) echo ucwords($key['tpoliza']); else echo "N/A";?></td>
      <td><?php if(isset($key['tplan'])) echo ucwords($key['tplan']); else echo "N/A";?></td>
      <td><?php if(isset($key['cobertura'])) echo ucwords($key['cobertura']); else echo "N/A";?></td>
      <td><a href="#" title="<?php echo $key['desde'].' | '.$key['hasta'] ?>"><?php echo ucwords($key['nsem']);?></a></td>
      <td><?php echo ucwords($estatus_venta);?></td>
      <td><a href="<?php echo base_url().'index.php/polizas/ver_ventas?id='.$key['id_venta']?>" class="btn btn-default" type="button"><i class="fa fa-eye"></i></a></td>
    </tr>
    <?php }} ?>
    </tfoot>
  </table>

<!-- #Agregar Usuario ############################################################################-->


<form action="<?php echo base_url().'index.php/polizas/guardar_venta'?>" method="post" accept-charset="utf-8" enctype="multipart/form-data">
  <div class="modal fade" id="myModal" role="dialog">
    <div class="modal-dialog modal-lg">
    
      <!-- Modal content-->
      <div class="modal-content">
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal">&times;</button>
          <h4 class="modal-title"><i class="fa fa-user"></i> Agregar Venta</h4>
        </div>
        <div class="modal-body">
          <div class="container-fluid">
            <div class="row">
              <div class="col-lg-3"><b>Tipo de venta</b></div>
              <div class="col-lg-9"><b>N° solicitud</b></div>
              <div class="col-lg-3">
                <select class="form-control" name="tventa" id="tventa">
                    <option value="1">Venta de poliza</option>
                    <option value="2">Adicionales</option>
                    <option value="3">Actualización de datos</option>
                </select>
              </div>
              <div class="col-lg-3"><input type="text" name="nsolicitud" id="nsolicitud" class="form-control numero"></div>

              <div class="col-lg-12"><b class="text-blue">Datos del tomador</b></div>
              <div class="_respuesta col-lg-12"></div>
              <div class="col-lg-12"><b>Cedula</b></div>
              <div class="col-lg-3">
                <table>
                  <tr>
                    <td style="width: 50px">
                      <select class="form-control" id="nac" name="nac">
                        <option value="V">V</option>
                        <option value="E">E</option>
                        <option value="J">J</option>
                        <option value="G">G</option>
                      </select>
                    </td>
                    <td>
                      <input type="text" name="cedula" id="cedula" class="form-control numero">
                    </td>
                  </tr>
                </table>
              </div>
              <div class="col-lg-12"></div>

              <div class="col-lg-3"><b>Apellidos</b></div>
              <div class="col-lg-3"><b>Nombres</b></div>
              <div class="col-lg-3"><b>Correo</b></div>
              <div class="col-lg-3"><b>Telefono</b></div>

              <div class="col-lg-3"><input type="text" name="apellidos" id="apellidos" class="form-control letras nm"></div>
              <div class="col-lg-3"><input type="text" name="nombres" id="nombres" class="form-control letras nm"></div>
              <div class="col-lg-3"><input type="text" name="correo" id="correo" class="form-control mail nm"></div>
              <div class="col-lg-3"><input type="text" name="telefono" id="telefono" class="form-control numero nm"></div>

              <div class="col-lg-12"><b class="text-blue">Datos de la poliza</b></div>

              <div class="col-lg-3 esconder ac_datos"><b>Tipo de Poliza</b></div>
              <div class="col-lg-3 esconder ac_datos"><b>Plan</b></div>
              <div class="col-lg-3 esconder ac_datos"><b>Cobertura</b></div>
              <div class="col-lg-3 ac_datos"><b>Ref de pago</b></div>

              <div class="_rpago"></div>

              <div class="col-lg-3 esconder ac_datos">
                <select class="form-control" name="tpoliza" id="tpoliza">
                  <?php foreach ($_ci_vars[tpoliza] as $key) {
                    echo "<option value='".$key[id_tpoliza]."'>".$key[tpoliza]."</option>";
                  } ?>
                </select>
              </div>
              <div class="col-lg-3 esconder ac_datos">
                <select class="form-control" name="plan" id="plan">
                  <option value="">--</option>
                  <?php foreach ($_ci_vars[plan] as $key) {
                    echo "<option value='".$key[id_tplan]."'>".$key[tplan]."</option>";
                  } ?>
                </select>
              </div>
              <div class="col-lg-3 esconder ac_datos">
                <select class="form-control" name="cobertura" id="cobertura"></select>
              </div>
              <div class="col-lg-3 ac_datos"><input type="text" name="rpago" id="rpago" class="form-control"></div>

              <div class="_rpago"></div>

              <div class="col-lg-3 ac_datos"><b>Monto</b></div>
              <div class="col-lg-3 ac_datos"><b>Cuotas Canceladas</b></div>
              <div class="col-lg-3 ac_datos"><b>Tipo de pago</b></div>
              <div class="col-lg-3 "><b>Cod. Vendedor</b></div>

              <div class="col-lg-3 ac_datos"><input type="text" name="monto" id="monto" class="form-control decimales"></div>
              <div class="col-lg-3 ac_datos"><input type="text" name="ccancelada" id="ccancelada" class="form-control numero"></div>
              <div class="col-lg-3 ac_datos">
                <select class="form-control" name="tpago" id="tpago">
                  <?php foreach ($_ci_vars[tpago] as $key) {
                    echo "<option value='".$key[id_tpago]."'>".$key[tpago]."</option>";
                  } ?>
                </select>
              </div>
              <div class="col-lg-3 ">
                 <select class="selectpicker form-control" data-show-subtext="true" data-live-search="true" id="cod_vendedor" name="cod_vendedor">
                  <?php foreach ($_ci_vars[vendedores] as $key) {
                    echo "<option value='".$key[id_vendedor]."' data-subtext='".$key[cod_vendedor]."'>".$key[apellidos].' '.$key[nombres]."</option>";
                  } ?>
               </select> 
            </div>
            <div class="col-lg-12"><br></div>
            <div class="col-lg-10">
              <div class="checkbox">
                  <label>
                      <input type="checkbox" name="adicionales" id="adicionales"> ¿Desea agregar personas adicionales?
                  </label>
              </div>
            </div>
            <div class="col-lg-2 head_adicionales" style="display: none;">
              <button class="btn btn-default" id="btn_add_ad" type="button">Agregar otro</button>
            </div>
            <div class="head_adicionales" style="display: none;">
              <div class="col-lg-3"><b>Cedula</b></div>
              <div class="col-lg-3"><b>Apellidos y nombres</b></div>
              <div class="col-lg-1"><b>Edad</b></div>
              <div class="col-lg-3"><b>Parentesco</b></div>
            </div>
            <div class="add_adicionales">

            </div>

        </div>
        <div class="modal-footer">
          <input type="submit" name="guardar" id="guardar" class="btn btn-primary" value="Guardar Venta">
        </div>
      </div>
      
    </div>
  </div>
</div>
</div>


</form>

<!-- #Editar Usuario ############################################################################-->
<?=form_open_multipart(base_url().'index.php/polizas/editar')?>



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

    $('.mail').blur('input', function () { 
        if($(".mail").val().indexOf('@', 0) == -1 || $(".mail").val().indexOf('.', 0) == -1) {
            alert('El correo electrónico introducido no es correcto.');
            $('.mail').val("");
            return false;
        }
    });

    $("#tventa").change(function(){
      $("._respuesta").html("");
      $("#telefono").val("");
      $("#apellidos").val("");
      $("#nombres").val("");
      $("#correo").val("");
      if ($("#tventa").val()==2) {
        $(".ac_datos").css("display","block");
        $(".esconder").css("display","none");
        $("._rpago").addClass("col-lg-12");
        $(".nm").prop('disabled', true);
        $(".checkbox").css("display","block");

      }else if($("#tventa").val()==3){
        $(".ac_datos").css("display","none");
        $(".checkbox").css("display","none");
        $(".nm").prop('disabled', false);
      }else{
        $(".checkbox").css("display","block");
        $(".ac_datos").css("display","block");
        $(".esconder").css("display","block");
        $("._rpago").removeClass("col-lg-12");
        $(".nm").prop('disabled', false);
      }
    });

    $("#guardar").click(function() {
      if($("#tventa").val()!=3) {
        if ($("#rpago").val() == "") { alert("Todos los campos son obligatorios"); return false; }
        if ($("#ccancelada").val() == "") { alert("Todos los campos son obligatorios"); return false; }
        if ($("#monto").val() == "") { alert("Todos los campos son obligatorios"); return false; }
      }
        if ($("#cedula").val() == "") { alert("Todos los campos son obligatorios"); return false; }
        if ($("#nombres").val() == "") { alert("Todos los campos son obligatorios"); return false; }
        if ($("#apellidos").val() == "") { alert("Todos los campos son obligatorios"); return false; }
        if ($("#telefono").val() == "") { alert("Todos los campos son obligatorios"); return false; }
        if ($("#correo").val() == "") { alert("Todos los campos son obligatorios"); return false; }
        if ($("#nsolicitud").val() == "") { alert("Todos los campos son obligatorios"); return false; }  
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

    var parentesco = <?php echo json_encode($_ci_vars['parentesco']);?>;

     var adicional = '<div><div class="col-lg-3"><table><tr><td style="width: 50px">';
          adicional += '<select class="form-control" id="ad_nac" name="ad_nac[]"><option value="V">V</option><option value="E">E</option><option value="J">J</option><option value="G">G</option></select>';
          adicional += '</td><td>';
          adicional += '<input type="text" name="ad_cedula[]" id="cedula" class="form-control numero">';
          adicional += '</td></tr></table></div>';
          adicional += '<div class="col-lg-3"><input type="text" name="ad_name[]" id="ad_name" class="form-control"></div>';
          adicional += '<div class="col-lg-1"><input type="text" name="adicional_edad[]" id="adicional_edad" class="form-control"></div>';
          adicional += '<div class="col-lg-3"><select id="adicional_parent" name="adicional_parent[]" class="form-control">';
          $.each(parentesco, function (index, value) {
              //console.log(value['parentesco']);
              adicional +='<option value="'+value['id_parentesco']+'">'+value['parentesco']+'</option>';
          });

          adicional += '</select></div><div class="col-lg-2">';
          adicional += '<input type="button" name="del_ad" id="del_ad" class="btn btn-default" value="x"></div>';
          adicional += '<div class="col-lg-12"><br></div></div>';

    $("#adicionales").click(function(){

      if( $('#adicionales').prop('checked') ) {
            $(".head_adicionales").css('display','block');
            $(".add_adicionales").append(adicional);
          }else{
            $(".head_adicionales").css('display','none');
            $(".add_adicionales").html("");
      }
    });

    $("#cedula").blur(function(){
      if ($("#tventa").val()!=1) {

      $.post("<?php echo base_url() ?>/index.php/polizas/buscartomador", { c:$(this).val(), n:$('#nac').val() }, function(data){

        if (data=='false') {

          $("._respuesta").html("<p class='text-red'>Esta persona no posee una poliza adquirida</p>");
          $("#telefono").val("");
          $("#apellidos").val("");
          $("#nombres").val("");
          $("#correo").val("");

        }else{

        $("._respuesta").html("");

        data = data.replace('{', '');
        data = data.replace('}', '');
        data = data.replace(/['"]+/g, '');
        data = data.split(',');

        var d = new Array(); 

        $.each(data, function (index, value) {
          d = value.split(":");
          $("#"+d[0]).val(d[1]);
        });
        }
      });
      }
    });

    $("#btn_add_ad").click(function(){
        $(".add_adicionales").append(adicional);
    });

    //esto no funciona hay que arreglarlo
    /*

    $("#del_ad").click(function(){
      event.preventDefault();
      alert("prueba");
        alert("aqui");
        //$(this).parents('<div>').css('background-color','red');
    });*/


});
</script>



