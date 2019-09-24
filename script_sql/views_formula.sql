
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


CREATE OR REPLACE VIEW public.vendedores_ventas_detalles
 AS
 SELECT a.id_vendedor,
    a.cod_vendedor,
    b.id_venta,
    CASE WHEN b.id_poliza IS NULL THEN RPAD(tventa::text, 5, '0') ELSE b.id_poliza::text END AS id_poliza as id_cobertura,
    b.id_plan,
    CASE WHEN b.id_tpoliza IS NULL THEN RPAD(tventa::text, 5, '0') ELSE b.id_tpoliza::text END AS id_poliza,
    b.cuotas_canceladas,
    b.id_semana,
    b.tventa AS tipo_venta
   FROM t_vendedores a
     JOIN t_ventas b ON a.id_vendedor = b.id_vendedor
     LEFT JOIN t_polizas c ON b.id_poliza = c.id_poliza
     LEFT JOIN t_tpoliza d ON b.id_tpoliza = d.id_tpoliza
     LEFT JOIN t_plan e ON b.id_plan = e.id_tplan
     JOIN t_concepto f ON b.tventa = f.id_concepto;

ALTER TABLE public.vendedores_ventas_detalles
    OWNER TO postgres;
