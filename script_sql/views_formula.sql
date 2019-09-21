
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