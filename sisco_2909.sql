--
-- PostgreSQL database dump
--

-- Dumped from database version 11.5 (Debian 11.5-1.pgdg90+1)
-- Dumped by pg_dump version 11.5 (Debian 11.5-1.pgdg90+1)

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: menu_rol; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.menu_rol (
    id_mrol bigint NOT NULL,
    id_rol integer,
    id_menu integer
);


ALTER TABLE public.menu_rol OWNER TO postgres;

--
-- Name: menu_rol_id_mrol_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.menu_rol_id_mrol_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.menu_rol_id_mrol_seq OWNER TO postgres;

--
-- Name: menu_rol_id_mrol_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.menu_rol_id_mrol_seq OWNED BY public.menu_rol.id_mrol;


--
-- Name: t_plan; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.t_plan (
    id_tplan bigint NOT NULL,
    tplan character varying(20),
    id_usuario integer,
    fecha_registro date,
    ult_mod date
);


ALTER TABLE public.t_plan OWNER TO postgres;

--
-- Name: t_polizas; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.t_polizas (
    id_poliza bigint NOT NULL,
    id_tpoliza integer,
    cobertura character varying(100),
    suma double precision,
    num_poliza character varying(20),
    id_usuario integer,
    fecha_registro date,
    ult_mod date,
    id_plan integer,
    estatus integer DEFAULT 0
);


ALTER TABLE public.t_polizas OWNER TO postgres;

--
-- Name: t_tpoliza; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.t_tpoliza (
    id_tpoliza bigint NOT NULL,
    tpoliza character varying(20),
    id_usuario integer,
    fecha_registro date,
    ult_mod date,
    factor double precision,
    estatus integer DEFAULT 0
);


ALTER TABLE public.t_tpoliza OWNER TO postgres;

--
-- Name: polizas_plan_coberturas; Type: VIEW; Schema: public; Owner: postgres
--

CREATE VIEW public.polizas_plan_coberturas AS
 SELECT a.id_tpoliza AS id_poliza,
    b.id_plan AS id_plan_poliza,
    b.id_poliza AS id_cobertura_poliza,
    a.tpoliza AS descripcion_poliza,
    b.cobertura AS cobertura_poliza,
    c.tplan AS descripcion_plan_poliza,
    a.factor AS factor_poliza,
    b.num_poliza AS cod_cobertura_poliza,
    b.suma AS suma_poliza
   FROM ((public.t_tpoliza a
     JOIN public.t_polizas b ON ((a.id_tpoliza = b.id_tpoliza)))
     JOIN public.t_plan c ON ((b.id_plan = c.id_tplan)))
  WHERE (b.estatus = 0);


ALTER TABLE public.polizas_plan_coberturas OWNER TO postgres;

--
-- Name: t_adicionales; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.t_adicionales (
    id_adicional bigint NOT NULL,
    identificacion character varying(20),
    nombres character varying(100),
    apellidos character varying(100),
    telefono character varying(30),
    usuario integer,
    fecha_registro date,
    ult_mod date,
    id_venta integer,
    edad integer,
    id_parentesco integer,
    tomador character varying(50)
);


ALTER TABLE public.t_adicionales OWNER TO postgres;

--
-- Name: t_adicionales_id_adicional_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.t_adicionales_id_adicional_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.t_adicionales_id_adicional_seq OWNER TO postgres;

--
-- Name: t_adicionales_id_adicional_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.t_adicionales_id_adicional_seq OWNED BY public.t_adicionales.id_adicional;


--
-- Name: t_calculo; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.t_calculo (
    id_calculo bigint NOT NULL,
    calculo character varying(100),
    id_usuario integer,
    fecha_registro date,
    ult_mod date
);


ALTER TABLE public.t_calculo OWNER TO postgres;

--
-- Name: t_calculo_id_calculo_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.t_calculo_id_calculo_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.t_calculo_id_calculo_seq OWNER TO postgres;

--
-- Name: t_calculo_id_calculo_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.t_calculo_id_calculo_seq OWNED BY public.t_calculo.id_calculo;


--
-- Name: t_comisiones; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.t_comisiones (
    id_comision bigint NOT NULL,
    id_tcomision integer,
    id_tcalculo integer,
    cuota double precision,
    fecha_registro date,
    ult_mod date,
    id_usuario integer,
    min integer,
    max integer,
    id_plan integer,
    id_basec integer DEFAULT 1
);


ALTER TABLE public.t_comisiones OWNER TO postgres;

--
-- Name: t_comisiones_id_comision_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.t_comisiones_id_comision_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.t_comisiones_id_comision_seq OWNER TO postgres;

--
-- Name: t_comisiones_id_comision_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.t_comisiones_id_comision_seq OWNED BY public.t_comisiones.id_comision;


--
-- Name: t_concepto; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.t_concepto (
    id_concepto bigint NOT NULL,
    concepto character varying(100),
    id_usuario integer,
    fecha_registro date,
    ult_mod date
);


ALTER TABLE public.t_concepto OWNER TO postgres;

--
-- Name: t_concepto_id_concepto_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.t_concepto_id_concepto_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.t_concepto_id_concepto_seq OWNER TO postgres;

--
-- Name: t_concepto_id_concepto_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.t_concepto_id_concepto_seq OWNED BY public.t_concepto.id_concepto;


--
-- Name: t_factor_edad; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.t_factor_edad (
    id_fedad bigint NOT NULL,
    edad integer,
    factor double precision,
    id_usuario integer,
    fecha_registro date,
    ult_mod date,
    estatus integer DEFAULT 0
);


ALTER TABLE public.t_factor_edad OWNER TO postgres;

--
-- Name: t_factor_edad_id_fedad_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.t_factor_edad_id_fedad_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.t_factor_edad_id_fedad_seq OWNER TO postgres;

--
-- Name: t_factor_edad_id_fedad_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.t_factor_edad_id_fedad_seq OWNED BY public.t_factor_edad.id_fedad;


--
-- Name: t_menu; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.t_menu (
    id_menu bigint NOT NULL,
    id_padre integer DEFAULT 0,
    item character varying(50),
    icono character varying(50),
    orden integer,
    ruta character varying(200),
    hijos integer DEFAULT 0
);


ALTER TABLE public.t_menu OWNER TO postgres;

