<?php //var_dump($_ci_vars); die() ?>

<!-- #lista de usuarios ############################################################################-->
<div class="col-lg-12"> 
    <div class="col-lg-12"><br></div>
    <div class="col-lg-10"><br></div>
    <!--div class="col-lg-2">
        <a href="#" class="btn btn-primary btn-xm" data-toggle="modal" data-target="#myModal">
            <b><i class="fa fa-user"></i> Nueva Semana</b>
        </a>
    </div-->
</div>

<div class="col-lg-12"><br></div>

<div class="col-lg-12 box"> 
    <div class="col-lg-12"><br></div>
        <table id="example1" class="table table-bordered table-striped" style="padding: 10px;">
            <thead>
                <tr>
                    <th>N° Semana del Año</th>
                    <th>Desde</th>
                    <th>Hasta</th>
                    <th>Estatus</th>
                    <th><center><i class="fa fa-cog"></i> Opciones</center></th>
                </tr>
            </thead>
            <tbody>
                <?php if ($_ci_vars[semanas]<>"") { foreach ($_ci_vars[semanas] as $key) { ?>
                    <tr>
                        <td><?php echo ucwords($key['nsem']);?></td>
                        <td><?php echo ucwords($key['desde']);?></td>
                        <td><?php echo ucwords($key['hasta']);?></td>
                        <td><?php if ($key['estatus']==0) echo "Abierta"; elseif($key['estatus']==1) echo "Cerrada"; ?></td>
                        <td>
                            <div class="btn-group">
                                <?php if ($key['estatus']==0) { ?>
                                <a href="<?php echo base_url().'index.php/config/cerrarSemana'; ?>"><i class="fa fa-close"></i></a>
                                <center>
                                    <a class="btn btn-sm btn-default desactivar" id="<?php echo $key['id_semana']?>" title="Cerrar Semana"><i class="fa fa-close"></i></a>

                                    
                                </center>
                                <?php } else { ?>
                                    SIN ACCIONES
                                <?php } ?>
                            </div>
                        </td>  
                    </tr>
                <?php }} ?>
            </tbody>
        </table>
  
        <!-- #Agregar Usuario ############################################################################-->

        <?=form_open_multipart(base_url().'index.php/config/registrarSemana')?>
            <div class="modal fade" id="myModal" role="dialog">
                <div class="modal-dialog">
        
                <!-- Modal content-->
                    <div class="modal-content">
                        <div class="modal-header">
                            <button type="button" class="close" data-dismiss="modal">&times;</button>
                            <h4 class="modal-title"><i class="fa fa-bank"></i> Nueva Semana</h4>
                        </div>
            
                        <div class="modal-body">
                            <div class="container-fluid">
                                <div class="row">                
                                    <div class="col-lg-6">
                                        <b>Desde</b>
                                        <input name="fecha_desde" type="date" class="form-control">
                                    </div>

                                    <div class="col-lg-6">
                                        <b>Hasta</b>
                                        <input name="fecha_hasta" type="date" class="form-control">
                                    </div>

                                    <div class="col-lg-6">
                                        <b>Estatus de la Semana</b>
                                        <select class="form-control" name="id_basec" id="id_basec">
                                            <option value="0">Abierta</option>
                                            <option value="1">Cerrada</option>
                                        </select>
                                    </div>
                                    
                                    <div class="col-lg-6">
                                        <b>Observacion</b>
                                        <input type="text" name="observacion_semana" class="form-control letras">
                                    </div>   
                                </div>
                                
                                <div class="modal-footer">
                                    <input type="submit" name="guardar" id="guardar" class="btn btn-primary" value="Guardar Comisión">
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
    </div>
</div>

<script type="text/javascript">
    $(".desactivar").click(function() {
        semana =  $(this).attr("id");

        $.post("<?php echo base_url() ?>/index.php/config/cerrarSemana", { semana: semana }, function(data){

            console.log(data); 
            alert(data);     

        });
    });

</script>