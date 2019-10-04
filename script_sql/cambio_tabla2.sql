CREATE TABLE t_liquidacion
(
  id_liquidacion integer NOT NULL,
  id_vendedor integer,
  id_venta integer,
  id_semana integer
)
WITH (
  OIDS=FALSE
);
ALTER TABLE t_liquidacion
  OWNER TO postgres;

INSERT INTO public.t_menu (
id_menu, id_padre, item, icono, orden, ruta, hijos) VALUES (
'20'::bigint, '0'::integer, 'Reportes'::character varying(50), 'fa fa-circle-o'::character varying(50), '21'::integer, '#'::character varying(200), '1'::integer)
 returning id_menu;

INSERT INTO public.t_menu (
id_menu, id_padre, item, icono, orden, ruta, hijos) VALUES (
'21'::bigint, '20'::integer, 'Comisiones'::character varying(50), 'fa fa-circle-o'::character varying(50), '22'::integer, 'index.php/reportes/comisiones'::character varying(200), '0'::integer)
returning id_menu;

INSERT INTO public.menu_rol (
id_rol, id_menu) VALUES (
'2'::integer, '20'::integer)
 returning id_mrol;

 INSERT INTO public.menu_rol (
id_rol, id_menu) VALUES (
'2'::integer, '21'::integer)
 returning id_mrol;