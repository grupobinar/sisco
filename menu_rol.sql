--
-- PostgreSQL database dump
--

-- Dumped from database version 9.4.24
-- Dumped by pg_dump version 9.4.24
-- Started on 2019-10-11 13:43:01 -04

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;

--
-- TOC entry 2124 (class 0 OID 141857)
-- Dependencies: 173
-- Data for Name: menu_rol; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.menu_rol (id_mrol, id_rol, id_menu) FROM stdin;
60	3	5
61	3	3
62	3	4
68	2	5
69	2	1
70	2	11
71	2	12
72	2	2
73	2	6
74	2	7
75	2	8
76	2	9
77	2	14
78	2	19
79	2	3
80	2	4
81	2	15
82	2	17
83	2	16
84	2	18
85	2	20
86	2	21
87	7	5
88	7	2
89	7	6
90	7	7
91	7	8
92	7	9
93	7	14
94	7	19
95	7	3
96	7	4
97	7	15
98	7	17
99	7	16
100	7	18
101	7	20
102	7	21
103	7	22
104	2	22
105	2	23
106	2	24
107	2	25
108	2	26
\.


--
-- TOC entry 2131 (class 0 OID 0)
-- Dependencies: 174
-- Name: menu_rol_id_mrol_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.menu_rol_id_mrol_seq', 108, true);


-- Completed on 2019-10-11 13:43:02 -04

--
-- PostgreSQL database dump complete
--

