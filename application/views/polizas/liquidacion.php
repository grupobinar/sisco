<div class="col-lg-12"> 
    <div class="col-lg-12"><br></div>
    <div class="col-lg-10"><br></div>
    <div class="col-lg-2"><a href="#" class="btn btn-primary btn-xm" data-toggle="modal" data-target="#liquidacion"><b><i class="fa fa-user"></i> Ejecutar Liquidacion</b></a></div>
</div>

<div class="col-lg-12"><br></div>

<div class="col-lg-12 box"> 
    <div class="col-lg-12"><br></div>
    <table id="example1" class="table table-bordered table-striped" style="padding: 10px;">
        <thead>
            <tr>
                <th>Cedula</th>
                <th>Vendedor</th>
                <th>Telefono</th>
                <th>Ventas</th>
                <th>Semana</th>
                <th>Comision total</th>
                <th><i class="fa fa-cogs"></i> Detalle</th>
            </tr>
        </thead>
        <tbody>
            <?php if ($_ci_vars <>"") { foreach ($_ci_vars as $key) { ?>
                <tr>
                    <td><?php echo ucwords($key['identificacion']);?></td>
                    <td><?php echo ucwords($key['apellidos'].' '.$key['nombres']);?></td>
                    <td><?php echo ucwords($key['telefono']);?></td>
                    <td><?php echo ucwords($key['ventas_totales']);?></td>
                    <td>Numero de la semana abierta</td>
                    <td><?php echo ucwords($key['comision_total']);?></td>
                    <td>
                        <center>
                            <a class="btn btn-sm btn-default detalleVendedor" id="<?php echo $key['id_vendedor']?>" data-toggle="modal" data-target="#detalleVendedor"title="editar"><i class="fa fa-pencil"></i></a>
                        </center>
                    </td>
                </tr>
            <?php }} ?>
        </tbody>
    </table>
</div>

<div class="modal fade" id="detalleVendedor">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
                
                <h4 class="modal-title">Detalle De Ventas</h4>
        </div>
        
        <div class="modal-body">
        <table id="example1" class="table table-bordered table-striped" style="padding: 10px;">
            <thead>
                <tr>
                    <th>Cedula</th>
                    <th>Vendedor</th>
                    <th>Telefono</th>
                    <th>Ventas</th>
                    <th>Semana</th>
                    <th>Comision total</th>
                    <th><i class="fa fa-cogs"></i> Detalle</th>
                </tr>
            </thead>
            <tbody>
                <?php if ($_ci_vars <>"") { foreach ($_ci_vars as $key) { ?>
                    <tr>
                        <td><?php echo ucwords($key['identificacion']);?></td>
                        <td><?php echo ucwords($key['apellidos'].' '.$key['nombres']);?></td>
                        <td><?php echo ucwords($key['telefono']);?></td>
                        <td><?php echo ucwords($key['ventas_totales']);?></td>
                        <td>Numero de la semana abierta</td>
                        <td><?php echo ucwords($key['comision_total']);?></td>
                        <td>
                            <center>
                                <a class="btn btn-sm btn-default detalleVendedor" id="<?php echo $key['id_vendedor']?>" data-toggle="modal" data-target="#detalleVendedor"title="editar"><i class="fa fa-pencil"></i></a>
                            </center>
                        </td>
                    </tr>
                <?php }} ?>
            </tbody>
        </table>
        </div>
    </div>
    
    <div class="modal-footer"></div>
</div>