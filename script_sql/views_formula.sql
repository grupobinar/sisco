-- View: public.vendedores_ventas_detalles

-- DROP VIEW public.vendedores_ventas_detalles;

CREATE OR REPLACE VIEW public.vendedores_ventas_detalles
 AS
 SELECT a.id_vendedor,
    a.cod_vendedor,
    b.id_venta,
        CASE
            WHEN b.id_poliza IS NULL THEN rpad(b.tventa::text, 5, '0'::text)
            ELSE b.id_poliza::text
        END AS id_cobertura,
    b.id_plan,
        CASE
            WHEN b.id_tpoliza IS NULL THEN rpad(b.tventa::text, 5, '0'::text)
            ELSE b.id_tpoliza::text
        END AS id_poliza,
    b.cuotas_canceladas,
    b.id_semana,
    b.tventa AS tipo_venta,
    f.concepto AS concepto_venta,
    (((g.identificacion::text || ' '::text) || g.nombres::text) || ' '::text) || g.apellidos::text AS tomador,
        CASE
            WHEN d.tpoliza IS NULL THEN 'NO APLICA'::character varying
            ELSE d.tpoliza
        END AS poliza_descripcion,
        CASE
            WHEN c.cobertura IS NULL THEN 'NO APLICA'::character varying
            ELSE c.cobertura
        END AS cobertura_descripcion,
    (a.nombres::text || ' '::text) || a.apellidos::text AS vendedor_data,
    b.estatus_venta,
    f.id_concepto AS id_concepto_venta,
    g.identificacion AS tomador_cedula,
    (g.nombres::text || ' '::text) || g.apellidos::text AS tomador_nombre,
    e.tplan AS descripcion_plan,
    c.suma AS suma_asegurada,
    a.id_coordinador
   FROM t_vendedores a
     JOIN t_ventas b ON a.id_vendedor = b.id_vendedor
     LEFT JOIN t_polizas c ON b.id_poliza = c.id_poliza
     LEFT JOIN t_tpoliza d ON b.id_tpoliza = d.id_tpoliza
     LEFT JOIN t_plan e ON b.id_plan = e.id_tplan
     JOIN t_concepto f ON b.tventa = f.id_concepto
     JOIN t_tomadores g ON b.id_tomador = g.id_tomador;

ALTER TABLE public.vendedores_ventas_detalles
    OWNER TO postgres;

