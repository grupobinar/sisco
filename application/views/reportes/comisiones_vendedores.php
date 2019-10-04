<script src="https://cdn.jsdelivr.net/npm/sweetalert2@8"></script>

<div class="col-lg-12"><br></div>

<div class="col-lg-12 box"> 
    <div class="col-lg-12"><br></div>
    <table id="example1" class="table table-bordered table-striped" style="padding: 10px;">
        <thead>
            <tr>
                <th>Cedula</th>
                <th>Vendedor</th>
                <th>Correo</th>
                <th>Coordinador</th>
                <th><i class="fa fa-cogs"></i>Acciones</th>
            </tr>
        </thead>
        <tbody>
            <?php if ($_ci_vars <>"") { foreach ($_ci_vars as $key) { ?>
                <tr>
                    <td><?php echo ucwords($key['identificacion']);?></td>
                    <td><?php echo ucwords($key['apellidos'].' '.$key['nombres']);?></td>
                    <td><?php echo ucwords($key['correo']);?></td>
                    <td><?php echo ucwords($key['nombre_coordinador']);?></td>
                    <td>
                        <center>
                            <input type="button" value="Generar Reporte" onclick="window.open('<?php echo base_url() ?>/index.php/reportes/estado_comisiones?id_vendedor=<?php echo $key['id_vendedor'] ?>')" />    
                        </center>
                    </td>
                </tr>
            <?php }} ?>
        </tbody>
    </table>
</div>