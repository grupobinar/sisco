<script src="https://cdn.jsdelivr.net/npm/sweetalert2@8"></script>

<div class="col-lg-12"> 
    <div class="col-lg-12"><br></div>
    <div class="col-lg-10"><br></div>
    <div class="col-lg-2"><a href="#" class="btn btn-primary btn-xm" onclick="preliquidacion()">
        <b><i class="fa fa-user"></i> Ejecutar Pre-Liquidacion</b>
    </a></div>
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
                    <td><?php echo ucwords($key['semana']);?></td>
                    <td><?php echo ucwords($key['comision_total']);?></td>
                    <td>
                        <center>
                            <a class="btn btn-sm btn-default detalleVendedor" id="<?php echo $key['cod_vendedor']?>" data-toggle="modal" data-target="#detalleVendedor" title="editar" data-backdrop="static" data-keyboard="false">
                                <i class="fa fa-pencil"></i>
                            </a>
                        </center>
                    </td>
                </tr>
            <?php }} ?>
        </tbody>
    </table>
</div>

<div class="modal fade" id="detalleVendedor">
    <div class="modal-dialog modal-lg" style="width: 90%;">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
                
                <h4 class="modal-title" id="name_vendedor"></h4>
        </div>
        
        <div class="modal-body">
        <table class="table table-responsive table-hover table-bordered table-striped">
            <thead>
                <tr>
                    <th>Tipo de Venta</th>
                    <th>Tomador</th>
                    <th>Poliza</th>
                    <th>Cobertura</th>
                    <th>Suma Asegurada</th>
                    <th>Prima Mensual</th>
                    <th>Comision</th>
                    <th>Acciones</th>
                </tr>
            </thead>
            <tbody id="tablechild">

            </tbody>
        </table>
        </div>
    </div>
    
    <div class="modal-footer"></div>
</div>

