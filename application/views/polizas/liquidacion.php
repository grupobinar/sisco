<script src="https://cdn.jsdelivr.net/npm/sweetalert2@8"></script>

<div class="col-lg-12"> 
    <div class="col-lg-12"><br></div>
    <div class="col-lg-10"><br></div>
    <div class="col-lg-2"><a href="#" class="btn btn-primary btn-xm" onclick="liquidacion()">
        <b><i class="fa fa-userflash"></i> Ejecutar Liquidacion</b>
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
            <?php for ($i=0; $i < count($_ci_vars); $i++) { ?>
                <?php if ($_ci_vars[$i] <>"") { foreach ($_ci_vars[$i] as $key) { ?>
                    <tr>
                        <td><?php echo ucwords($key['identificacion']);?></td>
                        <td><?php echo ucwords($key['apellidos'].' '.$key['nombres']);?></td>
                        <td><?php echo ucwords($key['telefono']);?></td>
                        <td><?php echo ucwords($key['ventas_totales']);?></td>
                        <td name="semana_id"><?php echo ucwords($key['numero_semana']);?></td>
                        <td><?php echo number_format($key['comision_total'], 2, ',', '.');?></td>
                        <td>
                            <center>
                                <a class="btn btn-sm btn-default detalleVendedor" id="<?php echo $key['cod_vendedor']?>" data-toggle="modal" data-target="#detalleVendedor" title="editar" data-backdrop="static" data-keyboard="false">
                                    <i class="fa fa-pencil"></i>
                                </a>
                            </center>
                        </td>
                    </tr>
                <?php }} ?>
            <?php } ?>
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
                    <th>Plan</th>
                    <th>Suma Asegurada</th>
                    <th>Prima Mensual</th>
                    <th>Comision</th>
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
    function liquidacion(){
        var semana_element = document.getElementsByName('semana_id');
        var semana = [];

        for (let j = 0; j < semana_element.length; j++) {
            semana[j] = semana_element[j].innerText;
            
        }
        
        Swal.fire({
            title: 'Desea liquidar a todos los vendedores de la tabla?',
            text: "Esta accion es irreversible!",
            type: 'info',
            showCancelButton: true,
            confirmButtonColor: '#3085d6',
            cancelButtonColor: '#d33',
            confirmButtonText: 'Si, LIQUIDAR'
        }).then((result) => {
            $.post("<?php echo base_url() ?>/index.php/polizas/liquidacionVendedores", { 
                semana: semana, codigo_vendedor:'vendedores', preliquidacion: 2, estatus_venta: 'P' }, function(data){      
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
        var semana = $(this)[0].parentElement.parentElement.parentElement.querySelector('td[name=semana_id]').innerText;
      
      $.post("<?php echo base_url() ?>/index.php/polizas/liquidacionVendedores", { semana: semana, codigo_vendedor:$(this).attr("id"), estatus_venta:'P' }, function(data){
        ventas_json = JSON.parse(data)
        console.log(data);
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
                td_child5.innerText = ventas_json[0][keys[index]][i].descripcion_plan;
                var td_child6 = document.createElement('td');
                td_child6.innerText = ventas_json[0][keys[index]][i].suma_asegurada.toLocaleString('ve-VE');
                var td_child7 = document.createElement('td');
                //prima_mensual = parseFloat(Math.round(ventas_json[0][keys[index]][i].prima_mensual * 100) / 100).toFixed(2);
                prima_mensual = ventas_json[0][keys[index]][i].prima_mensual;                
                td_child7.innerText = prima_mensual.toLocaleString('ve-VE');
                var td_child8 = document.createElement('td');
                td_child8.innerText = ventas_json[0][keys[index]][i].comision_calculada.toLocaleString('ve-VE');

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