INSERT INTO public.t_menu (
id_padre, item, icono, orden, ruta, hijos) VALUES (
'0'::integer, 'Ajustes de Semana'::character varying(50), 'fa fa-circle-o'::character varying(50), '19'::integer, 'index.php/config/semana'::character varying(200), '0'::integer)
returning id_menu;

UPDATE public.t_menu SET
id_padre = '2'::integer WHERE
id_menu = '18';

INSERT INTO public.menu_rol (
id_rol, id_menu) VALUES (
'2'::integer, '18'::integer)
returning id_mrol;

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
	b.id_semana
   FROM t_vendedores a
     JOIN t_ventas b ON a.id_vendedor = b.id_vendedor
     LEFT JOIN t_polizas c ON b.id_poliza = c.id_poliza
     LEFT JOIN t_tpoliza d ON b.id_tpoliza = d.id_tpoliza
     LEFT JOIN t_plan e ON b.id_plan = e.id_tplan
     JOIN t_concepto f ON b.tventa = f.id_concepto
     JOIN t_tomadores g ON b.id_tomador = g.id_tomador;

ALTER TABLE public.vendedores_ventas_detalles
    OWNER TO postgres;
