
<?php // print_r($_ci_vars['conceptos']); ?>
<div class="col-lg-12"> <br> </div>
<div class="col-lg-3"></div> 
<div class="col-lg-6"> 
  <div class="box box-primary">
   <div class="box-header with-border">
     <h3 class="box-title">Generar Reporte por coordinador</h3>
   </div>
   <?=form_open_multipart(base_url().'index.php/reportes/diario')?>

   <div class="box-body">
     <div class="row">
       <div class="col-xs-12"><b>Fecha</b></div>
       <div class="col-xs-6">
          <input type="date" name="fecha" id="fecha" class="form-control">
       </div>

       
       <div class="col-lg-12"> <br> </div>
       
       <div class="col-lg-12">      
         <button type="submit" id="pdf" name="pdf" class="btn btn-primary" >Generar</button>
      </div>   
     </div>
   </div>
 </form>
 </div>
 </div>



 <script type="text/javascript">

    $("#pdf").click(function(){
        $('form').attr("target", '_blanck');
    });

</script>