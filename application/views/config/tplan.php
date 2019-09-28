<div class="col-lg-12"> <br> </div>
<div class="col-lg-5"> 
  <div class="box box-primary">
   <div class="box-header with-border">
     <h3 class="box-title">Agregar Tipo de pago</h3>
   </div>
   <?=form_open_multipart(base_url().'index.php/config/guardar_plan')?>

   <div class="box-body">
     <div class="row">
       <div class="col-xs-12"><b>Agregar nuevo plan</b></div>
       
       <div class="col-xs-12">
         <input class="form-control" placeholder="Plan de poliza" name="plan" id="plan" type="text">
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

 <div class="col-lg-12"><br></div>
 
 <table id="example1" class="table table-bordered table-striped">
    <thead>
     <tr>
      <th>N°</th>
      <th>Tipo de pago</th>
    </tr>
    </thead>
    <tbody>
    <?php if ($_ci_vars<>"") { foreach ($_ci_vars['planes'] as $key) { ?>
      <tr>
        <td><?php echo $key['id_plan']?></td>
        <td><?php echo ucwords($key['plan'])?></td>
      </tr>
    <?php }} ?>
    </tfoot>
  </table>
</div>
 
 <script type="text/javascript">
  $(document).ready(function(){

    $("#guardar").click(function() {
      if ($("input").val() == "") { alert("Todos los campos son obligatorios"); return false; }
    });

   $('.decimales').on('input', function () { 
        this.value = this.value.replace(/[^0-9\.]/g,'');
    });

  });
</script>