--
-- Name: t_menu_id_menu_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.t_menu_id_menu_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.t_menu_id_menu_seq OWNER TO postgres;

--
-- Name: t_menu_id_menu_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.t_menu_id_menu_seq OWNED BY public.t_menu.id_menu;


--
-- Name: t_parentesco; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.t_parentesco (
    id_parentesco bigint NOT NULL,
    parentesco character varying(20),
    id_usuario integer,
    fecha_registro date,
    ult_mod date
);


ALTER TABLE public.t_parentesco OWNER TO postgres;

--
-- Name: t_parentesco_id_parentesco_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.t_parentesco_id_parentesco_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.t_parentesco_id_parentesco_seq OWNER TO postgres;

--
-- Name: t_parentesco_id_parentesco_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.t_parentesco_id_parentesco_seq OWNED BY public.t_parentesco.id_parentesco;


--
-- Name: t_personas; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.t_personas (
    id_persona bigint NOT NULL,
    identificacion character varying(20),
    nombres character varying(100),
    apellidos character varying(100),
    telefono character varying(30),
    correo character varying(30),
    id_usuario integer,
    fecha_registro date,
    ult_mod date,
    id_coordinador integer DEFAULT 0
);


ALTER TABLE public.t_personas OWNER TO postgres;

--
-- Name: t_personas_id_persona_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.t_personas_id_persona_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.t_personas_id_persona_seq OWNER TO postgres;

--
-- Name: t_personas_id_persona_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.t_personas_id_persona_seq OWNED BY public.t_personas.id_persona;


--
-- Name: t_plan_comision; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.t_plan_comision (
    id_planc bigint NOT NULL,
    planc character varying(100),
    id_usuario integer,
    fecha_registro date,
    ult_mod date,
    estatus integer DEFAULT 0,
    ventas_min integer
);


ALTER TABLE public.t_plan_comision OWNER TO postgres;

--
-- Name: t_plan_comision_id_planc_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.t_plan_comision_id_planc_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.t_plan_comision_id_planc_seq OWNER TO postgres;

--
-- Name: t_plan_comision_id_planc_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.t_plan_comision_id_planc_seq OWNED BY public.t_plan_comision.id_planc;


--
-- Name: t_plan_id_tplan_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.t_plan_id_tplan_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.t_plan_id_tplan_seq OWNER TO postgres;

--
-- Name: t_plan_id_tplan_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.t_plan_id_tplan_seq OWNED BY public.t_plan.id_tplan;


--
-- Name: t_polizas_id_poliza_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.t_polizas_id_poliza_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.t_polizas_id_poliza_seq OWNER TO postgres;

--
-- Name: t_polizas_id_poliza_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.t_polizas_id_poliza_seq OWNED BY public.t_polizas.id_poliza;


--
-- Name: t_roles; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.t_roles (
    id_rol bigint NOT NULL,
    rol character varying(40),
    observacion character varying(300),
    id_usuario integer,
    fecha_registro date,
    ult_mod date,
    estatus_rol integer DEFAULT 0
);


ALTER TABLE public.t_roles OWNER TO postgres;

--
-- Name: t_roles_id_rol_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.t_roles_id_rol_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.t_roles_id_rol_seq OWNER TO postgres;

--
-- Name: t_roles_id_rol_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.t_roles_id_rol_seq OWNED BY public.t_roles.id_rol;


--
-- Name: t_semanas; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.t_semanas (
    id_semana bigint NOT NULL,
    desde date,
    hasta date,
    estatus integer DEFAULT 0,
    id_usuario integer,
    fecha_registro date,
    ult_mod date,
    observaciones character varying(200),
    nsem integer
);


ALTER TABLE public.t_semanas OWNER TO postgres;

--
-- Name: t_semanas_id_semana_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.t_semanas_id_semana_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.t_semanas_id_semana_seq OWNER TO postgres;

--
-- Name: t_semanas_id_semana_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.t_semanas_id_semana_seq OWNED BY public.t_semanas.id_semana;


--
-- Name: t_tomadores; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.t_tomadores (
    id_tomador bigint NOT NULL,
    identificacion character varying(20),
    nombres character varying(100),
    apellidos character varying(100),
    telefono character varying(30),
    id_coordinador integer DEFAULT 0,
    correo character varying(30),
    fecha_registro date,
    ult_mod date,
    usuario integer
);


ALTER TABLE public.t_tomadores OWNER TO postgres;

--
-- Name: t_tomadores_id_tomador_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.t_tomadores_id_tomador_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.t_tomadores_id_tomador_seq OWNER TO postgres;

--
-- Name: t_tomadores_id_tomador_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.t_tomadores_id_tomador_seq OWNED BY public.t_tomadores.id_tomador;


--
-- Name: t_tpago; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.t_tpago (
    id_tpago bigint NOT NULL,
    tpago character varying(100),
    id_usuario integer,
    fecha_registro date,
    ult_mod date,
    estatus integer DEFAULT 0
);


ALTER TABLE public.t_tpago OWNER TO postgres;

--
-- Name: t_tpago_id_tpago_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.t_tpago_id_tpago_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.t_tpago_id_tpago_seq OWNER TO postgres;

--
-- Name: t_tpago_id_tpago_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.t_tpago_id_tpago_seq OWNED BY public.t_tpago.id_tpago;


--
-- Name: t_tpoliza_id_tpoliza_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.t_tpoliza_id_tpoliza_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.t_tpoliza_id_tpoliza_seq OWNER TO postgres;

--
-- Name: t_tpoliza_id_tpoliza_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.t_tpoliza_id_tpoliza_seq OWNED BY public.t_tpoliza.id_tpoliza;


--
-- Name: t_usuarios; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.t_usuarios (
    id_user bigint NOT NULL,
    username character varying(20),
    clave character varying(300),
    id_persona integer,
    id_rol integer,
    id_usuario integer,
    fecha_registro date,
    ult_mod date,
    estatus integer DEFAULT 0
);


ALTER TABLE public.t_usuarios OWNER TO postgres;

--
-- Name: t_usuarios_id_user_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.t_usuarios_id_user_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.t_usuarios_id_user_seq OWNER TO postgres;

--
-- Name: t_usuarios_id_user_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.t_usuarios_id_user_seq OWNED BY public.t_usuarios.id_user;


