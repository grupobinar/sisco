--
-- PostgreSQL database dump
--

-- Dumped from database version 9.4.24
-- Dumped by pg_dump version 9.4.24
-- Started on 2019-10-11 14:05:18 -04

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;

--
-- TOC entry 2126 (class 0 OID 141922)
-- Dependencies: 195
-- Data for Name: t_menu; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.t_menu (id_menu, id_padre, item, icono, orden, ruta, hijos) FROM stdin;
2	0	Configuración	fa fa-cogs	3	#	1
7	2	Tipo de Cobro	fa fa-circle-o	5	index.php/config/tpagos	0
8	2	Tipo de Poliza	fa fa-circle-o	6	index.php/config/tpoliza	0
9	2	Poliza	fa fa-circle-o	7	index.php/polizas/	0
10	2	Historico	fa fa-circle-o	8	index.php/polizas/	0
11	1	Roles	fa fa-circle-o	12	index.php/usuarios/roles	0
6	2	Comisiones	fa fa-circle-o	4	index.php/config/comisiones	0
12	1	Usuarios	fa fa-circle-o	13	index.php/usuarios/	0
13	2	Tipo Concepto	fa fa-circle-o	14	index.php/config/tconcepto	0
1	0	Confg. de Usuarios	fa fa-users	2	#	1
14	2	Factor de Edad	fa fa-circle-o	15	index.php/config/edad	0
16	15	Liquidacion	fa fa-circle-o	18	index.php/polizas/liquidacion	0
17	15	Pre-Liquidacion	fa fa-circle-o	17	index.php/polizas/preliquidacion	0
15	0	Liquidacion de Ventas	fa fa-play	16	#	1
3	0	Vendedores	fa fa-briefcase	9	index.php/usuarios/vendedores	0
5	0	Inicio	fa fa-home	1	index.php/login/home	0
19	2	Semanas	fa fa-circle-o	20	index.php/config/semana	0
20	0	Reportes	fa fa-circle-o	21	#	1
21	20	Comisiones	fa fa-circle-o	22	index.php/reportes/comisiones	0
22	20	Comisiones General	fa fa-circle-o	23	index.php/reportes/comisiones_general	0
18	0	Extornos	fa fa-undo	19	#	1
23	18	Extornar Venta	fa fa-circle-o	24	index.php/extornos/extornos	0
24	18	Ver Extornos	fa fa-circle-o	25	index.php/extornos/view_extornos	0
4	0	Ventas de Polizas	fa fa-opencart	10	#	1
25	4	Ventas	fa fa-circle-o	26	index.php/polizas/ventas	0
26	4	Ventas domicilidas	fa fa-circle-o	27	index.php/polizas/ventasd	0
\.


--
-- TOC entry 2133 (class 0 OID 0)
-- Dependencies: 196
-- Name: t_menu_id_menu_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.t_menu_id_menu_seq', 23, true);


-- Completed on 2019-10-11 14:05:19 -04

--
-- PostgreSQL database dump complete
--

