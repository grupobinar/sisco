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

ALTER TABLE public.t_ventas
    ADD COLUMN estatus_venta character varying(1) NOT NULL DEFAULT 'A';