--
-- Name: t_vendedores; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.t_vendedores (
    id_vendedor bigint NOT NULL,
    identificacion character varying(20),
    nombres character varying(100),
    apellidos character varying(100),
    telefono character varying(30),
    id_coordinador integer DEFAULT 0,
    correo character varying(30),
    fecha_registro date,
    ult_mod date,
    id_usuario integer,
    cod_vendedor integer
);


ALTER TABLE public.t_vendedores OWNER TO postgres;

--
-- Name: t_vendedores_id_vendedor_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.t_vendedores_id_vendedor_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.t_vendedores_id_vendedor_seq OWNER TO postgres;

--
-- Name: t_vendedores_id_vendedor_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.t_vendedores_id_vendedor_seq OWNED BY public.t_vendedores.id_vendedor;


--
-- Name: t_ventas; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.t_ventas (
    id_venta bigint NOT NULL,
    id_tomador integer,
    id_poliza integer,
    id_vendedor integer,
    id_comision integer,
    tipo_pago integer,
    referencia_pago character varying(100),
    monto double precision,
    cuotas_canceladas integer,
    extorno integer,
    fecha_extorno date,
    id_usuario integer,
    fecha_registro date,
    ult_mod date,
    id_plan integer,
    id_tpoliza integer,
    tventa integer,
    solicitud integer,
    id_semana integer,
    estatus_venta character varying(1) DEFAULT 'A'::character varying NOT NULL
);


ALTER TABLE public.t_ventas OWNER TO postgres;

--
-- Name: t_ventas_id_venta_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.t_ventas_id_venta_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.t_ventas_id_venta_seq OWNER TO postgres;

--
-- Name: t_ventas_id_venta_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.t_ventas_id_venta_seq OWNED BY public.t_ventas.id_venta;


--
-- Name: vendedores_ventas_detalles; Type: VIEW; Schema: public; Owner: postgres
--

CREATE VIEW public.vendedores_ventas_detalles AS
 SELECT a.id_vendedor,
    a.cod_vendedor,
    b.id_venta,
        CASE
            WHEN (b.id_poliza IS NULL) THEN rpad((b.tventa)::text, 5, '0'::text)
            ELSE (b.id_poliza)::text
        END AS id_cobertura,
    b.id_plan,
        CASE
            WHEN (b.id_tpoliza IS NULL) THEN rpad((b.tventa)::text, 5, '0'::text)
            ELSE (b.id_tpoliza)::text
        END AS id_poliza,
    b.cuotas_canceladas,
    b.id_semana,
    b.tventa AS tipo_venta,
    f.concepto AS concepto_venta,
    (((((g.identificacion)::text || ' '::text) || (g.nombres)::text) || ' '::text) || (g.apellidos)::text) AS tomador,
        CASE
            WHEN (d.tpoliza IS NULL) THEN 'NO APLICA'::character varying
            ELSE d.tpoliza
        END AS poliza_descripcion,
        CASE
            WHEN (c.cobertura IS NULL) THEN 'NO APLICA'::character varying
            ELSE c.cobertura
        END AS cobertura_descripcion,
    (((a.nombres)::text || ' '::text) || (a.apellidos)::text) AS vendedor_data
   FROM ((((((public.t_vendedores a
     JOIN public.t_ventas b ON (((a.id_vendedor = b.id_vendedor) AND ((b.estatus_venta)::text = 'A'::text))))
     LEFT JOIN public.t_polizas c ON ((b.id_poliza = c.id_poliza)))
     LEFT JOIN public.t_tpoliza d ON ((b.id_tpoliza = d.id_tpoliza)))
     LEFT JOIN public.t_plan e ON ((b.id_plan = e.id_tplan)))
     JOIN public.t_concepto f ON ((b.tventa = f.id_concepto)))
     JOIN public.t_tomadores g ON ((b.id_tomador = g.id_tomador)));


ALTER TABLE public.vendedores_ventas_detalles OWNER TO postgres;

--
-- Name: menu_rol id_mrol; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.menu_rol ALTER COLUMN id_mrol SET DEFAULT nextval('public.menu_rol_id_mrol_seq'::regclass);


--
-- Name: t_adicionales id_adicional; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.t_adicionales ALTER COLUMN id_adicional SET DEFAULT nextval('public.t_adicionales_id_adicional_seq'::regclass);


--
-- Name: t_calculo id_calculo; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.t_calculo ALTER COLUMN id_calculo SET DEFAULT nextval('public.t_calculo_id_calculo_seq'::regclass);


--
-- Name: t_comisiones id_comision; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.t_comisiones ALTER COLUMN id_comision SET DEFAULT nextval('public.t_comisiones_id_comision_seq'::regclass);


--
-- Name: t_concepto id_concepto; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.t_concepto ALTER COLUMN id_concepto SET DEFAULT nextval('public.t_concepto_id_concepto_seq'::regclass);


--
-- Name: t_factor_edad id_fedad; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.t_factor_edad ALTER COLUMN id_fedad SET DEFAULT nextval('public.t_factor_edad_id_fedad_seq'::regclass);


--
-- Name: t_menu id_menu; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.t_menu ALTER COLUMN id_menu SET DEFAULT nextval('public.t_menu_id_menu_seq'::regclass);


--
-- Name: t_parentesco id_parentesco; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.t_parentesco ALTER COLUMN id_parentesco SET DEFAULT nextval('public.t_parentesco_id_parentesco_seq'::regclass);


--
-- Name: t_personas id_persona; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.t_personas ALTER COLUMN id_persona SET DEFAULT nextval('public.t_personas_id_persona_seq'::regclass);


--
-- Name: t_plan id_tplan; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.t_plan ALTER COLUMN id_tplan SET DEFAULT nextval('public.t_plan_id_tplan_seq'::regclass);


--
-- Name: t_plan_comision id_planc; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.t_plan_comision ALTER COLUMN id_planc SET DEFAULT nextval('public.t_plan_comision_id_planc_seq'::regclass);


--
-- Name: t_polizas id_poliza; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.t_polizas ALTER COLUMN id_poliza SET DEFAULT nextval('public.t_polizas_id_poliza_seq'::regclass);


--
-- Name: t_roles id_rol; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.t_roles ALTER COLUMN id_rol SET DEFAULT nextval('public.t_roles_id_rol_seq'::regclass);


--
-- Name: t_semanas id_semana; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.t_semanas ALTER COLUMN id_semana SET DEFAULT nextval('public.t_semanas_id_semana_seq'::regclass);


