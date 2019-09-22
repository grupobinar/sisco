
CREATE VIEW polizas_plan_coberturas
 AS 
    SELECT 
        a.id_tpoliza as id_poliza,
        b.id_plan as id_plan_poliza,
        b.id_poliza as id_cobertura_poliza,
        a.tpoliza as descripcion_poliza,
        b.cobertura as cobertura_poliza,
        c.tplan as descripcion_plan_poliza,
        a.factor as factor_poliza,
        b.num_poliza as cod_cobertura_poliza,
        b.suma as suma_poliza
    from t_tpoliza as a
        inner join t_polizas as b on a.id_tpoliza = b.id_tpoliza
        inner join t_plan as c on b.id_plan = c.id_tplan
    where b.estatus = 0;


CREATE VIEW vendedores_ventas_detalles
 AS SELECT
    a.id_vendedor as id_vendedor,
    a.cod_vendedor as cod_vendedor,
    b.id_venta as id_venta,
    b.id_poliza as id_cobertura,
    b.id_plan as id_plan,
    b.id_tpoliza as id_poliza,
    b.cuotas_canceladas as cuotas_canceladas,
    b.id_semana as id_semana,
    b.tventa as tipo_venta
    from t_vendedores as a
    inner join t_ventas as b ON a.id_vendedor = b.id_vendedor
    inner join t_polizas as c ON b.id_poliza = c.id_poliza
    inner join t_tpoliza as d ON b.id_tpoliza = d.id_tpoliza
    inner join t_plan as e ON b.id_plan = e.id_tplan
    inner join t_concepto as f ON b.tventa = f.id_concepto;


select * from t_vendedores as a
inner join t_ventas as b ON a.id_vendedor = b.id_vendedor
inner join t_polizas as c ON b.id_poliza = c.id_poliza
inner join t_tpoliza as d ON b.id_tpoliza = d.id_tpoliza
inner join t_plan as e ON b.id_plan = e.id_tplan;