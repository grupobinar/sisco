
<?php // print_r($_ci_vars['conceptos']); ?>
<div class="col-lg-12"> <br> </div>
<div class="col-lg-3"></div> 
<div class="col-lg-6"> 
  <div class="box box-primary">
   <div class="box-header with-border">
     <h3 class="box-title">Extornar venta</h3>
   </div>
   <?=form_open_multipart(base_url().'index.php/extornos/vextornos')?>

   <div class="box-body">
     <div class="row">
       <div class="col-xs-6"><b>cod. vendedor</b></div>
       <div class="col-xs-6"><b>num. semana</b></div>
       
       <div class="col-xs-6">
         <input class="form-control" placeholder="Cod vendedor" name="cod" id="cod" type="text">
       </div>
        <div class="col-xs-6">
         <input class="form-control" placeholder="Num semana" name="sem" id="sem" type="text">
       </div>
       
       <div class="col-lg-12"> <br> </div>
       
       <div class="col-lg-12">      
         <button type="submit" class="btn btn-primary" id="ver">Buscar Ventas</button>
      </div>   
     </div>
   </div>
 </div>
 </div>




 
 <script type="text/javascript">
  $(document).ready(function(){

 
   $("#ver").click(function() {
      if ($("input").val() == "") { alert("Todos los campos son obligatorios"); return false; }
    });

  });
</script>