--
-- Name: t_tomadores id_tomador; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.t_tomadores ALTER COLUMN id_tomador SET DEFAULT nextval('public.t_tomadores_id_tomador_seq'::regclass);


--
-- Name: t_tpago id_tpago; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.t_tpago ALTER COLUMN id_tpago SET DEFAULT nextval('public.t_tpago_id_tpago_seq'::regclass);


--
-- Name: t_tpoliza id_tpoliza; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.t_tpoliza ALTER COLUMN id_tpoliza SET DEFAULT nextval('public.t_tpoliza_id_tpoliza_seq'::regclass);


--
-- Name: t_usuarios id_user; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.t_usuarios ALTER COLUMN id_user SET DEFAULT nextval('public.t_usuarios_id_user_seq'::regclass);


--
-- Name: t_vendedores id_vendedor; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.t_vendedores ALTER COLUMN id_vendedor SET DEFAULT nextval('public.t_vendedores_id_vendedor_seq'::regclass);


--
-- Name: t_ventas id_venta; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.t_ventas ALTER COLUMN id_venta SET DEFAULT nextval('public.t_ventas_id_venta_seq'::regclass);


--
-- Data for Name: menu_rol; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.menu_rol (id_mrol, id_rol, id_menu) FROM stdin;
35	2	5
36	2	1
37	2	11
38	2	12
39	2	2
40	2	6
41	2	7
42	2	8
43	2	9
46	2	3
47	2	4
59	2	14
60	3	5
61	3	3
62	3	4
63	2	15
64	2	16
65	2	17
\.


--
-- Data for Name: t_adicionales; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.t_adicionales (id_adicional, identificacion, nombres, apellidos, telefono, usuario, fecha_registro, ult_mod, id_venta, edad, id_parentesco, tomador) FROM stdin;
16	V-636974	prueba uno	\N	\N	1	2019-09-23	2019-09-23	26	56	7	\N
17	V-6670175	prueba uno	\N	\N	1	2019-09-23	2019-09-23	29	20	1	\N
\.


--
-- Data for Name: t_calculo; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.t_calculo (id_calculo, calculo, id_usuario, fecha_registro, ult_mod) FROM stdin;
1	porcentual	\N	\N	\N
2	monto fijo	\N	\N	\N
\.


--
-- Data for Name: t_comisiones; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.t_comisiones (id_comision, id_tcomision, id_tcalculo, cuota, fecha_registro, ult_mod, id_usuario, min, max, id_plan, id_basec) FROM stdin;
1	3	1	80	2019-09-11	2019-09-11	0	1	6	1	1
4	2	2	3000	2019-09-11	2019-09-11	0	1	6	1	1
5	1	1	12	2019-09-11	2019-09-11	0	1	10	1	1
6	2	1	80	2019-09-18	2019-09-18	1	1	23	2	1
7	3	2	8999	2019-09-23	2019-09-23	1	1	100	3	2
\.


--
-- Data for Name: t_concepto; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.t_concepto (id_concepto, concepto, id_usuario, fecha_registro, ult_mod) FROM stdin;
2	Por personas adicionales	\N	\N	\N
3	Por actualización de datos	\N	\N	\N
1	Por venta de poliza	\N	\N	\N
\.


