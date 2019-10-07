<script src="https://cdn.jsdelivr.net/npm/sweetalert2@8"></script>

<div class="col-lg-12"><br></div>

<div class="col-lg-12 box"> 
    <div class="col-lg-12"><br></div>
    <table id="example1" class="table table-bordered table-striped" style="padding: 10px;">
        <thead>
            <tr>
                <th>Semana</th>
                <th>Desde</th>
                <th>Hasta</th>
                <th><i class="fa fa-cogs"></i>Acciones</th>
            </tr>
        </thead>
        <tbody>
            <?php if ($_ci_vars <>"") { foreach ($_ci_vars as $key) { ?>
                <tr>
                    <td><?php echo ucwords($key['nsem']);?></td>
                    <td><?php echo ucwords($key['desde'].' '.$key['nombres']);?></td>
                    <td><?php echo ucwords($key['hasta']);?></td>
                    <td>
                        <center>
                            <input type="button" value="Generar Reporte" onclick="window.open('<?php echo base_url() ?>/index.php/reportes/estado_general?id_semana=<?php echo $key['id_semana'] ?>')" />    
                        </center>
                    </td>
                </tr>
            <?php }} ?>
        </tbody>
    </table>
</div>