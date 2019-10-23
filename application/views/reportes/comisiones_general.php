
<?php // print_r($_ci_vars['conceptos']); ?>
<div class="col-lg-12"> <br> </div>
<div class="col-lg-3"></div> 
<div class="col-lg-6"> 
  <div class="box box-primary">
   <div class="box-header with-border">
     <h3 class="box-title">Generar Reporte por coordinador</h3>
   </div>
   <?=form_open_multipart(base_url().'index.php/reportes/porcoordinador')?>

   <div class="box-body">
     <div class="row">
       <div class="col-xs-6"><b>Coordinador</b></div>
       <div class="col-xs-6"><b>Num. semana</b></div>
       
       <div class="col-xs-6">
              <select class="selectpicker form-control" data-show-subtext="true" data-live-search="true" id="cod_vendedor" name="cod_vendedor">
                  <?php foreach ($_ci_vars[coordinadores] as $key) {
                    echo "<option value='".$key[id_persona]."' data-subtext='".$key[username]."'>".$key[apellidos].' '.$key[nombres]."</option>";
                  } ?>
              </select> 
       </div>
       <div class="col-xs-6">
              <select class="selectpicker form-control" data-show-subtext="true" data-live-search="true" id="sem" name="sem">
                  <?php foreach ($_ci_vars[sem] as $key) {
                    echo "<option value='".$key[nsem]."' data-subtext='".$key[nsem]."'>".$key[desde].' - '.$key[hasta]."</option>";
                  } ?>
              </select> 
       </div>

       
       <div class="col-lg-12"> <br> </div>
       
       <div class="col-lg-12">      
         <button type="submit" id="pdf" name="pdf" class="btn btn-primary" >Generar en PDF</button>
         <button type="submit" id="excel" name="excel" class="btn btn-primary" >Generar en Excel</button>
      </div>   
     </div>
   </div>
 </form>
 </div>
 </div>



<input type="hidden" name="ruta_e" id="ruta_e" value="<?php echo base_url().'index.php/rpt_excel/porcoordinador';?>">
<input type="hidden" name="ruta_p" id="ruta_p" value="<?php echo base_url().'index.php/reportes/porcoordinador';?>">

 
 <script type="text/javascript">

    $("#excel").click(function(){
     // alert("aqui");
        $('form').attr("action", $("#ruta_e").val());
        $('form').attr("target", '_blanck');
    });

    $("#pdf").click(function(){
     // alert("aqui");
        $('form').attr("action", $("#ruta_p").val());
        $('form').attr("target", '_blanck');
    });

</script>