--
-- Data for Name: t_factor_edad; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.t_factor_edad (id_fedad, edad, factor, id_usuario, fecha_registro, ult_mod, estatus) FROM stdin;
1	0	4.40000000000000036	\N	\N	\N	0
2	1	4.40000000000000036	\N	\N	\N	0
3	2	4.40000000000000036	\N	\N	\N	0
4	3	4.40000000000000036	\N	\N	\N	0
5	4	4.40000000000000036	\N	\N	\N	0
6	5	4.40000000000000036	\N	\N	\N	0
7	6	4.40000000000000036	\N	\N	\N	0
8	7	4.40000000000000036	\N	\N	\N	0
9	8	4.40000000000000036	\N	\N	\N	0
10	9	4.40000000000000036	\N	\N	\N	0
11	10	4.40000000000000036	\N	\N	\N	0
12	11	4.40000000000000036	\N	\N	\N	0
13	12	4.40000000000000036	\N	\N	\N	0
14	13	4.40000000000000036	\N	\N	\N	0
15	14	4.40000000000000036	\N	\N	\N	0
16	15	4.40000000000000036	\N	\N	\N	0
17	16	4.40000000000000036	\N	\N	\N	0
18	17	4.40000000000000036	\N	\N	\N	0
19	18	4.40000000000000036	\N	\N	\N	0
20	19	4.40000000000000036	\N	\N	\N	0
21	20	4.40000000000000036	\N	\N	\N	0
22	21	6.40000000000000036	\N	\N	\N	0
23	22	6.40000000000000036	\N	\N	\N	0
24	23	6.40000000000000036	\N	\N	\N	0
25	24	6.40000000000000036	\N	\N	\N	0
26	25	6.40000000000000036	\N	\N	\N	0
27	26	6.40000000000000036	\N	\N	\N	0
28	27	6.40000000000000036	\N	\N	\N	0
29	28	6.40000000000000036	\N	\N	\N	0
30	29	6.40000000000000036	\N	\N	\N	0
31	30	6.40000000000000036	\N	\N	\N	0
32	31	6.40000000000000036	\N	\N	\N	0
33	32	6.40000000000000036	\N	\N	\N	0
34	33	6.40000000000000036	\N	\N	\N	0
35	34	6.40000000000000036	\N	\N	\N	0
36	35	6.40000000000000036	\N	\N	\N	0
37	36	6.40000000000000036	\N	\N	\N	0
38	37	6.40000000000000036	\N	\N	\N	0
39	38	6.40000000000000036	\N	\N	\N	0
40	39	6.40000000000000036	\N	\N	\N	0
41	40	6.40000000000000036	\N	\N	\N	0
42	41	6.40000000000000036	\N	\N	\N	0
43	42	6.79999999999999982	\N	\N	\N	0
44	43	7.20000000000000018	\N	\N	\N	0
45	44	7.70000000000000018	\N	\N	\N	0
46	45	8.09999999999999964	\N	\N	\N	0
47	46	8.59999999999999964	\N	\N	\N	0
48	47	9.19999999999999929	\N	\N	\N	0
49	48	9.69999999999999929	\N	\N	\N	0
50	49	10.4000000000000004	\N	\N	\N	0
51	50	11	\N	\N	\N	0
52	51	11.8000000000000007	\N	\N	\N	0
53	52	12.6999999999999993	\N	\N	\N	0
54	53	13.6999999999999993	\N	\N	\N	0
55	54	14.9000000000000004	\N	\N	\N	0
56	55	16.1000000000000014	\N	\N	\N	0
57	56	17.3999999999999986	\N	\N	\N	0
58	57	18.8000000000000007	\N	\N	\N	0
59	58	20.3000000000000007	\N	\N	\N	0
60	59	21.8000000000000007	\N	\N	\N	0
61	60	23.6000000000000014	\N	\N	\N	0
62	61	25.6000000000000014	\N	\N	\N	0
63	62	27.8000000000000007	\N	\N	\N	0
64	63	30.3000000000000007	\N	\N	\N	0
65	64	33.1000000000000014	\N	\N	\N	0
66	65	36.1000000000000014	\N	\N	\N	0
67	66	39.3999999999999986	\N	\N	\N	0
68	67	42.7999999999999972	\N	\N	\N	0
69	68	46.5	\N	\N	\N	0
70	69	50.5	\N	\N	\N	0
71	70	55	\N	\N	\N	0
72	71	60.2999999999999972	\N	\N	\N	0
73	72	65.9000000000000057	\N	\N	\N	0
74	73	72.5999999999999943	\N	\N	\N	0
75	74	80.0999999999999943	\N	\N	\N	0
76	75	88.0999999999999943	\N	\N	\N	0
77	76	96.5999999999999943	\N	\N	\N	0
78	77	105.5	\N	\N	\N	0
79	78	114.599999999999994	\N	\N	\N	0
80	79	124.200000000000003	\N	\N	\N	0
81	80	134.599999999999994	\N	\N	\N	0
82	81	146.199999999999989	\N	\N	\N	0
83	82	159.300000000000011	\N	\N	\N	0
84	83	174.409999999999997	\N	\N	\N	0
85	84	190.199999999999989	\N	\N	\N	0
86	85	207.719999999999999	\N	\N	\N	0
87	86	224.900000000000006	\N	\N	\N	0
88	87	242.900000000000006	\N	\N	\N	0
89	88	261.300000000000011	\N	\N	\N	0
90	89	280.199999999999989	\N	\N	\N	0
91	90	299.600000000000023	\N	\N	\N	0
92	91	320	\N	\N	\N	0
93	92	342.100000000000023	\N	\N	\N	0
94	93	367.100000000000023	\N	\N	\N	0
95	94	399.100000000000023	\N	\N	\N	0
96	95	444.800000000000011	\N	\N	\N	0
97	96	518	\N	\N	\N	0
98	97	646.399999999999977	\N	\N	\N	0
99	98	884.899999999999977	\N	\N	\N	0
100	99	884.899999999999977	\N	\N	\N	0
101	100	884.700000000000045	\N	\N	\N	0
102	101	884.700000000000045	\N	\N	\N	0
104	2000	100	1	2019-09-23	2019-09-23	1
103	200	100	1	2019-09-23	2019-09-23	1
\.


--
-- Data for Name: t_menu; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.t_menu (id_menu, id_padre, item, icono, orden, ruta, hijos) FROM stdin;
2	0	Configuración	fa fa-cogs	3	#	1
3	0	Vendedores	fa fa-shopping-cart	9	index.php/usuarios/vendedores	0
7	2	Tipo de Cobro	fa fa-circle-o	5	index.php/config/tpagos	0
8	2	Tipo de Poliza	fa fa-circle-o	6	index.php/config/tpoliza	0
9	2	Poliza	fa fa-circle-o	7	index.php/polizas/	0
10	2	Historico	fa fa-circle-o	8	index.php/polizas/	0
11	1	Roles	fa fa-circle-o	12	index.php/usuarios/roles	0
6	2	Comisiones	fa fa-circle-o	4	index.php/config/comisiones	0
12	1	Usuarios	fa fa-circle-o	13	index.php/usuarios/	0
13	2	Tipo Concepto	fa fa-circle-o	14	index.php/config/tconcepto	0
5	0	Dashboard	fa fa-dashboard	1	index.php/login/home	0
4	0	Venta	fa fa-spinner	10	index.php/polizas/ventas	0
1	0	Confg. de Usuarios	fa fa-users	2	#	1
14	2	Factor de Edad	fa fa-circle-o	15	index.php/config/edad	0
15	0	Liquidacion de Ventas	fa fa-circle-o	16	#	0
16	15	Liquidacion	fa fa-circle-o	17	index.php/polizas/liquidacion	0
17	15	Pre-Liquidacion	fa fa-circle-o	18	index.php/polizas/preliquidacion	0
\.


--
-- Data for Name: t_parentesco; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.t_parentesco (id_parentesco, parentesco, id_usuario, fecha_registro, ult_mod) FROM stdin;
1	Hermanos	\N	\N	\N
2	primos	\N	\N	\N
3	tios	\N	\N	\N
4	nietos	\N	\N	\N
5	hijos mayores	\N	\N	\N
6	sobrinos	\N	\N	\N
7	suegros	\N	\N	\N
8	otros	\N	\N	\N
\.


--
-- Data for Name: t_personas; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.t_personas (id_persona, identificacion, nombres, apellidos, telefono, correo, id_usuario, fecha_registro, ult_mod, id_coordinador) FROM stdin;
8	V-987654321	ana	lezama parra	78098090	analezama@gmail.com	0	2019-09-03	2019-09-03	0
1	21072511	ana	lezama	78098090	analezama@gmail.com	0	1992-02-12	2019-09-05	\N
11	V-21072510	NAilyn	Cuenca	111111111	nailin@gmail.com	0	2019-09-06	2019-09-06	0
4	V-1234678	Velasco Sequera	Ericson	04121234567	vsequera@grupobinar.com	1	2019-09-02	2019-09-17	\N
\.


--
-- Data for Name: t_plan; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.t_plan (id_tplan, tplan, id_usuario, fecha_registro, ult_mod) FROM stdin;
1	IMPERIAL	\N	\N	\N
2	CLASICO	\N	\N	\N
3	SUPERIOR	\N	\N	\N
\.


