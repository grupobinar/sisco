UPDATE public.t_plan_comision SET
ventas_min = '1'::integer WHERE
id_planc = '1';

UPDATE public.t_plan_comision SET
ventas_min = '7'::integer WHERE
id_planc = '2';

UPDATE public.t_plan_comision SET
ventas_min = '13'::integer WHERE
id_planc = '3';

INSERT INTO public.t_menu (
id_padre, item, icono, ruta, hijos) VALUES (
'0'::integer, 'Liquidacion'::character varying(50), 'fa fa-circle-o'::character varying(50), 'index.php/polizas/liquidacion'::character varying(200), '0'::integer)
 returning id_menu;

INSERT INTO public.menu_rol (
id_rol, id_menu) VALUES (
'2'::integer, '15'::integer)
returning id_mrol;

UPDATE public.t_menu SET
item = 'Liquidacion de Ventas'::character varying(50), orden = '16'::integer, ruta = '#'::character varying(200) WHERE
id_menu = '15';

UPDATE public.t_menu SET
hijos = '1'::integer WHERE
id_menu = '15';

INSERT INTO public.t_menu (
id_padre, item, icono, orden, ruta, hijos) VALUES (
'15'::integer, 'Pre-Liquidacion'::character varying(50), 'fa fa-circle-o'::character varying(50), '17'::integer, 'index.php/polizas/preliquidacion'::character varying(200), '0'::integer)
 returning id_menu;

INSERT INTO public.t_menu (
id_padre, item, icono, orden, ruta, hijos) VALUES (
'15'::integer, 'Liquidacion'::character varying(50), 'fa fa-circle-o'::character varying(50), '18'::integer, 'index.php/polizas/liquidacion'::character varying(200), '0'::integer)
 returning id_menu;

INSERT INTO public.menu_rol (
id_rol, id_menu) VALUES (
'2'::integer, '16'::integer)
 returning id_mrol;

INSERT INTO public.menu_rol (
id_rol, id_menu) VALUES (
'2'::integer, '17'::integer)
 returning id_mrol;

ALTER TABLE public.t_ventas
    ADD COLUMN estatus_venta character varying(1) NOT NULL DEFAULT 'A';

    CREATE TABLE public.t_liquidacion
(
    id_liquidacion serial,
    id_vendedor integer,
    id_venta integer,
    id_semana integer
)
WITH (
    OIDS = FALSE
);

ALTER TABLE public.t_liquidacion
    OWNER to postgres;

ALTER TABLE public.t_liquidacion
ADD COLUMN comision_liquidada double precision;