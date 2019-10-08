
<?php// print_r($_ci_vars); ?>
<div class="col-lg-12"> <br> </div>
<div class="col-lg-12"> 
  <div class="box box-primary" style="padding: 10px">
   <div class="box-body">
     <div class="row">
       <table id="example1" class="table" >
          <thead>
           <tr>
            <th>Tomador</th>
            <th>Cedula</th>
            <th>Tipo de venta</th>
            <th>Tipo de poliza</th>
            <th>S.A</th>
            <th>Cuotas</th>
            <th>Comisión</th>
            <th>Comisión Coordinador</th>
            <th><center><i class="fa fa-cogs"></i> Opciones</center></th>
          </tr>
          </thead>
          <tbody>
          <?php if ($_ci_vars<>"") { foreach ($_ci_vars as $key) { 
            if($key['tventa']==1) $tventa = "Venta de poliza";
            elseif($key['tventa']==2) $tventa = "Adicionales";
            elseif($key['tventa']==3) $tventa = "Actualización de Datos";

            ?>
            <tr>
              <td><?php echo $key['apellidos'].' '.$key['nombres']?></td>
              <td><?php echo $key['identificacion']?></td>
              <td><?php echo $tventa?></td>
              <td><?php if(isset($key['tpoliza'])) echo ucwords($key['tpoliza']); else echo "N/A";?></td>
              <td><?php if(isset($key['suma'])) echo ucwords($key['suma']); else echo "N/A";?></td>
              <td><?php echo $key['cuotas_canceladas']?></td>
              <td><?php echo $key['comision_liquidada']?></td>
              <td><?php echo $key['comision_coordinador']?></td>
              <td>
              <center>

                <a class="btn btn-sm btn-default ventana" id="<?php echo $key['id_venta'].'|'.$key['id_vendedor'].'|'.$key['comision_liquidada'].'|'.$key['cuotas_canceladas']?>" data-toggle="modal" data-target="#Extornar" href="#" title="Extornar"><i class="fa fa-undo"></i></a>

              </center>
            </td>
            </tr>
          <?php }} ?>
          </tfoot>
        </table>
     </div>
   </div>
 </div>
 </div>



<form action="<?php echo base_url().'index.php/extornos/guardar'?>" method="post" accept-charset="utf-8" enctype="multipart/form-data">


 <div class="modal fade" id="Extornar" role="dialog">
    <div class="modal-dialog modal-lg">
    
      <!-- Modal content-->
      <div class="modal-content">
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal">&times;</button>
          <h4 class="modal-title"><i class="fa fa-undo"></i> Extornar comisión</h4>
        </div>
        <div class="modal-body">
          <div class="container-fluid">
            <div class="row">
              <div class="col-lg-3"><b>Comisión cancelada</b></div>
              <div class="col-lg-3"><b>Comisión por cuota</b></div>
              <div class="col-lg-3"><b>Cuotas canceladas <a title="Cuotas canceladas por el tomador">[?]</a></b></div>
              <div class="col-lg-3"><b>Comision no extornable <a title="Comision por cuotas canceladas por el tomador">[?]</a></b></div>

              <div class="col-lg-3"><input type="text" name="comision_cancelada" id="comision_cancelada" class="form-control" readonly=""></div>
              <div class="col-lg-3"><input type="text" name="cuota_comision" id="cuota_comision" class="form-control" readonly=""></div>
              <div class="col-lg-3"><input type="text" name="cuota_cancel" id="cuota_cancel" class="form-control" readonly=""></div>
              <div class="col-lg-3"><input type="text" name="comision_noex" id="comision_noex" class="form-control" readonly=""></div>

              <div class="col-lg-3"><b>Cuotas a extornar</b></div>
              <div class="col-lg-3"><b>Monto a extornar</b></div>
              <div class="col-lg-6"><br></div>

              <div class="col-lg-3"><input type="text" name="c_extornar" id="c_extornar" class="form-control numero"></div>
              <div class="col-lg-3"><input type="text" name="m_extornar" id="m_extornar" class="form-control" readonly=""></div>
              <input type="hidden" name="id_venta" id="id_venta">
              <input type="hidden" name="id_vendedor" id="id_vendedor">
              <div class="col-lg-6 _mensaje"></div>

              <div class="col-lg-12"><b>Motivo</b></div>
              <div class="col-lg-12"><textarea class="form-control" name="motivo" id="motivo"></textarea></div>
              <input type="hidden" name="id_desactivar" id="id_desactivar">
            </div>
          </div>
        </div>
        <div class="modal-footer">
          <input type="submit" name="guardar" id="guardar" class="btn btn-primary" value="Extornar">
          <input type="button" class="btn btn-default"  data-dismiss="modal" value="Cancelar" id="_desctivar" name="_desctivar">
        </div>
      </div>
      <!-- /.modal-content -->
    </div>
  </div>

</form>


 
 <script type="text/javascript">
  $(document).ready(function(){

    var data=0; var cc=0; var ccn=0;

    $(".ventana").click(function(){

      data=$(this).attr("id");
      data = data.split("|");

      cc = data[2]/12;
      ccn = (data[2]/12)*data[3];

      $("#id_vendedor").val(data[1]);
      $("#id_venta").val(data[0]);
      $("#comision_cancelada").val(data[2]);
      $("#cuota_cancel").val(data[3]);
      $("#cuota_comision").val(cc.toFixed(2));
      $("#comision_noex").val(ccn.toFixed(2));

    });

    $("#c_extornar").keyup(function () {

        var monto = $(this).val() * cc;

        var dif_cuota = 12 - $("#cuota_cancel").val();

        if ($(this).val()>dif_cuota) {
          $("#m_extornar").css("color","red");
          $("#c_extornar").css("color","red");
          $("._mensaje").html("<p style='color:red'>La cantidad de cuotas a extornar es mayor a las cuotas pendientes de pago</p>");
        }else{
          $("#m_extornar").css("color","");
          $("#c_extornar").css("color","");
          $("._mensaje").html("");
        }

        if ($(this).val()>12) {
          $("._mensaje").html("<p style='color:red'>La cantidad de cuotas no puede ser mayor a 12</p>");
          $("#c_extornar").val("");
          $("#m_extornar").val("");
        }

        $("#m_extornar").val(monto.toFixed(2));
    });

    $('.numero').on('input', function () { 
        this.value = this.value.replace(/[^0-9]/g,'');
    });
    $("#guardar").click(function () {
      if ($("#monto").val() == "") { alert("Todos los campos son obligatorios"); return false; }
      if ($("#motivo").val() == "") { alert("Todos los campos son obligatorios"); return false; }
    })
    

  });
</script>