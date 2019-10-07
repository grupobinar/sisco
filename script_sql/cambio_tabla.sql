INSERT INTO public.t_menu (
id_menu, id_padre, item, icono, orden, ruta, hijos) VALUES (
'22'::bigint, '20'::integer, 'Comisiones General'::character varying(50), 'fa fa-circle-o'::character varying(50), '23'::integer, 'index.php/reportes/comisiones_general'::character varying(200), '0'::integer)
 returning id_menu;

 INSERT INTO public.menu_rol (
id_rol, id_menu) VALUES (
'7'::integer, '22'::integer)
 returning id_mrol;