<script>

    function anularVenta(vendedor_id, venta_id){
        Swal.fire({
            title: 'Desea anular la venta?',
            text: "Esta accion es irreversible!",
            type: 'info',
            showCancelButton: true,
            confirmButtonColor: '#3085d6',
            cancelButtonColor: '#d33',
            confirmButtonText: 'Si, ANULAR VENTA'
        }).then((result) => {
            $.post("<?php echo base_url() ?>/index.php/polizas/anularVenta", { vendedor_id: vendedor_id, venta_id: venta_id }, function(data){
                mensaje = JSON.parse(data);
                Swal.fire({
                    title: mensaje.mensaje,
                    text:  'Click en el boton para cerrar',
                    type:  mensaje.tipo,
                    confirmButtonText: 'Cerrar'
                }).then((result) => {
                    if (mensaje.tipo === 'success') {
                        location.reload();
                    }
                });
            });
        })
    }

    function preliquidacion(){
        Swal.fire({
            title: 'Desea preliquidar a este vendedor?',
            text: "Esta accion es irreversible!",
            type: 'info',
            showCancelButton: true,
            confirmButtonColor: '#3085d6',
            cancelButtonColor: '#d33',
            confirmButtonText: 'Si, PRELIQUIDAR'
        }).then((result) => {
            $.post("<?php echo base_url() ?>/index.php/polizas/liquidacionVendedores", { 
                semana: 2, codigo_vendedor: 'vendedores', preliquidacion: 1 }, function(data){      
                mensaje = JSON.parse(data);
                Swal.fire({
                    title: mensaje.mensaje,
                    text:  'Click en el boton para cerrar',
                    type:  mensaje.tipo,
                    confirmButtonText: 'Cerrar'
                }).then((result) => {
                    if (mensaje.tipo === 'success') {
                        location.reload();
                    }
                });
            });
        })
    }

    $(".detalleVendedor").click(function() {
      $.post("<?php echo base_url() ?>/index.php/polizas/liquidacionVendedores", { semana: 2, codigo_vendedor:$(this).attr("id") }, function(data){
        ventas_json = JSON.parse(data)
        document.getElementById('name_vendedor').innerText = 'Detalle De Ventas: ' + ventas_json[1];

        var keys = [];
        for(var k in ventas_json[0]) keys.push(k);
        
        var tablechild_body = document.getElementById('tablechild');

        for (let index = 0; index < keys.length; index++) {
            var tr_principal = document.createElement('tr');
            tr_principal.setAttribute('class', 'clickable')
            tr_principal.setAttribute('data-toggle', 'collapse')
            tr_principal.setAttribute('data-target', '.row'+index)
            tr_principal.id = "row"+index

            var td = document.createElement('td');
            var i = document.createElement('i');
            i.setAttribute('class', 'glyphicon glyphicon-plus')

            var texto_clickeable = document.createElement('b');
            texto_clickeable.innerText = ' '+keys[index];

            var td2 = document.createElement('td');
            var td3 = document.createElement('td');
            var td4 = document.createElement('td');
            var td5 = document.createElement('td');
            var td6 = document.createElement('td');
            var td7 = document.createElement('td');
            var td8 = document.createElement('td');

            td.appendChild(i);
            td.appendChild(texto_clickeable);
            tr_principal.appendChild(td);
            tr_principal.appendChild(td2);
            tr_principal.appendChild(td3);
            tr_principal.appendChild(td4);
            tr_principal.appendChild(td5);
            tr_principal.appendChild(td6);
            tr_principal.appendChild(td7);
            tr_principal.appendChild(td8);
            tablechild_body.appendChild(tr_principal);

            var ventas_categoria = ventas_json[0][keys[index]];

            for (let i = 0; i < ventas_categoria.length; i++) {
                var tr_child = document.createElement('tr');
                tr_child.setAttribute('class', 'collapse row'+index);

                var td_child1 = document.createElement('td');
                var td_child2 = document.createElement('td');
                td_child2.innerText = ventas_json[0][keys[index]][i].tomador;
                var td_child3 = document.createElement('td');
                td_child3.innerText = ventas_json[0][keys[index]][i].poliza_descripcion;
                var td_child4 = document.createElement('td');
                td_child4.innerText = ventas_json[0][keys[index]][i].cobertura_descripcion;
                var td_child5 = document.createElement('td');
                td_child5.innerText = ventas_json[0][keys[index]][i].suma_asegurada;
                var td_child6 = document.createElement('td');
                td_child6.innerText = ventas_json[0][keys[index]][i].prima_mensual;
                var td_child7 = document.createElement('td');
                td_child7.innerText = ventas_json[0][keys[index]][i].comision_calculada;

                var td_child8 = document.createElement('td');

                var action_button = document.createElement('a');
                action_button.setAttribute('class', 'btn btn-primary');
                action_button.setAttribute('style', 'float: right;');
                action_button.setAttribute('onclick', "anularVenta("+ventas_json[0][keys[index]][i].id_vendedor+","+ventas_json[0][keys[index]][i].id_venta+");");
                action_button.id = 'anularventa';


                var b_element = document.createElement('b');
                b_element.innerText = 'Anular Venta';
                
                action_button.appendChild(b_element);
                td_child8.appendChild(action_button);

                tr_child.appendChild(td_child1);
                tr_child.appendChild(td_child2);
                tr_child.appendChild(td_child3);
                tr_child.appendChild(td_child4); 
                tr_child.appendChild(td_child5); 
                tr_child.appendChild(td_child6); 
                tr_child.appendChild(td_child7);
                tr_child.appendChild(td_child8);
                tablechild_body.appendChild(tr_child);
            }
        }
      });
    });

    $('#detalleVendedor').on('hidden.bs.modal', function () {
        var e = document.getElementById("tablechild");
        var hijos = e.lastElementChild; 
        
        while (hijos) { 
            e.removeChild(hijos); 
            hijos = e.lastElementChild; 
        } 
    });

</script>