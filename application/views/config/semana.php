<?php //var_dump($_ci_vars); die() ?>
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@8"></script>

<script>
  function message(mensaje, tipo){
    Swal.fire(
      mensaje,
      'Click en el boton para cerrar',
      tipo
    );
  }

</script>

<?php if ($this->session->flashdata('message') != '') { ?>
  <script>
    message('<?= $this->session->flashdata('message')[0] ?>', '<?= $this->session->flashdata('message')[1] ?>');
  </script>
<?php } ?>

<!-- #lista de usuarios ############################################################################-->
<div class="col-lg-12"> 
    <div class="col-lg-12"><br></div>
    <div class="col-lg-10"><br></div>
</div>

<div class="col-lg-12"><br></div>

<div class="col-lg-12 box"> 
    <div class="col-lg-12"><br></div>
        <table id="example1" class="table table-bordered table-striped" style="padding: 10px;">
            <thead>
                <tr>
                    <th>Semana del Año</th>
                    <th>Desde</th>
                    <th>Hasta</th>
                    <th>Estatus</th>
                    <th><center><i class="fa fa-cog"></i> Opciones</center></th>
                </tr>
            </thead>
            <tbody>
                <?php $i=0; if ($_ci_vars[semanas]<>"") { foreach ($_ci_vars[semanas] as $key) {
                    $cant=count($_ci_vars[semanas]); $i++;
                 ?>
                    <tr>
                        <td><?php echo ucwords($key['nsem']);?></td>
                        <td><?php echo ucwords($key['desde']);?></td>
                        <td><?php echo ucwords($key['hasta']);?></td>
                        <td><?php if ($key['estatus']==0) echo "Abierta"; elseif($key['estatus']==1) echo "Cerrada"; elseif($key['estatus']==2) echo "Reabierta"; ?></td>
                        <td>
                            <div class="btn-group">
                                <?php if ($key['estatus']!=1) { ?>
                                <center>
                                    <a class="btn btn-sm btn-default desactivar" id="<?php echo $key['id_semana']?>" title="Cerrar Semana"><i class="fa fa-close"></i></a>  
                                </center>
                                <?php } elseif(($key['estatus']==1) && ($i==$cant-1)) { ?>
                                <center>
                                    <a class="btn btn-sm btn-default reabrir" id="<?php echo $key['id_semana']?>" title="Reabrir semana"><i class="fa fa-folder-open"></i></a>  
                                </center>
                                <?php } ?>
                            </div>
                        </td>  
                    </tr>
                <?php }} ?>
            </tbody>
        </table>
  
        <!-- #Agregar Usuario ############################################################################-->

        

<script type="text/javascript">
    $(".desactivar").click(function() {
        semana =  $(this).attr("id");
        var confirmacion=confirm("Recuerde que al cerrar la semana no podran ser cargadas ventas en la misma. Desea continuar?");
        if (confirmacion==true) {
        $.post("<?php echo base_url() ?>/index.php/config/cerrarSemana", { semana: semana }, function(data){

            console.log(data);

            alert(data);     
            location.reload(); 

        });
        }else{
            alert("Operacion Cancelada");
        }
    });

    $(".reabrir").click(function() {
        semana =  $(this).attr("id");
        var confirmacion=confirm("Recuerde que solo puede tener una semana abierta, al ejecutar esta accion se cerrara la semana que se encuentre abierta. Desea continuar?");
        if (confirmacion==true) {
        $.post("<?php echo base_url() ?>/index.php/config/reabrirSemana", { semana: semana }, function(data){

            alert(data);     
            location.reload(); 

        });
        }else{
            alert("Operacion Cancelada");
        }
    });

</script>