--
-- Data for Name: t_plan_comision; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.t_plan_comision (id_planc, planc, id_usuario, fecha_registro, ult_mod, estatus, ventas_min) FROM stdin;
1	BASE	\N	\N	\N	0	1
2	MEDIO	\N	\N	\N	0	7
3	SUPERIOR	\N	\N	\N	0	13
\.


--
-- Data for Name: t_polizas; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.t_polizas (id_poliza, id_tpoliza, cobertura, suma, num_poliza, id_usuario, fecha_registro, ult_mod, id_plan, estatus) FROM stdin;
67	1	Asistencia Funeraria (Parcela)	10500000	I1	0	2019-09-01	2019-09-01	1	0
68	1	Asistencia Funeraria (Funerario)	14500000	I2	0	2019-09-01	2019-09-01	1	0
69	1	Asistencia Funeraria (Funerario y Cremación)	20500000	I3	0	2019-09-01	2019-09-01	1	0
70	1	Asistencia Funeraria (Funerario y Parcela)	10000000	I8	0	2019-09-01	2019-09-01	1	0
71	1	Asistencia Funeraria (Por definir)	4000000	I7	0	2019-09-01	2019-09-01	1	0
72	1	Asistencia Funeraria (Funerario)	6000000	A1	0	2019-09-01	2019-09-01	2	0
73	1	Asistencia Funeraria (Parcela)	10000000	A2	0	2019-09-01	2019-09-01	2	0
74	1	Asistencia Funeraria (Funerario y Cremación)	12000000	A3	0	2019-09-01	2019-09-01	2	0
75	1	Asistencia Funeraria (Funerario y Parcela)	6000000	A8	0	2019-09-01	2019-09-01	2	0
76	1	Asistencia Funeraria (por definir)	4000000	A7	0	2019-09-01	2019-09-01	2	0
77	1	Asistencia Funeraria (Funerario)	8500000	B1	0	2019-09-01	2019-09-05	3	0
78	1	Asistencia Funeraria (Parcela)	12500000	B2	0	2019-09-01	2019-09-01	3	0
79	1	Asistencia Funeraria (Funerario y Cremación)	14500000	B3	0	2019-09-01	2019-09-01	3	0
80	1	Asistencia Funeraria (Funerario y Parcela)	6000000	B8	0	2019-09-01	2019-09-01	3	0
81	1	Asistencia Funeraria (Por definir)	4000000	B7	0	2019-09-01	2019-09-01	3	0
82	2	Asistencia Funeraria (Parcela)	10500000	I4	0	2019-09-01	2019-09-01	1	0
83	2	Asistencia Funeraria (Funerario)	14500000	I5	0	2019-09-01	2019-09-01	1	0
84	2	Asistencia Funeraria (Funerario y Cremación)	20500000	I6	0	2019-09-01	2019-09-01	1	0
85	2	Asistencia Funeraria (Funerario y Parcela)	10000000	I10	0	2019-09-01	2019-09-01	1	0
86	2	Asistencia Funeraria (Por definir)	4000000	I9	0	2019-09-01	2019-09-01	1	0
87	2	Asistencia Funeraria (Funerario)	6000000	A4	0	2019-09-01	2019-09-01	2	0
88	2	Asistencia Funeraria (Parcela)	10000000	A5	0	2019-09-01	2019-09-01	2	0
89	2	Asistencia Funeraria (Funerario y Cremación)	12000000	A6	0	2019-09-01	2019-09-01	2	0
90	2	Asistencia Funeraria (Funerario y Parcela)	6000000	A10	0	2019-09-01	2019-09-01	2	0
91	2	Asistencia Funeraria (Por definir)	4000000	A9	0	2019-09-01	2019-09-01	2	0
92	2	Asistencia Funeraria (Funerario)	8500000	B4	0	2019-09-01	2019-09-01	3	0
93	2	Asistencia Funeraria (Parcela)	12500000	B5	0	2019-09-01	2019-09-01	3	0
94	2	Asistencia Funeraria (Funerario y Cremación)	14500000	B6	0	2019-09-01	2019-09-01	3	0
95	2	Asistencia Funeraria (Funerario y Parcela)	6000000	B10	0	2019-09-01	2019-09-01	3	0
96	2	Asistencia Funeraria (Por definir)	4000000	B9	0	2019-09-01	2019-09-01	3	0
97	3	Asistencia Funeraria (Parcela)	10500000	I4-50	0	2019-09-01	2019-09-01	1	0
98	3	Asistencia Funeraria (Funerario)	14500000	I5-50	0	2019-09-01	2019-09-01	1	0
99	3	Asistencia Funeraria (Funerario y Cremación)	20500000	I6-50	0	2019-09-01	2019-09-01	1	0
100	3	Asistencia Funeraria (Funerario y Parcela)	10000000	I10-50	0	2019-09-01	2019-09-01	1	0
101	3	Asistencia Funeraria (Por definir)	4000000	I9-50	0	2019-09-01	2019-09-01	1	0
102	3	Asistencia Funeraria (Funerario)	6000000	A4-50	0	2019-09-01	2019-09-01	2	0
103	3	Asistencia Funeraria (Parcela)	10000000	A5-50	0	2019-09-01	2019-09-01	2	0
104	3	Asistencia Funeraria (Funerario y Cremación)	12000000	A6-50	0	2019-09-01	2019-09-01	2	0
105	3	Asistencia Funeraria (Funerario y Parcela)	6000000	A10-50	0	2019-09-01	2019-09-01	2	0
106	3	Asistencia Funeraria (Por definir)	4000000	A9-50	0	2019-09-01	2019-09-01	2	0
107	3	Asistencia Funeraria (Funerario)	8500000	B4-50	0	2019-09-01	2019-09-01	3	0
108	3	Asistencia Funeraria (Parcela)	12500000	B5-50	0	2019-09-01	2019-09-01	3	0
109	3	Asistencia Funeraria (Funerario y Cremación)	14500000	B6-50	0	2019-09-01	2019-09-01	3	0
110	3	Asistencia Funeraria (Funerario y Parcela)	6000000	B10-50	0	2019-09-01	2019-09-01	3	0
111	3	Asistencia Funeraria (Por definir)	4000000	B9-50	0	2019-09-01	2019-09-01	3	0
112	4	Asistencia Funeraria (Parcela)	10500000	I4-33	0	2019-09-01	2019-09-01	1	0
113	4	Asistencia Funeraria (Funerario)	14500000	I5-33	0	2019-09-01	2019-09-01	1	0
114	4	Asistencia Funeraria (Funerario y Cremación)	20500000	I6-33	0	2019-09-01	2019-09-01	1	0
115	4	Asistencia Funeraria (Funerario y Parcela)	10000000	I10-33	0	2019-09-01	2019-09-01	1	0
116	4	Asistencia Funeraria (Por definir)	4000000	I9-33	0	2019-09-01	2019-09-01	1	0
117	4	Asistencia Funeraria (Funerario)	6000000	A4-33	0	2019-09-01	2019-09-01	2	0
118	4	Asistencia Funeraria (Parcela)	10000000	A5-33	0	2019-09-01	2019-09-01	2	0
119	4	Asistencia Funeraria (Funerario y Cremación)	12000000	A6-33	0	2019-09-01	2019-09-01	2	0
120	4	Asistencia Funeraria (Funerario y Parcela)	6000000	A10-33	0	2019-09-01	2019-09-01	2	0
121	4	Asistencia Funeraria (Por definir)	4000000	A9-33	0	2019-09-01	2019-09-01	2	0
122	4	Asistencia Funeraria (Funerario)	8500000	B4-33	0	2019-09-01	2019-09-01	3	0
123	4	Asistencia Funeraria (Parcela)	12500000	B5-33	0	2019-09-01	2019-09-01	3	0
124	4	Asistencia Funeraria (Funerario y Cremación)	14500000	B6-33	0	2019-09-01	2019-09-01	3	0
125	4	Asistencia Funeraria (Funerario y Parcela)	6000000	B10-33	0	2019-09-01	2019-09-01	3	0
126	4	Asistencia Funeraria (Por definir)	4000000	B9-33	0	2019-09-01	2019-09-01	3	0
127	1	nada	0	\N	1	\N	2019-09-23	5	1
128	1	nada	0	\N	1	\N	2019-09-23	2	1
\.


