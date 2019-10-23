
<?php // print_r($_ci_vars); ?>
<div class="col-lg-12"> <br> </div>
<div class="col-lg-3"></div> 
<div class="col-lg-6"> 
  <div class="box box-primary">
   <div class="box-header with-border">
     <h3 class="box-title">Generar Reporte Estadisticas</h3>
   </div>
   <?=form_open_multipart(base_url().'index.php/reportes/metricas')?>

   <div class="box-body">
     <div class="row">
       <div class="col-xs-6"><b>Coordinador:</b></div>
       <div class="col-lg-12"></div>
       <div class="col-xs-6">
              <select class="selectpicker form-control" data-show-subtext="true" data-live-search="true" id="coo" name="coo">
                  <?php foreach ($_ci_vars[coordinadores] as $key) {
                    echo "<option value='".$key[id_user]."' data-subtext='".$key[username]."'>".$key[apellidos].' '.$key[nombres]."</option>";
                  } ?>
              </select> 
       </div>
       <div class="col-lg-12"></div>
       <div class="col-xs-6"><b>Desde</b></div>
       <div class="col-xs-6"><b>Hasta</b></div>
       <div class="col-xs-6">
              <select class="selectpicker form-control" data-show-subtext="true" data-live-search="true" id="desde" name="desde">
                  <?php foreach ($_ci_vars[sem] as $key) {
                    echo "<option value='".$key[nsem]."' data-subtext='".$key[nsem]."'>".$key[desde].' - '.$key[hasta]."</option>";
                  } ?>
              </select> 
       </div>
       <div class="col-xs-6">
              <select class="selectpicker form-control" data-show-subtext="true" data-live-search="true" id="hasta" name="hasta">
                  <?php foreach ($_ci_vars[sem] as $key) {
                    echo "<option value='".$key[nsem]."' data-subtext='".$key[nsem]."'>".$key[desde].' - '.$key[hasta]."</option>";
                  } ?>
              </select> 
       </div>
       
       <div class="col-lg-12"> <br> </div>
       
       <div class="col-lg-12">      
         <button type="submit" class="btn btn-primary" id="ver">Generar</button>
      </div>   
     </div>
   </div>
 </form>
 </div>
 </div>




 
 <script type="text/javascript">
  $(document).ready(function(){

  });
</script>