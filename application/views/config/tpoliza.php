<div class="col-lg-12"> <br> </div>
<div class="col-lg-5"> 
  <div class="box box-primary">
   <div class="box-header with-border">
     <h3 class="box-title">Agregar Tipo de poliza</h3>
   </div>

   <?=form_open_multipart(base_url().'index.php/config/guardar_tpoliza')?>

   <div class="box-body">
     <div class="row">
       <div class="col-xs-12"><b>Tipo de Poliza</b></div>
       
       <div class="col-xs-12">
         <input class="form-control" placeholder="Tipo de poliza" name="tpoliza" id="tpoliza" type="text">
       </div>
       
       <div class="col-lg-12"> <br> </div>
       
       <div class="col-lg-12">      
         <button type="submit" class="btn btn-primary">Agregar</button>
      </div>   
     </div>
   </div>
 </div>
 </div>

 <div class="col-lg-6">

<div class="box" style="padding: 10px">

 <div class="col-lg-12"><br></div>
 
 <table id="example1" class="table table-bordered table-striped">
    <thead>
     <tr>
      <th>N°</th>
      <th>Tipo de poliza</th>
      <th>Factor</th>
    </tr>
    </thead>
    <tbody>
    <?php if ($_ci_vars<>"") { foreach ($_ci_vars['tpolizas'] as $key) { ?>
      <tr>
        <td><?php echo $key['id_tpoliza']?></td>
        <td><?php echo $key['tpoliza']?></td>
        <td><?php echo $key['factor']?></td>
      </tr>
    <?php }} ?>
    </tfoot>
  </table>
</div>
</div>
 
 <script type="text/javascript">
  $(document).ready(function(){

  });
</script>