--
-- Data for Name: t_roles; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.t_roles (id_rol, rol, observacion, id_usuario, fecha_registro, ult_mod, estatus_rol) FROM stdin;
6	prueba	\N	\N	\N	\N	1
2	Administrador	\N	0	2019-09-01	2019-09-01	0
3	Coordinador De Ventas	\N	0	2019-09-01	2019-09-01	0
\.


--
-- Data for Name: t_semanas; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.t_semanas (id_semana, desde, hasta, estatus, id_usuario, fecha_registro, ult_mod, observaciones, nsem) FROM stdin;
2	2019-09-23	2019-09-30	0	1	\N	\N	seguimos probando	39
1	2019-09-16	2019-09-22	1	1	2019-09-21	2019-09-21	Pruebas	38
\.


--
-- Data for Name: t_tomadores; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.t_tomadores (id_tomador, identificacion, nombres, apellidos, telefono, id_coordinador, correo, fecha_registro, ult_mod, usuario) FROM stdin;
14	V-21072511	katherine A	lezama parra	04127255879	0	klezama@grupobinar.com	2019-09-23	2019-09-23	1
15	V-123123	brito	alan	04127255879	0	jennp1111@gmail.com	2019-09-23	2019-09-23	1
\.


--
-- Data for Name: t_tpago; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.t_tpago (id_tpago, tpago, id_usuario, fecha_registro, ult_mod, estatus) FROM stdin;
3	transferencia del mismo banco	0	\N	\N	0
2	Domiciliado en cuenta	0	\N	\N	0
1	Tarjeta de debito	0	\N	\N	0
5	prueba	0	2019-09-04	2019-09-04	1
4	transferencia otros 	0	\N	\N	1
9	Transferencia Otros Bancos	1	2019-09-23	2019-09-23	1
10	prueba	1	2019-09-23	2019-09-23	1
\.


--
-- Data for Name: t_tpoliza; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.t_tpoliza (id_tpoliza, tpoliza, id_usuario, fecha_registro, ult_mod, factor, estatus) FROM stdin;
1	TCH	0	2019-09-01	2019-09-01	25.7600000000000016	0
2	TCHP	0	2019-09-01	2019-09-01	73.5	0
3	TCHP (50%)	0	2019-09-01	2019-09-01	55.3599999999999994	0
4	TCHP (33%)	0	2019-09-01	2019-09-01	45.6300000000000026	0
5	VIDA	0	2019-09-01	2019-09-01	0	0
12	prueba	1	2019-09-23	2019-09-23	100	1
\.


--
-- Data for Name: t_usuarios; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.t_usuarios (id_user, username, clave, id_persona, id_rol, id_usuario, fecha_registro, ult_mod, estatus) FROM stdin;
6	nailyn	123456	11	3	0	2019-09-06	2019-09-06	0
1	master	123456	1	2	0	1992-05-12	2019-09-05	0
5	ana	1	8	2	0	2019-09-03	2019-09-03	0
2	vsequera	123	4	3	1	2019-09-02	2019-09-17	0
\.


--
-- Data for Name: t_vendedores; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.t_vendedores (id_vendedor, identificacion, nombres, apellidos, telefono, id_coordinador, correo, fecha_registro, ult_mod, id_usuario, cod_vendedor) FROM stdin;
8	V-6670175	Jenny	Parra	123123123	6	jennp@gmail.com	2019-09-17	2019-09-17	6	2201
7	V-21072511	lezama p	katherine	04121234567	1	katherine@gmail.com	2019-09-17	2019-09-23	1	21022
\.


--
-- Data for Name: t_ventas; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.t_ventas (id_venta, id_tomador, id_poliza, id_vendedor, id_comision, tipo_pago, referencia_pago, monto, cuotas_canceladas, extorno, fecha_extorno, id_usuario, fecha_registro, ult_mod, id_plan, id_tpoliza, tventa, solicitud, id_semana, estatus_venta) FROM stdin;
28	15	94	8	\N	4	0102	10000	2	\N	\N	1	2019-09-23	2019-09-23	3	2	1	1004	2	A
30	15	\N	7	\N	3	\N	\N	\N	\N	\N	1	2019-09-23	2019-09-23	\N	\N	3	210202	2	X
27	14	\N	7	\N	3	\N	\N	\N	\N	\N	1	2019-09-23	2019-09-23	\N	\N	3	123	2	X
26	14	\N	7	\N	3	122121	9877809.77999999933	2	\N	\N	1	2019-09-23	2019-09-23	\N	\N	2	1002	2	X
25	14	74	7	\N	3	122121	9877809.77999999933	2	\N	\N	1	2019-09-23	2019-09-23	2	1	1	1001	2	P
29	15	\N	7	\N	3	122121	9877809.77999999933	2	\N	\N	1	2019-09-23	2019-09-23	\N	\N	2	210202	2	P
\.


