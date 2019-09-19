<?=form_open_multipart(base_url().'index.php/polizas/guardar_venta')?>
  <div class="modal fade" id="myModal" role="dialog">
    <div class="modal-dialog modal-lg">
    
      <!-- Modal content-->
      <div class="modal-content">
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal">&times;</button>
          <h4 class="modal-title"><i class="fa fa-user"></i> Agregar Poliza</h4>
        </div>
        <div class="modal-body">
          <div class="container-fluid">
            <div class="row">
              <div class="col-lg-3"><b>Tipo de venta</b></div>
              <div class="col-lg-9"><b>N° solicitud</b></div>
              <div class="col-lg-3">
                <select class="form-control" name="tventa" id="tventa">
                    <option value="1">Venta de poliza</option>
                    <option value="2">Adicionales</option>
                    <option value="3">Actualización de datos</option>
                </select>
              </div>
              <div class="col-lg-3"><input type="text" name="nsolicitud" id="nsolicitud" class="form-control numero"></div>

              <div class="col-lg-12"><b class="text-light-blue">Datos del tomador</b></div>
              <div class="col-lg-12"><b>Cedula</b></div>
              <div class="col-lg-1">
                <select class="" id="nac" name="nac">
                  <option value="V">V</option>
                  <option value="E">E</option>
                  <option value="J">J</option>
                  <option value="G">G</option>
                </select>
              </div>
              <div class="col-lg-2"><input type="text" name="cedula" id="cedula" class="form-control numero"></div>
              <div class="col-lg-12"></div>

              <div class="col-lg-3"><b>Apellidos</b></div>
              <div class="col-lg-3"><b>Nombres</b></div>
              <div class="col-lg-3"><b>Correo</b></div>
              <div class="col-lg-3"><b>Telefono</b></div>

              <div class="col-lg-3"><input type="text" name="apellidos" id="apellidos" class="form-control letras"></div>
              <div class="col-lg-3"><input type="text" name="nombres" id="nombres" class="form-control letras"></div>
              <div class="col-lg-3"><input type="text" name="correo" id="correo" class="form-control letras"></div>
              <div class="col-lg-3"><input type="text" name="telefono" id="telefono" class="form-control numero"></div>

              <div class="col-lg-12"><b class="text-light-blue">Datos de la poliza</b></div>

              <div class="col-lg-3 esconder"><b>Tipo de Poliza</b></div>
              <div class="col-lg-3 esconder"><b>Plan</b></div>
              <div class="col-lg-3 esconder"><b>Cobertura</b></div>
              <div class="col-lg-3 _rpago"><b>Ref de pago</b></div>

              <div class="col-lg-3 esconder">
                <select class="form-control" name="tpoliza" id="tpoliza">
                  <?php foreach ($_ci_vars[tpoliza] as $key) {
                    echo "<option value='".$key[id_tpoliza]."'>".$key[tpoliza]."</option>";
                  } ?>
                </select>
              </div>
              <div class="col-lg-3 esconder">
                <select class="form-control" name="plan" id="plan">
                  <option value="">--</option>
                  <?php foreach ($_ci_vars[plan] as $key) {
                    echo "<option value='".$key[id_tplan]."'>".$key[tplan]."</option>";
                  } ?>
                </select>
              </div>
              <div class="col-lg-3 esconder">
                <select class="form-control letras" name="cobertura" id="cobertura"></select>
              </div>
              <div class="col-lg-3 _rpago"><input type="text" name="rpago" id="rpago" class="form-control"></div>

              <div class="col-lg-3"><b>Monto</b></div>
              <div class="col-lg-3"><b>Cuotas Canceladas</b></div>
              <div class="col-lg-3"><b>Tipo de pago</b></div>
              <div class="col-lg-3"><b>Cod. Vendedor</b></div>

              <div class="col-lg-3"><input type="text" name="monto" id="monto" class="form-control decimales"></div>
              <div class="col-lg-3"><input type="text" name="ccancelada" id="ccancelada" class="form-control numero"></div>
              <div class="col-lg-3">
                <select class="form-control" name="tpago" id="tpago">
                  <?php foreach ($_ci_vars[tpago] as $key) {
                    echo "<option value='".$key[id_tpago]."'>".$key[tpago]."</option>";
                  } ?>
                </select>
              </div>
              <div class="col-lg-3">
                 <select class="selectpicker form-control" data-show-subtext="true" data-live-search="true" id="cod_vendedor" name="cod_vendedor">
                  <?php foreach ($_ci_vars[vendedores] as $key) {
                    echo "<option value='".$key[id_vendedores]."' data-subtext='".$key[cod_vendedor]."'>".$key[apellidos].' '.$key[nombres]."</option>";
                  } ?>
               </select> 
            </div>
            <div class="col-lg-12">
              <div class="checkbox">
                  <label>
                      <input type="checkbox" name="adicionales" id="adicionales"> ¿Desea agregar personas adicionales?
                  </label>
              </div>
            </div>
            <div class="col-lg-3"><b>Cedula</b></div>
            <div class="col-lg-3"><b>Apellidos y nombres</b></div>
            <div class="col-lg-3"><b>Edad</b></div>
            <div class="col-lg-3"><b>Parentesco</b></div>
            <div class="add_adicionales">
              <div class="col-lg-1">
                <select class="" id="nac" name="nac">
                  <option value="V">V</option>
                  <option value="E">E</option>
                  <option value="J">J</option>
                  <option value="G">G</option>
                </select>
              </div>
              <div class="col-lg-2"><input type="text" name="cedula" id="cedula" class="form-control numero"></div>
              <div class="col-lg-3">
                <input type="text" name="adicional_name" id="adicional_name" class="form-control">
              </div>
              <div class="col-lg-3">
                <input type="text" name="adicional_edad" id="adicional_edad" class="form-control">
              </div>
              <div class="col-lg-3">
                <input type="text" name="adicional_edad" id="adicional_edad" class="form-control">
              </div>
            </div>

        </div>
        <div class="modal-footer">
          <input type="submit" name="guardar" id="guardar" class="btn btn-primary" value="Guardar Venta">
        </div>
      </div>
      
    </div>
  </div>
</div>
</div>