--
-- Name: menu_rol_id_mrol_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.menu_rol_id_mrol_seq', 65, true);


--
-- Name: t_adicionales_id_adicional_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.t_adicionales_id_adicional_seq', 17, true);


--
-- Name: t_calculo_id_calculo_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.t_calculo_id_calculo_seq', 2, true);


--
-- Name: t_comisiones_id_comision_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.t_comisiones_id_comision_seq', 7, true);


--
-- Name: t_concepto_id_concepto_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.t_concepto_id_concepto_seq', 3, true);


--
-- Name: t_factor_edad_id_fedad_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.t_factor_edad_id_fedad_seq', 104, true);


--
-- Name: t_menu_id_menu_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.t_menu_id_menu_seq', 17, true);


--
-- Name: t_parentesco_id_parentesco_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.t_parentesco_id_parentesco_seq', 8, true);


--
-- Name: t_personas_id_persona_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.t_personas_id_persona_seq', 11, true);


--
-- Name: t_plan_comision_id_planc_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.t_plan_comision_id_planc_seq', 3, true);


--
-- Name: t_plan_id_tplan_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.t_plan_id_tplan_seq', 5, true);


--
-- Name: t_polizas_id_poliza_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.t_polizas_id_poliza_seq', 128, true);


--
-- Name: t_roles_id_rol_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.t_roles_id_rol_seq', 6, true);


--
-- Name: t_semanas_id_semana_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.t_semanas_id_semana_seq', 2, true);


--
-- Name: t_tomadores_id_tomador_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.t_tomadores_id_tomador_seq', 15, true);


--
-- Name: t_tpago_id_tpago_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.t_tpago_id_tpago_seq', 10, true);


--
-- Name: t_tpoliza_id_tpoliza_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.t_tpoliza_id_tpoliza_seq', 12, true);


--
-- Name: t_usuarios_id_user_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.t_usuarios_id_user_seq', 6, true);


--
-- Name: t_vendedores_id_vendedor_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.t_vendedores_id_vendedor_seq', 8, true);


--
-- Name: t_ventas_id_venta_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.t_ventas_id_venta_seq', 30, true);


--
-- Name: t_adicionales pk_adicionales; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.t_adicionales
    ADD CONSTRAINT pk_adicionales PRIMARY KEY (id_adicional);


--
-- Name: t_factor_edad pk_fedad; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.t_factor_edad
    ADD CONSTRAINT pk_fedad PRIMARY KEY (id_fedad);


--
-- Name: t_menu pk_menu; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.t_menu
    ADD CONSTRAINT pk_menu PRIMARY KEY (id_menu);


--
-- Name: menu_rol pk_mrol; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.menu_rol
    ADD CONSTRAINT pk_mrol PRIMARY KEY (id_mrol);


--
-- Name: t_personas pk_persona; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.t_personas
    ADD CONSTRAINT pk_persona PRIMARY KEY (id_persona);


--
-- Name: t_plan_comision pk_planc; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.t_plan_comision
    ADD CONSTRAINT pk_planc PRIMARY KEY (id_planc);


--
-- Name: t_polizas pk_poliza; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.t_polizas
    ADD CONSTRAINT pk_poliza PRIMARY KEY (id_poliza);


--
-- Name: t_roles pk_rol; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.t_roles
    ADD CONSTRAINT pk_rol PRIMARY KEY (id_rol);


--
-- Name: t_semanas pk_semana; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.t_semanas
    ADD CONSTRAINT pk_semana PRIMARY KEY (id_semana);


--
-- Name: t_calculo pk_tcalculo; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.t_calculo
    ADD CONSTRAINT pk_tcalculo PRIMARY KEY (id_calculo);


--
-- Name: t_comisiones pk_tcomisiones; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.t_comisiones
    ADD CONSTRAINT pk_tcomisiones PRIMARY KEY (id_comision);


--
-- Name: t_concepto pk_tconcepto; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.t_concepto
    ADD CONSTRAINT pk_tconcepto PRIMARY KEY (id_concepto);


--
-- Name: t_tomadores pk_tomador; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.t_tomadores
    ADD CONSTRAINT pk_tomador PRIMARY KEY (id_tomador);


--
-- Name: t_tpago pk_tpago; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.t_tpago
    ADD CONSTRAINT pk_tpago PRIMARY KEY (id_tpago);


--
-- Name: t_parentesco pk_tparentesco; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.t_parentesco
    ADD CONSTRAINT pk_tparentesco PRIMARY KEY (id_parentesco);


--
-- Name: t_plan pk_tplan; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.t_plan
    ADD CONSTRAINT pk_tplan PRIMARY KEY (id_tplan);


--
-- Name: t_tpoliza pk_tpoliza; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.t_tpoliza
    ADD CONSTRAINT pk_tpoliza PRIMARY KEY (id_tpoliza);


--
-- Name: t_usuarios pk_user; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.t_usuarios
    ADD CONSTRAINT pk_user PRIMARY KEY (id_user);


--
-- Name: t_vendedores pk_vendedor; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.t_vendedores
    ADD CONSTRAINT pk_vendedor PRIMARY KEY (id_vendedor);


--
-- Name: t_ventas pk_ventas; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.t_ventas
    ADD CONSTRAINT pk_ventas PRIMARY KEY (id_venta);


--
-- Name: t_personas unique_id; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.t_personas
    ADD CONSTRAINT unique_id UNIQUE (identificacion);


--
-- Name: t_tomadores unique_id_t; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.t_tomadores
    ADD CONSTRAINT unique_id_t UNIQUE (identificacion);


--
-- Name: t_vendedores unique_id_v; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.t_vendedores
    ADD CONSTRAINT unique_id_v UNIQUE (identificacion);


--
-- PostgreSQL database dump complete
--

