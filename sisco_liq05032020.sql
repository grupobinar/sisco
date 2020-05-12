--
-- PostgreSQL database dump
--

-- Dumped from database version 11.5 (Debian 11.5-1+deb10u1)
-- Dumped by pg_dump version 11.5 (Debian 11.5-1+deb10u1)

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
-- Name: t_adicionales; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.t_adicionales (
    id_adicional bigint NOT NULL,
    identificacion character varying(20),
    nombres character varying(100),
    apellidos character varying(100),
    telefono character varying(30),
    usuario integer,
    fecha_registro timestamp without time zone,
    ult_mod timestamp without time zone,
    id_venta integer,
    id_parentesco integer,
    tomador character varying(50),
    edad date
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
    fecha_registro timestamp without time zone,
    ult_mod timestamp without time zone
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
-- Name: t_ccoordinador; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.t_ccoordinador (
    id_ccoordinador bigint NOT NULL,
    comision_c double precision,
    dom double precision
);


ALTER TABLE public.t_ccoordinador OWNER TO postgres;

--
-- Name: t_ccoordinador_id_ccoordinador_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.t_ccoordinador_id_ccoordinador_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.t_ccoordinador_id_ccoordinador_seq OWNER TO postgres;

--
-- Name: t_ccoordinador_id_ccoordinador_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.t_ccoordinador_id_ccoordinador_seq OWNED BY public.t_ccoordinador.id_ccoordinador;


--
-- Name: t_comisiones; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.t_comisiones (
    id_comision bigint NOT NULL,
    id_tcomision integer,
    id_tcalculo integer,
    cuota double precision,
    fecha_registro timestamp without time zone,
    ult_mod timestamp without time zone,
    id_usuario integer,
    min integer,
    max integer,
    id_plan integer,
    id_basec integer DEFAULT 1,
    estatus integer DEFAULT 0,
    c_minmax integer DEFAULT 0
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
    fecha_registro timestamp without time zone,
    ult_mod timestamp without time zone
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
-- Name: t_email; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.t_email (
    id_email bigint NOT NULL,
    email character varying(100)
);


ALTER TABLE public.t_email OWNER TO postgres;

--
-- Name: t_email_id_email_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.t_email_id_email_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.t_email_id_email_seq OWNER TO postgres;

--
-- Name: t_email_id_email_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.t_email_id_email_seq OWNED BY public.t_email.id_email;


--
-- Name: t_extornos; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.t_extornos (
    id_extorno bigint NOT NULL,
    id_venta integer,
    id_vendedor integer,
    monto_extornable double precision,
    monto_cuota double precision,
    cuotas_extornadas integer,
    fraccionar integer,
    cuotas_fraccionar integer,
    monto_fraccionado double precision,
    id_usuario integer,
    fecha_registro timestamp without time zone,
    ult_mod timestamp without time zone,
    id_estatus integer DEFAULT 0,
    observacion character varying(300),
    motivo integer,
    id_semana integer,
    monto_fraccionado_c double precision,
    monto_extornable_c double precision
);


ALTER TABLE public.t_extornos OWNER TO postgres;

--
-- Name: t_extornos_id_extorno_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.t_extornos_id_extorno_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.t_extornos_id_extorno_seq OWNER TO postgres;

--
-- Name: t_extornos_id_extorno_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.t_extornos_id_extorno_seq OWNED BY public.t_extornos.id_extorno;


--
-- Name: t_factor_edad; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.t_factor_edad (
    id_fedad bigint NOT NULL,
    edad integer,
    factor double precision,
    id_usuario integer,
    fecha_registro timestamp without time zone,
    ult_mod timestamp without time zone,
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
-- Name: t_liquidacion; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.t_liquidacion (
    id_venta integer,
    comision_liquidada double precision,
    id_liquidacion bigint NOT NULL,
    suma double precision,
    prima double precision,
    fecha_registro timestamp without time zone,
    ult_mod timestamp without time zone,
    usuario integer,
    comision_c double precision,
    estatus_l integer DEFAULT 0
);


ALTER TABLE public.t_liquidacion OWNER TO postgres;

--
-- Name: t_liquidacion_id_liquidacion_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.t_liquidacion_id_liquidacion_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.t_liquidacion_id_liquidacion_seq OWNER TO postgres;

--
-- Name: t_liquidacion_id_liquidacion_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.t_liquidacion_id_liquidacion_seq OWNED BY public.t_liquidacion.id_liquidacion;


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
-- Name: t_motivos; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.t_motivos (
    id_motivo bigint NOT NULL,
    motivo character varying(100),
    id_usuario integer,
    fecha_registro timestamp without time zone,
    ult_mod timestamp without time zone,
    estatus integer DEFAULT 0
);


ALTER TABLE public.t_motivos OWNER TO postgres;

--
-- Name: t_motivos_id_motivo_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.t_motivos_id_motivo_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.t_motivos_id_motivo_seq OWNER TO postgres;

--
-- Name: t_motivos_id_motivo_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.t_motivos_id_motivo_seq OWNED BY public.t_motivos.id_motivo;


--
-- Name: t_parentesco; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.t_parentesco (
    id_parentesco bigint NOT NULL,
    parentesco character varying(20),
    id_usuario integer,
    fecha_registro timestamp without time zone,
    ult_mod timestamp without time zone,
    estatus integer DEFAULT 0
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
    correo character varying(100),
    id_usuario integer,
    fecha_registro timestamp without time zone,
    ult_mod timestamp without time zone,
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
-- Name: t_plan; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.t_plan (
    id_tplan bigint NOT NULL,
    tplan character varying(20),
    id_usuario integer,
    fecha_registro timestamp without time zone,
    ult_mod timestamp without time zone
);


ALTER TABLE public.t_plan OWNER TO postgres;

--
-- Name: t_plan_comision; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.t_plan_comision (
    id_planc bigint NOT NULL,
    planc character varying(100),
    id_usuario integer,
    fecha_registro timestamp without time zone,
    ult_mod timestamp without time zone,
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
-- Name: t_polizas; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.t_polizas (
    id_poliza bigint NOT NULL,
    id_tpoliza integer,
    cobertura character varying(100),
    suma double precision,
    num_poliza character varying(20),
    id_usuario integer,
    fecha_registro timestamp without time zone,
    ult_mod timestamp without time zone,
    id_plan integer,
    estatus integer DEFAULT 0,
    id_sem_i date,
    id_sem_f date
);


ALTER TABLE public.t_polizas OWNER TO postgres;

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
    fecha_registro timestamp without time zone,
    ult_mod timestamp without time zone,
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
    fecha_registro timestamp without time zone,
    ult_mod timestamp without time zone,
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
    correo character varying(100),
    fecha_registro timestamp without time zone,
    ult_mod timestamp without time zone,
    usuario integer,
    tedad date
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
    fecha_registro timestamp without time zone,
    ult_mod timestamp without time zone,
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
-- Name: t_tpoliza; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.t_tpoliza (
    id_tpoliza bigint NOT NULL,
    tpoliza character varying(20),
    id_usuario integer,
    fecha_registro timestamp without time zone,
    ult_mod timestamp without time zone,
    factor double precision,
    estatus integer DEFAULT 0
);


ALTER TABLE public.t_tpoliza OWNER TO postgres;

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
    fecha_registro timestamp without time zone,
    ult_mod timestamp without time zone,
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
    correo character varying(100),
    fecha_registro timestamp without time zone,
    ult_mod timestamp without time zone,
    id_usuario integer,
    cod_vendedor integer,
    estatus integer DEFAULT 0
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
    id_comision integer DEFAULT 0,
    tipo_pago integer,
    referencia_pago character varying(100),
    monto double precision,
    cuotas_canceladas integer DEFAULT 0,
    extorno integer,
    fecha_extorno date,
    id_usuario integer,
    fecha_registro timestamp without time zone,
    ult_mod timestamp without time zone,
    id_plan integer,
    id_tpoliza integer,
    tventa integer,
    solicitud integer,
    id_semana integer,
    estatus_venta character varying(1) DEFAULT 'A'::character varying NOT NULL,
    id_sem integer
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
-- Name: t_ccoordinador id_ccoordinador; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.t_ccoordinador ALTER COLUMN id_ccoordinador SET DEFAULT nextval('public.t_ccoordinador_id_ccoordinador_seq'::regclass);


--
-- Name: t_comisiones id_comision; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.t_comisiones ALTER COLUMN id_comision SET DEFAULT nextval('public.t_comisiones_id_comision_seq'::regclass);


--
-- Name: t_concepto id_concepto; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.t_concepto ALTER COLUMN id_concepto SET DEFAULT nextval('public.t_concepto_id_concepto_seq'::regclass);


--
-- Name: t_email id_email; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.t_email ALTER COLUMN id_email SET DEFAULT nextval('public.t_email_id_email_seq'::regclass);


--
-- Name: t_extornos id_extorno; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.t_extornos ALTER COLUMN id_extorno SET DEFAULT nextval('public.t_extornos_id_extorno_seq'::regclass);


--
-- Name: t_factor_edad id_fedad; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.t_factor_edad ALTER COLUMN id_fedad SET DEFAULT nextval('public.t_factor_edad_id_fedad_seq'::regclass);


--
-- Name: t_liquidacion id_liquidacion; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.t_liquidacion ALTER COLUMN id_liquidacion SET DEFAULT nextval('public.t_liquidacion_id_liquidacion_seq'::regclass);


--
-- Name: t_menu id_menu; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.t_menu ALTER COLUMN id_menu SET DEFAULT nextval('public.t_menu_id_menu_seq'::regclass);


--
-- Name: t_motivos id_motivo; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.t_motivos ALTER COLUMN id_motivo SET DEFAULT nextval('public.t_motivos_id_motivo_seq'::regclass);


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
354	10	5
355	10	1
356	10	11
357	10	12
358	10	2
359	10	6
360	10	7
361	10	8
267	12	5
268	12	20
269	12	27
270	12	30
271	12	29
272	12	26
362	10	9
363	10	14
364	10	19
365	10	28
366	10	4
367	10	25
368	10	18
369	10	24
113	7	5
114	7	2
115	7	6
116	7	7
117	7	8
118	7	9
119	7	14
120	7	19
121	7	3
122	7	4
123	7	25
124	7	26
125	7	15
126	7	17
127	7	16
128	7	18
129	7	23
130	7	24
131	7	20
132	7	21
133	7	22
370	10	20
135	8	1
136	8	11
137	8	12
138	8	2
139	8	6
140	8	7
141	8	8
142	8	9
143	8	14
144	8	19
371	10	21
372	10	22
373	10	27
374	10	30
375	10	29
195	11	3
214	3	5
215	3	1
216	3	11
217	3	12
218	3	3
219	3	4
220	3	25
225	2	5
226	2	1
227	2	11
228	2	12
229	2	2
230	2	6
231	2	7
232	2	8
233	2	9
234	2	14
235	2	19
236	2	28
237	2	3
238	2	4
239	2	25
240	2	15
241	2	17
242	2	16
243	2	18
244	2	23
245	2	24
246	2	20
247	2	21
248	2	22
249	2	27
250	2	30
251	2	29
252	2	26
324	2	32
394	2	33
395	9	5
396	9	3
397	9	4
398	9	25
399	9	15
400	9	17
401	9	16
402	9	18
403	9	23
404	9	24
405	9	20
406	9	21
407	9	22
408	9	27
409	9	30
410	9	32
411	9	29
412	9	33
413	9	26
415	2	34
427	13	5
428	13	3
429	13	4
430	13	25
431	13	20
432	13	21
433	13	22
434	13	27
435	13	30
436	13	29
437	13	33
438	13	32
\.


--
-- Data for Name: t_adicionales; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.t_adicionales (id_adicional, identificacion, nombres, apellidos, telefono, usuario, fecha_registro, ult_mod, id_venta, id_parentesco, tomador, edad) FROM stdin;
43	V-12831944	JONNI GARCIA	\N	\N	1	2019-10-18 00:00:00	2019-10-18 00:00:00	152	5	V-4813038	\N
44	V-16683076	DUMARY YEPEZ	\N	\N	1	2019-10-18 00:00:00	2019-10-18 00:00:00	152	5	V-4813038	\N
45	V-18487763	YORDANYS YEPEZ	\N	\N	1	2019-10-18 00:00:00	2019-10-18 00:00:00	152	5	V-4813038	\N
46	V-	OSUNA ABDIEL	\N	\N	1	2019-10-18 00:00:00	2019-10-18 00:00:00	160	6	V-20629763	\N
47	V-14908633	OROPEZA ALEJANDRO	\N	\N	1	2019-10-18 00:00:00	2019-10-18 00:00:00	165	5	V-5541862	\N
48	V-19375265	LUIS GERRES	\N	\N	1	2019-10-21 00:00:00	2019-10-21 00:00:00	190	5	V-15663212	\N
49	V-13275584	LUIS BASTIDAS	\N	\N	1	2019-10-21 00:00:00	2019-10-21 00:00:00	191	5	V-22063537	\N
50	V-12752215	JOSE BASTIDAS	\N	\N	1	2019-10-21 00:00:00	2019-10-21 00:00:00	191	5	V-22063537	\N
51	V-15884521	CARLOS BASTIDAS	\N	\N	1	2019-10-21 00:00:00	2019-10-21 00:00:00	191	5	V-22063537	\N
52	V-21415817	HERNANDEZ KATHERIN	\N	\N	1	2019-10-21 00:00:00	2019-10-21 00:00:00	194	1	V-20220170	\N
53	V-23885630	DEUMAR PEÑA	\N	\N	1	2019-10-21 00:00:00	2019-10-21 00:00:00	195	5	V-12071093	\N
54	V-16225941	PASQUIER KEYLA	\N	\N	1	2019-10-21 00:00:00	2019-10-21 00:00:00	195	5	V-12071093	\N
55	V-26576636	GIANFRANCO GONZALEZ	\N	\N	1	\N	\N	199	5	V-13895400	\N
56	V-17772949	BARRIOS LUIS	\N	\N	1	\N	\N	199	5	V-13895400	\N
57	V-9887087	PERDOMO VICTOR	\N	\N	1	\N	\N	214	8	V-23965827	\N
58	V-16116078	DIAZ LAURA	\N	\N	1	\N	\N	215	1	V-19398929	\N
59	V-14363998	GONZALEZ DEIVIS	\N	\N	1	\N	\N	219	1	V-15404979	\N
60	V-18269545	GONZALEZ FREDDY	\N	\N	1	\N	\N	219	1	V-15404979	\N
61	V-26745261	RAMIREZ JUAN	\N	\N	1	\N	\N	220	5	V-16618201	\N
62	V-27270701	BETTI MARQUEZ	\N	\N	1	\N	\N	220	6	V-16618201	\N
63	V-18329615	MARTINEZ ROSSY	\N	\N	1	\N	\N	221	1	V-19710831	\N
64	V-25051372	MARINEZ PRADA	\N	\N	1	\N	\N	221	1	V-19710831	\N
65	V-14158008	ARIAS SARA	\N	\N	1	\N	\N	223	1	V-20154960	\N
66	V-32502234	YSAURA BOLIVAR	\N	\N	1	\N	\N	226	8	V-24058347	\N
67	V-20327367	CANO ANDREA	\N	\N	1	\N	\N	228	1	V-17855202	\N
68	V-20327366	MARCANO ANDREINA	\N	\N	1	\N	\N	228	1	V-17855202	\N
69	V-31412799	CANO BRITNAY	\N	\N	1	\N	\N	228	6	V-17855202	\N
70	V-32291973	UZCATEGUI NATHALY	\N	\N	1	\N	\N	228	6	V-17855202	\N
71	V-33206727	UZCATEGUI MATHIAS	\N	\N	1	\N	\N	228	6	V-17855202	\N
72	V-5645685	ZAMBRANO RUIZ	\N	\N	1	\N	\N	229	8	V-24295373	\N
73	V-28338274	VALERA KEVIN	\N	\N	1	\N	\N	231	1	V-19767690	\N
74	V-6406596	ACOSTA PEDRO	\N	\N	1	\N	\N	239	8	V-19373368	\N
75	V-13687821	GANCHOZO JAHIR	\N	\N	1	\N	\N	253	1	V-15820503	\N
76	V-11921334	GUTIERREZ MILEIDY	\N	\N	1	\N	\N	255	8	V-25219937	\N
77	V-5072051	PEREZ MIRIAM	\N	\N	1	\N	\N	256	1	V-6400296	\N
78	V-6981162	FERNANDEZ JOSE	\N	\N	1	\N	\N	256	1	V-6400296	\N
79	V-8555668	FERNANDEZ RAFAEL	\N	\N	1	\N	\N	256	1	V-6400296	\N
80	V-10506964	FERNANDEZ RODOLFO	\N	\N	1	\N	\N	256	1	V-6400296	\N
81	V-6910367	GONZALEZ PEREZ	\N	\N	1	\N	\N	256	2	V-6400296	\N
82	V-2585139	GONZALEZ TEOFILA	\N	\N	1	\N	\N	261	8	V-25939121	\N
83	V-2708510	BASTIDAS  MIGUEL	\N	\N	1	\N	\N	261	8	V-25939121	\N
84	V-25770536	rodriguez Maria	\N	\N	1	\N	\N	267	5	V-14291200	\N
85	V-	Briana Guevara	\N	\N	1	\N	\N	267	4	V-14291200	\N
86	V-19852002	Muñoz Daykslyn	\N	\N	1	\N	\N	275	1	V-19852004	\N
87	V-29989646	Soler Daniela	\N	\N	1	\N	\N	275	1	V-19852004	\N
88	V-23640074	ZAMBRANO YELISA	\N	\N	1	\N	\N	276	1	V-17974424	\N
89	V-25991881	ROJAS MILEXY	\N	\N	1	\N	\N	277	1	V-10821111	\N
90	V-	BRAVOS MILAN	\N	\N	1	\N	\N	277	6	V-10821111	\N
91	V-15928728	granados zulay	\N	\N	1	\N	\N	278	5	V-6244949	\N
92	V-15928828	GRANADOS ZULAY	\N	\N	1	\N	\N	278	5	V-6244949	\N
93	V-17977001	GRANADOS JACKSON	\N	\N	1	\N	\N	278	5	V-6244949	\N
94	V-17977002	GRANADOS YAJAIRA	\N	\N	1	\N	\N	278	5	V-6244949	\N
95	V-24287916	FERNSNDEZ MORS	\N	\N	1	\N	\N	278	5	V-6244949	\N
96	V-10500004	VALBUENA JOSE	\N	\N	1	\N	\N	280	3	V-18331977	\N
97	V-18762683	GUTIERREZ MIGUEL	\N	\N	1	\N	\N	281	5	V-9462324	\N
98	V-19669947	Dominguez Anny	\N	\N	1	\N	\N	284	1	V-17618807	\N
99	V-15085105	MOLINA JOSE	\N	\N	1	\N	\N	288	1	V-11690541	\N
100	V-11689289	MOLINA MARIA	\N	\N	1	\N	\N	288	1	V-11690541	\N
101	V-23640319	ARROYO FERNANDEZ	\N	\N	1	\N	\N	293	8	V-25482760	\N
102	V-12688389	BRITO DILIA	\N	\N	1	\N	\N	295	1	V-6350672	\N
103	V-10869348	ramos Richard	\N	\N	1	\N	\N	296	8	V-6358518	\N
104	V-29640170	QUINTERO VALERIA	\N	\N	1	\N	\N	297	1	V-18021344	\N
105	V-	MILLAN AZAEL	\N	\N	1	\N	\N	299	4	V-6670943	\N
106	V-14036940	GONZALEZ KEYVI	\N	\N	1	\N	\N	329	5	V-14036940	1998-03-09
107		keyvi	malpica	\N	\N	\N	\N	320	\N	V-14036940	1998-03-09
108		Nicole	Martinez	\N	\N	\N	\N	327	\N	V-10692135	2014-04-22
109	V-20820653	Maria	Guevara	\N	\N	\N	\N	327	\N	V-10692135	1992-04-17
110	V-6302717	JULIO RENGIFO		\N	\N	\N	\N	228	\N	V-17268191	1955-08-24
111	V-12614452	DALYANA RODRIGUEZ		\N	\N	\N	\N	166	\N	V-12977168	1972-09-04
112	V-31870679	YUBIANNYS LEZAMA		\N	\N	\N	\N	204	\N	V-25097811	2005-09-09
113	V-	GLEIDYS MENDEZ		\N	\N	\N	\N	226	\N	V-24058347	2009-06-21
114	V-27916322	EDGAR MOLINA		\N	\N	\N	\N	288	\N	V-11690541	2000-10-20
115	V-33206727	DAYANA CANO		\N	\N	\N	\N	228	\N	V-17855202	2010-04-05
116	V-26064585	MARIA RUIZ		\N	\N	\N	\N	190	\N	V-15663212	1998-03-06
117	V-16226985	LEON BRIAN	\N	\N	19	\N	\N	332	5	V-6005227	1983-02-09
118	V-18752120	LEON ALY	\N	\N	19	\N	\N	332	5	V-6005227	1989-09-20
119	V-18752120	LEON FELIX	\N	\N	19	\N	\N	332	5	V-6005227	1989-09-20
120	V-21107996	PACHON SIRIA	\N	\N	19	\N	\N	336	1	V-17675933	1993-01-08
121	V-19513644	MUÑOZ FREDDY	\N	\N	19	\N	\N	337	1	V-19513672	1996-01-04
122	V-9373621	BALZA MARIA	\N	\N	19	\N	\N	344	1	V-19508270	1967-12-12
123	V-19508268	DAVID GREGORY	\N	\N	19	\N	\N	344	1	V-19508270	1989-07-27
124	V-28180308	DAVID GREILI	\N	\N	19	\N	\N	344	1	V-19508270	2001-08-25
125	V-27941430	ALIENDO MELANIE	\N	\N	19	\N	\N	345	5	V-14535798	2000-11-28
126	V-21378124	VOTTARIELO IBARRA KEVIN	\N	\N	19	\N	\N	347	5	V-10828147	1994-04-02
127	V-24407972	VOTTARIELO MARIA 	\N	\N	19	\N	\N	347	5	V-10828147	1997-03-06
128	V-15074559	MOLINA LUIS	\N	\N	19	\N	\N	351	1	V-10904810	1979-10-08
129	V-16907060	MOLINA CESAR	\N	\N	19	\N	\N	351	1	V-10904810	1983-01-11
130	V-5638232	AZUAJE MARIA	\N	\N	19	\N	\N	354	8	V-16827867	1956-08-30
131	V-5638232	AZUAJE MARIA	\N	\N	19	\N	\N	355	8	V-16827867	1956-08-30
132	V-25160837	COLINA OSCAR	\N	\N	19	\N	\N	358	1	V-25347188	1995-01-31
133	V-27298834	COLINA MELANY	\N	\N	19	\N	\N	358	1	V-25347188	1999-09-19
134	V-24750138	SILVERA FRANYERLY 	\N	\N	19	\N	\N	360	5	V-7947676	1993-06-24
135	V-26323645	VELASCO ANFROIMAR	\N	\N	19	\N	\N	360	5	V-7947676	1999-07-27
136	V-24750138	FRANYERLI SILVERA	\N	\N	19	\N	\N	361	5	V-7947676	1993-06-24
137	V-26323645	VELASCO ANFROIMAR	\N	\N	19	\N	\N	361	5	V-7947676	1999-07-27
138	V-24750139	SILVERA HEINDER	\N	\N	19	\N	\N	361	5	V-7947676	1994-07-06
139	V-27903821	KAIRUZ AMAIZ	\N	\N	19	\N	\N	361	5	V-7947676	2000-06-21
140	V-20102163	RODRIGUEZ MANUEL	\N	\N	1	\N	\N	363	1	V-17453895	1990-10-17
141	V-19018421	RODRIGUEZ MANUEL	\N	\N	1	\N	\N	363	1	V-17453895	1988-01-26
142	V-13691801	ACOSTA YDALMIS	\N	\N	1	\N	\N	363	1	V-17453895	1977-07-12
143	V-20102163	RODRIGUEZ MANUEL	\N	\N	1	\N	\N	364	1	V-17453895	1990-10-17
144	V-19018421	RODRIGUEZ MANUEL	\N	\N	1	\N	\N	364	1	V-17453895	1988-01-26
145	V-13691801	ACOSTA YDALMIS	\N	\N	1	\N	\N	364	1	V-17453895	1977-07-12
146	V-20102163	RODRIGUEZ MANUEL	\N	\N	1	\N	\N	365	1	V-17453895	1990-10-17
147	V-19018421	RODRIGUEZ MANUEL	\N	\N	1	\N	\N	365	1	V-17453895	1988-01-26
148	V-13691801	ACOSTA YDALMIS	\N	\N	1	\N	\N	365	1	V-17453895	1977-07-12
149	V-27881681	RODRIGUEZ ORLANDYS	\N	\N	1	\N	\N	366	5	V-12961201	1997-04-13
150	V-	RODRIGUEZ ZAILI	\N	\N	1	\N	\N	366	4	V-12961201	2017-08-26
151	V-12411210	PERDOMO FERNANDO	\N	\N	1	\N	\N	372	1	V-13993925	1975-09-30
152	V-20102163	RODRIGUEZ MANUEL	\N	\N	1	\N	\N	374	1	V-17453895	1990-10-17
153	V-19018421	RODRIGUEZ MANUEL	\N	\N	1	\N	\N	374	1	V-17453895	1988-01-26
154	V-13691801	ACOSTA YDALMIS	\N	\N	1	\N	\N	374	1	V-17453895	1977-07-12
155	V-26740077	GONZALEZ LISMEN	\N	\N	1	\N	\N	374	6	V-17453895	1998-09-08
156	V-22646165	ARTEAGA WENDY	\N	\N	1	\N	\N	376	5	V-13405592	1994-09-19
157	V-	HERNANDEZ MIA	\N	\N	1	\N	\N	376	4	V-13405592	2014-07-20
158	V-10507617	VILLANUEVA SONIA	\N	\N	1	\N	\N	376	1	V-13405592	1969-01-07
159	V-12358097	VILLANUEVA JOSE	\N	\N	1	\N	\N	376	1	V-13405592	1972-06-30
160	V-11817340	MONTILVA ORLANDO	\N	\N	1	\N	\N	379	1	V-15714753	1974-05-08
161	V-10471999	MONTEROLA MARIA	\N	\N	1	\N	\N	387	1	V-11560872	1970-03-03
162	V-14973265	DAMAS CARMEN	\N	\N	1	\N	\N	389	8	V-17947914	1978-10-17
163	V-28311786	QUINTANA YIMMI	\N	\N	1	\N	\N	389	6	V-17947914	2000-11-10
164	V-32731441	QUINTANA MOISES	\N	\N	1	\N	\N	389	6	V-17947914	2008-03-28
165	V-26741428	BUITRIAGO ORIANA	\N	\N	1	\N	\N	391	5	V-12827725	1999-03-18
166	V-6837476	LONGA MAIGUALIDA	\N	\N	1	\N	\N	392	1	V-10511134	1963-03-27
167	V-27693269	LONDAÑO CRISMAR	\N	\N	1	\N	\N	393	5	V-13395269	2000-11-26
168	V-16564866	SANDOVAL JUSTER	\N	\N	1	\N	\N	394	5	V-9455026	1985-11-27
169	V-20911461	SANDOVAL JORDAN	\N	\N	1	\N	\N	394	5	V-9455026	1992-03-05
170	V-	SANDOVAL DARYELIS	\N	\N	1	\N	\N	394	4	V-9455026	2003-10-03
171	V-28053613	ARANGUREN ENMANUEL	\N	\N	1	\N	\N	394	6	V-9455026	2001-08-09
172	V-15324865	SILVA TRINO	\N	\N	1	\N	\N	395	1	V-15324851	1982-12-11
173	V-17424928	SILVA NATHALY	\N	\N	1	\N	\N	395	1	V-15324851	1984-07-14
174	V-18840819	SILVA MIGUEL	\N	\N	1	\N	\N	395	1	V-15324851	1985-11-26
175	V-18840820	SILVA DEIVIS	\N	\N	1	\N	\N	395	1	V-15324851	1984-12-30
176	V-32786576	SILVA BRAYAN	\N	\N	1	\N	\N	395	6	V-15324851	2005-07-10
177	V-	RIVAS SEBASTIAN	\N	\N	1	\N	\N	395	6	V-15324851	2012-10-21
178	V-21130179	ARMAS IBRAHIM	\N	\N	1	\N	\N	397	5	V-6693427	1991-12-29
179	V-23188709	ARMAS ISMAR	\N	\N	1	\N	\N	397	1	V-6693427	1993-11-12
180	V-25516865	ARMAS FRANKLIN	\N	\N	1	\N	\N	397	5	V-6693427	1997-04-02
181	V-28158376	ARMAS JESUS	\N	\N	1	\N	\N	397	5	V-6693427	1999-11-08
182	V-28158365	ARMAS YSMARY	\N	\N	1	\N	\N	397	5	V-6693427	2001-01-14
183	V-16007472	BARRIOS JHONNY	\N	\N	1	\N	\N	397	1	V-6693427	1983-08-12
184	V-26966127	RIVAS NATHALY	\N	\N	1	\N	\N	399	5	V-16604231	1998-12-18
185	V-	VARGAS EDWARD	\N	\N	1	\N	\N	399	4	V-16604231	2005-05-09
186	V-25220517	BARRIOS YILIANNY	\N	\N	1	\N	\N	401	5	V-13123687	1996-11-03
187	V-	SOTO YOZARETH	\N	\N	1	\N	\N	401	4	V-13123687	2018-02-20
188	V-6981219	GUZMAN ALFREDA	\N	\N	1	\N	\N	402	1	V-10497612	1961-11-08
189	V-26994945	ROJAS OMAR	\N	\N	1	\N	\N	402	5	V-10497612	1999-12-02
190	V-23624818	ROJAS ALWIN	\N	\N	1	\N	\N	402	5	V-10497612	1995-11-15
191	V-14742480	OCANDO CARLOS	\N	\N	1	\N	\N	403	5	V-6390672	1980-10-22
192	V-16714753	MONTILVA DESIREE	\N	\N	1	\N	\N	403	8	V-6390672	1991-07-01
193	V-32954141	OCANDO OSCAR	\N	\N	1	\N	\N	403	4	V-6390672	2008-12-06
194	V-32410518	OCANDO FERNANDA	\N	\N	1	\N	\N	403	4	V-6390672	2007-12-27
195	V-	OCANDO CARLOS	\N	\N	1	\N	\N	403	4	V-6390672	2015-10-25
196	V-	URIBE ORLANDO	\N	\N	1	\N	\N	403	4	V-6390672	2015-05-11
197	V-15151743	URIBE KARIANA	\N	\N	1	\N	\N	403	8	V-6390672	1982-05-01
198	V-19227970	GARCIA ALEWIS	\N	\N	1	\N	\N	404	5	V-10113261	1989-02-01
199	V-33148343	VALDEZ ANDERSON	\N	\N	1	\N	\N	404	4	V-10113261	2008-09-13
200	V-26994490	ANGULO MARIA	\N	\N	19	\N	\N	406	5	V-14225270	1998-04-17
201	V-6342582	CARRILLO CARLOS	\N	\N	19	\N	\N	408	2	V-10691280	1962-02-23
202	V-28152527	PEREIRA AYRTON	\N	\N	19	\N	\N	410	5	V-11930566	2000-09-05
203	V-23682158	TRIVIÑO JUAN	\N	\N	19	\N	\N	412	1	E-81663838	1958-08-28
204	V-16033492	TRIVIÑO OSCAR	\N	\N	19	\N	\N	412	5	E-81663838	1983-05-31
205	V-23692622	MOLINA ALI	\N	\N	19	\N	\N	413	8	V-12361078	1994-07-21
206	V-25846418	CAMACHO JOSE	\N	\N	19	\N	\N	413	5	V-12361078	1996-11-17
207	V-32549125	CAMACHO ROSA	\N	\N	19	\N	\N	413	6	V-12361078	2007-09-17
208	V-15822927	CAMACHO EUCLIDES	\N	\N	19	\N	\N	413	1	V-12361078	1981-02-05
209	V-19962449	CAMACHO BETSI	\N	\N	19	\N	\N	413	1	V-12361078	1989-04-07
210	V-12596125	CAMACHO LUIS	\N	\N	19	\N	\N	413	1	V-12361078	1970-04-21
211	V-14057154	CAMACHO CARMEN	\N	\N	19	\N	\N	413	1	V-12361078	1977-08-29
212	V-23692622	ALI MOLINA	\N	\N	19	\N	\N	414	8	V-12361078	1994-07-21
213	V-25846418	CAMACHO JOSE	\N	\N	19	\N	\N	414	5	V-12361078	1994-07-21
214	V-32549125	CAMACHO ROSA	\N	\N	19	\N	\N	414	6	V-12361078	2007-09-17
215	V-15822927	CAMACHO EUCLIDES	\N	\N	19	\N	\N	414	1	V-12361078	1981-02-05
216	V-19962449	CAMACHO BETSI	\N	\N	19	\N	\N	414	1	V-12361078	1989-04-07
217	V-12596125	CAMACHO LUIS	\N	\N	19	\N	\N	414	1	V-12361078	1970-04-21
218	V-14057154	CAMACHO CARMEN	\N	\N	19	\N	\N	414	1	V-12361078	1977-08-29
219	V-5638232	AZUAJE MARIA	\N	\N	1	\N	\N	427	8	V-16827867	1956-08-30
220	V-17974733	ZAMBRANO SERGIO	\N	\N	1	\N	\N	430	1	V-17974731	1985-05-09
221	V-19351539	LUCERO CENDI	\N	\N	1	\N	\N	430	8	V-17974731	1989-08-14
222	V-18814573	ELORZA YORGENIS	\N	\N	1	\N	\N	432	5	V-6229771	1990-03-21
223	V-20615560	ELORZA YORAIMARA	\N	\N	1	\N	\N	432	5	V-6229771	1994-02-08
224	V-20128832	ELORZA GENARI	\N	\N	1	\N	\N	432	5	V-6229771	1992-02-04
225	V-22015130	MILANEZ LEWIS	\N	\N	1	\N	\N	433	5	V-12470276	1992-01-05
226	V-22015131	MILANEZ WENDY	\N	\N	1	\N	\N	433	5	V-12470276	1993-02-11
227	V-26254932	MILANEZ JOHANNY	\N	\N	1	\N	\N	433	5	V-12470276	1995-09-17
228	V-11070390	MERENTES JOEL	\N	\N	1	\N	\N	433	1	V-12470276	1972-01-27
229	V-27391261	ANGULO MEDINA 	\N	\N	1	\N	\N	434	5	V-12824265	1999-12-02
230	V-14876106	MANAURE YOEL	\N	\N	19	\N	\N	438	5	V-5977404	1983-07-13
231	V-27371415	TORRES LUIS	\N	\N	19	\N	\N	438	5	V-5977404	1999-10-27
232	V-10090333	GONZALEZ BETTY	\N	\N	19	\N	\N	439	8	V-15198301	1967-10-29
233	V-6436154	CARRERA ANTONIO	\N	\N	19	\N	\N	440	3	V-15838795	1960-01-24
234	V-31046761	URBINA DALESKA	\N	\N	19	\N	\N	441	5	V-5528846	1999-08-17
235	V-27472798	GARCIA RAFAEL	\N	\N	19	\N	\N	445	5	V-6956862	1999-10-20
236	V-27374871	DIAZ MARIELSY	\N	\N	19	\N	\N	447	1	V-22032491	1999-10-25
237	V-30309151	ESNEIDER BAILON	\N	\N	19	\N	\N	471	1	V-17390212	2003-07-23
238	V-29743499	GONZALEZ JOSE	\N	\N	19	\N	\N	479	1	V-18485472	2002-11-12
239	V-	RUDA GENESIS	\N	\N	19	\N	\N	479	1	V-18485472	2010-08-08
240	V-27793041	LORENZO ROGER	\N	\N	19	\N	\N	479	1	V-18485472	1999-02-16
241	V-25253218	IRALA ADRIANA	\N	\N	19	\N	\N	487	5	V-4163051	1994-12-14
242	V-25523776	IZAGUIRRE PITER	\N	\N	19	\N	\N	488	1	V-17709389	1994-09-11
243	V-25369544	MENDOZA LUIS	\N	\N	19	\N	\N	490	5	V-9860452	1961-05-13
244	V-18020179	MUJICA XACHATA	\N	\N	19	\N	\N	491	5	V-6190203	1987-07-29
245	V-21414410	MUJICA XAMUEL	\N	\N	19	\N	\N	491	5	V-6190203	1993-08-09
246	V-6388981	RONDON GERMAN	\N	\N	19	\N	\N	493	5	V-5313082	1958-05-21
247	V-19066467	VILLAMIZAR DANTELA	\N	\N	19	\N	\N	494	5	V-10625232	1989-09-25
248	V-31117494	VILLAMIZAR MEDINA	\N	\N	19	\N	\N	494	5	V-10625232	1992-05-23
249	V-	JESSIBETH RIOS	\N	\N	19	\N	\N	495	8	V-20175280	2010-11-27
250	V-28007732	JIMENEZ JESUS	\N	\N	19	\N	\N	496	5	V-11562494	2000-01-21
251	V-25225898	JIMENEZ NAIBELYS	\N	\N	19	\N	\N	496	5	V-11562494	1997-01-13
252	V-26012757	JIMENEZ NAUDIMAR	\N	\N	19	\N	\N	496	5	V-11562494	1998-03-13
253	V-25542213	BOGADO JOSBEL	\N	\N	19	\N	\N	497	5	V-11471627	1995-11-22
254	V-27262423	CASTRO UZCANGA	\N	\N	19	\N	\N	497	5	V-11471627	1998-01-05
255	V-29738317	ORTIZ LUZKEINY	\N	\N	19	\N	\N	498	5	E-83078198	2000-11-03
256	V-24901712	VASQUEZ AMPARO	\N	\N	19	\N	\N	498	3	E-83078198	1967-01-08
257	V-28059171	MORALES JONDRY	\N	\N	19	\N	\N	505	5	V-13841927	1998-04-24
258	V-28059170	MORALES JUNIO	\N	\N	19	\N	\N	505	5	V-13841927	2000-08-07
259	V-27099262	HERRERA VICTOR	\N	\N	19	\N	\N	506	5	V-17142304	1999-11-17
260	V-15133276	TIRADO PEDRO	\N	\N	19	\N	\N	508	1	V-12123075	1982-11-24
261	V-15133275	TIRADO FERNNADO	\N	\N	19	\N	\N	508	1	V-12123075	1979-08-09
262	V-18313452	TIRADO JOAN	\N	\N	19	\N	\N	508	1	V-12123075	1986-06-01
263	V-13123076	TIRADO DORIS	\N	\N	19	\N	\N	508	1	V-12123075	1976-04-13
264	E-83646267	MERO JENNY	\N	\N	19	\N	\N	509	8	V-24883228	1977-03-17
265	V-27794250	LEON EDWISBEL	\N	\N	19	\N	\N	513	8	V-22444405	2001-01-01
266	V-29756529	LEON YERINES	\N	\N	19	\N	\N	513	8	V-22444405	2003-04-07
267	V-26396420	BIERMA WILMER	\N	\N	19	\N	\N	515	5	V-16085907	1997-07-31
268	V-14129821	BIERMA JOSE	\N	\N	19	\N	\N	515	1	V-16085907	1980-08-13
269	V-15586767	BIERMA LEIDY	\N	\N	19	\N	\N	515	1	V-16085907	1982-09-09
270	V-	GARRIDO JEAIR	\N	\N	19	\N	\N	517	4	V-19201091	2017-12-16
271	V-	ORTIZ YERMAN	\N	\N	19	\N	\N	517	4	V-19201091	2019-01-21
272	V-6387149	ANGULO ALEXIS	\N	\N	19	\N	\N	518	1	V-6392554	1959-08-12
273	V-23947147	ZAPATA ROLANDO	\N	\N	19	\N	\N	520	5	V-6708455	1993-04-12
274	V-20336272	MONTILLA ALDEMAR	\N	\N	19	\N	\N	521	5	V-10632021	1992-04-18
275	V-26680662	MONTILLA JHONNY	\N	\N	19	\N	\N	521	5	V-10632021	1999-04-02
276	V-	SUAREZ CRHISTIAN	\N	\N	19	\N	\N	522	8	V-16670300	2003-01-31
277	V-17159006	SANCHEZ VANESSA	\N	\N	19	\N	\N	523	1	V-15166658	1986-01-21
278	V-17079163	SANCHEZ JOSE	\N	\N	19	\N	\N	523	1	V-15166658	1985-02-22
279	V-	DUARTE JOSE	\N	\N	19	\N	\N	523	6	V-15166658	2014-08-02
280	V-25510258	RONDON MANUEL	\N	\N	19	\N	\N	524	5	V-14046439	1996-12-08
281	V-26530962	RONDON LUIS	\N	\N	19	\N	\N	524	5	V-14046439	1998-09-09
282	V-27279013	CARABALLO CESAR	\N	\N	19	\N	\N	524	5	V-14046439	2000-06-12
283	V-24724652	ALDANA JAIME	\N	\N	19	\N	\N	525	5	V-4578591	1996-02-20
284	V-28417793	MORA CRYSTI	\N	\N	19	\N	\N	527	5	V-14791126	2000-01-03
285	V-24655748	ESCALONA LUZ	\N	\N	19	\N	\N	529	5	V-22900373	1994-10-08
286	V-26159947	MARTINEZ JAVIER	\N	\N	19	\N	\N	529	8	V-22900373	1996-05-14
287	V-27585181	PINO WILLI	\N	\N	19	\N	\N	533	5	V-14720470	1998-09-24
288	V-22670088	URIEPERO DAYERLING	\N	\N	19	\N	\N	540	5	V-14745562	1994-11-27
289	V-26794334	URIEPERO JUAN	\N	\N	19	\N	\N	540	5	V-14745562	1998-02-10
290	V-28494482	URIEPERO ESTEFANI	\N	\N	19	\N	\N	540	5	V-14745562	2000-04-09
291	V-16153941	VASQUEZ JOHAN	\N	\N	19	\N	\N	541	1	V-18111804	1984-06-19
292	V-19582586	CANALES GABRIELA	\N	\N	19	\N	\N	543	5	V-7929274	1991-07-30
293	V-27451994	CANALES NAZARETH	\N	\N	19	\N	\N	543	5	V-7929274	1999-03-17
294	V-21174946	SALAZAR YONAR	\N	\N	19	\N	\N	544	1	V-21174944	1987-08-01
295	V-15132513	BURGUILLOS JULIO	\N	\N	19	\N	\N	548	5	V-6849923	1981-05-15
296	V-17529924	SANGRONIS JESSICA	\N	\N	19	\N	\N	548	5	V-6849923	1984-04-22
297	V-28078623	BARAZARTE EYLEEN	\N	\N	19	\N	\N	549	5	V-5635672	1999-05-24
298	V-	CARRION IGNACIO	\N	\N	19	\N	\N	557	8	V-19105862	2017-09-20
299	V-15761658	CARRION HAMILTON	\N	\N	19	\N	\N	557	8	V-19105862	1978-02-26
300	V-23813418	ADAN ROXANA	\N	\N	19	\N	\N	557	1	V-19105862	1993-03-15
301	V-13265786	ADAN LUISA	\N	\N	19	\N	\N	557	1	V-19105862	1978-10-18
302	V-	FLORES SAMANTA	\N	\N	19	\N	\N	557	6	V-19105862	2014-12-01
303	V-	AMARO DIEGO	\N	\N	19	\N	\N	557	6	V-19105862	2013-01-24
304	V-10949175	JIMENEZ ZULAY	\N	\N	19	\N	\N	559	1	V-10383010	1969-04-17
305	V-19979562	JIMENEZ ENYERLYS	\N	\N	19	\N	\N	559	1	V-10383010	1991-11-29
306	V-23433499	JIMENEZ JESUS	\N	\N	19	\N	\N	559	5	V-10383010	1993-02-15
307	V-26809661	JIMENEZ JOSE	\N	\N	19	\N	\N	559	5	V-10383010	1998-10-03
308	V-19873920	RIVERO DERWIR	\N	\N	19	\N	\N	559	6	V-10383010	1990-06-02
309	V-10743298	MORA JUAN	\N	\N	19	\N	\N	560	3	V-15161907	1972-05-07
310	V-16021777	MORA RONALD	\N	\N	19	\N	\N	560	1	V-15161907	1983-07-30
311	V-22393133	SANDOVAL JANNY	\N	\N	19	\N	\N	563	5	V-6929641	1993-09-03
312	V-20491076	LAOZ GILME	\N	\N	19	\N	\N	563	8	V-6929641	1989-10-16
313	V-12419145	DONAIRE MIGUEL	\N	\N	19	\N	\N	563	1	V-6929641	1973-09-26
314	V-24205404	VILLA  OMAR	\N	\N	19	\N	\N	566	5	V-9156953	1996-01-19
315	V-23622438	GOUVEIA SCARLET	\N	\N	19	\N	\N	576	1	V-17144850	1993-03-26
316	V-28116386	GOUVEIA JOSE	\N	\N	19	\N	\N	576	1	V-17144850	2000-12-15
317	V-	MONTES LUNA	\N	\N	19	\N	\N	576	6	V-17144850	2012-11-02
318	V-5083587	MOROCOIMA ELVIRA	\N	\N	19	\N	\N	578	6	V-26861580	1956-12-25
319	V-19497130	EMILSYS ZONILLA	\N	\N	19	\N	\N	582	1	V-20594129	1990-09-26
320	V-14019237	RODRIGUEZ YESSICA	\N	\N	19	\N	\N	583	1	V-27916524	1979-01-11
321	V-30709217	MAZA MARVIT	\N	\N	19	\N	\N	585	6	V-20616256	2004-12-19
322	V-32652979	MAZA MARIA	\N	\N	19	\N	\N	585	6	V-20616256	2006-10-24
323	V-18367757	ALEXANDRA  REYES	\N	\N	19	\N	\N	586	2	V-19203384	1989-05-02
324	V-25641947	ALEXANDER REYES	\N	\N	19	\N	\N	586	2	V-19203384	1996-10-10
325	V-27318112	BELLO JOEL	\N	\N	19	\N	\N	597	5	V-11036180	1999-11-30
326	V-26646118	GUEVARA IVAN	\N	\N	19	\N	\N	600	8	V-13401161	1996-06-24
327	V-13385446	GONZALEZ NATHALI	\N	\N	19	\N	\N	600	1	V-13401161	1978-08-30
328	V-34898271	CAMPOS DAWLIN	\N	\N	19	\N	\N	602	5	V-10000021	1995-03-08
329	V-26268693	CAMPOS VERONICA	\N	\N	19	\N	\N	602	5	V-10000021	1996-07-14
330	V-20631262	DURAN JESUS	\N	\N	19	\N	\N	602	8	V-10000021	1990-06-07
331	V-21301597	YEISY LLOVERA	\N	\N	19	\N	\N	603	5	V-11277282	1989-12-02
332	V-27234579	FARFAN DELKIS	\N	\N	19	\N	\N	603	5	V-11277282	2000-05-19
333	V-24288508	LINARES JHANDRILU	\N	\N	19	\N	\N	604	5	V-14165148	1995-05-01
334	V-26250323	DENIZ JHOANGELYS	\N	\N	19	\N	\N	604	5	V-14165148	1998-03-18
335	V-26993103	DENIZ  JULIAN	\N	\N	19	\N	\N	604	5	V-14165148	1999-12-21
336	V-24210712	PEREZ YOMISYARI	\N	\N	19	\N	\N	605	1	V-18357573	1995-07-06
337	V-	GONZALEZ KENYELIZ	\N	\N	19	\N	\N	606	8	V-18487731	2012-04-18
338	V-12952088	CEDEÑO DANIEL	\N	\N	19	\N	\N	608	1	V-19084195	1968-07-15
339	V-18761458	HERNANNDEZ JOSE	\N	\N	19	\N	\N	609	5	V-10038723	1989-10-15
340	V-19228758	HERNANDEZ DINIMAR	\N	\N	19	\N	\N	609	5	V-10038723	1990-11-22
341	V-27254295	CORDOVA HIDIMAR	\N	\N	19	\N	\N	609	5	V-10038723	2000-07-09
342	V-5966422	MENDOZA MARIA	\N	\N	19	\N	\N	610	7	V-18314052	1958-06-18
343	V-14547292	ZAMBRANO DANY	\N	\N	19	\N	\N	614	1	V-13885815	1980-12-18
344	V-27318112	BELLO JOEL	\N	\N	19	\N	\N	616	5	V-11036180	1999-11-30
345	V-24312611	CARRASCO ORIANA	\N	\N	19	\N	\N	622	5	V-6391000	1990-10-18
346	V-24312613	CARRASCO MARIA	\N	\N	19	\N	\N	622	5	V-6391000	1990-10-18
347	V-	DURAN MADELEIM	\N	\N	19	\N	\N	622	4	V-6391000	2012-11-26
348	V-	DURAN SAMUEL	\N	\N	19	\N	\N	622	4	V-6391000	2018-10-03
349	V-	DURAN ARANZA	\N	\N	19	\N	\N	622	4	V-6391000	2015-03-14
350	V-26396360	ROSALES GERVLIMAR	\N	\N	19	\N	\N	623	5	V-14045463	1998-05-09
351	V-28434607	ROSALES LAURA	\N	\N	19	\N	\N	623	5	V-14045463	1999-10-20
352	V-17775541	LEON YENIFER	\N	\N	19	\N	\N	624	5	V-10545243	1987-02-09
353	V-19820030	LEON PEDRO	\N	\N	19	\N	\N	624	5	V-10545243	1987-02-09
354	V-22037521	LEON DERWIN	\N	\N	19	\N	\N	624	5	V-10545243	1992-11-29
355	V-32055552	DIAZ JOHANDER	\N	\N	19	\N	\N	624	4	V-10545243	2007-08-05
356	V-	TORRES LEINI	\N	\N	19	\N	\N	624	4	V-10545243	2018-09-08
357	V-11234690	ARISTIGUETA ADELAIDA	\N	\N	19	\N	\N	625	8	V-25038841	1975-08-14
358	V-17428132	MARTINEZ WENDY	\N	\N	19	\N	\N	626	1	V-19559149	1985-02-21
359	V-	GELVIS MARTINEZ	\N	\N	19	\N	\N	626	6	V-19559149	2007-01-28
360	V-21051832	ECHERRY SILVIA	\N	\N	19	\N	\N	627	5	V-10304758	1992-06-27
361	V-8482184	RIVAS FELIX	\N	\N	19	\N	\N	627	1	V-10304758	1961-09-19
362	V-11776103	RIVAS JESUS	\N	\N	19	\N	\N	627	1	V-10304758	1973-05-27
363	V-12385701	RANGEL JOSE	\N	\N	19	\N	\N	628	1	V-12385649	1974-04-09
364	V-6284562	RANGEL WILLI	\N	\N	19	\N	\N	628	1	V-12385649	1964-06-07
365	V-10632341	RANGEL WENDY	\N	\N	19	\N	\N	628	1	V-12385649	1967-06-10
366	V-24673661	ARNAL CONCEPCION	\N	\N	19	\N	\N	629	1	V-20995371	1994-09-18
367	V-28102286	ARNAL JUAN	\N	\N	19	\N	\N	629	1	V-20995371	2000-12-23
368	V-	GODOY SOLMARY	\N	\N	19	\N	\N	629	6	V-20995371	2010-03-14
369	V-25839253	KETTERER JOSE	\N	\N	1	\N	\N	631	5	V-12302464	1997-09-11
370	V-24368463	RODRIGUEZ YULIANA	\N	\N	1	\N	\N	636	1	V-27401102	1996-04-05
371	V-18330746	ROMERO ALVIN	\N	\N	1	\N	\N	640	5	V-7956891	1987-02-01
372	V-20793611	ROMERO MELVIN	\N	\N	1	\N	\N	640	5	V-7956891	1987-02-01
373	V-22029182	ROMERO ALBANI	\N	\N	1	\N	\N	640	5	V-7956891	1993-11-25
374	V-6293023	JAIMES JOSE	\N	\N	1	\N	\N	640	8	V-7956891	1966-10-14
375	V-7726763	ROME ALBERTO	\N	\N	1	\N	\N	640	1	V-7956891	1961-02-03
376	V-18271674	AVENDAÑO JUAN	\N	\N	1	\N	\N	644	5	V-6212522	1988-08-29
377	V-6212523	AVENDAÑO RAUL	\N	\N	1	\N	\N	644	1	V-6212522	1967-01-23
378	V-12952088	CEDEÑO DANIEL	\N	\N	1	\N	\N	646	1	V-19084195	1968-07-15
379	V-28015758	MONTAÑO ZULEIMA	\N	\N	1	\N	\N	647	1	V-15206211	1976-08-27
380	V-	CASTILLO YENDERLIN	\N	\N	1	\N	\N	647	4	V-15206211	2019-07-05
381	V-13091650	TINEO FERNANDO	\N	\N	19	\N	\N	648	1	V-15366525	1977-09-25
382	V-26334506	LA CRUZ NAOMI	\N	\N	19	\N	\N	649	5	V-6670540	1998-01-11
383	V-8611622	OVIEDO ADELFINA	\N	\N	19	\N	\N	650	8	V-19954006	1965-02-28
384	V-13094289	GUEVARA PEDRO	\N	\N	19	\N	\N	650	2	V-19954006	1976-08-26
385	V-23371992	GUEVARA ANDRES	\N	\N	19	\N	\N	650	1	V-19954006	1994-04-02
386	V-21125321	GUEVARA PEDRO	\N	\N	19	\N	\N	650	6	V-19954006	1999-04-03
387	V-23529387	BETANCOURT ANTONIO	\N	\N	19	\N	\N	654	5	V-8379699	1995-02-07
388	V-24760797	BETANCOURT JOSE	\N	\N	19	\N	\N	654	5	V-8379699	1997-01-02
389	V-21344065	YNOJOSA KAYMAR	\N	\N	19	\N	\N	656	5	V-11489148	1993-08-29
390	V-27903913	BOLIVAR ISAAC	\N	\N	19	\N	\N	657	8	V-14141646	2000-05-10
391	V-31886093	HERNANDEZ RUT	\N	\N	19	\N	\N	659	8	V-14867701	2003-07-15
392	V-19153767	ESCALONA INDIRA	\N	\N	19	\N	\N	661	5	V-4976432	1989-04-26
393	V-21051429	ROJAS JACSON	\N	\N	19	\N	\N	663	1	V-21051430	1990-09-27
394	V-13415512	CASTILLO LUIS	\N	\N	19	\N	\N	663	3	V-21051430	1973-03-10
395	V-	ESPINOZA SAMUEL	\N	\N	19	\N	\N	663	1	V-21051430	2014-01-17
396	V-22384136	ZAMBRANO FRANCISCO	\N	\N	19	\N	\N	664	1	V-17562801	1965-12-24
397	V-24208014	CASTRO SILFREDO	\N	\N	19	\N	\N	665	8	V-21378861	1966-06-19
398	V-31912743	CASTRO GEREMY	\N	\N	19	\N	\N	665	1	V-21378861	2008-04-02
399	V-32527592	CASTRO FREDERICH	\N	\N	19	\N	\N	665	1	V-21378861	2009-05-07
400	V-21132905	COLINA SAGRARIO	\N	\N	19	\N	\N	668	5	V-3988627	1992-09-10
401	V-21131821	HARSEN MARCOS	\N	\N	19	\N	\N	669	5	V-11569953	1992-08-27
402	V-27624244	HARSEN JUAN	\N	\N	19	\N	\N	669	5	V-11569953	1992-08-27
403	V-27954562	RIERA DEIVIS	\N	\N	19	\N	\N	672	5	V-13251832	2000-12-21
404	V-26911850	RODRIGUEZ JUAN	\N	\N	19	\N	\N	676	1	V-15910637	1998-11-25
405	V-25037173	GALAVIS ALEJANDRO	\N	\N	19	\N	\N	679	5	V-11020646	1997-06-10
406	V-	PARRA DEYOMAR	\N	\N	19	\N	\N	681	8	V-6732730	2007-04-12
407	V-	PARRA LUCIA	\N	\N	19	\N	\N	681	8	V-6732730	2016-04-16
408	V-18817524	DOMINGUEZ MARIA	\N	\N	19	\N	\N	682	5	V-9962935	1987-08-16
409	E-83556310	ALMARALES DUBAL	\N	\N	19	\N	\N	682	8	V-9962935	1980-11-26
410	V-13833334	SOPRANO ROSIRIS	\N	\N	19	\N	\N	683	1	V-15131060	1977-01-01
411	V-5800823	DE PNTIVEROS IRAIS	\N	\N	19	\N	\N	684	8	V-20990178	1956-09-14
412	V-4147734	ONTIVEROS JUAN	\N	\N	19	\N	\N	684	8	V-20990178	1952-03-01
413	V-27374271	DIAZ SLEINER 	\N	\N	19	\N	\N	685	5	V-14129142	1999-04-11
414	V-7544933	GONZALEZ CARLOS	\N	\N	19	\N	\N	687	8	V-18026578	1970-08-06
415	V-11005099	TOLEDO EUGENIA	\N	\N	19	\N	\N	687	8	V-18026578	1968-11-15
416	V-6257578	MARCANO CESAR	\N	\N	19	\N	\N	687	8	V-18026578	1966-03-18
417	V-24896673	ROSALES MAYERLIN	\N	\N	19	\N	\N	688	5	V-9958963	1996-09-04
418	V-20990178	ROSALES MIYERLYN	\N	\N	19	\N	\N	688	5	V-9958963	2009-07-12
419	V-26470436	REBOLLEDO JOSE	\N	\N	19	\N	\N	689	5	V-13456185	1980-06-21
420	V-25501097	CORONEL WILMER	\N	\N	19	\N	\N	690	5	V-10633995	1996-01-01
421	V-20990178	ROSALES MIYERLYN	\N	\N	19	\N	\N	690	1	V-10633995	1993-06-21
422	V-20978646	GARCIA GEORGE	\N	\N	19	\N	\N	691	5	V-6344627	1991-08-08
423	V-20978646	GARCIA GEORGE	\N	\N	19	\N	\N	692	5	V-6344627	1991-08-08
424	V-	MARIA MOTAVITA	\N	\N	1	\N	\N	696	8	V-21117121	2011-05-18
425	V-12782954	CARRERO MAIRET	\N	\N	1	\N	\N	696	7	V-21117121	1977-01-18
426	V-13996108	LEAL JOSE	\N	\N	19	\N	\N	697	1	V-13996107	1978-03-03
427	V-19098742	NAVA ALEXANDRA	\N	\N	19	\N	\N	699	5	V-9327559	1987-09-04
428	V-19739733	NAVA ALEXANDER	\N	\N	19	\N	\N	699	5	V-9327559	1988-12-24
429	V-19739732	NAVA DIANA	\N	\N	19	\N	\N	699	5	V-9327559	1991-09-05
430	V-28494736	BRICEÑO JONATHAN	\N	\N	19	\N	\N	699	8	V-9327559	2002-12-04
431	V-13208816	MAVARE GILBERTO	\N	\N	19	\N	\N	699	1	V-9327559	1976-07-06
432	V-18001458	CHARACO MARCOS	\N	\N	19	\N	\N	699	8	V-9327559	1986-04-27
433	V-15040740	FERNANDEZ MARITZA	\N	\N	19	\N	\N	700	8	V-18492491	1988-02-05
434	V-27254713	SERRANO EDWARD	\N	\N	19	\N	\N	704	5	V-15876300	2000-04-27
435	V-26497849	ACOSTA JOSE	\N	\N	19	\N	\N	705	1	V-12908610	2002-08-25
436	V-	GUAIMA ANDRES	\N	\N	19	\N	\N	705	4	V-12908610	2015-11-20
437	V-22035040	RODRIGUEZ WILMARY	\N	\N	19	\N	\N	706	5	V-8246696	1993-11-23
438	V-	SANCHEZ SAMUEL	\N	\N	19	\N	\N	706	4	V-8246696	2015-05-18
439	V-27105564	HERNANDEZ CARLA	\N	\N	19	\N	\N	707	5	V-14053669	2000-03-27
440	V-12299901	GUTIERREZ MARISOL	\N	\N	19	\N	\N	707	1	V-14053669	1973-10-10
441	V-20710597	RODRIGUEZ GUSTAVO	\N	\N	19	\N	\N	708	5	V-13384315	1990-03-26
442	V-24221587	VASQUEZ MAIKER	\N	\N	19	\N	\N	711	5	V-11014849	2008-10-30
443	V-4679606	DELGADO MARISELA	\N	\N	19	\N	\N	713	1	V-9480023	1958-06-04
444	V-6357333	DELGADO MARLENE	\N	\N	19	\N	\N	713	1	V-9480023	1960-12-17
445	V-10798477	DELGADO EMMA	\N	\N	19	\N	\N	713	1	V-9480023	1972-01-13
446	V-26283245	JENIFER MEZA	\N	\N	19	\N	\N	714	5	V-9402354	1997-07-29
447	V-21468455	MOLINA JESUS	\N	\N	19	\N	\N	714	6	V-9402354	1992-06-06
448	V-19497268	RIVERO MANUEL	\N	\N	19	\N	\N	716	5	V-11483978	1990-07-19
449	V-23662459	RODRIGUEZ ALEXA	\N	\N	19	\N	\N	717	1	V-19510115	1995-01-20
450	V-	FLORES MIA	\N	\N	19	\N	\N	717	6	V-19510115	2017-01-11
451	V-25846850	NUÑEZ KATERIN	\N	\N	19	\N	\N	718	6	V-14386958	1997-12-20
452	V-	PEREZ GENELVIS	\N	\N	19	\N	\N	719	4	V-10802632	2016-09-17
453	V-20613913	GARCIA GRUTTEL	\N	\N	19	\N	\N	720	5	V-5220295	1990-11-12
454	V-24933192	GARCIA GENESIS	\N	\N	19	\N	\N	720	5	V-5220295	1996-08-08
455	V-24057338	MORALES ROBERTO	\N	\N	19	\N	\N	724	1	V-20603971	1976-11-26
456	V-12689548	YSMELY MORALES	\N	\N	19	\N	\N	724	1	V-20603971	1975-04-29
457	V-27309151	SALAVERRIA BRAYAN	\N	\N	19	\N	\N	725	5	V-15328534	2000-05-28
458	V-27109918	YANEZ JEIFREH	\N	\N	19	\N	\N	726	1	V-11667385	1997-07-16
459	V-15040027	SANCHEZ VICTOR	\N	\N	19	\N	\N	727	5	V-23188757	1982-05-02
460	V-17439325	SANCHEZ EDGAR	\N	\N	19	\N	\N	727	5	V-23188757	1985-08-09
461	V-23188654	DIOSCAR CORTEZ	\N	\N	19	\N	\N	727	5	V-23188757	1995-06-12
462	V-26946098	ECHENIQUE ERICK	\N	\N	19	\N	\N	730	5	V-12455581	1998-04-13
463	V-18829220	RODRIGUEZ MARBELYS	\N	\N	19	\N	\N	730	1	V-12455581	1989-03-30
464	V-26966687	MARQUEZ KAREN	\N	\N	19	\N	\N	730	8	V-12455581	1999-08-18
465	V-26711438	DIAZ YUBIRI	\N	\N	19	\N	\N	733	1	V-17691310	2008-03-07
466	V-25917295	GIL DENNIS	\N	\N	19	\N	\N	733	1	V-17691310	1987-05-21
467	V-22523561	DIAZ YINNELIS	\N	\N	19	\N	\N	733	1	V-17691310	1990-10-10
468	V-26711438	DIAZ YUBIRI	\N	\N	19	\N	\N	734	1	V-17691310	1987-05-21
469	V-25917295	GIL DENNIS	\N	\N	19	\N	\N	734	1	V-17691310	1981-09-10
470	V-22523561	DIAZ YINNELIS	\N	\N	19	\N	\N	734	1	V-17691310	1990-10-10
471	V-	SANCHEZ YOHANYELI	\N	\N	19	\N	\N	735	6	V-17976444	2012-07-11
472	V-21377599	DIAZ YOHAN	\N	\N	19	\N	\N	735	1	V-17976444	1990-10-10
473	V-26908722	AZUAJE YOSIBELL	\N	\N	19	\N	\N	735	5	V-17976444	1999-05-29
474	V-20706922	TERAN LUZ MARINA	\N	\N	19	\N	\N	739	1	V-20706921	1987-03-30
475	V-24617913	TERAN LUZ MARY	\N	\N	19	\N	\N	739	1	V-20706921	1998-08-30
476	V-26557480	TERAN LISMAR	\N	\N	19	\N	\N	739	1	V-20706921	1998-01-22
477	V-18034372	ALVARADO JOSE	\N	\N	19	\N	\N	739	1	V-20706921	1983-04-23
478	V-23660438	PEREZ OLIVER	\N	\N	19	\N	\N	740	5	V-6333913	1995-01-09
479	V-26466470	RAMIREZ KLEIMAR	\N	\N	19	\N	\N	741	8	V-13782115	1998-10-22
480	V-25029889	LEON EDWIN	\N	\N	19	\N	\N	742	5	V-14667507	1996-02-08
481	V-26466197	LEON BRAYAN	\N	\N	19	\N	\N	742	5	V-14667507	1998-07-08
482	V-27254234	LEON CRISTHIAN	\N	\N	19	\N	\N	742	5	V-14667507	2000-05-03
483	V-	LEON BRIHAMY	\N	\N	19	\N	\N	742	4	V-14667507	2019-02-17
484	V-23636437	YUGURI ANTONI	\N	\N	19	\N	\N	746	1	V-29698807	1994-03-07
485	V-27318655	ESPITIA LUIS	\N	\N	19	\N	\N	752	1	V-27318653	1998-05-25
486	E-84489317	PRIETO ANA	\N	\N	19	\N	\N	754	2	E-84604510	1985-10-29
487	V-18936953	lobo daneysi	\N	\N	19	\N	\N	755	1	V-26908441	1987-08-14
488	V-22537344	RAMOS ILVIA	\N	\N	19	\N	\N	756	1	V-27160759	1992-08-30
489	V-9170327	ANGARITA VERONICA	\N	\N	19	\N	\N	758	1	V-12041793	1964-07-09
490	V-10396910	ANGARITA DENYS	\N	\N	19	\N	\N	758	1	V-12041793	1969-10-20
491	V-27647097	MARTINEZ JORGELIS	\N	\N	19	\N	\N	760	1	V-29862919	1968-08-07
492	V-26152972	SANCHEZ EMILY	\N	\N	19	\N	\N	761	5	V-16227251	1998-05-12
493	V-	RIVERA XAVIER	\N	\N	19	\N	\N	763	6	V-25504278	2013-10-14
494	V-	RIVERA XAQUIEL	\N	\N	19	\N	\N	763	6	V-25504278	2017-12-08
495	V-25787335	GARCIA ALEJANDRO	\N	\N	19	\N	\N	765	1	V-23654995	1995-12-27
496	V-17458208	GARCIA ENYERLIS	\N	\N	19	\N	\N	765	1	V-23654995	1985-09-02
497	V-	GARCIA MELANNY	\N	\N	19	\N	\N	765	6	V-23654995	2013-05-09
498	V-19498384	CHOZI KARELIS	\N	\N	19	\N	\N	766	5	V-13321165	1991-03-21
499	V-23194258	GAUNA PAMELIS	\N	\N	19	\N	\N	766	5	V-13321165	1995-06-11
500	V-	ARANZA RODRIGUEZ	\N	\N	19	\N	\N	766	4	V-13321165	2017-04-17
501	V-	VARGAS GAEL	\N	\N	19	\N	\N	766	4	V-13321165	2017-01-20
502	V-23639260	RANGEL GABRIELA	\N	\N	19	\N	\N	770	5	V-11022406	1993-12-26
503	V-25409969	VITORA ANGEL	\N	\N	19	\N	\N	774	5	V-13599826	1997-07-01
504	V-27279923	VITORA JESUS	\N	\N	19	\N	\N	774	5	V-13599826	1998-10-15
505	V-28148391	GIL HECTOR	\N	\N	19	\N	\N	775	5	V-14675161	1992-10-23
506	V-31699456	DIAZ RAYBERT	\N	\N	19	\N	\N	777	8	V-10745243	1971-12-11
507	V-15930934	AGUILUZ YONATHAN	\N	\N	19	\N	\N	778	1	V-22752479	1974-05-27
508	V-32859384	LOPEZ DALEIDY	\N	\N	19	\N	\N	782	8	V-12113832	2009-02-10
509	V-26040533	TOLEDO NATHALIA	\N	\N	19	\N	\N	783	5	V-15820735	1995-08-06
510	V-	GARCIA YEHIBERLIS	\N	\N	19	\N	\N	783	4	V-15820735	2013-09-24
511	V-10779688	DATICA JUANA	\N	\N	19	\N	\N	784	7	V-15327187	1981-10-12
512	V-25957291	ANGULO ILIS	\N	\N	19	\N	\N	786	1	V-23189271	1996-11-05
513	V-	LEMUS VICTORIA	\N	\N	19	\N	\N	786	6	V-23189271	2013-04-16
514	V-	ANGULO VICTOR	\N	\N	19	\N	\N	786	6	V-23189271	2016-10-29
515	V-17116210	CASTILLO DREIBER	\N	\N	19	\N	\N	788	1	V-22752631	1985-02-05
516	V-6008499	ARNAL CONCEPCION	\N	\N	19	\N	\N	789	1	V-20995371	1994-09-18
517	V-28102286	ARNAL JUAN	\N	\N	19	\N	\N	789	1	V-20995371	2000-12-23
518	V-	GODOY SOLMARY	\N	\N	19	\N	\N	789	6	V-20995371	2010-03-14
519	V-11675811	TOVAR LUIS	\N	\N	19	\N	\N	790	1	V-16598001	1974-02-27
520	V-6890139	LUGO JESUS	\N	\N	19	\N	\N	792	3	V-20492102	1965-03-27
521	V-18588791	MEZA ARBIN	\N	\N	19	\N	\N	792	1	V-20492102	1986-11-23
522	V-17706208	MEZA PEDRO	\N	\N	19	\N	\N	792	1	V-20492102	1985-04-29
523	V-26738928	MAIRIM CAMBERO	\N	\N	19	\N	\N	794	5	V-6397691	1998-07-12
524	V-24478179	CAMBERO JAVIER	\N	\N	19	\N	\N	794	5	V-6397691	1992-10-13
525	V-	CAMBERO ISABELLA	\N	\N	19	\N	\N	794	4	V-6397691	2017-03-13
526	V-11991724	TOVAR EDGAR	\N	\N	19	\N	\N	796	1	V-14412134	1971-02-19
527	V-18038364	TOVAR MARIA	\N	\N	19	\N	\N	796	1	V-14412134	1987-08-28
528	V-31745685	TOVAR MAIKEL	\N	\N	19	\N	\N	796	6	V-14412134	2005-07-01
529	V-	ORTEGA ANIS	\N	\N	19	\N	\N	796	6	V-14412134	2011-07-21
530	V-6061618	TOVAR NANCY	\N	\N	19	\N	\N	797	1	V-12411331	1974-07-14
531	V-10523449	ROJAS YSAAC 	\N	\N	19	\N	\N	798	1	V-17476772	1967-08-16
532	V-17921274	RAMOS ELUYS	\N	\N	19	\N	\N	800	1	V-19558283	1986-12-12
533	V-28317979	RAMOS VALENTINA	\N	\N	19	\N	\N	800	1	V-19558283	2000-12-26
534	V-26104254	GONZALEZ JOSE	\N	\N	19	\N	\N	801	5	V-13419984	1998-06-05
535	V-26946848	GONZALEZ JOSE	\N	\N	19	\N	\N	801	5	V-13419984	1999-10-20
536	V-15724872	GONZALEZ FROILAN	\N	\N	19	\N	\N	801	5	V-13419984	1981-10-23
537	V-13124785	gonzalez aNA	\N	\N	19	\N	\N	801	1	V-13419984	1976-05-11
538	V-13419985	MARIA GONZALEZ	\N	\N	19	\N	\N	801	1	V-13419984	1978-11-18
539	V-18935001	ULLOA FRANCISCO	\N	\N	19	\N	\N	802	1	V-21414912	1990-04-16
540	V-24618965	DURAN JHOAN	\N	\N	19	\N	\N	805	1	V-24618966	1994-12-09
541	V-32896195	DURAN ENYERBER	\N	\N	19	\N	\N	805	1	V-24618966	2008-03-18
542	V-26602697	MARTINEZ HENRY	\N	\N	19	\N	\N	807	1	V-20466481	1993-11-15
543	V-28291782	TORREALBA KENNEDY	\N	\N	19	\N	\N	807	1	V-20466481	2002-04-07
544	V-31905843	TORREALBA SAMUEL	\N	\N	19	\N	\N	807	1	V-20466481	2004-05-24
545	V-24698200	URREA DAYRO	\N	\N	19	\N	\N	808	1	V-24698198	1994-10-26
546	V-19557588	FERNANDEZ MIGUEL	\N	\N	19	\N	\N	810	5	V-9379433	1990-05-10
547	V-26064007	OLIVA CARDOZO	\N	\N	19	\N	\N	810	5	V-9379433	1997-03-17
548	V-27038074	CARDOZO LINA	\N	\N	19	\N	\N	810	5	V-9379433	1999-07-11
549	V-17754134	ramirez roger	\N	\N	19	\N	\N	816	8	V-17965131	1987-10-01
550	V-17754134	RAIREZ ROGER	\N	\N	19	\N	\N	818	8	V-17965131	1987-10-01
551	V-17224791	GARCIA KAYROLYS	\N	\N	19	\N	\N	821	1	V-12821184	1984-09-21
552	V-1088952	YULEIMA GARCIA	\N	\N	19	\N	\N	821	1	V-12821184	1972-01-15
553	V-27741427	BARRIOS BRIGITE	\N	\N	19	\N	\N	824	5	V-6653732	2000-03-05
554	V-27138982	RUIZ EDDY	\N	\N	19	\N	\N	828	5	V-14363829	1981-05-27
555	V-24716104	ROJAS YOSELIN	\N	\N	19	\N	\N	832	5	V-6433472	1995-09-26
556	V-28304263	ROJAS YANAIRA	\N	\N	19	\N	\N	832	5	V-6433472	1999-11-12
557	V-28576704	ABREU FRANYOLIS	\N	\N	19	\N	\N	834	8	V-14688529	2002-01-30
558	V-20175280	SIVIRA ANYIMAR	\N	\N	19	\N	\N	835	5	V-10544286	1989-12-31
559	V-	RIOS JETSIBETH 	\N	\N	19	\N	\N	835	8	V-10544286	2010-11-27
560	V-19224901	GOMEZ ENGERBERTH	\N	\N	19	\N	\N	837	1	V-12950649	1990-11-14
561	V-13885884	LUCIANO YEFERSSON	\N	\N	19	\N	\N	837	8	V-12950649	1979-08-15
562	V-14019237	RODRIGUEZ YESICA	\N	\N	19	\N	\N	840	5	V-14019236	2000-12-28
563	V-19314152	MELENDEZ RUBEN	\N	\N	19	\N	\N	841	1	V-11917615	1990-11-11
564	V-14889733	GONZALEZ MABEL	\N	\N	19	\N	\N	846	5	V-17706211	1981-01-21
565	V-31288665	LOPEZ MIGUEL	\N	\N	19	\N	\N	847	1	V-21535768	2006-03-07
566	V-17123504	PAREDES ANTHONY	\N	\N	19	\N	\N	848	1	V-14387566	1986-11-09
567	V-17125029	GUEVARA OSCAR	\N	\N	19	\N	\N	849	1	V-14666990	1983-03-19
568	V-18310706	PARRA VANESSA	\N	\N	19	\N	\N	849	8	V-14666990	1987-08-13
569	V-32672366	PARRA DANIEL	\N	\N	19	\N	\N	849	6	V-14666990	2007-02-08
570	V-17428132	MARTINEZ WENDY	\N	\N	19	\N	\N	850	1	V-19559149	1985-02-21
571	V-17428132	MARTINEZ WENDY	\N	\N	19	\N	\N	851	1	V-19559149	1985-02-21
572	V-	GELVIS XAVIER	\N	\N	19	\N	\N	851	6	V-19559149	2007-01-28
573	V-7929126	PABON JOSE	\N	\N	19	\N	\N	853	1	V-13070164	1970-09-29
574	V-7929216	PABON JOSE	\N	\N	19	\N	\N	853	1	V-13070164	1965-12-05
575	V-10633056	PABON FELIX	\N	\N	19	\N	\N	853	1	V-13070164	1972-05-02
576	V-9350493	PABON LIBIA	\N	\N	19	\N	\N	853	1	V-13070164	1964-06-15
577	V-25222386	MOLINA RICARDO	\N	\N	19	\N	\N	854	5	V-13833179	1996-04-06
578	V-26472863	BORGES RUBEN	\N	\N	19	\N	\N	854	5	V-13833179	1999-05-13
579	V-18912709	HERNANDEZ WILANDY	\N	\N	19	\N	\N	858	5	V-6323930	1989-06-18
580	V-	MACHADO VICTORIA	\N	\N	19	\N	\N	858	4	V-6323930	2014-02-05
581	V-24906348	CARRILLO DANIEL	\N	\N	19	\N	\N	861	5	V-10470839	1994-04-22
582	V-21014709	FLORES CLARET	\N	\N	19	\N	\N	862	5	V-10336498	1990-10-23
583	V-	BURGUILLO DAYARLIN	\N	\N	19	\N	\N	863	8	V-26547612	2007-03-27
584	V-19692042	ABREU BERMARY	\N	\N	19	\N	\N	864	5	V-5304676	1989-06-11
585	V-19692043	ABREU FRANCISCO	\N	\N	19	\N	\N	864	5	V-5304676	1990-07-11
586	V-29887204	DUBREUSE MARIA	\N	\N	19	\N	\N	866	5	V-23154648	1999-10-28
587	V-	BLANCO SANTIAGO	\N	\N	19	\N	\N	874	6	V-18604640	2015-05-05
588	V-18604641	SALAS KAURISSAN	\N	\N	19	\N	\N	874	1	V-18604640	1986-01-16
589	V-32539775	PEÑA LISMEIDY	\N	\N	19	\N	\N	874	1	V-18604640	2007-09-13
590	V-	ORELLANA MOISES	\N	\N	19	\N	\N	874	6	V-18604640	2016-01-03
591	V-18492343	RIVERO JOSE	\N	\N	19	\N	\N	876	5	V-5513775	1987-08-11
592	V-24220630	RIVERO SACHARY	\N	\N	19	\N	\N	876	5	V-5513775	1994-04-15
593	V-21336167	SOLORZANO DEYBERLY	\N	\N	19	\N	\N	877	5	V-10669800	1993-11-18
594	V-26281679	RENGIFO MAURELIN	\N	\N	19	\N	\N	878	5	V-16526758	1998-03-19
595	V-29661412	RENGIFO KENERI	\N	\N	19	\N	\N	878	5	V-16526758	1999-08-31
596	V-	RENGIFO KENERI	\N	\N	19	\N	\N	878	4	V-16526758	2019-09-28
597	V-25740361	OLIVEROS BRAYAN	\N	\N	19	\N	\N	892	5	V-13348333	1996-11-16
598	V-14645767	MORCADO JOSE	\N	\N	19	\N	\N	896	8	V-26282412	1979-12-24
599	V-	VILLASMIL AZAEL 	\N	\N	23	\N	\N	897	4	V-19087994	2018-11-19
600	V-21105124	MARTINEZ MARYURIS	\N	\N	19	\N	\N	904	1	V-21105125	1993-06-10
601	V-16974379	CASTILLO YOSMARY	\N	\N	19	\N	\N	905	5	V-10367641	1985-07-22
602	V-17389803	ROJAS ANDRES	\N	\N	19	\N	\N	905	8	V-10367641	1985-10-29
603	V-31910285	ROJAS YOHANDREIKER	\N	\N	19	\N	\N	905	4	V-10367641	2004-04-15
604	V-25751265	CABRICES MARIA	\N	\N	19	\N	\N	906	5	V-11157168	1996-05-10
605	V-15020966	ROSALES NOEL	\N	\N	19	\N	\N	907	5	V-5676517	1981-06-18
606	V-24862098	VASQUEZ EDGARDO	\N	\N	19	\N	\N	913	5	V-6056508	1996-01-20
607	V-24209785	CASTILLO YORGELIS	\N	\N	19	\N	\N	914	8	V-14757294	1995-06-20
608	V-5543155	ALMINDA RAMON	\N	\N	19	\N	\N	914	8	V-14757294	1960-06-06
609	V-9098370	DIAZ CARLOS	\N	\N	19	\N	\N	914	8	V-14757294	1963-11-08
610	V-27392295	BECERRA MARIANGELAS	\N	\N	19	\N	\N	919	8	V-14626283	2000-01-26
611	V-14989706	SANCHEZ MAYERLI	\N	\N	19	\N	\N	921	5	V-6901327	1981-12-27
612	V-16620408	CALDERON JUAN	\N	\N	19	\N	\N	921	5	V-6901327	1984-05-16
613	V-18109066	CALDERON PAULA	\N	\N	19	\N	\N	921	5	V-6901327	1987-08-15
614	V-22760137	CALDERON KIRA	\N	\N	19	\N	\N	921	5	V-6901327	1992-09-10
615	V-25051100	MEDOLFO ANDRIW	\N	\N	19	\N	\N	925	5	V-12385095	1998-04-26
616	V-27571419	MEDOLFO JOSE	\N	\N	19	\N	\N	925	5	V-12385095	2000-03-04
617	V-25845927	AGUILAR JHEANGER	\N	\N	19	\N	\N	927	5	V-15615779	1996-09-19
618	V-25530607	JIMENEZ DANIELA	\N	\N	19	\N	\N	931	5	V-11038889	1996-11-27
619	V-24278480	CARRO EDWARD	\N	\N	19	\N	\N	932	5	V-11735744	1995-11-04
620	V-22388177	CARRO SUYIN	\N	\N	19	\N	\N	932	5	V-11735744	1992-08-28
621	V-33186874	LARES MIGUEL	\N	\N	19	\N	\N	932	6	V-11735744	2010-06-10
622	V-31460291	LARES JOSE	\N	\N	19	\N	\N	932	6	V-11735744	2006-01-05
623	V-	PEREZ ALEXANDRA	\N	\N	19	\N	\N	932	4	V-11735744	2014-04-21
624	V-14650053	BRITO MERCEDES	\N	\N	19	\N	\N	939	1	V-19656619	1979-02-07
625	V-27588963	MONTOYA YEISY	\N	\N	19	\N	\N	940	5	V-24674594	1997-10-16
626	V-27588964	MONTOYA YULIET	\N	\N	19	\N	\N	940	5	V-24674594	2000-12-19
627	V-27588965	MONTOYA YULIANY	\N	\N	19	\N	\N	940	5	V-24674594	2000-12-19
628	V-	PACHECO RONNY	\N	\N	19	\N	\N	940	4	V-24674594	2013-08-14
629	V-	SANTIAGO MARIMON	\N	\N	19	\N	\N	940	4	V-24674594	2017-12-02
630	V-	BETANCOURTH DANIEL	\N	\N	19	\N	\N	940	4	V-24674594	2019-04-02
631	V-12817118	COLMENARES GLADYS	\N	\N	19	\N	\N	943	8	V-25369051	1975-02-17
632	V-6280364	TORRES WILLIAMS	\N	\N	19	\N	\N	943	8	V-25369051	1967-11-24
633	V-29983081	BERMUDEZ NORYELIS	\N	\N	19	\N	\N	945	5	V-16029025	1997-07-01
634	V-29983082	BERMUDEZ NORELVIS	\N	\N	19	\N	\N	945	5	V-16029025	1999-08-08
635	V-	RIVAS NARLESKA	\N	\N	19	\N	\N	945	4	V-16029025	2018-05-13
636	V-11029620	SALAZAR JOSE	\N	\N	19	\N	\N	950	1	V-14743090	1967-01-02
637	V-23615782	TOVAR JOSELIN	\N	\N	19	\N	\N	952	5	V-12977345	1995-06-28
638	V-27446620	TOVAR JOGER	\N	\N	19	\N	\N	952	5	V-12977345	1998-11-01
639	V-	TOVAR XAVIANGELIS	\N	\N	19	\N	\N	952	4	V-12977345	2016-11-29
640	V-	GARCIA SUSEJ	\N	\N	19	\N	\N	954	4	V-10863611	2018-09-24
641	V-25234327	PEREZ ARIANNA	\N	\N	19	\N	\N	954	5	V-10863611	1997-05-09
642	V-23650333	GARCIA JESUS	\N	\N	19	\N	\N	954	8	V-10863611	1996-02-22
643	V-14406704	HISTOR PATRICIA	\N	\N	19	\N	\N	956	1	V-13159108	1981-04-02
644	V-18041280	HISTOR DANIELA	\N	\N	19	\N	\N	956	1	V-13159108	1987-06-18
645	V-14406704	HISTOR PATRICIA	\N	\N	19	\N	\N	958	1	V-13159108	1953-05-11
646	V-18041280	HISTOR DANIELA	\N	\N	19	\N	\N	958	1	V-13159108	1987-06-18
647	V-28007096	YEIFREIS ZABALETA 	\N	\N	23	\N	\N	960	8	V-14990565	1996-07-28
648	V-16284787	SANDOVAL MARIA	\N	\N	19	\N	\N	961	5	V-5427927	1982-05-27
649	V-24635995	SIVIRA YOHANNI	\N	\N	19	\N	\N	963	5	V-13686170	1995-04-30
650	V-24215937	BATTIKHA JORGE	\N	\N	19	\N	\N	969	1	V-15757330	1996-09-02
651	V-259877961	PRADA LALHESKA	\N	\N	19	\N	\N	971	5	V-10527899	1964-09-06
652	V-19203574	GUTIERREZ JOEL	\N	\N	19	\N	\N	971	5	V-10527899	1995-04-02
653	V-20615357	CARUCI JORGE	\N	\N	19	\N	\N	971	8	V-10527899	1988-12-31
654	V-29990870	SANCHEZ FRANCY	\N	\N	19	\N	\N	971	6	V-10527899	2003-08-20
655	V-24315755	FERNANDEZ SYLUIA	\N	\N	19	\N	\N	971	8	V-10527899	1995-04-10
656	V-	CARUCI ENMANUEL	\N	\N	19	\N	\N	971	4	V-10527899	2014-11-18
657	V-	CARUCI LEONARDO	\N	\N	19	\N	\N	971	4	V-10527899	2018-04-05
658	V-13158574	CARVAJAL DAMELYS	\N	\N	19	\N	\N	972	6	V-13158574	1976-01-27
659	V-32473554	MARCANO MARIA	\N	\N	19	\N	\N	972	6	V-13158574	2008-08-14
660	V-14384152	CARVAJAL ADA	\N	\N	19	\N	\N	972	6	V-13158574	1980-06-22
661	V-8225408	GUAICARA RAUL	\N	\N	19	\N	\N	972	1	V-13158574	1963-09-14
662	V-19023347	NOGUERA MARINA	\N	\N	19	\N	\N	973	5	V-12952506	1990-02-15
663	V-	CARRION MAHOLY	\N	\N	19	\N	\N	973	4	V-12952506	2008-08-08
664	V-25990351	ALVAREZ GESSILLE 	\N	\N	23	\N	\N	979	5	V-16097209	1957-05-13
665	V-	FREITES NICOLLE 	\N	\N	23	\N	\N	979	4	V-16097209	2019-10-13
666	V-20799992	RIOS OSCARELIS 	\N	\N	23	\N	\N	980	5	V-6506613	1990-06-30
667	V-24287745	RIOS IDALIS 	\N	\N	23	\N	\N	980	5	V-6506613	1993-10-21
668	V-27133035	MEDINA JUAN	\N	\N	19	\N	\N	981	5	V-15073630	1999-12-15
669	V-27133036	MEDINA JEAN	\N	\N	19	\N	\N	981	5	V-15073630	1999-12-15
670	V-24663701	TORO OMAR	\N	\N	19	\N	\N	987	5	V-9196896	1994-05-24
671	V-28303301	TORO YONAIKE	\N	\N	19	\N	\N	987	5	V-9196896	1998-09-02
672	V-19452663	HERNANDEZ GENESIS	\N	\N	19	\N	\N	987	5	V-9196896	1989-01-02
673	V-24214099	RONDON ALFREDO	\N	\N	19	\N	\N	988	5	V-12093935	1993-07-15
674	V-27794101	RONDON KEISBER	\N	\N	19	\N	\N	988	5	V-12093935	2003-09-11
675	V-32304204	PICHARDO NEFFER	\N	\N	19	\N	\N	990	8	V-21282653	1989-05-28
676	V-	BLANCO ANTONELLA	\N	\N	19	\N	\N	990	8	V-21282653	2013-04-17
677	V-23657956	ESPINOZA YOLEIXI	\N	\N	19	\N	\N	990	1	V-21282653	1993-09-23
678	V-19228503	GUZMAN LUZ	\N	\N	19	\N	\N	992	1	V-19228504	1988-11-15
679	V-	LUCES MARILUZ	\N	\N	19	\N	\N	992	6	V-19228504	1970-05-21
680	V-26728986	PEREIRA JAILENE	\N	\N	19	\N	\N	993	1	V-25210094	1997-08-09
681	V-26728987	PEREIRA WESLWIDY	\N	\N	19	\N	\N	993	1	V-25210094	1995-07-16
682	V-26573107	DE LA ROSA ANGELA	\N	\N	19	\N	\N	994	1	V-24456475	1998-10-23
683	V-18588559	BELTRAN MIGUEL	\N	\N	19	\N	\N	996	1	V-25235828	1988-11-16
684	V-19993785	OVIEDO JUAN	\N	\N	19	\N	\N	999	5	V-11228167	1991-04-29
685	V-26282407	TARAZONA ANDERSON	\N	\N	19	\N	\N	999	5	V-11228167	1998-05-25
686	V-21419734	DIAZ ELSY	\N	\N	19	\N	\N	1001	5	V-9419712	19734-04-21
687	V-	ARELLANO FABIAN	\N	\N	19	\N	\N	1001	4	V-9419712	2016-07-27
688	V-6948369	MORENO FRANKLIN	\N	\N	19	\N	\N	1001	1	V-9419712	1971-01-10
689	V-19452056	ARELLANO DIEGO	\N	\N	19	\N	\N	1001	8	V-9419712	1988-03-30
690	V-26489634	TOVAR SERGIO	\N	\N	19	\N	\N	1004	1	V-17856198	1998-10-26
691	V-17693365	MARQUEZ THAIS	\N	\N	19	\N	\N	1012	1	V-20309108	1987-09-18
692	V-29738193.	VILLEGAS CRISTAL	\N	\N	19	\N	\N	1012	1	V-20309108	2001-10-08
693	V-11933251	MOLINA ROSA	\N	\N	19	\N	\N	1013	1	V-11933250	1974-11-02
694	V-6721471	MOLINA GHILDA	\N	\N	19	\N	\N	1013	1	V-11933250	1971-05-18
695	V-	MANRIQUE ROBERT	\N	\N	19	\N	\N	1014	6	V-14140701	2013-03-17
696	V-18325330	VELASQUEZ BETZY	\N	\N	19	\N	\N	1014	6	V-14140701	1988-11-06
697	V-15544365	VARGAS ENDER	\N	\N	19	\N	\N	1014	6	V-14140701	1988-11-06
698	V-	VARGAS ENDERLING	\N	\N	19	\N	\N	1014	2	V-14140701	2016-08-16
699	V-14769306	JIMENEZ YRAIDA	\N	\N	19	\N	\N	1014	2	V-14140701	1982-07-08
700	V-	MARIN ARINI	\N	\N	19	\N	\N	1019	6	V-16472700	2011-06-29
701	V-18314412	PINO SORANGELIN	\N	\N	19	\N	\N	1020	5	V-5491384	1988-09-01
702	V-19504454	PINO MILAGROS	\N	\N	19	\N	\N	1020	5	V-5491384	1990-11-27
703	V-24440238	PINO ROSSY	\N	\N	19	\N	\N	1020	5	V-5491384	1995-03-01
704	V-31507553	HENRIQUEZ SEBASTIAN	\N	\N	19	\N	\N	1020	4	V-5491384	2006-08-25
705	V-26824730	PEREIRA DUBRASKA	\N	\N	19	\N	\N	1021	5	V-12640319	1997-03-01
706	V-29678629	PEREIRA JHONSON	\N	\N	19	\N	\N	1021	5	V-12640319	2000-12-20
707	V-25846927	MORILLO ANACARINA	\N	\N	19	\N	\N	1028	5	V-9376869	1991-01-25
708	V-6161430	SUAREZ RAFAEL	\N	\N	19	\N	\N	1030	8	V-17459454	1965-10-16
709	V-18934913	CORRO ALBERTH	\N	\N	19	\N	\N	1031	5	V-6504510	1989-07-17
710	V-21412597	CORRO ANTONIO	\N	\N	19	\N	\N	1031	5	V-6504510	1991-05-26
711	V-26510195	CORRO ANDRYS	\N	\N	19	\N	\N	1031	5	V-6504510	1996-12-15
712	V-21412510	HERNANDEZ NAIRELYS	\N	\N	19	\N	\N	1032	5	V-12410136	1994-06-19
713	V-20027879	HERERA MISYELIBER	\N	\N	19	\N	\N	1034	5	V-5978629	1990-02-02
714	V-24286897	HERRERA YELBER	\N	\N	19	\N	\N	1034	5	V-5978629	1994-01-31
715	V-	DAVILA MISYERLIANY	\N	\N	19	\N	\N	1034	4	V-5978629	2008-09-19
716	V-	DAVILA JOSWEL	\N	\N	19	\N	\N	1034	4	V-5978629	2011-04-14
717	V-29662577	TORRES JEAN	\N	\N	19	\N	\N	1036	1	V-22036847	2002-08-24
718	V-23192528	LEON JAHELZAR	\N	\N	19	\N	\N	1037	5	V-12420845	1994-08-07
719	V-257694379	LEON JAHILEN	\N	\N	19	\N	\N	1037	5	V-12420845	1995-07-08
720	V-	SUAREZ NELSON	\N	\N	19	\N	\N	1037	4	V-12420845	2012-12-03
721	V-20229066	PIMENTEL JENNIFER	\N	\N	19	\N	\N	1038	5	V-6662372	1990-04-30
722	V-23188705	PIMENTEL CASEY	\N	\N	19	\N	\N	1038	5	V-6662372	1993-07-21
723	V-	SOLORZANO KEISY	\N	\N	19	\N	\N	1038	4	V-6662372	2013-11-19
724	V-	PIMENTEL ANGEL	\N	\N	19	\N	\N	1038	4	V-6662372	2016-04-09
725	V-	PRIETO XAVIER	\N	\N	19	\N	\N	1038	4	V-6662372	2014-11-24
726	V-	PRIETO SAEL	\N	\N	19	\N	\N	1038	4	V-6662372	2017-12-09
727	V-21414472	MARTINEZ JUAN	\N	\N	19	\N	\N	1040	5	V-11025218	1989-04-20
728	V-27624737	MATERANO SEBASTIAN	\N	\N	19	\N	\N	1042	6	V-10514796	1999-08-04
729	V-27234035	ORTIZ MARIA	\N	\N	19	\N	\N	1045	5	V-13066961	1999-07-04
730	V-17440193	GARCIA JENNIFER	\N	\N	19	\N	\N	1047	5	V-6320225	1986-10-17
731	V-32992960	GARCIA ANGEL	\N	\N	19	\N	\N	1047	8	V-6320225	2007-12-18
732	V-	ACEVEDO SEBASTIAN	\N	\N	19	\N	\N	1047	4	V-6320225	2011-10-13
733	V-32624267	VELASCO ARIANNI	\N	\N	19	\N	\N	1047	4	V-6320225	2008-02-02
734	V-27103117	ABREU GENESIS	\N	\N	19	\N	\N	1048	1	V-23926640	1999-12-16
735	V-32353505	ABREU NAZARETH	\N	\N	19	\N	\N	1048	1	V-23926640	2007-03-27
736	V-25866479	PESTANA MANUEL	\N	\N	19	\N	\N	1053	5	V-14452330	1997-08-26
737	V-24663454	PESTANA JUAN	\N	\N	19	\N	\N	1053	5	V-14452330	1995-12-10
738	V-26794727	PESTANA ANTHONY	\N	\N	19	\N	\N	1053	5	V-14452330	1999-07-02
739	V-30032932	DEPABLOS DANNY	\N	\N	19	\N	\N	1054	8	V-16145154	2003-07-29
740	V-	SANTOS CASTRO	\N	\N	19	\N	\N	1055	4	V-9273641	2017-05-05
741	V-25870343	ESPINOZA ROSAULUIS	\N	\N	19	\N	\N	1055	5	V-9273641	1998-02-13
742	V-28750196	ROJAS YERMAINE	\N	\N	19	\N	\N	1057	1	V-25751180	2004-08-06
743	V-21116337	SANCHEZ JOSE	\N	\N	19	\N	\N	1058	5	V-11379829	1991-01-29
744	V-24401064	JULIANNYS SANCHEZ	\N	\N	19	\N	\N	1058	5	V-11379829	1992-07-08
745	V-23943001	GARCIA MARIA	\N	\N	19	\N	\N	1059	5	E-82154348	1995-08-22
746	V-25964866	GARCIA PASTOR	\N	\N	19	\N	\N	1059	5	E-82154348	1991-03-15
747	V-26367913	GARCIA RONALDO	\N	\N	19	\N	\N	1059	5	E-82154348	1998-04-27
748	V-29756191	RAMIREZ YSMARY	\N	\N	19	\N	\N	1061	8	V-15844787	2002-09-03
749	V-30871692	LANDAETA NAHOBY	\N	\N	19	\N	\N	1063	8	V-13304589	2005-08-21
750	V-32267502	RAMIREZ GENESIS	\N	\N	19	\N	\N	1071	8	V-15314472	2006-02-05
751	V-24218824	HERNANDEZ JOVANNY	\N	\N	19	\N	\N	1073	5	V-6198383	1994-04-20
752	V-26484846	COTE JULIANI	\N	\N	19	\N	\N	1074	5	V-13162194	1998-06-18
753	V-	BOADA BREYERLING	\N	\N	19	\N	\N	1074	4	V-13162194	2015-12-30
754	V-	BOADA ISAIAS	\N	\N	19	\N	\N	1074	4	V-13162194	2017-02-19
755	V-	BOADA JEREMIAS	\N	\N	19	\N	\N	1074	4	V-13162194	2014-04-29
756	V-27573710	SURITA YUSBELIS	\N	\N	19	\N	\N	1079	5	V-15344884	2000-06-07
757	V-	HERNANDEZ ASHEY	\N	\N	19	\N	\N	1082	8	V-13582703	2012-10-06
758	V-4856537	HENRIQUEZ MARLENE	\N	\N	19	\N	\N	1088	7	V-6276681	1958-02-23
759	V-20365687	MORALES JOSEPH	\N	\N	19	\N	\N	1090	5	V-11672896	1992-12-12
760	V-9958629	BARRETO RUTH	\N	\N	19	\N	\N	1091	3	V-16683647	1970-03-18
761	V-5519421	BARRETO MABEL	\N	\N	19	\N	\N	1091	3	V-16683647	1957-01-03
762	V-24471699	LONGA JONATHAN	\N	\N	19	\N	\N	1092	1	V-18603097	1995-12-29
763	V-6129480	ORTIZ AQUILES	\N	\N	19	\N	\N	1094	8	V-20629897	1962-10-27
764	V-23611585	VIVAS AYMARA	\N	\N	19	\N	\N	1095	5	V-10099085	1995-03-05
765	V-	LOPEZ KRYSTTYAN 	\N	\N	19	\N	\N	1095	4	V-10099085	1968-07-16
766	V-26741718	VIVAS IVAN	\N	\N	19	\N	\N	1095	5	V-10099085	1998-10-23
767	V-30242944	TUÑEZ MARIA	\N	\N	0	\N	\N	1097	8	V-16022866	2004-05-15
768	V-6350898	ACOSTA CARLOS	\N	\N	19	\N	\N	1104	1	V-6868738	1961-09-04
769	V-9411953	ACOSTA MONICA	\N	\N	19	\N	\N	1104	1	V-6868738	1967-09-09
770	V-10630568	RENGIFO ELISA	\N	\N	19	\N	\N	1105	3	V-17060282	1971-08-20
771	V-24160098	TORRES JENNIFER	\N	\N	19	\N	\N	1107	5	V-9626157	1993-03-23
772	V-20678513	PEREZ SUNDDY	\N	\N	19	\N	\N	1107	8	V-9626157	1992-01-29
773	V-	MENDOZA REICHELL	\N	\N	19	\N	\N	1107	4	V-9626157	2013-11-03
774	V-25174189	CONDE AIDELY	\N	\N	19	\N	\N	1109	5	V-11688665	1998-08-30
775	V-19606089	MORA YELITZA	\N	\N	19	\N	\N	1115	5	V-11215408	1989-06-01
776	V-22017963	MORA JESSIKA	\N	\N	19	\N	\N	1115	5	V-11215408	1993-11-25
777	V-12388250	PALACIOS NESTOR	\N	\N	19	\N	\N	1116	8	V-12069240	1975-05-06
778	V-10119179	BARRIOS YSMERI	\N	\N	19	\N	\N	1116	1	V-12069240	1969-12-23
779	V-19220116	ESCALONA KATHERINE	\N	\N	19	\N	\N	1117	5	V-6335294	1990-01-04
780	V-22035754	ESCALONA KAREN	\N	\N	19	\N	\N	1117	5	V-6335294	1994-02-24
781	V-26645171	ESCALONA NORBENIT	\N	\N	19	\N	\N	1117	5	V-6335294	1998-08-08
782	V-	RANGEL MATHIAS	\N	\N	19	\N	\N	1117	4	V-6335294	2018-02-15
783	V-21411407	MUJICA GUILLERMO	\N	\N	19	\N	\N	1119	5	V-6698543	1992-10-05
784	V-30436475	KRISBEL ACEVEDO	\N	\N	19	\N	\N	1121	8	V-13374212	2004-10-23
785	V-21104080	CANONICO LUIS	\N	\N	19	\N	\N	1123	1	V-18094527	1994-03-16
786	V-31985625	FERRAEZ HENDRICK	\N	\N	19	\N	\N	1125	1	V-28015004	2007-07-25
787	V-27130044	ORELLANEZ ORIANNY	\N	\N	19	\N	\N	1127	1	V-25220257	1999-10-31
788	V-29741095	ORELLANEZ ANGEL	\N	\N	19	\N	\N	1127	1	V-25220257	2002-07-10
789	V-30165286	ORELLANEZ ARIANNY	\N	\N	19	\N	\N	1127	1	V-25220257	2003-09-08
790	V-30954596	ORELLANEZ AMBAR	\N	\N	19	\N	\N	1127	1	V-25220257	2004-09-27
791	V-32010640	ORELLANEZ JESUS	\N	\N	19	\N	\N	1127	1	V-25220257	2006-12-16
792	V-	ORELLANEZ IRIANNYS	\N	\N	19	\N	\N	1127	1	V-25220257	2009-10-24
793	V-25218981	MATA OMAR	\N	\N	19	\N	\N	1128	1	V-19314680	1996-10-14
794	V-27279748	FERNANDEZ ARIANNYS	\N	\N	19	\N	\N	1132	5	V-11834514	2000-08-29
795	V-27488448	VELASQUEZ YAIQUERLIS	\N	\N	19	\N	\N	1134	1	V-24074748	2000-07-19
796	V-8638339	GARCIA ALEJA	\N	\N	19	\N	\N	1134	3	V-24074748	1965-07-17
797	V-24314159	CONTRERAS KATHERINE	\N	\N	19	\N	\N	1135	5	V-14123955	1994-08-25
798	V-26952709	CONTRERAS YULIBETH	\N	\N	19	\N	\N	1135	5	V-14123955	2000-02-29
799	V-	CONTRERAS DAVIS	\N	\N	19	\N	\N	1135	4	V-14123955	2010-10-13
800	V-	ANDRES CUÑATE	\N	\N	19	\N	\N	1135	4	V-14123955	2017-04-30
801	V-23781816	CABRITA ZULEIKA	\N	\N	19	\N	\N	1136	1	V-25609304	1991-06-03
802	V-25492618	CABRITA BENEDICTO	\N	\N	19	\N	\N	1136	1	V-25609304	1993-03-26
803	V-30060534	CABRITA ELADIO	\N	\N	19	\N	\N	1136	1	V-25609304	1999-12-14
804	V-31264978	CABRITA LAURELIS	\N	\N	19	\N	\N	1136	1	V-25609304	2003-10-02
805	V-25609305	CABRITA KENDRI	\N	\N	19	\N	\N	1136	1	V-25609304	1996-10-31
806	V-17747277	ULICE BORROSO	\N	\N	19	\N	\N	1136	8	V-25609304	1985-03-24
807	V-23303992	ZARATE HEIDIS	\N	\N	19	\N	\N	1137	1	V-20047770	1995-02-28
808	V-33576144	VERA KLEIBERT	\N	\N	19	\N	\N	1137	6	V-20047770	2010-10-03
809	V-	MORA EVANLLELY	\N	\N	19	\N	\N	1137	6	V-20047770	2015-06-04
810	V-25957965	GRANADILLO PAOLA	\N	\N	19	\N	\N	1143	8	V-11226419	1998-08-25
811	V-26334156	GRANADILLO VALENTINA	\N	\N	19	\N	\N	1143	8	V-11226419	1999-08-26
812	V-25220099	SALAS MILDRED	\N	\N	19	\N	\N	1147	7	V-20221985	1977-07-09
813	V-18934913	CORRO ALBERTH	\N	\N	19	\N	\N	1148	5	V-6504510	1989-07-17
814	V-21412597	CORRO ANTONIO	\N	\N	19	\N	\N	1148	5	V-6504510	1991-05-26
815	V-26510195	CORRO ANDRYS	\N	\N	19	\N	\N	1148	5	V-6504510	1996-12-15
816	V-24211248	OBELMEJIAS MARIANGEL	\N	\N	19	\N	\N	1151	5	V-9489952	1995-11-09
817	V-26527145	OBELMEJIAS MIGUEL	\N	\N	19	\N	\N	1151	5	V-9489952	1998-07-15
818	V-24207729	PEREZ IVAN	\N	\N	19	\N	\N	1151	5	V-9489952	1996-03-05
819	V-23622418	MAYORA ANIUSKA	\N	\N	19	\N	\N	1152	5	V-11562205	1973-10-03
820	V-23613594	RAMIREZ MARIA	\N	\N	19	\N	\N	1153	1	V-27488315	1994-05-01
821	V-27488316	RAMIREZ GABRIELA	\N	\N	19	\N	\N	1153	1	V-27488315	1999-03-12
822	V-32820618	RAMIREZ GENESIS	\N	\N	19	\N	\N	1153	1	V-27488315	2009-03-13
823	V-5184625	GARCIA OSWALDO	\N	\N	19	\N	\N	1155	1	V-6379095	1954-05-09
824	V-19822731	ARIAS MARYOLI	\N	\N	19	\N	\N	1157	5	V-8745948	1992-07-11
825	V-6399622	INFANTE ROSA	\N	\N	19	\N	\N	1160	1	V-6388012	1964-08-30
826	V-18934771	RAMOS RUBEN	\N	\N	19	\N	\N	1163	1	V-17235826	1987-06-04
827	V-15797898	CARMONA BEZABE	\N	\N	19	\N	\N	1164	5	V-6119245	1982-06-25
828	V-32229392	VELASQUEZ NAHOMI	\N	\N	19	\N	\N	1164	4	V-6119245	2009-08-04
829	V-27302467	CARMONA JESUBETH	\N	\N	19	\N	\N	1164	5	V-6119245	1999-07-30
830	V-31187335	BRICEÑO YITZAID	\N	\N	19	\N	\N	1165	4	V-6501661	2005-12-06
831	V-	YANEZ LIGIA	\N	\N	19	\N	\N	1165	4	V-6501661	2007-07-26
832	V-	YANEZ KAYLIA	\N	\N	19	\N	\N	1165	4	V-6501661	2013-10-01
833	V-19787671	HERNANDEZ NOHELI	\N	\N	19	\N	\N	1166	5	V-7945304	1990-11-21
834	V-20102158	HERNANDEZ NORAILI	\N	\N	19	\N	\N	1166	5	V-7945304	1991-11-17
835	V-	HERNANDEZ NORBEIKER	\N	\N	19	\N	\N	1166	4	V-7945304	2008-09-14
836	V-22965084	UBAN EDUARDO	\N	\N	19	\N	\N	1167	5	V-6519173	1994-08-29
837	V-25957253	UBAN GABRIEL	\N	\N	19	\N	\N	1167	5	V-6519173	1997-07-06
838	V-11033884	UBAN YEMMY	\N	\N	19	\N	\N	1167	1	V-6519173	1973-07-04
839	V-24213082	CARRIZLES CIRA	\N	\N	19	\N	\N	1168	5	V-12484626	1995-08-05
840	V-27130261	CARRIZLES CATHERIN	\N	\N	19	\N	\N	1168	5	V-12484626	1998-09-14
841	V-	CARRIZALEZ MUGUEL	\N	\N	19	\N	\N	1168	4	V-12484626	2016-09-08
842	V-	CARRIZLAEZ YOSWAR	\N	\N	19	\N	\N	1168	4	V-12484626	2019-06-11
843	V-12955951	CRUZ WLADIMIR 	\N	\N	19	\N	\N	1169	8	V-5779709	1975-10-12
844	V-15605142	SUAREZ NATACHA	\N	\N	19	\N	\N	1169	5	V-5779709	1982-10-29
845	V-15421278	SUAREZ EZEQUIEL	\N	\N	19	\N	\N	1169	5	V-5779709	1981-04-10
846	V-26825403	FLORES KAREMIS	\N	\N	19	\N	\N	1172	5	V-15700979	1997-10-02
847	V-16813262	ALVARADO SORANGEL	\N	\N	19	\N	\N	1178	1	V-14198655	1981-09-07
848	V-14897620	GONZALEZ ELAINE	\N	\N	19	\N	\N	1179	1	V-18037341	1977-03-25
849	V-26946005	SAAVEDAR ESTEFANIA	\N	\N	19	\N	\N	1180	5	V-13950362	1977-07-16
850	V-22756822	LICETT MADELEINE	\N	\N	19	\N	\N	1181	5	V-11920228	1995-07-29
851	V-	GARCIA HANSEN	\N	\N	19	\N	\N	1181	4	V-11920228	2010-02-09
852	V-27121404	CASTILLO NIETZER	\N	\N	19	\N	\N	1183	5	V-14387483	1998-09-04
853	V-	CASTILLO AUSTIN	\N	\N	19	\N	\N	1183	4	V-14387483	2019-10-09
854	V-27794561	RODRIGUEZ FRANCIMAR	\N	\N	19	\N	\N	1184	5	V-12377066	2000-12-12
855	V-6189495	NEGRIN NESTOR	\N	\N	19	\N	\N	1185	1	V-5519701	1963-10-25
856	V-14974087	NEGRIN JONATHAN	\N	\N	19	\N	\N	1185	5	V-5519701	1982-04-19
857	V-21131690	NEGRIN GIOVANNA	\N	\N	19	\N	\N	1185	5	V-5519701	1991-10-05
858	V-26061728	ZABALETA KENESY	\N	\N	19	\N	\N	1186	5	V-13453883	1997-06-25
859	V-27499247	ZABALETA KELVI	\N	\N	19	\N	\N	1186	5	V-13453883	1999-11-01
860	V-	SILVA KEISY	\N	\N	19	\N	\N	1186	4	V-13453883	2016-12-04
861	V-28308842	COLMENARES DUGLENIS	\N	\N	19	\N	\N	1189	1	V-26435999	2001-07-20
862	V-24760558	VARGAS YOSLENNY	\N	\N	19	\N	\N	1191	5	V-12383341	1996-02-14
863	V-26794031	VARGAS JHOSLEIDY	\N	\N	19	\N	\N	1191	1	V-12383341	1990-07-23
864	V-25774191	ESTE EATEILIS	\N	\N	19	\N	\N	1193	1	V-18677798	1996-02-09
865	V-22768257	ESTE ESTARQUI	\N	\N	19	\N	\N	1193	1	V-18677798	1994-09-29
866	V-20871995	ESTE ESTARLIN	\N	\N	19	\N	\N	1193	1	V-18677798	1991-02-11
867	V-18676814	ESTE ESTEIVIS	\N	\N	19	\N	\N	1193	1	V-18677798	1988-06-01
868	V-	ESTE DYLAN	\N	\N	19	\N	\N	1193	6	V-18677798	2014-09-20
869	V-	ESTE DANIEL	\N	\N	19	\N	\N	1193	6	V-18677798	2016-01-29
870	V-18221321	PADRON TIFFANY	\N	\N	19	\N	\N	1200	1	V-14756473	1987-10-13
871	V-	GUERRERO LUISANJELY	\N	\N	19	\N	\N	1200	6	V-14756473	2007-10-04
872	V-31935943	RANGEL BARBARA	\N	\N	19	\N	\N	1208	8	V-20751677	2007-06-18
873	V-27159005	FREITES DUBRASKA	\N	\N	19	\N	\N	1209	5	V-10746187	1999-04-19
874	V-27488974	FREITES ELIENET	\N	\N	19	\N	\N	1209	5	V-10746187	2000-08-10
875	V-17967903	PARRA DIMAN	\N	\N	19	\N	\N	1211	5	V-5977690	1985-08-14
876	V-19380094	PARRA JORDAN	\N	\N	19	\N	\N	1211	5	V-5977690	1990-01-29
877	V-27321754	PARRA SARAI	\N	\N	19	\N	\N	1211	5	V-5977690	1999-08-21
878	V-	BRACAMONTE ANDRES	\N	\N	19	\N	\N	1211	4	V-5977690	1999-08-21
879	V-	BRACAMONTE ANDREA	\N	\N	19	\N	\N	1211	4	V-5977690	2016-06-24
880	V-	PARRA DYLAN	\N	\N	19	\N	\N	1211	4	V-5977690	2019-03-01
881	V-26996743	DAZA LUIS	\N	\N	19	\N	\N	1212	5	V-24223690	1999-04-25
882	V-27020521	DAZA MARBY	\N	\N	19	\N	\N	1212	5	V-24223690	1997-05-24
883	V-25683283	FERNANDEZ JOSE	\N	\N	19	\N	\N	1215	1	V-26113013	1996-05-05
884	V-17124002	ROSO MARIA	\N	\N	19	\N	\N	1220	5	V-9880865	1985-06-18
885	V-24316579	ROSA MARIA MERCEDES	\N	\N	19	\N	\N	1220	5	V-9880865	1995-02-10
886	V-14150730	GONZALEZ EDIXON	\N	\N	19	\N	\N	1223	5	V-5765881	1980-03-19
887	V-16880192	GONZALEZ JOHANA	\N	\N	19	\N	\N	1223	5	V-5765881	1983-05-17
888	V-17803492	GONZALEZ MARYURI	\N	\N	19	\N	\N	1223	5	V-5765881	1984-10-16
889	V-17803496	GONZALEZ YULEIXY	\N	\N	19	\N	\N	1223	5	V-5765881	1986-12-29
890	V-17346575	GONZALEZ JORGE	\N	\N	19	\N	\N	1223	5	V-5765881	1981-08-19
891	V-25641887	DIAZ YOSUET 	\N	\N	23	\N	\N	1227	5	V-12993039	1996-11-24
892	V-	DIAZ JONNALBERT 	\N	\N	23	\N	\N	1227	4	V-12993039	2012-05-04
893	V-12641734	AYALA ROBERT	\N	\N	23	\N	\N	1229	8	V-6857422	1975-08-01
894	V-6547953	ARCIA XIOMARA 	\N	\N	23	\N	\N	1229	1	V-6857422	1963-04-05
895	V-6963392	MARCANO JOSE 	\N	\N	23	\N	\N	1229	8	V-6857422	1966-09-17
896	V-6017022	NOGUERA SERGIO	\N	\N	23	\N	\N	1231	3	V-15331204	1961-03-10
897	V-22774610	QUINTERO MIRNEIDYS 	\N	\N	23	\N	\N	1234	5	V-6358480	1993-08-13
898	V-	AYALA ROMINA 	\N	\N	23	\N	\N	1234	4	V-6358480	2018-08-27
899	V-16870935	QUINTERO YSSI	\N	\N	23	\N	\N	1234	5	V-6358480	1984-09-28
900	V-18187837	OCAMPO WINDER 	\N	\N	23	\N	\N	1234	8	V-6358480	1986-11-03
901	V-16671291	LABRADOR DENNYS 	\N	\N	23	\N	\N	1234	8	V-6358480	1982-06-01
902	V-25641887	DIAZ YOSWET	\N	\N	19	\N	\N	1246	5	V-12973039	1963-04-16
903	V-	DIAZ JONALBERTH	\N	\N	19	\N	\N	1246	4	V-12973039	2012-05-04
904	V-26061728	ZABALETA KENESY	\N	\N	19	\N	\N	1247	5	V-13453883	1997-06-25
905	V-27499247	ZABALETA KELVI	\N	\N	19	\N	\N	1247	5	V-13453883	1999-11-01
906	V-	SILVA KEISY	\N	\N	19	\N	\N	1247	4	V-13453883	2016-12-04
907	V-21414472	MARTINEZ JUAN	\N	\N	19	\N	\N	1248	5	V-11025218	1989-04-20
908	V-21130095	MICETT ANNIYEL 	\N	\N	23	\N	\N	1252	5	V-6693822	1991-07-23
909	V-	MICETT LUISANA 	\N	\N	23	\N	\N	1252	4	V-6693822	2009-07-11
910	V-	ÑAÑEZ TEREPAIMA 	\N	\N	23	\N	\N	1252	4	V-6693822	2014-12-20
911	V-21375793	BOMPAR ALEX	\N	\N	23	\N	\N	1252	8	V-6693822	1992-01-20
912	V-24209785	CASTILLO YORGELIS 	\N	\N	23	\N	\N	1253	8	V-14757294	1995-06-20
913	V-5543155	RONDON ALMINDA	\N	\N	23	\N	\N	1253	7	V-14757294	1960-06-06
914	V-9098370	DIAZ CARLOS 	\N	\N	23	\N	\N	1253	7	V-14757294	1963-11-08
915	V-21130095	MOLINA ANNIYEL 	\N	\N	23	\N	\N	1254	5	V-6693822	1991-07-23
916	V-	MOLINA LUISANA 	\N	\N	23	\N	\N	1254	4	V-6693822	2009-07-11
917	V-	ÑAÑEZ TEREPAIMA	\N	\N	23	\N	\N	1254	4	V-6693822	2014-12-20
918	V-21375793	BOMPAR ALEX	\N	\N	23	\N	\N	1254	8	V-6693822	1992-01-20
919	V-24209785	CASTILLO YORGELIS 	\N	\N	23	\N	\N	1255	8	V-14757294	1995-06-20
920	V-5543155	RONDON ALMINDA	\N	\N	23	\N	\N	1255	7	V-14757294	1960-06-06
921	V-24209785	CASTILLO YORGELIS 	\N	\N	23	\N	\N	1256	8	V-14757294	1995-06-20
922	V-5543155	RONDON ALMINDA	\N	\N	23	\N	\N	1256	7	V-14757294	1960-06-06
923	V-9098370	DIAZ ARGENIS 	\N	\N	23	\N	\N	1256	7	V-14757294	1963-11-08
924	V-	ORTEGA REINALDO	\N	\N	23	\N	\N	1259	5	V-4887663	1992-01-06
925	V-31988694	ROJAS FRANKLIN 	\N	\N	23	\N	\N	1261	8	V-14645767	2005-06-01
926	V-15161391	RODRIGUEZ ESMERALDA	\N	\N	23	\N	\N	1263	1	V-17476248	1982-04-18
927	V-18221772	RODRIGUEZ AYARI 	\N	\N	23	\N	\N	1263	1	V-17476248	1988-10-05
928	V-14195950	RODRIGUEZ MAILENY 	\N	\N	23	\N	\N	1263	1	V-17476248	1979-08-15
929	V-14195948	RODRIGUEZ VICTOR 	\N	\N	23	\N	\N	1263	1	V-17476248	1978-01-14
930	V-28308842	COLMENARES DUGLENIS 	\N	\N	23	\N	\N	1266	1	V-26435999	2001-07-20
931	V-14874593	DIAZ VIRGINIA 	\N	\N	23	\N	\N	1272	6	V-17967455	1980-04-22
932	V-30375794	DIAZ ORIANA 	\N	\N	23	\N	\N	1272	1	V-17967455	2003-06-26
933	V-26609967	CLEMENTE RICHAD 	\N	\N	23	\N	\N	1273	4	V-15804674	1998-07-23
934	V-18934892	LICOA MARIELA 	\N	\N	23	\N	\N	1273	5	V-15804674	1989-04-17
935	V-17146590	LICOA RUBEN 	\N	\N	23	\N	\N	1273	5	V-15804674	1983-06-13
936	V-15804675	LICOA ESTEFANIA 	\N	\N	23	\N	\N	1273	5	V-15804674	1981-11-24
937	V-10788724	LOPEZ ANTONIO 	\N	\N	23	\N	\N	1275	1	V-12097357	1969-06-13
938	V-31431443	CHIRINOS EDDYS	\N	\N	19	\N	\N	1277	6	V-15942937	2001-04-02
939	V-31410554	PEREZ BRANDON	\N	\N	19	\N	\N	1277	8	V-15942937	2005-12-23
940	V-6135518	ROLDAN FRANCIS 	\N	\N	23	\N	\N	1290	1	V-6018389	1964-01-01
941	V-30886699	ANIN BOB 	\N	\N	23	\N	\N	1290	6	V-6018389	2005-03-16
942	V-28469121	ALVARADO OSCAR	\N	\N	23	\N	\N	1294	5	V-14908430	2000-06-25
943	V-29662632	GONZALEZ MICHELLE	\N	\N	23	\N	\N	1295	5	V-15439314	1999-11-04
944	V-25847846	URBAEZ LORENA	\N	\N	23	\N	\N	1295	5	V-15439314	1996-04-29
945	V-	GASPAR CRISTHIAN 	\N	\N	23	\N	\N	1296	1	V-16343128	2015-11-12
946	V-	MARTINES JORLEY	\N	\N	23	\N	\N	1297	4	V-23616174	2008-06-24
947	V-	MARTINEZ DAVIER 	\N	\N	23	\N	\N	1297	4	V-23616174	2014-07-01
948	V-23198121	MAITA KEILYN 	\N	\N	23	\N	\N	1299	4	V-10506202	1995-06-29
949	V-	CARDOZO PEDRO 	\N	\N	23	\N	\N	1299	4	V-10506202	2017-12-15
950	V-27746035	BLANCO JAIRIMAR	\N	\N	23	\N	\N	1300	5	V-12961103	2000-12-07
951	V-26745913	NIÑO KEIVI 	\N	\N	23	\N	\N	1301	5	V-6894392	1997-08-13
952	V-25624393	MEDINA FRANK 	\N	\N	23	\N	\N	1301	5	V-6894392	1993-05-13
953	V-24697710	RAMIREZ VICTOR 	\N	\N	23	\N	\N	1303	5	V-6895922	1996-03-26
954	V-	ALGUETO YOIRLEDYS 	\N	\N	23	\N	\N	1304	6	V-18555029	2016-12-06
955	V-	ALGUETO KEIDERLYS 	\N	\N	23	\N	\N	1304	6	V-18555029	2011-05-23
956	V-22525812	SERRANO WILDER 	\N	\N	23	\N	\N	1304	1	V-18555029	1985-10-04
957	V-21102373	ALGUETO KENIA	\N	\N	23	\N	\N	1304	1	V-18555029	1990-12-22
958	V-	ALGUETO YOIRLEDYS 	\N	\N	23	\N	\N	1305	6	V-18555029	2016-12-06
959	V-	ALGUETO KEIDERLYS 	\N	\N	23	\N	\N	1305	6	V-18555029	2011-05-23
960	V-22525812	SERRANO WILDER 	\N	\N	23	\N	\N	1305	1	V-18555029	1985-10-04
961	V-21102373	ALGUETO KENIA	\N	\N	23	\N	\N	1305	1	V-18555029	1990-12-22
962	V-24673224	RAMOS OSMAR	\N	\N	23	\N	\N	1305	1	V-18555029	1992-05-18
963	V-27647143	RANGEL WILDALY	\N	\N	23	\N	\N	1307	5	V-14286249	1999-05-14
964	V-22772244	REALES CARLOS 	\N	\N	23	\N	\N	1308	5	V-83772051	1991-11-09
965	V-18313962	REALE3S GUILLERMO 	\N	\N	23	\N	\N	1308	5	V-83772051	1985-05-04
966	V-17921538	REALES ADRIANA 	\N	\N	23	\N	\N	1308	5	V-83772051	1988-04-27
967	V-17651244	APONTE LUIS 	\N	\N	23	\N	\N	1309	5	V-12667682	1985-09-13
968	V-22518497	APONTE JESSICA 	\N	\N	23	\N	\N	1309	5	V-12667682	1996-09-22
969	V-18359544	APONTE MARIELBA 	\N	\N	23	\N	\N	1309	5	V-12667682	1989-05-25
970	V-17963678	ESPIN ADRINA 	\N	\N	23	\N	\N	1314	5	V-9062360	1987-04-13
971	V-	ESPINJAVIER	\N	\N	23	\N	\N	1314	4	V-9062360	2015-11-18
972	V-17963678	ESPIN ADRINA 	\N	\N	23	\N	\N	1315	5	V-9062360	1987-04-13
973	V-	ESPIN JAVIER	\N	\N	23	\N	\N	1315	4	V-9062360	2015-11-18
974	V-1781969	DIAZ BEATRIZ 	\N	\N	23	\N	\N	1315	2	V-9062360	1969-08-17
975	V-12385701	RANGEL JOSE 	\N	\N	23	\N	\N	1316	1	V-12385649	1974-04-09
976	V-6284562	RANGEL WILLI 	\N	\N	23	\N	\N	1316	1	V-12385649	1964-06-07
977	V-10632341	RANGEL WENDY 	\N	\N	23	\N	\N	1316	1	V-12385649	1967-06-10
978	V-25891602	LOPEZ KEYVER 	\N	\N	23	\N	\N	1317	5	V-6683545	1994-10-30
979	V-21451698	RONDON CHEILA 	\N	\N	23	\N	\N	1318	1	V-26210979	1993-11-13
980	V-30687391	COLINA MICHEL	\N	\N	23	\N	\N	1318	1	V-26210979	2004-09-10
981	V-26063447	COLINA HECTOR	\N	\N	23	\N	\N	1318	1	V-26210979	1997-08-22
982	V-19738526	OMAÑA LITO 	\N	\N	23	\N	\N	1318	8	V-26210979	1991-06-19
983	V-27941129	PAEZ WHESNER 	\N	\N	23	\N	\N	1320	5	V-15800017	2001-07-05
984	V-	OJEDA DIEGO	\N	\N	19	\N	\N	1322	8	V-12916924	2008-09-23
985	V-17530059	ACOSTA JANETH 	\N	\N	23	\N	\N	1323	1	V-18275419	1984-03-19
986	V-33228615	ACOSTA KEVIN 	\N	\N	23	\N	\N	1323	6	V-18275419	2009-12-07
987	V-	ALMANZA VICTOR	\N	\N	23	\N	\N	1323	6	V-18275419	2011-12-14
988	V-	ACOSTA DIANA 	\N	\N	23	\N	\N	1323	6	V-18275419	2018-02-23
989	V-	GIL MARIALIS 	\N	\N	23	\N	\N	1323	8	V-18275419	2008-03-12
990	V-6562214	GONZALEZ JUAN 	\N	\N	23	\N	\N	1326	8	V-24317652	1964-02-11
991	V-26996194	ZERPA DAYSUMI	\N	\N	19	\N	\N	1329	5	V-14452990	1999-09-19
992	V-26996193	LIDISE YOKLLEIVER	\N	\N	19	\N	\N	1329	5	V-14452990	1999-11-01
993	V-19504717	LARA DAVID	\N	\N	19	\N	\N	1337	1	V-10384368	1971-02-12
994	V-27111760	RODRIGUEZ MARIA	\N	\N	19	\N	\N	1338	5	V-14774153	1998-12-14
995	V-	ZAMANTHA RODRIGUEZ	\N	\N	19	\N	\N	1338	4	V-14774153	2016-04-12
996	V-13419586	HERRERA BELKIS	\N	\N	19	\N	\N	1339	5	V-5631461	1977-06-09
997	V-16300493	HERRERA MELVIS	\N	\N	19	\N	\N	1339	5	V-5631461	1982-02-10
998	V-14165963	MUJICA EDUAR	\N	\N	19	\N	\N	1340	1	V-14165962	1979-12-08
999	V-21130412	ZAMBRANO ALEXANDER	\N	\N	19	\N	\N	1344	1	V-12260289	0412-12-21
1000	V-26610067	MARIÑO BRAYAN	\N	\N	19	\N	\N	1344	5	V-12260289	1999-04-02
1001	V-19478117	GIL YORLENIS 	\N	\N	23	\N	\N	1348	1	V-18994779	1990-09-04
1002	V-22015294	BARBOZA EVER	\N	\N	23	\N	\N	1352	5	V-82263532	1993-01-21
1003	V-25866544	BARBOZA EVELIN 	\N	\N	23	\N	\N	1352	5	V-82263532	1995-05-27
1004	V-24494462	CONTRERAS DARWIN	\N	\N	1	\N	\N	1353	6	V-10391766	1992-11-03
1005	V-27756279	CHACON YEISON	\N	\N	1	\N	\N	1354	5	V-6234749	2000-12-22
1006	V-28412249	OVALLES AARON 	\N	\N	23	\N	\N	1355	5	V-16030430	2000-02-27
1007	V-28322256	CORNIVEL AARON 	\N	\N	23	\N	\N	1356	5	V-10480664	2001-07-23
1008	V-9990200	AGUILAR YAJAIRA	\N	\N	1	\N	\N	1357	3	V-19430728	1967-06-11
1009	V-26809466	ROMERO BRYAN	\N	\N	1	\N	\N	1358	5	V-13420914	1999-02-15
1010	V-24309120	NIETO ANNERYS 	\N	\N	23	\N	\N	1360	5	V-6653971	1995-11-18
1011	V-26483087	GUTIERREZ LUZ 	\N	\N	23	\N	\N	1360	5	V-6653971	1998-04-23
1012	V-30557765	GUTIERREZ LEYDI 	\N	\N	23	\N	\N	1360	5	V-6653971	2004-04-29
1013	V-27713768	JARAMILLO JOSEPH	\N	\N	1	\N	\N	1363	5	V-13384946	2001-02-06
1014	V-20307078	ROSALES ABRAHAM	\N	\N	1	\N	\N	1371	5	V-10520459	1991-09-18
1015	V-27755371	ACUÑA WALTER	\N	\N	19	\N	\N	1376	5	V-12837426	2008-11-25
1016	V-21410869	ACUNA GERALDINE	\N	\N	19	\N	\N	1376	5	V-12837426	1992-09-22
1017	V-25322615	ACUÑA SADRICK	\N	\N	19	\N	\N	1376	5	V-12837426	1996-04-01
1018	V-25078816	RODRIGUEZ JUNIOR	\N	\N	19	\N	\N	1376	5	V-12837426	1993-08-10
1019	V-30057315	FIGUEROA YANILZA	\N	\N	19	\N	\N	1376	8	V-12837426	2001-09-07
1020	V-19504717	LARA DAVID 	\N	\N	23	\N	\N	1378	1	V-10384368	1968-03-08
1021	V-24206310	ESPINOZA DANIEL 	\N	\N	23	\N	\N	1381	5	V-13515513	1994-09-05
1022	V-26279025	ESPINOZA FREDDY 	\N	\N	23	\N	\N	1381	1	V-13515513	2002-02-21
1023	V-	ESPINOZA DILAN 	\N	\N	23	\N	\N	1381	4	V-13515513	2013-11-27
1024	V-	ESPINOZA SEBASTIAN 	\N	\N	23	\N	\N	1381	4	V-13515513	2017-03-03
1025	V-25845927	AGUILAR JHEANGER	\N	\N	23	\N	\N	1382	5	V-15615779	1996-09-19
1026	V-15572269	TRILLO HARINSON 	\N	\N	23	\N	\N	1383	1	V-15572268	1979-12-18
1027	V-20299039	TRILLO GERMARYS 	\N	\N	23	\N	\N	1383	1	V-15572268	1990-10-02
1028	V-29621008	MARCANO LUIS	\N	\N	19	\N	\N	1388	5	V-6516425	1999-10-13
1029	V-22546469	HENRIQUEZ DOUGLAS	\N	\N	19	\N	\N	1390	5	V-11029908	46469-05-22
1030	V-26476508	HENRIQUEZ HELLEN	\N	\N	19	\N	\N	1390	5	V-11029908	1998-08-21
1031	V-22783337	ACEVEDO ALEJANDRA 	\N	\N	0	\N	\N	1392	1	V-22783336	1994-06-06
1032	V-25516356	ACEVEDO ANDREINA 	\N	\N	0	\N	\N	1392	1	V-22783336	1997-02-19
1033	V-16287666	AMARO MARIA DE LOS ANGELES	\N	\N	19	\N	\N	1395	8	V-11310911	1973-07-09
1034	V-20615191	RAMOS JESUS	\N	\N	19	\N	\N	1408	1	V-15342886	1992-12-03
1035	V-22029212	HERNANDEZ CARVIS	\N	\N	19	\N	\N	1409	5	V-10147488	1997-09-27
1036	V-15820703	SIVIRA YORMAN 	\N	\N	23	\N	\N	1413	1	V-19351001	1982-12-01
1037	V-10010157	GONZALEZ JAVIER	\N	\N	19	\N	\N	1415	1	V-15581289	1976-07-02
1038	V-14050073	GONZALEZ JESSIKA	\N	\N	19	\N	\N	1415	1	V-15581289	1979-03-22
1039	V-30573737	GONZALEZ MARIANA	\N	\N	19	\N	\N	1415	6	V-15581289	2002-01-16
1040	V-10010157	GONZALEZ JAVIER	\N	\N	19	\N	\N	1416	1	V-15581289	1976-07-02
1041	V-14050073	GONZALEZ JESSIKA	\N	\N	19	\N	\N	1416	1	V-15581289	1979-03-22
1042	V-30573737	GONZALEZ MARIANA	\N	\N	19	\N	\N	1416	6	V-15581289	2002-01-16
1043	V-27294431	ZAMBRANO AMANDA	\N	\N	19	\N	\N	1432	5	V-16574252	1998-11-10
1044	V-25876113	ZAMBRANO MIGUEL	\N	\N	19	\N	\N	1432	5	V-16574252	1997-09-14
1045	V-26911582	GUTIERREZ GREISY	\N	\N	19	\N	\N	1434	5	V-12358480	1999-10-12
1046	E-83772051	REALES MARIA	\N	\N	19	\N	\N	1454	1	V-16674327	1966-10-08
1047	V-12667682	REALES MARIBEL	\N	\N	19	\N	\N	1454	1	V-16674327	1964-08-17
1048	V-22772244	REALES CARLOS	\N	\N	19	\N	\N	1454	6	V-16674327	1991-01-09
1049	V-17651244	APONTE LUIS	\N	\N	19	\N	\N	1454	6	V-16674327	1985-09-13
1050	V-18313962	CABARCOS GUILLERMO	\N	\N	19	\N	\N	1454	6	V-16674327	1985-05-04
1051	V-22518497	APONTE JESSICA	\N	\N	19	\N	\N	1454	6	V-16674327	1996-09-22
1052	V-18359544	REALES MARIELBA	\N	\N	19	\N	\N	1454	6	V-16674327	1989-05-25
1053	V-17921538	CABARCAS ADRIANA	\N	\N	19	\N	\N	1454	6	V-16674327	1988-04-27
1054	V-6890030	APONTE FRANCOIAL	\N	\N	19	\N	\N	1454	8	V-16674327	1962-10-10
1055	V-	GONZALEZ MIA	\N	\N	19	\N	\N	1455	4	V-9482473	2017-08-01
1056	V-19559996	BUSTAMANTE ELIO	\N	\N	19	\N	\N	1456	5	V-12762672	1987-05-28
1057	V-24900745	CARMENATE CARLOS 	\N	\N	23	\N	\N	1458	5	V-14585835	1995-06-11
1058	V-27071981	GODOY EDWAN 	\N	\N	23	\N	\N	1458	5	V-14585835	1999-01-03
1059	V-20114779	CAPOTE MERCEDES 	\N	\N	23	\N	\N	1461	5	V-12729637	1991-09-24
1060	V-24462790	GRATEROL SUSANA 	\N	\N	23	\N	\N	1461	5	V-12729637	1995-03-14
1061	V-19720091	LEON GENESIS	\N	\N	23	\N	\N	1462	5	V-10181168	1992-01-15
1062	V-26152446	HERNANDEZ GENELIS 	\N	\N	23	\N	\N	1462	5	V-10181168	1998-02-10
1063	V-27038047	HERNANDEZ LUIS 	\N	\N	23	\N	\N	1462	5	V-10181168	2000-02-04
1064	V-	LEON IRAIDIS 	\N	\N	23	\N	\N	1462	4	V-10181168	2008-03-23
1065	V-17075050	OJEDA YOAN	\N	\N	19	\N	\N	1464	8	V-6962123	1978-10-03
1066	V-15099294	OJEDA JOEL	\N	\N	19	\N	\N	1464	8	V-6962123	1979-11-04
1067	V-15800949	SARDINAS YAMIRA	\N	\N	19	\N	\N	1464	8	V-6962123	1980-12-30
1068	V-21618334	PEREZ JUNIOR	\N	\N	19	\N	\N	1464	8	V-6962123	1986-07-25
1069	V-27373193	COLMENARES YERENA	\N	\N	19	\N	\N	1464	5	V-6962123	2000-02-03
1070	V-	OJEDA JAIR	\N	\N	19	\N	\N	1464	4	V-6962123	2016-10-04
1071	V-18954608	UTRERA YAILANIS	\N	\N	19	\N	\N	1466	5	V-8748466	1990-02-07
1072	V-17457806	UTRERA EDUARDO	\N	\N	19	\N	\N	1466	5	V-8748466	1986-07-07
1073	V-	UTRERA AMANDA	\N	\N	19	\N	\N	1466	4	V-8748466	2016-04-28
1074	V-25990349	ESPINOZA LUIS	\N	\N	19	\N	\N	1473	5	V-13128703	1997-05-08
1075	V-	ESPINOZA LUCIANO	\N	\N	19	\N	\N	1473	4	V-13128703	2018-02-07
1076	V-26619728	LAYA CHIQUINQUIRA	\N	\N	19	\N	\N	1476	5	V-6110646	1998-08-18
1077	V-30021378	XOTCHILT APONTE	\N	\N	19	\N	\N	1477	4	V-5965583	2003-08-29
1078	V-23785000	HERRERA MICHEL	\N	\N	19	\N	\N	1482	5	V-13419870	1993-03-02
1079	V-23785074	HERRERA MAYKOL	\N	\N	19	\N	\N	1482	5	V-13419870	1995-02-11
1080	V-26435461	MONTILLA GABRIELA	\N	\N	19	\N	\N	1483	5	V-12831650	1997-10-14
1081	V-	EYTHAN JIMENEZ	\N	\N	19	\N	\N	1483	4	V-12831650	2018-03-05
1082	V-	EYLLEM JIMENEZ	\N	\N	19	\N	\N	1483	4	V-12831650	2019-06-27
1083	V-25234398	VELASQUEZ LEIDY	\N	\N	19	\N	\N	1486	1	V-20362570	1994-09-08
1084	V-29955090	VELASQUEZ KEILY	\N	\N	19	\N	\N	1486	1	V-20362570	2002-05-09
1085	V-33160461	VELASQUEZ DIANA	\N	\N	19	\N	\N	1486	1	V-20362570	2007-04-13
1086	V-	ESCALONA LEONARDO	\N	\N	19	\N	\N	1486	6	V-20362570	2019-04-22
1087	V-30166486	GUZMAN ESTEFANIA	\N	\N	19	\N	\N	1490	6	V-6440894	2001-10-30
1088	V-22647653	BURQUILLO DAVID	\N	\N	19	\N	\N	1491	5	V-9137217	1995-05-10
1089	V-21289269	CORRO BOGART	\N	\N	19	\N	\N	1497	5	V-13873565	1997-05-01
1090	V-27756420	CORRO YOSELYN	\N	\N	19	\N	\N	1497	5	V-13873565	1998-08-30
1091	V-24315250	CORRO YOSIBETH	\N	\N	19	\N	\N	1497	5	V-13873565	1996-10-11
1092	V-25212797	PLAZA YEISCHELLE	\N	\N	19	\N	\N	1500	5	V-12358563	1997-01-17
1093	V-25831180	PLAZA MERVIN	\N	\N	19	\N	\N	1500	5	V-12358563	1997-09-22
1094	V-27391724	PLAZA SUYIN	\N	\N	19	\N	\N	1500	5	V-12358563	1998-10-12
1095	V-25212797	PLAZA YEISCHELLE	\N	\N	19	\N	\N	1501	5	V-12358563	1997-01-17
1096	V-25831180	PLAZA MERVIN	\N	\N	19	\N	\N	1501	5	V-12358563	1997-09-22
1097	V-27391724	PLAZA SUYIN	\N	\N	19	\N	\N	1501	5	V-12358563	1998-10-12
1098	V-20028389	VARGAS ELVIS	\N	\N	19	\N	\N	1502	1	V-15557798	1987-11-07
1099	V-20639556	VARGAS DORIS	\N	\N	19	\N	\N	1502	1	V-15557798	1990-09-21
1100	V-26966760	URBANO LEON	\N	\N	19	\N	\N	1503	5	V-10315598	1999-10-02
1101	V-27439608	GONZALEZ MARIA	\N	\N	19	\N	\N	1505	1	V-27439608	1998-08-26
1102	V-	MENDEZ LIAM	\N	\N	19	\N	\N	1505	4	V-27439608	2018-09-29
1103	V-11924650	ARROYO ALEXIS	\N	\N	19	\N	\N	1506	5	V-469172	1975-03-08
1104	V-16226926	ARROYO ARELIS	\N	\N	19	\N	\N	1506	5	V-469172	1982-02-21
1105	V-26734057	AREVALO ALBERTO	\N	\N	19	\N	\N	1507	5	V-14926466	1997-04-01
1106	V-26734057	AREVALO ALBERTO	\N	\N	1	\N	\N	1509	5	V-14926466	1997-04-01
1107	V-25845927	AGUILAR JHEANGER	\N	\N	19	\N	\N	1510	5	V-15615779	1996-09-19
1108	V-28322256	CARIBEL AARON 	\N	\N	23	\N	\N	1511	5	V-10480664	2001-07-23
1109	V-16876089	COLLS AVYLEING	\N	\N	23	\N	\N	1512	1	V-20302526	1979-04-21
1110	V-	COLLS SAMUEL	\N	\N	23	\N	\N	1512	6	V-20302526	2010-11-14
1111	V-20210737	MORALES CARLOS	\N	\N	19	\N	\N	1515	5	V-10790319	1992-12-13
1112	V-23611463	MORALES YOVANNY	\N	\N	19	\N	\N	1515	5	V-10790319	1995-08-24
1113	V-20210736	MORALES OCTAVIO	\N	\N	19	\N	\N	1515	5	V-10790319	1988-10-16
1114	V-14742332	MORALES JAIRO	\N	\N	19	\N	\N	1515	1	V-10790319	1977-03-03
1115	V-12068347	MORALES HENRY	\N	\N	19	\N	\N	1515	1	V-10790319	1974-03-03
1116	V-27350260	VALERA WLADIMIR	\N	\N	19	\N	\N	1516	8	V-16117541	1999-03-10
1117	V-	VALERA KEIBELY	\N	\N	19	\N	\N	1516	4	V-16117541	2015-02-10
1118	V-16177382	TORRES MARIA	\N	\N	19	\N	\N	1517	5	V-6318523	7382-12-16
1119	V-	FLEIRE WHITNEY	\N	\N	19	\N	\N	1517	4	V-6318523	2010-04-17
1120	V-6893325	TINEO ANGEL 	\N	\N	23	\N	\N	1520	1	V-9099820	1966-02-02
1121	V-7926708	TINEO AURA 	\N	\N	23	\N	\N	1520	1	V-9099820	1968-03-29
1122	V-18266865	BARRIOS ARGENIS 	\N	\N	23	\N	\N	1520	5	V-9099820	1987-11-27
1123	V-20651970	COBA ROEDLY 	\N	\N	23	\N	\N	1520	8	V-9099820	1990-06-08
1124	V-22285467	MIJARES LUIS 	\N	\N	23	\N	\N	1520	6	V-9099820	1995-05-03
1125	V-26734308	BRICEÑO MARIA 	\N	\N	23	\N	\N	1520	6	V-9099820	1997-09-12
1126	V-26248049	HERNANDEZ JHOANGEL 	\N	\N	23	\N	\N	1520	6	V-9099820	1997-08-13
1127	V-30428155	HERNANDEZ JESUS 	\N	\N	23	\N	\N	1520	6	V-9099820	2003-06-01
1128	V-	VERDU AQUILES 	\N	\N	23	\N	\N	1520	6	V-9099820	2014-07-26
1129	V-27028121	VEGA HANYI	\N	\N	23	\N	\N	1523	5	V-15844903	1999-02-15
1130	V-29509763	VEGA BRAYAN 	\N	\N	23	\N	\N	1523	5	V-15844903	2000-04-05
1131	V-16903670	COLMENARES JHONATAN 	\N	\N	23	\N	\N	1524	5	V-6961530	1984-01-04
1132	V-21130400	COLMENARES ALVARO 	\N	\N	23	\N	\N	1524	5	V-6961530	1992-04-10
1133	V-21130399	COLMENARES JUNIOR 	\N	\N	23	\N	\N	1524	5	V-6961530	1993-08-02
1134	V-20129283	PRADO KIMBERLIN 	\N	\N	23	\N	\N	1524	8	V-6961530	1991-11-11
1135	V-	ROMERO ASLY	\N	\N	23	\N	\N	1526	8	V-16376100	2012-05-14
1136	V-12778661	ROJAS SATURNINA	\N	\N	23	\N	\N	1526	7	V-16376100	1971-02-11
1137	V-18364819	POLANCO ENDRY	\N	\N	23	\N	\N	1528	1	V-16168789	1987-03-23
1138	V-16168783	POLANCO HECTOR 	\N	\N	23	\N	\N	1528	1	V-16168789	1984-11-09
1139	V-16598928	MERIÑO LORVIS	\N	\N	19	\N	\N	1531	1	V-14775262	1984-04-03
1140	V-26475843	SOJO MAIKEL 	\N	\N	23	\N	\N	1534	5	V-6302433	1998-01-14
1141	V-27028121	VEGA HANYI	\N	\N	23	\N	\N	1540	5	V-15844903	1999-02-15
1142	V-18364819	POLANCO ENDRY	\N	\N	23	\N	\N	1542	1	V-16198789	1987-03-23
1143	V-16168783	POLANCO HECTOR	\N	\N	23	\N	\N	1542	1	V-16198789	1984-11-09
1144	V-21133162	TOVAR MICHELL	\N	\N	19	\N	\N	1544	5	V-11564126	1993-04-07
1145	V-26576452	PINTO SHARON	\N	\N	19	\N	\N	1544	5	V-11564126	1998-10-30
1146	V-	CUADRO MANUEL	\N	\N	19	\N	\N	1544	4	V-11564126	2016-12-02
1147	V-18364819	POLANCO ENDRY	\N	\N	19	\N	\N	1545	1	V-16168789	1987-03-23
1148	V-16168783	POLANCO HECTOR	\N	\N	19	\N	\N	1545	1	V-16168789	1984-11-09
1149	V-13637193	ROMERO GERDENIS 	\N	\N	0	\N	\N	1546	1	V-19986844	1983-07-22
1150	V-25019169	RODRIGUEZ MARTIN	\N	\N	19	\N	\N	1552	8	V-6073742	1996-08-28
1151	V-27753264	RODRIGUEZ ANDRES	\N	\N	19	\N	\N	1552	8	V-6073742	1999-05-02
1152	V-22574772	LOPEZ NEDITZA	\N	\N	19	\N	\N	1552	5	V-6073742	1990-10-15
1153	V-24831947	LOPEZ NEIVIS	\N	\N	19	\N	\N	1552	5	V-6073742	1991-10-23
1154	V-26619823	LOPEZ NESTOR	\N	\N	19	\N	\N	1552	5	V-6073742	1995-09-18
1155	V-	CASTILLO JOSE	\N	\N	19	\N	\N	1552	6	V-6073742	2012-02-24
1156	V-14560481	TIAPA YASMIN	\N	\N	19	\N	\N	1552	1	V-6073742	1978-01-20
1157	V-25773532	PEREZ GLENDA	\N	\N	19	\N	\N	1555	5	V-23682674	1964-02-08
1158	V-22021110	ASTUDILLO KENDER	\N	\N	19	\N	\N	1556	1	V-16285150	1994-07-17
1159	V-11671331	ONEIDO ROSSANA	\N	\N	19	\N	\N	1558	11	V-5141104	1971-08-26
1160	V-29875502	PULIDO MIGUEL	\N	\N	19	\N	\N	1561	5	V-15190497	2000-08-02
1161	V-29776372	HERNANDEZ PAULA	\N	\N	19	\N	\N	1571	5	E-32895342	1995-12-19
1162	V-28426377	HERNANDEZ JHAIR	\N	\N	19	\N	\N	1571	5	E-32895342	2001-03-13
1163	V-20074676	MARTINEZ HENNI	\N	\N	19	\N	\N	1571	8	E-32895342	1989-04-15
1164	V-23622918	NIÑEZ KAREN 	\N	\N	23	\N	\N	1579	5	V-11026477	1995-01-05
1165	V-28441856	ESPINOZA GABRIEL 	\N	\N	23	\N	\N	1582	5	V-6693118	2001-02-22
1166	V-20826848	CARRION ALEJANDRO	\N	\N	19	\N	\N	1584	5	V-11063501	1992-02-13
1167	V-21536108	MERCADO EROS	\N	\N	19	\N	\N	1584	5	V-11063501	1994-06-01
1168	V-20826848	CARRION ALEJANDRO	\N	\N	19	\N	\N	1585	5	V-11063501	1992-02-13
1169	V-21536108	MERCADO EROS	\N	\N	19	\N	\N	1585	5	V-11063501	1994-06-01
1170	V-27647890	MERCADO ERASMO	\N	\N	19	\N	\N	1585	5	V-11063501	2006-09-23
1171	V-21289269	CORRO BOGART 	\N	\N	23	\N	\N	1590	5	V-13873565	1997-05-01
1172	V-27756420	CORRO YOSELIN 	\N	\N	23	\N	\N	1590	5	V-13873565	1998-08-30
1173	V-24315250	CORRO MISETT 	\N	\N	23	\N	\N	1590	5	V-13873565	1996-10-11
1174	V-19368870	MATOS OSWALDO	\N	\N	19	\N	\N	1592	1	V-19368869	1991-06-08
1175	V-22036119	PALMA JOSE	\N	\N	19	\N	\N	1594	1	V-10521352	1992-06-11
1176	V-25019169	RODRIGUEZ MARTIN	\N	\N	19	\N	\N	1604	8	V-11656922	1996-08-28
1177	V-27753264	RODRIGUEZ ANDRES	\N	\N	19	\N	\N	1604	8	V-11656922	1999-05-02
1178	V-22574772	LOPEZ NEDITZA	\N	\N	19	\N	\N	1604	5	V-11656922	1990-10-15
1179	V-24831947	LOPEZ NEIVIS	\N	\N	19	\N	\N	1604	5	V-11656922	1991-10-23
1180	V-26619823	LOPEZ NESTOR	\N	\N	19	\N	\N	1604	5	V-11656922	1995-09-18
1181	V-	CASTILLO JOSE	\N	\N	19	\N	\N	1604	6	V-11656922	2012-02-24
1182	V-14560481	TIAPA YASMIN	\N	\N	19	\N	\N	1604	1	V-11656922	1978-01-20
1183	V-19162717	SIFONTES KLEINER	\N	\N	19	\N	\N	1610	5	V-5190236	1989-01-31
1184	V-21414844	SIFONTES KELVIN	\N	\N	19	\N	\N	1610	5	V-5190236	1991-10-11
1185	V-27130280	SIFONTES NATALIA	\N	\N	19	\N	\N	1610	5	V-5190236	1998-09-27
1186	V-27770334	ORIANA RANGEL	\N	\N	19	\N	\N	1621	5	V-16082292	1995-11-24
1187	V-27770333	RIOS DIANA	\N	\N	19	\N	\N	1621	1	V-16082292	2000-08-03
1188	V-	RANGEL MELANY	\N	\N	19	\N	\N	1621	4	V-16082292	2019-05-08
1189	V-10377062	FUENTES SERGIO	\N	\N	19	\N	\N	1625	1	V-12618015	1970-12-07
1190	V-12618338	FUENTES CARLOS	\N	\N	19	\N	\N	1625	1	V-12618015	1974-06-03
1191	V-27748565	GOMEZ ANDRES	\N	\N	19	\N	\N	1627	5	V-10380874	1999-10-17
1192	V-27150505	UZCATEGUI GILBERT 	\N	\N	23	\N	\N	1628	5	V-13860720	1998-10-29
1193	V-27694835	PUERTA GUSSDALYS	\N	\N	19	\N	\N	1629	5	V-5965522	1999-06-02
1194	V-23644336	MARTINEZ SUSAN	\N	\N	19	\N	\N	1631	5	V-10110671	1994-08-12
1195	V-24205853	OSIO ARIADNA	\N	\N	19	\N	\N	1632	5	V-8774110	1996-02-18
1196	V-26902627	OSIO HAROLD	\N	\N	19	\N	\N	1632	5	V-8774110	1999-09-18
1197	V-33159221	ESPINOZA ALEXIS 	\N	\N	23	\N	\N	1634	1	V-21282653	2004-04-20
1198	V-24905117	YEGUE YULIAN 	\N	\N	23	\N	\N	1637	5	V-11567425	1992-10-05
1199	V-17077672	NIETO JESUS	\N	\N	19	\N	\N	1638	5	V-6129011	1985-05-26
1200	V-17554985	NIETO YUSMARY	\N	\N	19	\N	\N	1638	5	V-6129011	1985-05-26
1201	V-25846204	NIETO JOSE	\N	\N	19	\N	\N	1638	5	V-6129011	1998-04-16
1202	V-18529708	DIAZ ALICE	\N	\N	19	\N	\N	1641	1	V-10117329	1987-02-12
1203	V-24884047	DIAZ KATIUSKA	\N	\N	19	\N	\N	1641	5	V-10117329	1990-12-16
1204	V-32467858	DIAZ DAIVERSON	\N	\N	19	\N	\N	1641	4	V-10117329	1990-12-16
1205	V-	DIAZ KAMILA	\N	\N	19	\N	\N	1641	4	V-10117329	2013-11-13
1206	V-	31109776	\N	\N	19	\N	\N	1641	4	V-10117329	2005-05-16
1207	V-23657760	SOLORZANO ALICIA 	\N	\N	23	\N	\N	1642	5	V-6073742	1994-06-06
1208	V-	SOLORZANO ALEICA 	\N	\N	23	\N	\N	1642	4	V-6073742	2018-02-23
1209	V-18529708	DIAZ ALICE	\N	\N	19	\N	\N	1643	5	V-10117329	1987-02-12
1210	V-24884047	DIAZ KATIUSKA	\N	\N	19	\N	\N	1643	5	V-10117329	1990-12-16
1211	V-32467858	DIAZ DELERSON	\N	\N	19	\N	\N	1643	4	V-10117329	2007-10-15
1212	V-	DIAZ KAMILA	\N	\N	19	\N	\N	1643	4	V-10117329	2013-11-13
1213	V-31109776	DIAZ YOLEIMY	\N	\N	19	\N	\N	1643	4	V-10117329	2005-05-16
1214	V-29678355	ORIANA RICAPO	\N	\N	19	\N	\N	1644	5	V-15420748	2000-12-15
1215	V-26367785	MEJIAS DIEGO	\N	\N	19	\N	\N	1646	5	V-6333872	1998-11-01
1216	V-27150505	UZCATEGUI GILBERT	\N	\N	23	\N	\N	1661	5	V-13860720	1998-10-29
1217	V-19065833	RIVAS REINDEVER	\N	\N	19	\N	\N	1662	5	V-10797810	1989-07-06
1218	V-	RIVAS TAILER	\N	\N	19	\N	\N	1662	4	V-10797810	2019-11-20
1219	V-26645536	SANDOVAL FLORIANA	\N	\N	19	\N	\N	1662	8	V-10797810	1997-11-13
1220	V-23695157	JASPE JEISON	\N	\N	19	\N	\N	1662	6	V-10797810	1992-02-28
1221	V-19368611	JASPE NALCY	\N	\N	19	\N	\N	1662	6	V-10797810	1990-08-22
1222	V-81462716	DE FREITES AGUSTINO	\N	\N	19	\N	\N	1662	6	V-10797810	1966-06-02
1223	V-17115603	RAMIREZ SINTHIA	\N	\N	19	\N	\N	1662	6	V-10797810	1983-01-07
1224	V-14991748	ALFONZO OSCAR 	\N	\N	19	\N	\N	1662	6	V-10797810	1981-03-17
\.


--
-- Data for Name: t_calculo; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.t_calculo (id_calculo, calculo, id_usuario, fecha_registro, ult_mod) FROM stdin;
1	porcentual	\N	\N	\N
2	monto fijo	\N	\N	\N
\.


--
-- Data for Name: t_ccoordinador; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.t_ccoordinador (id_ccoordinador, comision_c, dom) FROM stdin;
1	20	0.5
\.


--
-- Data for Name: t_comisiones; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.t_comisiones (id_comision, id_tcomision, id_tcalculo, cuota, fecha_registro, ult_mod, id_usuario, min, max, id_plan, id_basec, estatus, c_minmax) FROM stdin;
22	1	1	80	2019-10-16 00:00:00	2019-10-16 00:00:00	1	1	6	1	1	0	0
23	1	1	100	2019-10-16 00:00:00	2019-10-16 00:00:00	1	7	12	2	1	0	0
27	1	1	20	2019-10-16 00:00:00	2019-10-16 00:00:00	1	4	99	4	2	0	1
24	1	1	110	2019-10-16 00:00:00	2019-10-16 00:00:00	1	13	99	3	1	0	0
26	3	2	10000	2019-10-16 00:00:00	2019-10-16 00:00:00	1	1	99	4	3	0	0
25	2	2	20000	2019-10-16 00:00:00	2019-10-16 00:00:00	1	1	99	4	3	0	0
\.


--
-- Data for Name: t_concepto; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.t_concepto (id_concepto, concepto, id_usuario, fecha_registro, ult_mod) FROM stdin;
1	venta de poliza	\N	\N	\N
2	personas adicionales	\N	\N	\N
3	actualización de datos	\N	\N	\N
\.


--
-- Data for Name: t_email; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.t_email (id_email, email) FROM stdin;
5	ejvalles@seguroslafe.com
6	ebermudez@seguroslafe.com
7	mvielma@seguroslafe.com
8	nperez@seguroslafe.com
9	mpena@seguroslafe.com
\.


--
-- Data for Name: t_extornos; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.t_extornos (id_extorno, id_venta, id_vendedor, monto_extornable, monto_cuota, cuotas_extornadas, fraccionar, cuotas_fraccionar, monto_fraccionado, id_usuario, fecha_registro, ult_mod, id_estatus, observacion, motivo, id_semana, monto_fraccionado_c, monto_extornable_c) FROM stdin;
18	583	34	3225.44000000000005	\N	1	\N	1	3225.44000000000005	1	\N	\N	1	\N	1	64	645.090000000000032	645.090000000000032
19	584	34	1133.32999999999993	\N	1	\N	1	1133.32999999999993	1	\N	\N	1	\N	1	64	226.669999999999987	226.669999999999987
20	1067	50	100450	\N	12	\N	1	100450	19	\N	\N	1	\N	1	63	20090	20090
21	1068	50	27066.6699999999983	\N	12	\N	2	0	19	\N	\N	1	fraccionado	1	63	20090	5413.32999999999993
29	1021	51	6999.99666666669964	\N	\N	25	1	6999.99666666669964	0	\N	\N	-1	fraccion de extorno anterior	\N	\N	1400.00333333329991	1400.00333333329991
25	1021	51	42205.3300000000017	\N	12	\N	2	35205.3333333330011	19	\N	\N	1	fraccionado	1	66	7041.06666666670026	8441.06999999999971
27	1061	34	38705.3300000000017	\N	12	\N	1	38705.3300000000017	19	\N	\N	1	\N	1	62	7741.06999999999971	7741.06999999999971
30	1062	34	12800	\N	\N	28	1	12800	0	\N	\N	-1	fraccion de extorno anterior	\N	\N	-5881.06666666670026	-5881.06666666670026
28	1062	34	12800	\N	12	\N	2	0	19	\N	\N	1	fraccionado	1	62	8441.06666666670026	2560
23	1035	52	35205.3300000000017	\N	12	\N	1	35205.3300000000017	19	\N	\N	1	\N	1	61	7041.06999999999971	7041.06999999999971
31	1038	52	56205.3300000000017	\N	\N	24	1	56205.3300000000017	0	\N	\N	-1	fraccion de extorno anterior	\N	\N	-8848.93000000000029	-8848.93000000000029
24	1038	52	56205.3300000000017	\N	12	\N	2	0	19	\N	\N	1	fraccionado	1	61	20090	11241.0699999999997
32	1014	43	17499.9966666670007	\N	\N	26	1	17499.9966666670007	0	\N	\N	-1	fraccion de extorno anterior	\N	\N	3500.00333333329991	3500.00333333329991
26	1014	43	52705.3300000000017	\N	12	\N	2	35205.3333333330011	19	\N	\N	1	fraccionado	1	67	7041.06666666670026	10541.0699999999997
22	1068	50	27066.6699999999983	\N	\N	21	1	27066.6699999999983	0	\N	\N	1	fraccion de extorno anterior	\N	72	-14676.6700000000001	-14676.6700000000001
\.


--
-- Data for Name: t_factor_edad; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.t_factor_edad (id_fedad, edad, factor, id_usuario, fecha_registro, ult_mod, estatus) FROM stdin;
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
104	2000	100	1	2019-09-23 00:00:00	2019-09-23 00:00:00	1
103	200	100	1	2019-09-23 00:00:00	2019-09-23 00:00:00	1
1	0	4.40000000000000036	\N	\N	\N	1
105	0	4.40000000000000036	7	2019-10-04 00:00:00	2019-10-04 00:00:00	0
106	200	1	1	\N	\N	1
\.


--
-- Data for Name: t_liquidacion; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.t_liquidacion (id_venta, comision_liquidada, id_liquidacion, suma, prima, fecha_registro, ult_mod, usuario, comision_c, estatus_l) FROM stdin;
163	100450	201	20500000	\N	\N	\N	1	20090	1
199	103950	202	20500000	\N	\N	\N	1	20790	1
277	38705.3333333330011	203	20500000	\N	\N	\N	1	7741.06666666670026	1
320	28401.3333333330011	204	14500000	\N	\N	\N	1	5680.26666666670008	1
180	1000	205	\N	\N	\N	\N	1	200	1
181	1000	206	\N	\N	\N	\N	1	200	1
183	1000	207	\N	\N	\N	\N	1	200	1
184	1000	208	\N	\N	\N	\N	1	200	1
185	1000	209	\N	\N	\N	\N	1	200	1
186	1000	210	\N	\N	\N	\N	1	200	1
187	1000	211	\N	\N	\N	\N	1	200	1
188	1000	212	\N	\N	\N	\N	1	200	1
179	1000	213	\N	\N	\N	\N	1	200	1
182	1000	214	\N	\N	\N	\N	1	200	1
177	1000	215	\N	\N	\N	\N	1	200	1
178	1000	216	\N	\N	\N	\N	1	200	1
329	3500	217	\N	\N	\N	\N	1	700	1
152	32900	218	6000000	\N	\N	\N	1	6580	1
153	20608	219	12000000	\N	\N	\N	1	4121.60000000000036	1
189	49000	220	10000000	\N	\N	\N	1	9800	1
174	0	221	\N	\N	\N	\N	1	0	1
173	100450	222	20500000	\N	\N	\N	1	20090	1
154	1000	223	\N	\N	\N	\N	1	200	1
270	1000	224	\N	\N	\N	\N	1	200	1
271	1000	225	\N	\N	\N	\N	1	200	1
272	1000	226	\N	\N	\N	\N	1	200	1
274	1000	227	\N	\N	\N	\N	1	200	1
273	1000	228	\N	\N	\N	\N	1	200	1
161	35205.3333333330011	229	20500000	\N	\N	\N	1	7041.06666666670026	1
162	0	230	\N	\N	\N	\N	1	0	1
164	0	231	\N	\N	\N	\N	1	0	1
295	103950	232	20500000	\N	\N	\N	1	20790	1
296	3500	233	\N	\N	\N	\N	1	700	1
312	35205.3333333330011	234	20500000	\N	\N	\N	1	7041.06666666670026	1
313	0	235	\N	\N	\N	\N	1	0	1
168	35205.3333333330011	236	20500000	\N	\N	\N	1	7041.06666666670026	1
298	35205.3333333330011	237	20500000	\N	\N	\N	1	7041.06666666670026	1
196	100450	238	20500000	\N	\N	\N	1	20090	1
303	1000	239	\N	\N	\N	\N	1	200	1
292	1000	240	\N	\N	\N	\N	1	200	1
291	1000	241	\N	\N	\N	\N	1	200	1
328	1000	253	\N	\N	\N	\N	1	200	1
238	1000	252	\N	\N	\N	\N	1	200	1
232	1000	251	\N	\N	\N	\N	1	200	1
240	1000	250	\N	\N	\N	\N	1	200	1
264	1000	249	\N	\N	\N	\N	1	200	1
257	1000	248	\N	\N	\N	\N	1	200	1
241	1000	247	\N	\N	\N	\N	1	200	1
237	1000	246	\N	\N	\N	\N	1	200	1
236	1000	245	\N	\N	\N	\N	1	200	1
235	1000	244	\N	\N	\N	\N	1	200	1
234	1000	243	\N	\N	\N	\N	1	200	1
233	1000	242	\N	\N	\N	\N	1	200	1
362	0	254	\N	\N	\N	\N	19	0	1
361	38901.3333333330011	255	14500000	\N	\N	\N	19	7780.26666666670008	1
350	0	256	\N	\N	\N	\N	19	0	1
349	58800	257	12000000	\N	\N	\N	19	11760	1
351	42205.3333333330011	258	20500000	\N	\N	\N	19	8441.06666666670026	1
412	65800	259	12000000	\N	\N	\N	19	13160	1
415	8466.66666666670062	260	10000000	\N	\N	\N	19	1693.33333333330006	1
414	45108	261	12000000	\N	\N	\N	19	9021.60000000000036	1
367	100450	262	20500000	\N	\N	\N	19	20090	1
384	20800	263	30000000	\N	\N	\N	19	4160	1
383	35205.3333333330011	264	20500000	\N	\N	\N	19	7041.06666666670026	1
382	20800	265	30000000	\N	\N	\N	19	4160	1
381	100450	266	20500000	\N	\N	\N	19	20090	1
377	35205.3333333330011	267	20500000	\N	\N	\N	19	7041.06666666670026	1
378	34800	268	30000000	\N	\N	\N	19	6960	1
380	12800	269	30000000	\N	\N	\N	19	2560	1
379	103950	270	20500000	\N	\N	\N	19	20790	1
386	14400	271	30000000	\N	\N	\N	19	2880	1
385	35205.3333333330011	272	20500000	\N	\N	\N	19	7041.06666666670026	1
403	124950	273	20500000	\N	\N	\N	19	24990	1
332	71750	274	12500000	\N	\N	\N	19	14350	1
404	27608	275	12000000	\N	\N	\N	19	5521.60000000000036	1
405	19600	276	4000000	\N	\N	\N	19	3920	1
407	58800	277	12000000	\N	\N	\N	19	11760	1
410	103950	278	20500000	\N	\N	\N	19	20790	1
411	49000	279	10000000	\N	\N	\N	19	9800	1
375	1000	280	\N	\N	\N	\N	19	200	1
419	35205.3333333330011	281	20500000	\N	\N	\N	19	7041.06666666670026	1
420	35205.3333333330011	282	20500000	\N	\N	\N	19	7041.06666666670026	1
366	42205.3333333330011	283	20500000	\N	\N	\N	19	8441.06666666670026	1
392	38705.3333333330011	284	20500000	\N	\N	\N	19	7741.06666666670026	1
387	38705.3333333330011	285	20500000	\N	\N	\N	19	7741.06666666670026	1
388	71050	286	14500000	\N	\N	\N	19	14210	1
389	81550	287	14500000	\N	\N	\N	19	16310	1
390	58800	288	12000000	\N	\N	\N	19	11760	1
391	38705.3333333330011	289	20500000	\N	\N	\N	19	7741.06666666670026	1
491	42205.3333333330011	290	20500000	\N	\N	\N	19	8441.06666666670026	1
484	20608	293	12000000	\N	\N	\N	19	4121.60000000000036	1
486	20608	292	12000000	\N	\N	\N	19	4121.60000000000036	1
515	31108	291	12000000	\N	\N	\N	19	6221.60000000000036	1
492	29800	294	30000000	\N	\N	\N	19	5960	1
421	35205.3333333330011	296	20500000	\N	\N	\N	19	7041.06666666670026	1
423	35205.3333333330011	295	20500000	\N	\N	\N	19	7041.06666666670026	1
425	100450	298	20500000	\N	\N	\N	19	20090	1
549	103950	297	20500000	\N	\N	\N	19	20790	1
424	16200	301	30000000	\N	\N	\N	19	3240	1
426	12800	300	30000000	\N	\N	\N	19	2560	1
550	43600	299	30000000	\N	\N	\N	19	8720	1
435	24901.3333333330011	303	14500000	\N	\N	\N	19	4980.26666666670008	1
441	28401.3333333330011	302	14500000	\N	\N	\N	19	5680.26666666670008	1
429	51450	304	10500000	\N	\N	\N	19	10290	1
440	64750	305	12500000	\N	\N	\N	19	12950	1
428	58800	306	12000000	\N	\N	\N	19	11760	1
442	1000	307	\N	\N	\N	\N	19	200	1
452	1000	322	\N	\N	\N	\N	19	200	1
453	1000	321	\N	\N	\N	\N	19	200	1
454	1000	320	\N	\N	\N	\N	19	200	1
455	1000	319	\N	\N	\N	\N	19	200	1
456	1000	318	\N	\N	\N	\N	19	200	1
457	1000	317	\N	\N	\N	\N	19	200	1
458	1000	316	\N	\N	\N	\N	19	200	1
459	1000	315	\N	\N	\N	\N	19	200	1
460	1000	314	\N	\N	\N	\N	19	200	1
461	1000	313	\N	\N	\N	\N	19	200	1
462	1000	312	\N	\N	\N	\N	19	200	1
463	1000	311	\N	\N	\N	\N	19	200	1
464	1000	310	\N	\N	\N	\N	19	200	1
465	1000	309	\N	\N	\N	\N	19	200	1
467	1000	308	\N	\N	\N	\N	19	200	1
502	35205.3333333330011	323	20500000	\N	\N	\N	19	7041.06666666670026	1
506	54950	324	10500000	\N	\N	\N	19	10990	1
546	100450	325	20500000	\N	\N	\N	19	20090	1
531	35205.3333333330011	328	20500000	\N	\N	\N	19	7041.06666666670026	1
532	35205.3333333330011	327	20500000	\N	\N	\N	19	7041.06666666670026	1
533	38705.3333333330011	326	20500000	\N	\N	\N	19	7741.06666666670026	1
534	12800	329	30000000	\N	\N	\N	19	2560	1
432	45705.3333333330011	330	20500000	\N	\N	\N	19	9141.06666666670026	1
434	24108	331	12000000	\N	\N	\N	19	4821.60000000000036	1
436	35205.3333333330011	333	20500000	\N	\N	\N	19	7041.06666666670026	1
543	42205.3333333330011	332	20500000	\N	\N	\N	19	8441.06666666670026	1
542	71050	334	14500000	\N	\N	\N	19	14210	1
541	103950	336	20500000	\N	\N	\N	19	20790	1
544	103950	335	20500000	\N	\N	\N	19	20790	1
545	44288	337	12000000	\N	\N	\N	19	8857.60000000000036	1
507	1000	338	\N	\N	\N	\N	19	200	1
535	1000	340	\N	\N	\N	\N	19	200	1
536	1000	339	\N	\N	\N	\N	19	200	1
523	45705.3333333330011	341	20500000	\N	\N	\N	19	9141.06666666670026	1
547	35205.3333333330011	342	20500000	\N	\N	\N	19	7041.06666666670026	1
553	1000	345	\N	\N	\N	\N	19	200	1
554	1000	344	\N	\N	\N	\N	19	200	1
555	1000	343	\N	\N	\N	\N	19	200	1
494	42205.3333333330011	348	20500000	\N	\N	\N	19	8441.06666666670026	1
495	38705.3333333330011	347	20500000	\N	\N	\N	19	7741.06666666670026	1
499	35205.3333333330011	346	20500000	\N	\N	\N	19	7041.06666666670026	1
624	38108	349	12000000	\N	\N	\N	19	7621.60000000000036	1
625	28401.3333333330011	350	14500000	\N	\N	\N	19	5680.26666666670008	1
645	100450	351	20500000	\N	\N	\N	19	20090	1
617	1000	356	\N	\N	\N	\N	19	200	1
618	1000	355	\N	\N	\N	\N	19	200	1
619	1000	354	\N	\N	\N	\N	19	200	1
620	1000	353	\N	\N	\N	\N	19	200	1
621	1000	352	\N	\N	\N	\N	19	200	1
616	24108	357	12000000	\N	\N	\N	19	4821.60000000000036	1
591	1000	358	\N	\N	\N	\N	19	200	1
583	38705.3333333330011	359	20500000	\N	\N	\N	19	7741.06666666670026	1
584	13600	360	30000000	\N	\N	\N	19	2720	1
598	1000	361	\N	\N	\N	\N	19	200	1
644	42205.3333333330011	362	20500000	\N	\N	\N	19	8441.06666666670026	1
607	100450	363	20500000	\N	\N	\N	19	20090	1
566	52500	364	10000000	\N	\N	\N	19	10500	1
567	27400	366	30000000	\N	\N	\N	19	5480	1
568	34800	365	30000000	\N	\N	\N	19	6960	1
613	1000	367	\N	\N	\N	\N	19	200	1
575	1000	368	\N	\N	\N	\N	19	200	1
648	38705.3333333330011	369	20500000	\N	\N	\N	19	7741.06666666670026	1
562	1000	370	\N	\N	\N	\N	19	200	1
646	38705.3333333330011	372	20500000	\N	\N	\N	19	7741.06666666670026	1
647	42205.3333333330011	371	20500000	\N	\N	\N	19	8441.06666666670026	1
604	110950	373	20500000	\N	\N	\N	19	22190	1
573	100450	374	20500000	\N	\N	\N	19	20090	1
574	4266.66666666669971	375	10000000	\N	\N	\N	19	853.333333333329961	1
569	1000	379	\N	\N	\N	\N	19	200	1
570	1000	378	\N	\N	\N	\N	19	200	1
571	1000	377	\N	\N	\N	\N	19	200	1
572	1000	376	\N	\N	\N	\N	19	200	1
565	35205.3333333330011	380	20500000	\N	\N	\N	19	7041.06666666670026	1
582	74550	381	14500000	\N	\N	\N	19	14910	1
327	27608	382	12000000	\N	\N	\N	19	5521.60000000000036	1
685	38705.3333333330011	383	20500000	\N	\N	\N	19	7741.06666666670026	1
686	12800	384	30000000	\N	\N	\N	19	2560	1
699	41608	385	12000000	\N	\N	\N	19	8321.60000000000036	1
694	35205.3333333330011	387	20500000	\N	\N	\N	19	7041.06666666670026	1
697	38705.3333333330011	386	20500000	\N	\N	\N	19	7741.06666666670026	1
661	103950	389	20500000	\N	\N	\N	19	20790	1
696	107450	388	20500000	\N	\N	\N	19	21490	1
695	22000	391	30000000	\N	\N	\N	19	4400	1
698	12800	390	30000000	\N	\N	\N	19	2560	1
693	24901.3333333330011	392	14500000	\N	\N	\N	19	4980.26666666670008	1
745	1000	393	\N	\N	\N	\N	19	200	1
719	103950	394	20500000	\N	\N	\N	19	20790	1
717	107450	395	20500000	\N	\N	\N	19	21490	1
299	38705.3333333330011	396	20500000	\N	\N	\N	19	7741.06666666670026	1
300	100450	397	20500000	\N	\N	\N	19	20090	1
657	38705.3333333330011	399	20500000	\N	\N	\N	19	7741.06666666670026	1
659	38705.3333333330011	398	20500000	\N	\N	\N	19	7741.06666666670026	1
658	13600	400	30000000	\N	\N	\N	19	2720	1
279	35205.3333333330011	401	20500000	\N	\N	\N	19	7041.06666666670026	1
278	66500	402	10000000	\N	\N	\N	19	13300	1
160	32900	403	6000000	\N	\N	\N	19	6580	1
294	29400	409	6000000	\N	\N	\N	19	5880	1
293	32900	408	6000000	\N	\N	\N	19	6580	1
167	29400	406	6000000	\N	\N	\N	19	5880	1
170	29400	405	6000000	\N	\N	\N	19	5880	1
169	29400	404	6000000	\N	\N	\N	19	5880	1
290	71050	407	14500000	\N	\N	\N	19	14210	1
258	20608	410	12000000	\N	\N	\N	19	4121.60000000000036	1
741	46446.4000000000015	411	20500000	\N	\N	\N	19	9289.28000000000065	1
721	71050	413	14500000	\N	\N	\N	19	14210	1
723	71050	412	14500000	\N	\N	\N	19	14210	1
720	107450	415	20500000	\N	\N	\N	19	21490	1
722	100450	414	20500000	\N	\N	\N	19	20090	1
714	42205.3333333330011	416	20500000	\N	\N	\N	19	8441.06666666670026	1
190	24173.3333333330011	417	10000000	\N	\N	\N	19	4834.66666666669971	1
192	6933.33333333330029	418	10000000	\N	\N	\N	19	1386.66666666669994	1
743	1000	419	\N	\N	\N	\N	19	200	1
171	35205.3333333330011	420	20500000	\N	\N	\N	19	7041.06666666670026	1
304	35205.3333333330011	421	20500000	\N	\N	\N	19	7041.06666666670026	1
301	100450	422	20500000	\N	\N	\N	19	20090	1
726	38705.3333333330011	423	20500000	\N	\N	\N	19	7741.06666666670026	1
730	45705.3333333330011	425	20500000	\N	\N	\N	19	9141.06666666670026	1
731	35205.3333333330011	424	20500000	\N	\N	\N	19	7041.06666666670026	1
653	29400	426	6000000	\N	\N	\N	19	5880	1
282	35205.3333333330011	428	20500000	\N	\N	\N	19	7041.06666666670026	1
267	42205.3333333330011	427	20500000	\N	\N	\N	19	8441.06666666670026	1
281	20673.3333333330011	429	10000000	\N	\N	\N	19	4134.66666666669971	1
254	58800	432	12000000	\N	\N	\N	19	11760	1
275	65800	431	12000000	\N	\N	\N	19	13160	1
276	62300	430	12000000	\N	\N	\N	19	12460	1
194	141618.75	433	20500000	\N	\N	\N	19	28323.75	1
195	145118.75	434	20500000	\N	\N	\N	19	29023.75	1
200	125562.5	435	20500000	\N	\N	\N	19	25112.5	1
204	74550	436	14500000	\N	\N	\N	19	14910	1
206	35205.3333333330011	437	20500000	\N	\N	\N	19	7041.06666666670026	1
210	35205.3333333330011	438	20500000	\N	\N	\N	19	7041.06666666670026	1
212	125562.5	439	20500000	\N	\N	\N	19	25112.5	1
215	129062.5	440	20500000	\N	\N	\N	19	25812.5	1
220	42205.3333333330011	441	20500000	\N	\N	\N	19	8441.06666666670026	1
221	42205.3333333330011	442	20500000	\N	\N	\N	19	8441.06666666670026	1
219	132562.5	443	20500000	\N	\N	\N	19	26512.5	1
224	125562.5	444	20500000	\N	\N	\N	19	25112.5	1
225	125562.5	445	20500000	\N	\N	\N	19	25112.5	1
226	107450	446	20500000	\N	\N	\N	19	21490	1
227	71050	447	14500000	\N	\N	\N	19	14210	1
229	74550	448	14500000	\N	\N	\N	19	14910	1
230	100450	449	20500000	\N	\N	\N	19	20090	1
284	103950	450	20500000	\N	\N	\N	19	20790	1
285	100450	451	20500000	\N	\N	\N	19	20090	1
286	71050	452	14500000	\N	\N	\N	19	14210	1
287	100450	453	20500000	\N	\N	\N	19	20090	1
253	38705.3333333330011	454	20500000	\N	\N	\N	19	7741.06666666670026	1
314	100450	455	20500000	\N	\N	\N	19	20090	1
766	49205.3333333330011	456	20500000	\N	\N	\N	19	9841.06666666670026	1
765	110950	457	20500000	\N	\N	\N	19	22190	1
834	38705.3333333330011	459	20500000	\N	\N	\N	19	7741.06666666670026	1
835	42205.3333333330011	458	20500000	\N	\N	\N	19	8441.06666666670026	1
833	51450	460	10500000	\N	\N	\N	19	10290	1
818	38705.3333333330011	461	20500000	\N	\N	\N	19	7741.06666666670026	1
819	12800	463	30000000	\N	\N	\N	19	2560	1
820	12800	462	30000000	\N	\N	\N	19	2560	1
809	1000	464	\N	\N	\N	\N	19	200	1
265	58800	465	12000000	\N	\N	\N	19	11760	1
754	21532	466	10500000	\N	\N	\N	19	4306.39999999999964	1
858	42205.3333333330011	470	20500000	\N	\N	\N	19	8441.06666666670026	1
761	38705.3333333330011	469	20500000	\N	\N	\N	19	7741.06666666670026	1
755	38705.3333333330011	468	20500000	\N	\N	\N	19	7741.06666666670026	1
763	42205.3333333330011	467	20500000	\N	\N	\N	19	8441.06666666670026	1
758	58450	480	10500000	\N	\N	\N	19	11690	1
759	51450	479	10500000	\N	\N	\N	19	10290	1
752	54950	478	10500000	\N	\N	\N	19	10990	1
760	54950	477	10500000	\N	\N	\N	19	10990	1
877	54950	476	10500000	\N	\N	\N	19	10990	1
747	51450	475	10500000	\N	\N	\N	19	10290	1
762	64312.5	474	10500000	\N	\N	\N	19	12862.5	1
748	64312.5	473	10500000	\N	\N	\N	19	12862.5	1
749	64312.5	472	10500000	\N	\N	\N	19	12862.5	1
750	64312.5	471	10500000	\N	\N	\N	19	12862.5	1
746	74550	481	14500000	\N	\N	\N	19	14910	1
757	100450	482	20500000	\N	\N	\N	19	20090	1
751	49000	483	10000000	\N	\N	\N	19	9800	1
756	32900	484	6000000	\N	\N	\N	19	6580	1
753	11162.6666666670008	485	6500000	\N	\N	\N	19	2232.53333333330011	1
855	1000	488	\N	\N	\N	\N	19	200	1
856	1000	487	\N	\N	\N	\N	19	200	1
857	1000	486	\N	\N	\N	\N	19	200	1
208	100450	489	20500000	\N	\N	\N	19	20090	1
840	38705.3333333330011	493	20500000	\N	\N	\N	19	7741.06666666670026	1
841	38705.3333333330011	492	20500000	\N	\N	\N	19	7741.06666666670026	1
837	42205.3333333330011	491	20500000	\N	\N	\N	19	8441.06666666670026	1
843	35205.3333333330011	490	20500000	\N	\N	\N	19	7041.06666666670026	1
842	15400	497	30000000	\N	\N	\N	19	3080	1
838	13600	496	30000000	\N	\N	\N	19	2720	1
844	27400	495	30000000	\N	\N	\N	19	5480	1
845	12800	494	30000000	\N	\N	\N	19	2560	1
839	1000	498	\N	\N	\N	\N	19	200	1
861	38705.3333333330011	499	20500000	\N	\N	\N	19	7741.06666666670026	1
859	1000	500	\N	\N	\N	\N	19	200	1
865	35205.3333333330011	504	20500000	\N	\N	\N	19	7041.06666666670026	1
866	38705.3333333330011	503	20500000	\N	\N	\N	19	7741.06666666670026	1
873	35205.3333333330011	502	20500000	\N	\N	\N	19	7041.06666666670026	1
874	49205.3333333330011	501	20500000	\N	\N	\N	19	9841.06666666670026	1
289	29400	505	6000000	\N	\N	\N	19	5880	1
764	71050	506	14500000	\N	\N	\N	19	14210	1
815	1000	507	\N	\N	\N	\N	19	200	1
847	24108	508	12000000	\N	\N	\N	19	4821.60000000000036	1
849	61950	509	10500000	\N	\N	\N	19	12390	1
848	103950	510	20500000	\N	\N	\N	19	20790	1
852	1000	511	\N	\N	\N	\N	19	200	1
297	74550	512	14500000	\N	\N	\N	19	14910	1
594	17173.3333333330011	513	10000000	\N	\N	\N	19	3434.66666666670017	1
592	19600	516	4000000	\N	\N	\N	19	3920	1
593	19600	515	4000000	\N	\N	\N	19	3920	1
596	19600	514	4000000	\N	\N	\N	19	3920	1
595	29400	517	6000000	\N	\N	\N	19	5880	1
416	35205.3333333330011	518	20500000	\N	\N	\N	19	7041.06666666670026	1
603	42205.3333333330011	519	20500000	\N	\N	\N	19	8441.06666666670026	1
605	103950	520	20500000	\N	\N	\N	19	20790	1
578	62300	521	12000000	\N	\N	\N	19	12460	1
402	35401.3333333330011	522	14500000	\N	\N	\N	19	7080.26666666670008	1
357	29400	523	6000000	\N	\N	\N	19	5880	1
623	27608	524	12000000	\N	\N	\N	19	5521.60000000000036	1
622	88550	525	14500000	\N	\N	\N	19	17710	1
950	20673.3333333330011	526	10000000	\N	\N	\N	19	4134.66666666669971	1
968	51450	527	10500000	\N	\N	\N	19	10290	1
589	100450	530	20500000	\N	\N	\N	19	20090	1
586	107450	529	20500000	\N	\N	\N	19	21490	1
614	103950	528	20500000	\N	\N	\N	19	20790	1
587	12800	533	30000000	\N	\N	\N	19	2560	1
615	12800	532	30000000	\N	\N	\N	19	2560	1
590	12800	531	30000000	\N	\N	\N	19	2560	1
433	38901.3333333330011	534	14500000	\N	\N	\N	19	7780.26666666670008	1
396	35205.3333333330011	535	20500000	\N	\N	\N	19	7041.06666666670026	1
397	45901.3333333330011	536	14500000	\N	\N	\N	19	9180.26666666669917	1
609	35401.3333333330011	539	14500000	\N	\N	\N	19	7080.26666666670008	1
640	52705.3333333330011	540	20500000	\N	\N	\N	19	10541.0666666670004	1
610	103950	537	20500000	\N	\N	\N	19	20790	1
612	12800	538	30000000	\N	\N	\N	19	2560	1
356	20608	541	12000000	\N	\N	\N	19	4121.60000000000036	1
353	29400	542	6000000	\N	\N	\N	19	5880	1
359	29400	543	6000000	\N	\N	\N	19	5880	1
577	35205.3333333330011	544	20500000	\N	\N	\N	19	7041.06666666670026	1
266	58800	545	12000000	\N	\N	\N	19	11760	1
207	58800	546	12000000	\N	\N	\N	19	11760	1
209	100450	547	20500000	\N	\N	\N	19	20090	1
218	100450	548	20500000	\N	\N	\N	19	20090	1
223	38705.3333333330011	549	20500000	\N	\N	\N	19	7741.06666666670026	1
201	100450	550	20500000	\N	\N	\N	19	20090	1
509	38705.3333333330011	554	20500000	\N	\N	\N	19	7741.06666666670026	1
513	42205.3333333330011	553	20500000	\N	\N	\N	19	8441.06666666670026	1
508	49205.3333333330011	552	20500000	\N	\N	\N	19	9841.06666666670026	1
512	35205.3333333330011	551	20500000	\N	\N	\N	19	7041.06666666670026	1
511	71050	555	14500000	\N	\N	\N	19	14210	1
514	4266.66666666669971	556	10000000	\N	\N	\N	19	853.333333333329961	1
510	17200	557	30000000	\N	\N	\N	19	3440	1
439	62300	558	12000000	\N	\N	\N	19	12460	1
943	107450	559	20500000	\N	\N	\N	19	21490	1
944	12800	560	30000000	\N	\N	\N	19	2560	1
376	49205.3333333330011	561	20500000	\N	\N	\N	19	9841.06666666670026	1
352	35205.3333333330011	562	20500000	\N	\N	\N	19	7041.06666666670026	1
537	20608	564	12000000	\N	\N	\N	19	4121.60000000000036	1
540	31108	563	12000000	\N	\N	\N	19	6221.60000000000036	1
631	21532	567	10500000	\N	\N	\N	19	4306.39999999999964	1
641	35205.3333333330011	574	20500000	\N	\N	\N	19	7041.06666666670026	1
634	35205.3333333330011	569	20500000	\N	\N	\N	19	7041.06666666670026	1
627	31108	566	12000000	\N	\N	\N	19	6221.60000000000036	1
639	100450	573	20500000	\N	\N	\N	19	20090	1
636	103950	571	20500000	\N	\N	\N	19	20790	1
635	100450	570	20500000	\N	\N	\N	19	20090	1
633	100450	568	20500000	\N	\N	\N	19	20090	1
632	100450	565	20500000	\N	\N	\N	19	20090	1
637	58800	572	12000000	\N	\N	\N	19	11760	1
524	45705.3333333330011	575	20500000	\N	\N	\N	19	9141.06666666670026	1
527	103950	576	20500000	\N	\N	\N	19	20790	1
528	12800	577	30000000	\N	\N	\N	19	2560	1
952	45705.3333333330011	578	20500000	\N	\N	\N	19	9141.06666666670026	1
891	1000	582	\N	\N	\N	\N	19	200	1
885	1000	581	\N	\N	\N	\N	19	200	1
887	1000	580	\N	\N	\N	\N	19	200	1
889	1000	579	\N	\N	\N	\N	19	200	1
649	38705.3333333330011	583	20500000	\N	\N	\N	19	7741.06666666670026	1
498	42205.3333333330011	584	20500000	\N	\N	\N	19	8441.06666666670026	1
496	59500	585	10000000	\N	\N	\N	19	11900	1
493	74550	586	14500000	\N	\N	\N	19	14910	1
202	0	587	\N	\N	\N	\N	19	0	1
165	62300	588	12000000	\N	\N	\N	19	12460	1
940	56205.3333333330011	589	20500000	\N	\N	\N	19	11241.0666666670004	1
899	1000	591	\N	\N	\N	\N	19	200	1
901	1000	590	\N	\N	\N	\N	19	200	1
451	24901.3333333330011	592	14500000	\N	\N	\N	19	4980.26666666670008	1
487	54950	593	10500000	\N	\N	\N	19	10990	1
488	103950	594	20500000	\N	\N	\N	19	20790	1
490	62300	595	12000000	\N	\N	\N	19	12460	1
880	1000	598	\N	\N	\N	\N	19	200	1
881	1000	597	\N	\N	\N	\N	19	200	1
883	1000	596	\N	\N	\N	\N	19	200	1
520	28401.3333333330011	599	14500000	\N	\N	\N	19	5680.26666666670008	1
522	74550	601	14500000	\N	\N	\N	19	14910	1
518	74550	600	14500000	\N	\N	\N	19	14910	1
517	36400	602	6000000	\N	\N	\N	19	7280	1
941	35205.3333333330011	603	20500000	\N	\N	\N	19	7041.06666666670026	1
942	12800	604	30000000	\N	\N	\N	19	2560	1
468	35205.3333333330011	609	20500000	\N	\N	\N	19	7041.06666666670026	1
476	35205.3333333330011	608	20500000	\N	\N	\N	19	7041.06666666670026	1
469	35205.3333333330011	607	20500000	\N	\N	\N	19	7041.06666666670026	1
480	35205.3333333330011	606	20500000	\N	\N	\N	19	7041.06666666670026	1
477	35205.3333333330011	605	20500000	\N	\N	\N	19	7041.06666666670026	1
472	20608	610	12000000	\N	\N	\N	19	4121.60000000000036	1
478	12800	611	30000000	\N	\N	\N	19	2560	1
504	35205.3333333330011	613	20500000	\N	\N	\N	19	7041.06666666670026	1
503	35205.3333333330011	612	20500000	\N	\N	\N	19	7041.06666666670026	1
505	42205.3333333330011	614	20500000	\N	\N	\N	19	8441.06666666670026	1
960	38705.3333333330011	617	20500000	\N	\N	\N	19	7741.06666666670026	1
963	38705.3333333330011	616	20500000	\N	\N	\N	19	7741.06666666670026	1
957	35205.3333333330011	615	20500000	\N	\N	\N	19	7041.06666666670026	1
530	22000	618	30000000	\N	\N	\N	19	4400	1
563	45705.3333333330011	619	20500000	\N	\N	\N	19	9141.06666666670026	1
437	35205.3333333330011	620	20500000	\N	\N	\N	19	7041.06666666670026	1
602	45705.3333333330011	621	20500000	\N	\N	\N	19	9141.06666666670026	1
600	107450	623	20500000	\N	\N	\N	19	21490	1
599	100450	622	20500000	\N	\N	\N	19	20090	1
601	12800	624	30000000	\N	\N	\N	19	2560	1
892	38705.3333333330011	625	20500000	\N	\N	\N	19	7741.06666666670026	1
929	100450	629	20500000	\N	\N	\N	19	20090	1
961	103950	628	20500000	\N	\N	\N	19	20790	1
907	103950	627	20500000	\N	\N	\N	19	20790	1
914	110950	626	20500000	\N	\N	\N	19	22190	1
915	12800	636	30000000	\N	\N	\N	19	2560	1
916	12800	635	30000000	\N	\N	\N	19	2560	1
894	13600	634	30000000	\N	\N	\N	19	2720	1
930	12800	633	30000000	\N	\N	\N	19	2560	1
962	12800	632	30000000	\N	\N	\N	19	2560	1
895	12800	631	30000000	\N	\N	\N	19	2560	1
908	16000	630	30000000	\N	\N	\N	19	3200	1
923	1000	637	\N	\N	\N	\N	19	200	1
896	38705.3333333330011	638	20500000	\N	\N	\N	19	7741.06666666670026	1
898	12800	639	30000000	\N	\N	\N	19	2560	1
342	35205.3333333330011	649	20500000	\N	\N	\N	19	7041.06666666670026	1
345	38705.3333333330011	651	20500000	\N	\N	\N	19	7741.06666666670026	1
347	42205.3333333330011	653	20500000	\N	\N	\N	19	8441.06666666670026	1
372	38705.3333333330011	658	20500000	\N	\N	\N	19	7741.06666666670026	1
346	71050	652	14500000	\N	\N	\N	19	14210	1
371	71050	657	14500000	\N	\N	\N	19	14210	1
339	58800	646	12000000	\N	\N	\N	19	11760	1
340	58800	647	12000000	\N	\N	\N	19	11760	1
344	69300	650	12000000	\N	\N	\N	19	13860	1
368	58800	656	12000000	\N	\N	\N	19	11760	1
333	125562.5	640	20500000	\N	\N	\N	19	25112.5	1
334	125562.5	641	20500000	\N	\N	\N	19	25112.5	1
335	125562.5	642	20500000	\N	\N	\N	19	25112.5	1
336	129062.5	643	20500000	\N	\N	\N	19	25812.5	1
337	103950	644	20500000	\N	\N	\N	19	20790	1
338	100450	645	20500000	\N	\N	\N	19	20090	1
341	100450	648	20500000	\N	\N	\N	19	20090	1
348	100450	654	20500000	\N	\N	\N	19	20090	1
374	114450	655	20500000	\N	\N	\N	19	22890	1
373	100450	659	20500000	\N	\N	\N	19	20090	1
556	100450	660	20500000	\N	\N	\N	19	20090	1
430	65800	661	12000000	\N	\N	\N	19	13160	1
933	58800	662	12000000	\N	\N	\N	19	11760	1
559	42401.3333333330011	663	14500000	\N	\N	\N	19	8480.26666666669917	1
560	58450	664	10500000	\N	\N	\N	19	11690	1
302	20608	665	12000000	\N	\N	\N	19	4121.60000000000036	1
558	35205.3333333330011	666	20500000	\N	\N	\N	19	7041.06666666670026	1
445	38705.3333333330011	673	20500000	\N	\N	\N	19	7741.06666666670026	1
448	19600	670	4000000	\N	\N	\N	19	3920	1
449	58800	671	12000000	\N	\N	\N	19	11760	1
444	58800	668	12000000	\N	\N	\N	19	11760	1
450	29400	672	6000000	\N	\N	\N	19	5880	1
447	32900	669	6000000	\N	\N	\N	19	6580	1
443	29400	667	6000000	\N	\N	\N	19	5880	1
971	59705.3333333330011	674	20500000	\N	\N	\N	19	11941.0666666670004	1
1015	100450	675	20500000	\N	\N	\N	19	20090	1
970	29400	676	6000000	\N	\N	\N	19	5880	1
1061	38705.3333333330011	678	20500000	\N	\N	\N	19	7741.06666666670026	1
1063	38705.3333333330011	677	20500000	\N	\N	\N	19	7741.06666666670026	1
1059	110950	679	20500000	\N	\N	\N	19	22190	1
1060	37600	682	30000000	\N	\N	\N	19	7520	1
1062	12800	681	30000000	\N	\N	\N	19	2560	1
1064	12800	680	30000000	\N	\N	\N	19	2560	1
394	32032	683	10500000	\N	\N	\N	19	6406.39999999999964	1
1086	1000	684	\N	\N	\N	\N	19	200	1
1032	38705.3333333330011	690	20500000	\N	\N	\N	19	7741.06666666670026	1
1034	49205.3333333330011	689	20500000	\N	\N	\N	19	9841.06666666670026	1
1035	35205.3333333330011	688	20500000	\N	\N	\N	19	7041.06666666670026	1
1037	45705.3333333330011	687	20500000	\N	\N	\N	19	9141.06666666670026	1
1038	56205.3333333330011	686	20500000	\N	\N	\N	19	11241.0666666670004	1
1042	46446.4000000000015	685	20500000	\N	\N	\N	19	9289.28000000000065	1
1036	103950	691	20500000	\N	\N	\N	19	20790	1
1014	52705.3333333330011	692	20500000	\N	\N	\N	19	10541.0666666670004	1
1033	35205.3333333330011	695	20500000	\N	\N	\N	19	7041.06666666670026	1
1021	42205.3333333330011	694	20500000	\N	\N	\N	19	8441.06666666670026	1
1023	35205.3333333330011	693	20500000	\N	\N	\N	19	7041.06666666670026	1
978	1000	696	\N	\N	\N	\N	19	200	1
955	35205.3333333330011	697	20500000	\N	\N	\N	19	7041.06666666670026	1
973	42205.3333333330011	699	20500000	\N	\N	\N	19	8441.06666666670026	1
974	35205.3333333330011	698	20500000	\N	\N	\N	19	7041.06666666670026	1
972	114450	702	20500000	\N	\N	\N	19	22890	1
976	100450	701	20500000	\N	\N	\N	19	20090	1
977	100450	700	20500000	\N	\N	\N	19	20090	1
1013	27608	703	12000000	\N	\N	\N	19	5521.60000000000036	1
969	103950	704	20500000	\N	\N	\N	19	20790	1
1066	71050	705	14500000	\N	\N	\N	19	14210	1
1067	100450	706	20500000	\N	\N	\N	19	20090	1
1068	27066.6666666669989	707	20000000	\N	\N	\N	19	5413.33333333330029	1
1043	35205.3333333330011	708	20500000	\N	\N	\N	19	7041.06666666670026	1
1044	100450	709	20500000	\N	\N	\N	19	20090	1
1212	42205.3333333330011	711	20500000	\N	\N	\N	1	8441.06666666670026	1
1208	38705.3333333330011	710	20500000	\N	\N	\N	1	7741.06666666670026	1
1214	100450	713	20500000	\N	\N	\N	1	20090	1
1215	103950	712	20500000	\N	\N	\N	1	20790	1
1213	23600	714	30000000	\N	\N	\N	1	4720	1
706	42205.3333333330011	715	20500000	\N	\N	\N	1	8441.06666666670026	1
704	54950	716	10500000	\N	\N	\N	1	10990	1
712	35205.3333333330011	717	20500000	\N	\N	\N	1	7041.06666666670026	1
725	74550	718	14500000	\N	\N	\N	1	14910	1
713	110950	719	20500000	\N	\N	\N	1	22190	1
1218	1000	720	\N	\N	\N	\N	1	200	1
1234	52705.3333333330011	721	20500000	\N	\N	\N	1	10541.0666666670004	1
1225	100450	724	20500000	\N	\N	\N	1	20090	1
1241	100450	723	20500000	\N	\N	\N	1	20090	1
1229	110950	722	20500000	\N	\N	\N	1	22190	1
1239	37600	727	30000000	\N	\N	\N	1	7520	1
1242	14400	726	30000000	\N	\N	\N	1	2880	1
1243	12800	725	30000000	\N	\N	\N	1	2560	1
315	75658.6666666670062	728	20500000	\N	\N	\N	1	15131.7333333330007	1
1237	35205.3333333330011	731	20500000	\N	\N	\N	1	7041.06666666670026	1
1180	38705.3333333330011	730	20500000	\N	\N	\N	1	7741.06666666670026	1
1184	38705.3333333330011	729	20500000	\N	\N	\N	1	7741.06666666670026	1
1238	100450	733	20500000	\N	\N	\N	1	20090	1
1223	117950	732	20500000	\N	\N	\N	1	23590	1
1206	1000	734	\N	\N	\N	\N	1	200	1
1207	1000	735	\N	\N	\N	\N	1	200	1
1168	49205.3333333330011	736	20500000	\N	\N	\N	1	9841.06666666670026	1
1170	14400	737	30000000	\N	\N	\N	1	2880	1
660	35205.3333333330011	738	20500000	\N	\N	\N	1	7041.06666666670026	1
825	24901.3333333330011	746	14500000	\N	\N	\N	1	4980.26666666670008	1
830	35205.3333333330011	740	20500000	\N	\N	\N	1	7041.06666666670026	1
828	24108	748	12000000	\N	\N	\N	1	4821.60000000000036	1
826	20608	747	12000000	\N	\N	\N	1	4121.60000000000036	1
824	24108	744	12000000	\N	\N	\N	1	4821.60000000000036	1
831	20608	743	12000000	\N	\N	\N	1	4121.60000000000036	1
823	20608	741	12000000	\N	\N	\N	1	4121.60000000000036	1
829	51450	739	10500000	\N	\N	\N	1	10290	1
827	58800	749	12000000	\N	\N	\N	1	11760	1
832	65800	745	12000000	\N	\N	\N	1	13160	1
822	58800	742	12000000	\N	\N	\N	1	11760	1
564	100450	750	20500000	\N	\N	\N	1	20090	1
1098	35205.3333333330011	751	20500000	\N	\N	\N	1	7041.06666666670026	1
669	107450	752	20500000	\N	\N	\N	1	21490	1
664	103950	753	20500000	\N	\N	\N	1	20790	1
670	35205.3333333330011	754	20500000	\N	\N	\N	1	7041.06666666670026	1
666	100450	755	20500000	\N	\N	\N	1	20090	1
665	110950	756	20500000	\N	\N	\N	1	22190	1
671	35205.3333333330011	757	20500000	\N	\N	\N	1	7041.06666666670026	1
663	69300	758	12000000	\N	\N	\N	1	13860	1
662	71050	759	14500000	\N	\N	\N	1	14210	1
672	38705.3333333330011	760	20500000	\N	\N	\N	1	7741.06666666670026	1
673	12800	761	30000000	\N	\N	\N	1	2560	1
667	71050	762	14500000	\N	\N	\N	1	14210	1
668	103950	763	20500000	\N	\N	\N	1	20790	1
683	103950	764	20500000	\N	\N	\N	1	20790	1
773	35205.3333333330011	773	20500000	\N	\N	\N	1	7041.06666666670026	1
775	38705.3333333330011	772	20500000	\N	\N	\N	1	7741.06666666670026	1
782	38705.3333333330011	771	20500000	\N	\N	\N	1	7741.06666666670026	1
776	35205.3333333330011	770	20500000	\N	\N	\N	1	7041.06666666670026	1
783	42205.3333333330011	769	20500000	\N	\N	\N	1	8441.06666666670026	1
777	38705.3333333330011	768	20500000	\N	\N	\N	1	7741.06666666670026	1
778	47506.6666666669989	767	20500000	\N	\N	\N	1	9501.33333333329938	1
779	44006.6666666669989	766	20500000	\N	\N	\N	1	8801.33333333329938	1
772	44006.6666666669989	765	20500000	\N	\N	\N	1	8801.33333333329938	1
774	107450	778	20500000	\N	\N	\N	1	21490	1
781	100450	777	20500000	\N	\N	\N	1	20090	1
769	100450	776	20500000	\N	\N	\N	1	20090	1
770	103950	775	20500000	\N	\N	\N	1	20790	1
784	103950	774	20500000	\N	\N	\N	1	20790	1
1166	45705.3333333330011	781	20500000	\N	\N	\N	1	9141.06666666670026	1
1167	45705.3333333330011	780	20500000	\N	\N	\N	1	9141.06666666670026	1
1247	45705.3333333330011	779	20500000	\N	\N	\N	1	9141.06666666670026	1
1165	81550	783	14500000	\N	\N	\N	1	16310	1
1185	81550	782	14500000	\N	\N	\N	1	16310	1
585	42205.3333333330011	784	20500000	\N	\N	\N	1	8441.06666666670026	1
681	27608	787	12000000	\N	\N	\N	1	5521.60000000000036	1
678	20608	786	12000000	\N	\N	\N	1	4121.60000000000036	1
675	20608	785	12000000	\N	\N	\N	1	4121.60000000000036	1
654	17304	788	6000000	\N	\N	\N	1	3460.80000000000018	1
656	10369.3333333329992	789	4000000	\N	\N	\N	1	2073.86666666669998	1
677	49000	791	10000000	\N	\N	\N	1	9800	1
680	49000	790	10000000	\N	\N	\N	1	9800	1
650	72800	793	12000000	\N	\N	\N	1	14560	1
676	62300	792	12000000	\N	\N	\N	1	12460	1
655	10733.3333333329992	794	10000000	\N	\N	\N	1	2146.66666666670017	1
398	35205.3333333330011	796	20500000	\N	\N	\N	1	7041.06666666670026	1
400	35205.3333333330011	795	20500000	\N	\N	\N	1	7041.06666666670026	1
393	20673.3333333330011	797	10000000	\N	\N	\N	1	4134.66666666669971	1
399	68250	798	12500000	\N	\N	\N	1	13650	1
401	78050	799	14500000	\N	\N	\N	1	15610	1
576	69300	800	12000000	\N	\N	\N	1	13860	1
280	38705.3333333330011	801	20500000	\N	\N	\N	1	7741.06666666670026	1
767	35205.3333333330011	803	20500000	\N	\N	\N	1	7041.06666666670026	1
768	35205.3333333330011	802	20500000	\N	\N	\N	1	7041.06666666670026	1
789	110950	804	20500000	\N	\N	\N	1	22190	1
788	103950	805	20500000	\N	\N	\N	1	20790	1
787	100450	806	20500000	\N	\N	\N	1	20090	1
790	74550	807	14500000	\N	\N	\N	1	14910	1
791	35205.3333333330011	808	20500000	\N	\N	\N	1	7041.06666666670026	1
792	110950	809	20500000	\N	\N	\N	1	22190	1
786	110950	810	20500000	\N	\N	\N	1	22190	1
872	35205.3333333330011	815	20500000	\N	\N	\N	1	7041.06666666670026	1
871	35205.3333333330011	814	20500000	\N	\N	\N	1	7041.06666666670026	1
868	35205.3333333330011	813	20500000	\N	\N	\N	1	7041.06666666670026	1
867	35205.3333333330011	812	20500000	\N	\N	\N	1	7041.06666666670026	1
869	35205.3333333330011	811	20500000	\N	\N	\N	1	7041.06666666670026	1
724	65800	816	12000000	\N	\N	\N	1	13160	1
1148	45705.3333333330011	817	20500000	\N	\N	\N	1	9141.06666666670026	1
1147	103950	818	20500000	\N	\N	\N	1	20790	1
538	58800	819	12000000	\N	\N	\N	1	11760	1
853	49205.3333333330011	820	20500000	\N	\N	\N	1	9841.06666666670026	1
846	54950	822	10500000	\N	\N	\N	1	10990	1
854	58450	821	10500000	\N	\N	\N	1	11690	1
851	65800	823	12000000	\N	\N	\N	1	13160	1
1158	35205.3333333330011	824	20500000	\N	\N	\N	1	7041.06666666670026	1
526	20608	825	12000000	\N	\N	\N	1	4121.60000000000036	1
525	74550	826	14500000	\N	\N	\N	1	14910	1
191	110950	827	20500000	\N	\N	\N	1	22190	1
193	4266.66666666669971	828	10000000	\N	\N	\N	1	853.333333333329961	1
692	62300	829	12000000	\N	\N	\N	1	12460	1
821	42205.3333333330011	830	20500000	\N	\N	\N	1	8441.06666666670026	1
331	20608	832	12000000	\N	\N	\N	1	4121.60000000000036	1
159	0	831	\N	\N	\N	\N	1	0	1
727	45705.3333333330011	834	20500000	\N	\N	\N	1	9141.06666666670026	1
728	35205.3333333330011	833	20500000	\N	\N	\N	1	7041.06666666670026	1
729	58800	835	12000000	\N	\N	\N	1	11760	1
1151	45705.3333333330011	836	20500000	\N	\N	\N	1	9141.06666666670026	1
1154	71050	837	14500000	\N	\N	\N	1	14210	1
1123	103950	838	20500000	\N	\N	\N	1	20790	1
688	42205.3333333330011	839	20500000	\N	\N	\N	1	8441.06666666670026	1
687	110950	840	20500000	\N	\N	\N	1	22190	1
474	51450	841	10500000	\N	\N	\N	1	10290	1
475	8800	842	30000000	\N	\N	\N	1	1760	1
501	35205.3333333330011	843	20500000	\N	\N	\N	1	7041.06666666670026	1
718	62300	844	12000000	\N	\N	\N	1	12460	1
438	42205.3333333330011	845	20500000	\N	\N	\N	1	8441.06666666670026	1
417	35205.3333333330011	846	20500000	\N	\N	\N	1	7041.06666666670026	1
651	12800	847	30000000	\N	\N	\N	1	2560	1
716	28401.3333333330011	848	14500000	\N	\N	\N	1	5680.26666666670008	1
732	35205.3333333330011	854	20500000	\N	\N	\N	1	7041.06666666670026	1
740	38705.3333333330011	853	20500000	\N	\N	\N	1	7741.06666666670026	1
735	45705.3333333330011	852	20500000	\N	\N	\N	1	9141.06666666670026	1
742	49205.3333333330011	851	20500000	\N	\N	\N	1	9841.06666666670026	1
734	45705.3333333330011	850	20500000	\N	\N	\N	1	9141.06666666670026	1
738	35205.3333333330011	849	20500000	\N	\N	\N	1	7041.06666666670026	1
736	100450	856	20500000	\N	\N	\N	1	20090	1
739	114450	855	20500000	\N	\N	\N	1	22890	1
966	35205.3333333330011	858	20500000	\N	\N	\N	23	7041.06666666670026	1
967	35205.3333333330011	857	20500000	\N	\N	\N	23	7041.06666666670026	1
965	12800	859	30000000	\N	\N	\N	23	2560	1
707	42205.3333333330011	860	20500000	\N	\N	\N	23	8441.06666666670026	1
1092	38705.3333333330011	861	20500000	\N	\N	\N	23	7741.06666666670026	1
1091	107450	862	20500000	\N	\N	\N	23	21490	1
958	107450	863	20500000	\N	\N	\N	23	21490	1
925	78050	864	14500000	\N	\N	\N	23	15610	1
1251	35205.3333333330011	865	20500000	\N	\N	\N	23	7041.06666666670026	1
529	42205.3333333330011	866	20500000	\N	\N	\N	23	8441.06666666670026	1
928	35205.3333333330011	868	20500000	\N	\N	\N	23	7041.06666666670026	1
924	35205.3333333330011	867	20500000	\N	\N	\N	23	7041.06666666670026	1
888	12800	869	30000000	\N	\N	\N	23	2560	1
988	27608	870	12000000	\N	\N	\N	23	5521.60000000000036	1
987	59500	871	10000000	\N	\N	\N	23	11900	1
983	58800	872	12000000	\N	\N	\N	23	11760	1
981	65800	873	12000000	\N	\N	\N	23	13160	1
418	100450	874	20500000	\N	\N	\N	23	20090	1
975	100450	875	20500000	\N	\N	\N	23	20090	1
1030	74550	876	14500000	\N	\N	\N	23	14910	1
1255	107450	878	20500000	\N	\N	\N	23	21490	1
1259	124740	877	20500000	\N	\N	\N	23	24948	1
1069	35205.3333333330011	879	20500000	\N	\N	\N	23	7041.06666666670026	1
700	103950	880	20500000	\N	\N	\N	23	20790	1
938	35205.3333333330011	881	20500000	\N	\N	\N	23	7041.06666666670026	1
935	35205.3333333330011	882	20500000	\N	\N	\N	23	7041.06666666670026	1
931	38705.3333333330011	883	20500000	\N	\N	\N	23	7741.06666666670026	1
946	100450	884	20500000	\N	\N	\N	23	20090	1
937	100450	885	20500000	\N	\N	\N	23	20090	1
936	100450	886	20500000	\N	\N	\N	23	20090	1
934	100450	887	20500000	\N	\N	\N	23	20090	1
989	35205.3333333330011	888	20500000	\N	\N	\N	23	7041.06666666670026	1
990	81550	889	14500000	\N	\N	\N	23	16310	1
947	35205.3333333330011	890	20500000	\N	\N	\N	23	7041.06666666670026	1
917	24901.3333333330011	891	14500000	\N	\N	\N	23	4980.26666666670008	1
913	24108	892	12000000	\N	\N	\N	23	4821.60000000000036	1
878	35401.3333333330011	893	14500000	\N	\N	\N	23	7080.26666666670008	1
900	49000	894	10000000	\N	\N	\N	23	9800	1
919	62300	898	12000000	\N	\N	\N	23	12460	1
909	58800	897	12000000	\N	\N	\N	23	11760	1
912	58800	896	12000000	\N	\N	\N	23	11760	1
910	58800	895	12000000	\N	\N	\N	23	11760	1
926	12266.6666666670008	899	20000000	\N	\N	\N	23	2453.33333333329983	1
652	58800	900	12000000	\N	\N	\N	23	11760	1
1065	58800	901	12000000	\N	\N	\N	23	11760	1
1039	35205.3333333330011	902	20500000	\N	\N	\N	23	7041.06666666670026	1
1027	35205.3333333330011	907	20500000	\N	\N	\N	23	7041.06666666670026	1
1028	38705.3333333330011	906	20500000	\N	\N	\N	23	7741.06666666670026	1
982	35205.3333333330011	905	20500000	\N	\N	\N	23	7041.06666666670026	1
984	35205.3333333330011	904	20500000	\N	\N	\N	23	7041.06666666670026	1
1025	35205.3333333330011	903	20500000	\N	\N	\N	23	7041.06666666670026	1
986	100450	908	20500000	\N	\N	\N	23	20090	1
1017	35205.3333333330011	910	20500000	\N	\N	\N	23	7041.06666666670026	1
1018	35205.3333333330011	909	20500000	\N	\N	\N	23	7041.06666666670026	1
1019	103950	912	20500000	\N	\N	\N	23	20790	1
1090	103950	911	20500000	\N	\N	\N	23	20790	1
793	35205.3333333330011	913	20500000	\N	\N	\N	23	7041.06666666670026	1
798	38705.3333333330011	914	20500000	\N	\N	\N	23	7741.06666666670026	1
797	38705.3333333330011	915	20500000	\N	\N	\N	23	7741.06666666670026	1
796	49205.3333333330011	916	20500000	\N	\N	\N	23	9841.06666666670026	1
794	45705.3333333330011	917	20500000	\N	\N	\N	23	9141.06666666670026	1
801	52705.3333333330011	918	20500000	\N	\N	\N	23	10541.0666666670004	1
800	107450	919	20500000	\N	\N	\N	23	21490	1
803	100450	920	20500000	\N	\N	\N	23	20090	1
808	103950	921	20500000	\N	\N	\N	23	20790	1
805	65800	922	12000000	\N	\N	\N	23	13160	1
804	58800	923	12000000	\N	\N	\N	23	11760	1
802	62300	924	12000000	\N	\N	\N	23	12460	1
795	58800	925	12000000	\N	\N	\N	23	11760	1
211	100450	926	20500000	\N	\N	\N	23	20090	1
228	124950	927	20500000	\N	\N	\N	23	24990	1
214	74550	928	14500000	\N	\N	\N	23	14910	1
906	24108	929	12000000	\N	\N	\N	23	4821.60000000000036	1
1006	35205.3333333330011	930	20500000	\N	\N	\N	23	7041.06666666670026	1
1001	49205.3333333330011	931	20500000	\N	\N	\N	23	9841.06666666670026	1
999	42205.3333333330011	932	20500000	\N	\N	\N	23	8441.06666666670026	1
1088	38705.3333333330011	933	20500000	\N	\N	\N	23	7741.06666666670026	1
1008	35205.3333333330011	934	20500000	\N	\N	\N	23	7041.06666666670026	1
997	100450	935	20500000	\N	\N	\N	23	20090	1
994	103950	936	20500000	\N	\N	\N	23	20790	1
1012	107450	937	20500000	\N	\N	\N	23	21490	1
993	107450	938	20500000	\N	\N	\N	23	21490	1
992	107450	939	20500000	\N	\N	\N	23	21490	1
1007	12800	940	30000000	\N	\N	\N	23	2560	1
1002	22000	941	30000000	\N	\N	\N	23	4400	1
1000	18400	942	30000000	\N	\N	\N	23	3680	1
1009	12800	943	30000000	\N	\N	\N	23	2560	1
1046	35205.3333333330011	948	20500000	\N	\N	\N	23	7041.06666666670026	1
1049	35205.3333333330011	947	20500000	\N	\N	\N	23	7041.06666666670026	1
1056	35205.3333333330011	946	20500000	\N	\N	\N	23	7041.06666666670026	1
1058	42205.3333333330011	945	20500000	\N	\N	\N	23	8441.06666666670026	1
1045	38705.3333333330011	944	20500000	\N	\N	\N	23	7741.06666666670026	1
1051	100450	951	20500000	\N	\N	\N	23	20090	1
1053	110950	950	20500000	\N	\N	\N	23	22190	1
1055	107450	949	20500000	\N	\N	\N	23	21490	1
921	32032	952	10500000	\N	\N	\N	23	6406.39999999999964	1
882	100450	953	20500000	\N	\N	\N	23	20090	1
884	12800	955	30000000	\N	\N	\N	23	2560	1
922	32200	954	30000000	\N	\N	\N	23	6440	1
862	103950	956	20500000	\N	\N	\N	23	20790	1
903	100450	959	20500000	\N	\N	\N	23	20090	1
904	103950	958	20500000	\N	\N	\N	23	20790	1
902	100450	957	20500000	\N	\N	\N	23	20090	1
1096	35205.3333333330011	960	20500000	\N	\N	\N	23	7041.06666666670026	1
1094	103950	961	20500000	\N	\N	\N	23	20790	1
711	38705.3333333330011	962	20500000	\N	\N	\N	1	7741.06666666670026	1
1277	42205.3333333330011	963	20500000	\N	\N	\N	1	8441.06666666670026	1
1287	1000	964	\N	\N	\N	\N	1	200	1
911	20608	965	12000000	\N	\N	\N	1	4121.60000000000036	1
1269	1000	966	\N	\N	\N	\N	1	200	1
1279	0	967	\N	\N	\N	\N	1	0	1
497	42205.3333333330011	968	20500000	\N	\N	\N	1	8441.06666666670026	1
561	49000	969	10000000	\N	\N	\N	1	9800	1
1261	38705.3333333330011	970	20500000	\N	\N	\N	1	7741.06666666670026	1
1262	12800	971	30000000	\N	\N	\N	1	2560	1
905	45705.3333333330011	972	20500000	\N	\N	\N	1	9141.06666666670026	1
1095	45705.3333333330011	973	20500000	\N	\N	\N	1	9141.06666666670026	1
682	42205.3333333330011	974	20500000	\N	\N	\N	1	8441.06666666670026	1
1272	107450	977	20500000	\N	\N	\N	1	21490	1
1273	114450	976	20500000	\N	\N	\N	1	22890	1
1276	100450	975	20500000	\N	\N	\N	1	20090	1
1275	62300	978	12000000	\N	\N	\N	1	12460	1
1274	12800	979	30000000	\N	\N	\N	1	2560	1
1271	1000	980	\N	\N	\N	\N	1	200	1
1153	44205.3333333330011	981	20500000	\N	\N	\N	1	8841.06666666670026	1
395	53205.3333333330011	982	20500000	\N	\N	\N	1	10641.0666666670004	1
1159	35205.3333333330011	983	20500000	\N	\N	\N	1	7041.06666666670026	1
1163	74050	984	14500000	\N	\N	\N	1	14810	1
1160	103450	985	20500000	\N	\N	\N	1	20690	1
1219	35205.3333333330011	986	20500000	\N	\N	\N	1	7041.06666666670026	1
1221	100450	987	20500000	\N	\N	\N	1	20090	1
1245	8800	988	30000000	\N	\N	\N	1	1760	1
1244	12800	989	30000000	\N	\N	\N	1	2560	1
1240	12800	990	30000000	\N	\N	\N	1	2560	1
886	35205.3333333330011	991	20500000	\N	\N	\N	1	7041.06666666670026	1
890	12800	992	30000000	\N	\N	\N	1	2560	1
1172	38205.3333333330011	993	20500000	\N	\N	\N	1	7641.06666666670026	1
1171	100450	994	20500000	\N	\N	\N	1	20090	1
1173	12800	995	30000000	\N	\N	\N	1	2560	1
1217	35205.3333333330011	996	20500000	\N	\N	\N	1	7041.06666666670026	1
158	58800	997	12000000	\N	\N	\N	1	11760	1
1111	18032	998	10500000	\N	\N	\N	1	3606.40000000000009	1
1113	24901.3333333330011	999	14500000	\N	\N	\N	1	4980.26666666670008	1
1100	24901.3333333330011	1000	14500000	\N	\N	\N	1	4980.26666666670008	1
1107	26173.3333333330011	1001	10000000	\N	\N	\N	1	5234.66666666669971	1
1114	20608	1002	12000000	\N	\N	\N	1	4121.60000000000036	1
1120	20608	1003	12000000	\N	\N	\N	1	4121.60000000000036	1
1104	26608	1004	12000000	\N	\N	\N	1	5321.60000000000036	1
1118	20608	1005	12000000	\N	\N	\N	1	4121.60000000000036	1
1117	32608	1006	12000000	\N	\N	\N	1	6521.60000000000036	1
1115	26608	1007	12000000	\N	\N	\N	1	5321.60000000000036	1
1116	27466.6666666669989	1008	12500000	\N	\N	\N	1	5493.33333333330029	1
1109	27901.3333333330011	1009	14500000	\N	\N	\N	1	5580.26666666670008	1
1121	27901.3333333330011	1010	14500000	\N	\N	\N	1	5580.26666666670008	1
1102	71050	1011	14500000	\N	\N	\N	1	14210	1
1112	29400	1012	6000000	\N	\N	\N	1	5880	1
1119	61800	1013	12000000	\N	\N	\N	1	12360	1
1105	74050	1014	14500000	\N	\N	\N	1	14810	1
1103	4266.66666666669971	1015	10000000	\N	\N	\N	1	853.333333333329961	1
1101	9933.33333333329938	1016	10000000	\N	\N	\N	1	1986.66666666669994	1
1108	13866.6666666670008	1017	20000000	\N	\N	\N	1	2773.33333333329983	1
1106	8533.33333333329938	1018	20000000	\N	\N	\N	1	1706.66666666669994	1
1110	16200	1019	30000000	\N	\N	\N	1	3240	1
1122	32200	1020	30000000	\N	\N	\N	1	6440	1
991	35205.3333333330011	1021	20500000	\N	\N	\N	1	7041.06666666670026	1
205	35205.3333333330011	1022	20500000	\N	\N	\N	1	7041.06666666670026	1
806	100450	1023	20500000	\N	\N	\N	1	20090	1
1004	103450	1024	20500000	\N	\N	\N	1	20690	1
1003	100450	1025	20500000	\N	\N	\N	1	20090	1
996	103450	1026	20500000	\N	\N	\N	1	20690	1
1005	12800	1027	30000000	\N	\N	\N	1	2560	1
995	12800	1028	30000000	\N	\N	\N	1	2560	1
998	12800	1029	30000000	\N	\N	\N	1	2560	1
1236	35205.3333333330011	1030	20500000	\N	\N	\N	1	7041.06666666670026	1
1143	41205.3333333330011	1031	20500000	\N	\N	\N	1	8241.06666666670026	1
1141	35205.3333333330011	1032	20500000	\N	\N	\N	1	7041.06666666670026	1
1132	38205.3333333330011	1033	20500000	\N	\N	\N	1	7641.06666666670026	1
1144	138118.75	1034	20500000	\N	\N	\N	1	27623.75	1
1127	156118.75	1035	20500000	\N	\N	\N	1	31223.75	1
1126	138118.75	1036	20500000	\N	\N	\N	1	27623.75	1
1140	125562.5	1037	20500000	\N	\N	\N	1	25112.5	1
1124	125562.5	1038	20500000	\N	\N	\N	1	25112.5	1
1139	125562.5	1039	20500000	\N	\N	\N	1	25112.5	1
1138	125562.5	1040	20500000	\N	\N	\N	1	25112.5	1
1137	134562.5	1041	20500000	\N	\N	\N	1	26912.5	1
1136	143562.5	1042	20500000	\N	\N	\N	1	28712.5	1
1135	112450	1043	20500000	\N	\N	\N	1	22490	1
1134	106450	1044	20500000	\N	\N	\N	1	21290	1
1133	100450	1045	20500000	\N	\N	\N	1	20090	1
1131	100450	1046	20500000	\N	\N	\N	1	20090	1
1130	100450	1047	20500000	\N	\N	\N	1	20090	1
1145	100450	1048	20500000	\N	\N	\N	1	20090	1
1082	47006.6666666669989	1049	20500000	\N	\N	\N	1	9401.33333333329938	1
1081	44006.6666666669989	1050	20500000	\N	\N	\N	1	8801.33333333329938	1
1080	44006.6666666669989	1051	20500000	\N	\N	\N	1	8801.33333333329938	1
1079	38205.3333333330011	1052	20500000	\N	\N	\N	1	7641.06666666670026	1
1078	35205.3333333330011	1053	20500000	\N	\N	\N	1	7041.06666666670026	1
1077	35205.3333333330011	1054	20500000	\N	\N	\N	1	7041.06666666670026	1
1075	35205.3333333330011	1055	20500000	\N	\N	\N	1	7041.06666666670026	1
1072	35205.3333333330011	1056	20500000	\N	\N	\N	1	7041.06666666670026	1
1083	35205.3333333330011	1057	20500000	\N	\N	\N	1	7041.06666666670026	1
1076	100450	1058	20500000	\N	\N	\N	1	20090	1
1073	103450	1059	20500000	\N	\N	\N	1	20690	1
1084	100450	1060	20500000	\N	\N	\N	1	20090	1
1074	112450	1061	20500000	\N	\N	\N	1	22490	1
1070	100450	1062	20500000	\N	\N	\N	1	20090	1
1097	38205.3333333330011	1063	20500000	\N	\N	\N	1	7641.06666666670026	1
1202	35205.3333333330011	1064	20500000	\N	\N	\N	1	7041.06666666670026	1
1200	41205.3333333330011	1065	20500000	\N	\N	\N	1	8241.06666666670026	1
1195	100450	1066	20500000	\N	\N	\N	1	20090	1
1191	106450	1067	20500000	\N	\N	\N	1	21290	1
1449	10000	1178	\N	\N	\N	\N	1	2000	1
1187	100450	1068	20500000	\N	\N	\N	1	20090	1
1203	16000	1069	30000000	\N	\N	\N	1	3200	1
1201	12800	1070	30000000	\N	\N	\N	1	2560	1
1188	12800	1071	30000000	\N	\N	\N	1	2560	1
1199	12800	1072	30000000	\N	\N	\N	1	2560	1
1196	12800	1073	30000000	\N	\N	\N	1	2560	1
1192	14400	1074	30000000	\N	\N	\N	1	2880	1
1099	12800	1075	30000000	\N	\N	\N	1	2560	1
409	100450	1076	20500000	\N	\N	\N	1	20090	1
406	61800	1077	12000000	\N	\N	\N	1	12360	1
945	67800	1078	12000000	\N	\N	\N	1	13560	1
1157	74050	1079	14500000	\N	\N	\N	1	14810	1
1155	103450	1080	20500000	\N	\N	\N	1	20690	1
1233	35205.3333333330011	1084	20500000	\N	\N	\N	1	7041.06666666670026	1
1209	41205.3333333330011	1083	20500000	\N	\N	\N	1	8241.06666666670026	1
1210	35205.3333333330011	1082	20500000	\N	\N	\N	1	7041.06666666670026	1
1211	53205.3333333330011	1081	20500000	\N	\N	\N	1	10641.0666666670004	1
1250	35205.3333333330011	1085	20500000	\N	\N	\N	1	7041.06666666670026	1
953	35205.3333333330011	1086	20500000	\N	\N	\N	1	7041.06666666670026	1
1178	38205.3333333330011	1088	20500000	\N	\N	\N	1	7641.06666666670026	1
1181	41205.3333333330011	1087	20500000	\N	\N	\N	1	8241.06666666670026	1
1248	38205.3333333330011	1089	20500000	\N	\N	\N	1	7641.06666666670026	1
1249	20608	1090	12000000	\N	\N	\N	1	4121.60000000000036	1
1048	106450	1092	20500000	\N	\N	\N	1	21290	1
1050	100450	1091	20500000	\N	\N	\N	1	20090	1
1343	10000	1093	\N	\N	\N	\N	1	2000	1
1164	305000	1094	50000000	\N	\N	\N	1	61000	1
1312	10000	1097	\N	\N	\N	\N	1	2000	1
1310	10000	1096	\N	\N	\N	\N	1	2000	1
1311	10000	1095	\N	\N	\N	\N	1	2000	1
1321	137386.666666670004	1102	80000000	\N	\N	\N	1	27477.3333333330011	1
1303	157386.666666670004	1101	80000000	\N	\N	\N	1	31477.3333333330011	1
1324	137386.666666670004	1100	80000000	\N	\N	\N	1	27477.3333333330011	1
1325	137386.666666670004	1099	80000000	\N	\N	\N	1	27477.3333333330011	1
1299	177386.666666670004	1098	80000000	\N	\N	\N	1	35477.3333333330011	1
1182	137386.666666670004	1103	80000000	\N	\N	\N	1	27477.3333333330011	1
1071	157386.666666670004	1104	80000000	\N	\N	\N	1	31477.3333333330011	1
1288	137386.666666670004	1106	80000000	\N	\N	\N	1	27477.3333333330011	1
1289	137386.666666670004	1105	80000000	\N	\N	\N	1	27477.3333333330011	1
1332	68693.3333333329938	1107	40000000	\N	\N	\N	1	13738.6666666670008	1
1328	137386.666666670004	1108	80000000	\N	\N	\N	1	27477.3333333330011	1
166	265000	1109	50000000	\N	\N	\N	1	53000	1
1292	137386.666666670004	1110	80000000	\N	\N	\N	1	27477.3333333330011	1
1305	492000	1111	80000000	\N	\N	\N	1	98400	1
1298	12800	1112	30000000	\N	\N	\N	1	2560	1
1317	157386.666666670004	1113	80000000	\N	\N	\N	1	31477.3333333330011	1
1294	412000	1115	80000000	\N	\N	\N	1	82400	1
1329	432000	1114	80000000	\N	\N	\N	1	86400	1
1333	122500	1116	25000000	\N	\N	\N	1	24500	1
1346	10000	1118	\N	\N	\N	\N	1	2000	1
1345	10000	1117	\N	\N	\N	\N	1	2000	1
1319	392000	1119	80000000	\N	\N	\N	1	78400	1
1354	157386.666666670004	1120	80000000	\N	\N	\N	19	31477.3333333330011	1
1347	10000	1123	\N	\N	\N	\N	19	2000	1
1350	10000	1122	\N	\N	\N	\N	19	2000	1
1351	10000	1121	\N	\N	\N	\N	19	2000	1
1377	28666.6666666669989	1124	50000000	\N	\N	\N	19	5733.33333333330029	1
1379	19400	1125	30000000	\N	\N	\N	19	3880	1
1376	237386.666666670004	1127	80000000	\N	\N	\N	19	47477.3333333330011	1
1378	157386.666666670004	1126	80000000	\N	\N	\N	19	31477.3333333330011	1
1363	140213.333333329996	1128	70000000	\N	\N	\N	19	28042.6666666669989	1
1361	98000	1129	20000000	\N	\N	\N	19	19600	1
1373	0	1132	\N	\N	\N	\N	19	0	1
1374	10000	1131	\N	\N	\N	\N	19	2000	1
1375	10000	1130	\N	\N	\N	\N	19	2000	1
1359	10000	1133	\N	\N	\N	\N	19	2000	1
1162	35205.3333333330011	1134	20500000	\N	\N	\N	1	7041.06666666670026	1
1169	50650	1135	8500000	\N	\N	\N	1	10130	1
1149	35205.3333333330011	1137	20500000	\N	\N	\N	1	7041.06666666670026	1
1220	41205.3333333330011	1136	20500000	\N	\N	\N	1	8241.06666666670026	1
1174	35205.3333333330011	1138	20500000	\N	\N	\N	1	7041.06666666670026	1
1175	15400	1139	30000000	\N	\N	\N	1	3080	1
812	35205.3333333330011	1140	20500000	\N	\N	\N	1	7041.06666666670026	1
1125	103450	1141	20500000	\N	\N	\N	1	20690	1
1263	47205.3333333330011	1142	20500000	\N	\N	\N	1	9441.06666666670026	1
1266	103450	1143	20500000	\N	\N	\N	1	20690	1
1267	12800	1145	30000000	\N	\N	\N	1	2560	1
1268	17200	1144	30000000	\N	\N	\N	1	3440	1
1193	53205.3333333330011	1146	20500000	\N	\N	\N	1	10641.0666666670004	1
1194	12800	1147	30000000	\N	\N	\N	1	2560	1
1285	35205.3333333330011	1149	20500000	\N	\N	\N	1	7041.06666666670026	1
1286	35205.3333333330011	1148	20500000	\N	\N	\N	1	7041.06666666670026	1
519	51450	1150	10500000	\N	\N	\N	1	10290	1
1026	100450	1151	20500000	\N	\N	\N	1	20090	1
1183	41205.3333333330011	1152	20500000	\N	\N	\N	1	8241.06666666670026	1
580	16200	1153	30000000	\N	\N	\N	1	3240	1
1093	12800	1154	30000000	\N	\N	\N	1	2560	1
864	41205.3333333330011	1155	20500000	\N	\N	\N	1	8241.06666666670026	1
1453	25666.6666666669989	1156	50000000	\N	\N	\N	1	5133.33333333330029	1
1452	120213.333333329996	1157	70000000	\N	\N	\N	1	24042.6666666669989	1
1397	28666.6666666669989	1158	50000000	\N	\N	\N	1	5733.33333333330029	1
1395	157386.666666670004	1159	80000000	\N	\N	\N	1	31477.3333333330011	1
1398	10000	1162	\N	\N	\N	\N	1	2000	1
1400	10000	1161	\N	\N	\N	\N	1	2000	1
1401	10000	1160	\N	\N	\N	\N	1	2000	1
1420	10000	1168	\N	\N	\N	\N	1	2000	1
1421	10000	1167	\N	\N	\N	\N	1	2000	1
1423	10000	1166	\N	\N	\N	\N	1	2000	1
1424	10000	1165	\N	\N	\N	\N	1	2000	1
1426	10000	1164	\N	\N	\N	\N	1	2000	1
1428	10000	1163	\N	\N	\N	\N	1	2000	1
1384	21333.3333333330011	1169	50000000	\N	\N	\N	1	4266.66666666669971	1
1381	217386.666666670004	1171	80000000	\N	\N	\N	1	43477.3333333330011	1
1460	137386.666666670004	1170	80000000	\N	\N	\N	1	27477.3333333330011	1
1461	160213.333333329996	1172	70000000	\N	\N	\N	1	32042.6666666669989	1
1462	208800	1173	75000000	\N	\N	\N	1	41760	1
1383	383000	1174	70000000	\N	\N	\N	1	76600	1
1386	10000	1175	\N	\N	\N	\N	1	2000	1
1447	10000	1180	\N	\N	\N	\N	1	2000	1
1448	10000	1179	\N	\N	\N	\N	1	2000	1
1450	10000	1177	\N	\N	\N	\N	1	2000	1
1451	10000	1176	\N	\N	\N	\N	1	2000	1
1459	21333.3333333330011	1181	50000000	\N	\N	\N	1	4266.66666666669971	1
1458	177386.666666670004	1182	80000000	\N	\N	\N	1	35477.3333333330011	1
1456	20000	1183	\N	\N	\N	\N	1	4000	1
1455	20000	1184	\N	\N	\N	\N	1	4000	1
1454	180000	1185	\N	\N	\N	\N	1	36000	1
1443	10000	1186	\N	\N	\N	\N	1	2000	1
1442	10000	1187	\N	\N	\N	\N	1	2000	1
1441	10000	1188	\N	\N	\N	\N	1	2000	1
1440	10000	1189	\N	\N	\N	\N	1	2000	1
1439	10000	1190	\N	\N	\N	\N	1	2000	1
1438	10000	1191	\N	\N	\N	\N	1	2000	1
1437	10000	1192	\N	\N	\N	\N	1	2000	1
1436	10000	1193	\N	\N	\N	\N	1	2000	1
1435	10000	1194	\N	\N	\N	\N	1	2000	1
1433	10000	1195	\N	\N	\N	\N	1	2000	1
1431	10000	1196	\N	\N	\N	\N	1	2000	1
1430	10000	1197	\N	\N	\N	\N	1	2000	1
1429	10000	1198	\N	\N	\N	\N	1	2000	1
1427	10000	1199	\N	\N	\N	\N	1	2000	1
1425	10000	1200	\N	\N	\N	\N	1	2000	1
1422	10000	1201	\N	\N	\N	\N	1	2000	1
1419	10000	1202	\N	\N	\N	\N	1	2000	1
1418	10000	1203	\N	\N	\N	\N	1	2000	1
1417	10000	1204	\N	\N	\N	\N	1	2000	1
1466	197386.666666670004	1205	80000000	\N	\N	\N	19	39477.3333333330011	1
1492	67666.6666666670062	1207	50000000	\N	\N	\N	19	13533.3333333329992	1
1508	21333.3333333330011	1206	50000000	\N	\N	\N	19	4266.66666666669971	1
1509	157386.666666670004	1208	80000000	\N	\N	\N	19	31477.3333333330011	1
1491	412000	1209	80000000	\N	\N	\N	19	82400	1
1465	10000	1210	\N	\N	\N	\N	19	2000	1
1504	36666.6666666669989	1211	50000000	\N	\N	\N	19	7333.33333333330029	1
1503	140213.333333329996	1212	70000000	\N	\N	\N	19	28042.6666666669989	1
1152	14162.6666666670008	1213	6500000	\N	\N	\N	1	2832.53333333330011	1
1246	106450	1214	20500000	\N	\N	\N	1	21290	1
1315	197386.666666670004	1215	80000000	\N	\N	\N	23	39477.3333333330011	1
1334	220500	1216	45000000	\N	\N	\N	23	44100	1
1330	85866.6666666670062	1218	50000000	\N	\N	\N	23	17173.3333333330011	1
1331	245000	1217	50000000	\N	\N	\N	23	49000	1
1297	177386.666666670004	1222	80000000	\N	\N	\N	23	35477.3333333330011	1
1300	157386.666666670004	1221	80000000	\N	\N	\N	23	31477.3333333330011	1
1295	177386.666666670004	1220	80000000	\N	\N	\N	23	35477.3333333330011	1
1322	412000	1219	80000000	\N	\N	\N	23	82400	1
1307	387500	1223	75000000	\N	\N	\N	23	77500	1
1538	392000	1225	80000000	\N	\N	\N	23	78400	1
1537	10000	1224	\N	\N	\N	\N	23	2000	1
1533	21333.3333333330011	1226	50000000	\N	\N	\N	23	4266.66666666669971	1
1531	412000	1227	80000000	\N	\N	\N	23	82400	1
1336	49666.6666666669989	1229	50000000	\N	\N	\N	23	9933.33333333329938	1
1335	22000	1228	30000000	\N	\N	\N	23	4400	1
1544	197386.666666670004	1233	80000000	\N	\N	\N	23	39477.3333333330011	1
1543	137386.666666670004	1232	80000000	\N	\N	\N	23	27477.3333333330011	1
1515	237386.666666670004	1231	80000000	\N	\N	\N	23	47477.3333333330011	1
1513	137386.666666670004	1230	80000000	\N	\N	\N	23	27477.3333333330011	1
1366	21333.3333333330011	1237	50000000	\N	\N	\N	23	4266.66666666669971	1
1364	21333.3333333330011	1235	50000000	\N	\N	\N	23	4266.66666666669971	1
1362	137386.666666670004	1236	80000000	\N	\N	\N	23	27477.3333333330011	1
1365	245000	1234	50000000	\N	\N	\N	23	49000	1
1353	88693.3333333329938	1238	40000000	\N	\N	\N	23	17738.6666666669989	1
1358	148800	1240	75000000	\N	\N	\N	23	29760	1
1357	412000	1239	80000000	\N	\N	\N	23	82400	1
1372	68693.3333333329938	1241	40000000	\N	\N	\N	23	13738.6666666670008	1
1316	197386.666666670004	1242	80000000	\N	\N	\N	23	39477.3333333330011	1
1320	412000	1243	80000000	\N	\N	\N	23	82400	1
1313	392000	1244	80000000	\N	\N	\N	23	78400	1
1306	392000	1245	80000000	\N	\N	\N	23	78400	1
1327	392000	1246	80000000	\N	\N	\N	23	78400	1
1326	412000	1247	80000000	\N	\N	\N	23	82400	1
1318	472000	1248	80000000	\N	\N	\N	23	94400	1
1344	187000	1249	30000000	\N	\N	\N	23	37400	1
1291	137386.666666670004	1250	80000000	\N	\N	\N	23	27477.3333333330011	1
1370	12800	1252	30000000	\N	\N	\N	23	2560	1
1369	34346.6666666669989	1251	20000000	\N	\N	\N	23	6869.33333333330029	1
1525	10000	1253	\N	\N	\N	\N	23	2000	1
1290	285000	1254	50000000	\N	\N	\N	23	57000	1
1521	53666.6666666669989	1256	50000000	\N	\N	\N	23	10733.3333333329992	1
1520	425000	1255	50000000	\N	\N	\N	23	85000	1
1339	236000	1257	40000000	\N	\N	\N	23	47200	1
1264	12800	1258	30000000	\N	\N	\N	23	2560	1
1371	105866.666666670004	1259	50000000	\N	\N	\N	23	21173.3333333330011	1
1352	236000	1260	40000000	\N	\N	\N	23	47200	1
1348	363000	1261	70000000	\N	\N	\N	23	72600	1
1605	21333.3333333330011	1267	50000000	\N	\N	\N	19	4266.66666666669971	1
1581	21333.3333333330011	1266	50000000	\N	\N	\N	19	4266.66666666669971	1
1578	21333.3333333330011	1264	50000000	\N	\N	\N	19	4266.66666666669971	1
1576	137386.666666670004	1263	80000000	\N	\N	\N	19	27477.3333333330011	1
1571	197386.666666670004	1262	80000000	\N	\N	\N	19	39477.3333333330011	1
1580	392000	1265	80000000	\N	\N	\N	19	78400	1
1589	137386.666666670004	1268	80000000	\N	\N	\N	19	27477.3333333330011	1
1570	10000	1279	\N	\N	\N	\N	19	2000	1
1569	10000	1278	\N	\N	\N	\N	19	2000	1
1568	10000	1277	\N	\N	\N	\N	19	2000	1
1567	10000	1276	\N	\N	\N	\N	19	2000	1
1566	10000	1275	\N	\N	\N	\N	19	2000	1
1565	10000	1274	\N	\N	\N	\N	19	2000	1
1563	10000	1273	\N	\N	\N	\N	19	2000	1
1560	10000	1272	\N	\N	\N	\N	19	2000	1
1558	20000	1271	\N	\N	\N	\N	19	4000	1
1557	10000	1270	\N	\N	\N	\N	19	2000	1
1554	10000	1269	\N	\N	\N	\N	19	2000	1
1588	392000	1280	80000000	\N	\N	\N	19	78400	1
1594	157386.666666670004	1282	80000000	\N	\N	\N	19	31477.3333333330011	1
1592	363000	1281	70000000	\N	\N	\N	19	72600	1
1555	157386.666666670004	1283	80000000	\N	\N	\N	19	31477.3333333330011	1
1556	412000	1284	80000000	\N	\N	\N	19	82400	1
1587	30666.6666666669989	1287	50000000	\N	\N	\N	19	6133.33333333330029	1
1586	28666.6666666669989	1286	50000000	\N	\N	\N	19	5733.33333333330029	1
1585	197386.666666670004	1285	80000000	\N	\N	\N	19	39477.3333333330011	1
1614	17173.3333333330011	1300	20000000	\N	\N	\N	1	3434.66666666670017	0
1616	68693.3333333329938	1301	80000000	\N	\N	\N	1	13738.6666666670008	0
1629	132500	1304	50000000	\N	\N	\N	1	26500	0
1632	62933.3333333330011	1305	50000000	\N	\N	\N	1	12586.6666666670008	0
1633	122500	1306	50000000	\N	\N	\N	1	24500	0
1638	201500	1307	70000000	\N	\N	\N	1	40300	0
584	13600	1297	30000000	\N	\N	\N	1	2720	1
583	157386.666666670004	1296	80000000	\N	\N	\N	1	31477.3333333330011	1
1061	157386.666666670004	1294	80000000	\N	\N	\N	1	31477.3333333330011	1
1062	12800	1295	30000000	\N	\N	\N	1	2560	1
1648	196000	1308	80000000	\N	\N	\N	1	39200	0
1415	58000	1299	70000000	\N	\N	\N	1	11600	1
1630	196000	1309	80000000	\N	\N	\N	1	39200	0
1637	74400	1310	75000000	\N	\N	\N	1	14880	0
1661	78693.3333333329938	1311	80000000	\N	\N	\N	1	15738.6666666670008	0
1014	237386.666666670004	1290	80000000	\N	\N	\N	1	47477.3333333330011	1
1643	148000	1312	40000000	\N	\N	\N	1	29600	0
1068	392000	1289	40000000	\N	\N	\N	1	78400	1
1067	392000	1288	80000000	\N	\N	\N	1	78400	1
1499	68693.3333333329938	1302	30000000	\N	\N	\N	1	13738.6666666670008	1
1021	177386.666666670004	1291	80000000	\N	\N	\N	1	35477.3333333330011	1
1644	78693.3333333329938	1313	80000000	\N	\N	\N	1	15738.6666666670008	0
1038	257386.666666670004	1293	80000000	\N	\N	\N	1	51477.3333333330011	1
1035	137386.666666670004	1292	80000000	\N	\N	\N	1	27477.3333333330011	1
1302	58000	1298	50000000	\N	\N	\N	1	11600	1
1301	383000	1303	70000000	\N	\N	\N	1	76600	1
1618	98000	1314	40000000	\N	\N	\N	1	19600	0
1620	68693.3333333329938	1315	80000000	\N	\N	\N	1	13738.6666666670008	0
1621	98693.3333333329938	1316	80000000	\N	\N	\N	1	19738.6666666669989	0
1612	68693.3333333329938	1317	80000000	\N	\N	\N	1	13738.6666666670008	0
1617	10666.6666666670008	1318	50000000	\N	\N	\N	1	2133.33333333329983	0
1635	122500	1319	50000000	\N	\N	\N	1	24500	0
1636	26833.3333333330011	1320	50000000	\N	\N	\N	1	5366.66666666669971	0
1639	49000	1321	20000000	\N	\N	\N	1	9800	0
1640	4400	1322	30000000	\N	\N	\N	1	880	0
1642	69000	1323	20000000	\N	\N	\N	1	13800	0
\.


--
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
15	0	Liquidacion de Ventas	fa fa-play	16	#	1
3	0	Vendedores	fa fa-briefcase	9	index.php/usuarios/vendedores	0
19	2	Semanas	fa fa-circle-o	20	index.php/config/semana	0
20	0	Reportes	fa fa-circle-o	21	#	1
18	0	Extornos	fa fa-undo	19	#	1
23	18	Extornar Venta	fa fa-circle-o	24	index.php/extornos/extornos	0
24	18	Ver Extornos	fa fa-circle-o	25	index.php/extornos/view_extornos	0
4	0	Ventas de Polizas	fa fa-opencart	10	#	1
25	4	Ventas	fa fa-circle-o	26	index.php/polizas/ventas	0
17	15	Pre-Liquidacion	fa fa-circle-o	17	index.php/liquidacion	0
16	15	Liquidacion	fa fa-circle-o	18	index.php/liquidacion/view_liquidacion	0
22	20	Comisiones General	fa fa-circle-o	23	index.php/reportes/rpt_por_coordinador	0
21	20	Comisiones	fa fa-circle-o	22	index.php/reportes/rpt_por_vendedor	0
27	20	Estadisticas	fa fa-circle-o	28	index.php/reportes/estadisticas	0
28	2	Parentesco	fa fa-circle-o	29	index.php/config/parentesco	0
5	0	Inicio	fa fa-home	1	index.php/login/welcome	0
26	0	Aprobar ventas domiciliadas	fa fa-credit-card	27	index.php/polizas/ventasd	0
29	20	Reporte Diario	fa fa-circle-o	\N	index.php/reportes/rpt_diario	0
31	2	Planes	fa fa-circle-o	32	index.php/config/tplan	0
30	20	Reporte de Cierre	fa fa-circle-o	31	index.php/reportes/rpt_cierre	0
32	20	Reporte	fa fa-circle-o	\N	index.php/reportes/rpt	0
33	20	Domiciliaciones	\N	\N	index.php/reportes/rpt_dom	0
34	2	configuracion de correo electronico	fa fa-circle-o	\N	index.php/email	0
\.


--
-- Data for Name: t_motivos; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.t_motivos (id_motivo, motivo, id_usuario, fecha_registro, ult_mod, estatus) FROM stdin;
1	Porque si	\N	\N	\N	0
2	www	1	2019-10-10 00:00:00	2019-10-10 00:00:00	0
\.


--
-- Data for Name: t_parentesco; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.t_parentesco (id_parentesco, parentesco, id_usuario, fecha_registro, ult_mod, estatus) FROM stdin;
1	Hermanos	\N	\N	\N	0
2	primos	\N	\N	\N	0
3	tios	\N	\N	\N	0
4	nietos	\N	\N	\N	0
5	hijos mayores	\N	\N	\N	0
6	sobrinos	\N	\N	\N	0
7	suegros	\N	\N	\N	0
8	otros	\N	\N	\N	0
9	Prueba	1	2019-10-10 00:00:00	2019-10-10 00:00:00	1
10	padres	1	\N	\N	0
11	conyugue	1	\N	\N	0
\.


--
-- Data for Name: t_personas; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.t_personas (id_persona, identificacion, nombres, apellidos, telefono, correo, id_usuario, fecha_registro, ult_mod, id_coordinador) FROM stdin;
23	V-38006	ALVARO 	ROMERO	02128221100	klucas@seguroslafe.com	1	\N	\N	0
24	V-15820004	KARINA	LUCAS	02128221100	klucas@seguroslafe.com	1	\N	\N	0
22	V-6399332	MIRLENA CHARI	BLANCO	04143890525	mirlenachary@gmail.com	1	\N	\N	0
21	V-21072511	katherine	lezama	21072511	kathylezama@live.com	1	2019-10-16 00:00:00	2019-10-16 00:00:00	0
25	V-9954296	PATRICIA	IRALA	04142668938	pirala@seguroslafe.com	1	\N	\N	0
26	V-22523438	MILANYELA 	VIELMA	02128221100	mvielma@seguroslafe.com	1	\N	\N	0
27	V-6033253	NICOLAS	PEREZ	04142991136	nperez@seguroslafe.com	1	\N	\N	0
28	V-28325386	DANIELA	GARVAN	02128221100	fgarban@seguroslafe.com	1	\N	\N	0
29	V-2898087	MANUEL	PEÑA	04166324335	mpena@seguroslafe.com	1	\N	\N	0
30	V-16329141	KEILE	QUINTERO	02128221100	KQUINTERO@SEGUROSLAFE.COM	1	\N	\N	0
31	V-12114699	ANA MARIA	ITRIAGO CASTILLO	02128221173	aitriago@seguroslafe.com	1	\N	\N	0
32	V-17401901	Edwin	Bermudez	1137	ebermudez@seguroslafe.com	1	\N	\N	0
33	V-14127253	Alexander	Segovia	1233	asegovia@seguroslafe.com	1	\N	\N	0
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
4	NO APLICA	\N	\N	\N	0	\N
\.


--
-- Data for Name: t_polizas; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.t_polizas (id_poliza, id_tpoliza, cobertura, suma, num_poliza, id_usuario, fecha_registro, ult_mod, id_plan, estatus, id_sem_i, id_sem_f) FROM stdin;
97	3	Asistencia Funeraria (Parcela)	10500000	I4-50	0	2019-09-01 00:00:00	2019-09-01 00:00:00	1	0	\N	\N
98	3	Asistencia Funeraria (Funerario)	14500000	I5-50	0	2019-09-01 00:00:00	2019-09-01 00:00:00	1	0	\N	\N
99	3	Asistencia Funeraria (Funerario y Cremación)	20500000	I6-50	0	2019-09-01 00:00:00	2019-09-01 00:00:00	1	0	\N	\N
100	3	Asistencia Funeraria (Funerario y Parcela)	10000000	I10-50	0	2019-09-01 00:00:00	2019-09-01 00:00:00	1	0	\N	\N
101	3	Asistencia Funeraria (Por definir)	4000000	I9-50	0	2019-09-01 00:00:00	2019-09-01 00:00:00	1	0	\N	\N
102	3	Asistencia Funeraria (Funerario)	6000000	A4-50	0	2019-09-01 00:00:00	2019-09-01 00:00:00	2	0	\N	\N
103	3	Asistencia Funeraria (Parcela)	10000000	A5-50	0	2019-09-01 00:00:00	2019-09-01 00:00:00	2	0	\N	\N
104	3	Asistencia Funeraria (Funerario y Cremación)	12000000	A6-50	0	2019-09-01 00:00:00	2019-09-01 00:00:00	2	0	\N	\N
105	3	Asistencia Funeraria (Funerario y Parcela)	6000000	A10-50	0	2019-09-01 00:00:00	2019-09-01 00:00:00	2	0	\N	\N
106	3	Asistencia Funeraria (Por definir)	4000000	A9-50	0	2019-09-01 00:00:00	2019-09-01 00:00:00	2	0	\N	\N
107	3	Asistencia Funeraria (Funerario)	8500000	B4-50	0	2019-09-01 00:00:00	2019-09-01 00:00:00	3	0	\N	\N
108	3	Asistencia Funeraria (Parcela)	12500000	B5-50	0	2019-09-01 00:00:00	2019-09-01 00:00:00	3	0	\N	\N
109	3	Asistencia Funeraria (Funerario y Cremación)	14500000	B6-50	0	2019-09-01 00:00:00	2019-09-01 00:00:00	3	0	\N	\N
110	3	Asistencia Funeraria (Funerario y Parcela)	6000000	B10-50	0	2019-09-01 00:00:00	2019-09-01 00:00:00	3	0	\N	\N
111	3	Asistencia Funeraria (Por definir)	4000000	B9-50	0	2019-09-01 00:00:00	2019-09-01 00:00:00	3	0	\N	\N
112	4	Asistencia Funeraria (Parcela)	10500000	I4-33	0	2019-09-01 00:00:00	2019-09-01 00:00:00	1	0	\N	\N
113	4	Asistencia Funeraria (Funerario)	14500000	I5-33	0	2019-09-01 00:00:00	2019-09-01 00:00:00	1	0	\N	\N
114	4	Asistencia Funeraria (Funerario y Cremación)	20500000	I6-33	0	2019-09-01 00:00:00	2019-09-01 00:00:00	1	0	\N	\N
115	4	Asistencia Funeraria (Funerario y Parcela)	10000000	I10-33	0	2019-09-01 00:00:00	2019-09-01 00:00:00	1	0	\N	\N
116	4	Asistencia Funeraria (Por definir)	4000000	I9-33	0	2019-09-01 00:00:00	2019-09-01 00:00:00	1	0	\N	\N
117	4	Asistencia Funeraria (Funerario)	6000000	A4-33	0	2019-09-01 00:00:00	2019-09-01 00:00:00	2	0	\N	\N
118	4	Asistencia Funeraria (Parcela)	10000000	A5-33	0	2019-09-01 00:00:00	2019-09-01 00:00:00	2	0	\N	\N
119	4	Asistencia Funeraria (Funerario y Cremación)	12000000	A6-33	0	2019-09-01 00:00:00	2019-09-01 00:00:00	2	0	\N	\N
120	4	Asistencia Funeraria (Funerario y Parcela)	6000000	A10-33	0	2019-09-01 00:00:00	2019-09-01 00:00:00	2	0	\N	\N
121	4	Asistencia Funeraria (Por definir)	4000000	A9-33	0	2019-09-01 00:00:00	2019-09-01 00:00:00	2	0	\N	\N
122	4	Asistencia Funeraria (Funerario)	8500000	B4-33	0	2019-09-01 00:00:00	2019-09-01 00:00:00	3	0	\N	\N
123	4	Asistencia Funeraria (Parcela)	12500000	B5-33	0	2019-09-01 00:00:00	2019-09-01 00:00:00	3	0	\N	\N
124	4	Asistencia Funeraria (Funerario y Cremación)	14500000	B6-33	0	2019-09-01 00:00:00	2019-09-01 00:00:00	3	0	\N	\N
125	4	Asistencia Funeraria (Funerario y Parcela)	6000000	B10-33	0	2019-09-01 00:00:00	2019-09-01 00:00:00	3	0	\N	\N
126	4	Asistencia Funeraria (Por definir)	4000000	B9-33	0	2019-09-01 00:00:00	2019-09-01 00:00:00	3	0	\N	\N
127	1	nada	0	\N	1	\N	2019-09-23 00:00:00	5	1	\N	\N
128	1	nada	0	\N	1	\N	2019-09-23 00:00:00	2	1	\N	\N
130	5	Cuarenta Millones	40000000	\N	1	\N	\N	2	0	\N	\N
129	5	Cincuenta Millones	50000000	\N	1	\N	2019-10-06 00:00:00	2	0	\N	\N
131	5	trenta millones	30000000	\N	1	\N	\N	2	0	\N	\N
67	1	Asistencia Funeraria (Parcela)	30000000	I1	1	2019-09-01 00:00:00	2019-09-01 00:00:00	1	0	\N	\N
68	1	Asistencia Funeraria (Funerario)	50000000	I2	1	2019-09-01 00:00:00	2019-09-01 00:00:00	1	0	\N	\N
69	1	Asistencia Funeraria (Funerario y Cremación)	80000000	I3	1	2019-09-01 00:00:00	2019-09-01 00:00:00	1	0	\N	\N
70	1	Asistencia Funeraria (Funerario y Parcela)	50000000	I8	1	2019-09-01 00:00:00	2019-09-01 00:00:00	1	0	\N	\N
71	1	Asistencia Funeraria (Por definir)	20000000	I7	1	2019-09-01 00:00:00	2019-09-01 00:00:00	1	0	\N	\N
73	1	Asistencia Funeraria (Parcela)	40000000	A2	1	2019-09-01 00:00:00	2019-09-01 00:00:00	2	0	\N	\N
74	1	Asistencia Funeraria (Funerario y Cremación)	70000000	A3	1	2019-09-01 00:00:00	2019-09-01 00:00:00	2	0	\N	\N
75	1	Asistencia Funeraria (Funerario y Parcela)	50000000	A8	1	2019-09-01 00:00:00	2019-09-01 00:00:00	2	0	\N	\N
76	1	Asistencia Funeraria (por definir)	20000000	A7	1	2019-09-01 00:00:00	2019-09-01 00:00:00	2	0	\N	\N
72	1	Asistencia Funeraria (Funerario)	20000000	A1	1	2019-09-01 00:00:00	2019-05-10 00:00:00	2	0	\N	\N
77	1	Asistencia Funeraria (Funerario)	25000000	B1	1	2019-09-01 00:00:00	2019-09-05 00:00:00	3	0	\N	\N
78	1	Asistencia Funeraria (Parcela)	45000000	B2	1	2019-09-01 00:00:00	2019-09-01 00:00:00	3	0	\N	\N
79	1	Asistencia Funeraria (Funerario y Cremación)	75000000	B3	1	2019-09-01 00:00:00	2019-09-01 00:00:00	3	0	\N	\N
80	1	Asistencia Funeraria (Funerario y Parcela)	50000000	B8	1	2019-09-01 00:00:00	2019-09-01 00:00:00	3	0	\N	\N
81	1	Asistencia Funeraria (Por definir)	20000000	B7	1	2019-09-01 00:00:00	2019-09-01 00:00:00	3	0	\N	\N
82	2	Asistencia Funeraria (Parcela)	30000000	I4	1	2019-09-01 00:00:00	2019-09-01 00:00:00	1	0	\N	\N
83	2	Asistencia Funeraria (Funerario)	50000000	I5	1	2019-09-01 00:00:00	2019-09-01 00:00:00	1	0	\N	\N
84	2	Asistencia Funeraria (Funerario y Cremación)	80000000	I6	1	2019-09-01 00:00:00	2019-09-01 00:00:00	1	0	\N	\N
85	2	Asistencia Funeraria (Funerario y Parcela)	50000000	I10	1	2019-09-01 00:00:00	2019-09-01 00:00:00	1	0	\N	\N
86	2	Asistencia Funeraria (Por definir)	20000000	I9	1	2019-09-01 00:00:00	2019-09-01 00:00:00	1	0	\N	\N
87	2	Asistencia Funeraria (Funerario)	20000000	A4	1	2019-09-01 00:00:00	2019-09-01 00:00:00	2	0	\N	\N
88	2	Asistencia Funeraria (Parcela)	40000000	A5	1	2019-09-01 00:00:00	2019-09-01 00:00:00	2	0	\N	\N
89	2	Asistencia Funeraria (Funerario y Cremación)	70000000	A6	1	2019-09-01 00:00:00	2019-09-01 00:00:00	2	0	\N	\N
90	2	Asistencia Funeraria (Funerario y Parcela)	50000000	A10	1	2019-09-01 00:00:00	2019-09-01 00:00:00	2	0	\N	\N
91	2	Asistencia Funeraria (Por definir)	20000000	A9	1	2019-09-01 00:00:00	2019-09-01 00:00:00	2	0	\N	\N
92	2	Asistencia Funeraria (Funerario)	25000000	B4	1	2019-09-01 00:00:00	2019-09-01 00:00:00	3	0	\N	\N
93	2	Asistencia Funeraria (Parcela)	45000000	B5	1	2019-09-01 00:00:00	2019-09-01 00:00:00	3	0	\N	\N
94	2	Asistencia Funeraria (Funerario y Cremación)	75000000	B6	1	2019-09-01 00:00:00	2019-09-01 00:00:00	3	0	\N	\N
95	2	Asistencia Funeraria (Funerario y Parcela)	50000000	B10	1	2019-09-01 00:00:00	2019-09-01 00:00:00	3	0	\N	\N
96	2	Asistencia Funeraria (Por definir)	20000000	B9	1	2019-09-01 00:00:00	2019-09-01 00:00:00	3	0	\N	\N
\.


--
-- Data for Name: t_roles; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.t_roles (id_rol, rol, observacion, id_usuario, fecha_registro, ult_mod, estatus_rol) FROM stdin;
8	Configuración	\N	\N	\N	\N	1
11	Vendedores	\N	\N	\N	\N	0
3	Coordinador De Ventas	\N	0	2019-09-01 00:00:00	2019-09-01 00:00:00	0
2	Administrador	\N	0	2019-09-01 00:00:00	2019-09-01 00:00:00	0
12	Cobranzas	\N	\N	\N	\N	0
10	Tecnico	\N	\N	\N	\N	0
9	Asistente De Ventas	\N	\N	\N	\N	0
13	Ventas	\N	\N	\N	\N	0
\.


--
-- Data for Name: t_semanas; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.t_semanas (id_semana, desde, hasta, estatus, id_usuario, fecha_registro, ult_mod, observaciones, nsem) FROM stdin;
1	2019-09-15	2019-09-21	1	1	2019-09-21 00:00:00	2019-10-08 00:00:00	Pruebas	38
57	2019-09-23	2019-09-29	1	\N	2019-10-08 00:00:00	2019-10-08 00:00:00	REGISTRO DE NUEVA SEMANA	39
58	2019-09-30	2019-10-06	1	\N	2019-10-08 00:00:00	2019-10-15 00:00:00	REGISTRO DE NUEVA SEMANA	40
59	2019-10-07	2019-10-13	1	\N	2019-10-08 00:00:00	2019-10-16 00:00:00	REGISTRO DE NUEVA SEMANA	41
60	2019-10-14	2019-10-20	1	\N	2019-10-15 00:00:00	2019-10-16 00:00:00	REGISTRO DE NUEVA SEMANA	42
61	2019-10-21	2019-10-27	1	\N	\N	\N	REGISTRO DE NUEVA SEMANA	43
62	2019-10-28	2019-11-03	1	\N	\N	\N	REGISTRO DE NUEVA SEMANA	44
63	2019-11-04	2019-11-10	1	\N	\N	\N	REGISTRO DE NUEVA SEMANA	45
64	2019-11-11	2019-11-17	1	\N	\N	\N	REGISTRO DE NUEVA SEMANA	46
65	2019-11-18	2019-11-24	1	\N	\N	\N	REGISTRO DE NUEVA SEMANA	47
66	2019-11-25	2019-12-01	1	\N	\N	\N	REGISTRO DE NUEVA SEMANA	48
67	2019-12-02	2019-12-08	1	\N	\N	\N	REGISTRO DE NUEVA SEMANA	49
68	2019-12-09	2019-12-15	1	\N	\N	\N	REGISTRO DE NUEVA SEMANA	50
69	2019-12-16	2019-12-22	1	\N	\N	\N	REGISTRO DE NUEVA SEMANA	51
71	2020-01-06	2020-01-11	1	\N	\N	\N	\N	2
70	2019-12-22	2019-12-28	1	\N	\N	\N	REGISTRO DE NUEVA SEMANA	52
72	2019-12-30	2020-01-05	1	\N	\N	\N	\N	1
74	2020-01-13	2020-01-18	1	\N	\N	\N	REGISTRO DE NUEVA SEMANA	3
75	2020-01-20	2020-01-25	1	\N	\N	\N	REGISTRO DE NUEVA SEMANA	4
76	2020-01-27	2020-02-01	1	\N	\N	\N	REGISTRO DE NUEVA SEMANA	5
77	2020-02-04	2020-02-10	1	\N	\N	\N	REGISTRO DE NUEVA SEMANA	6
78	2020-02-11	2020-02-17	1	\N	\N	\N	REGISTRO DE NUEVA SEMANA	7
79	2020-02-18	2020-02-24	1	\N	\N	\N	REGISTRO DE NUEVA SEMANA	8
80	2020-02-25	2020-03-02	0	\N	\N	\N	REGISTRO DE NUEVA SEMANA	9
\.


--
-- Data for Name: t_tomadores; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.t_tomadores (id_tomador, identificacion, nombres, apellidos, telefono, id_coordinador, correo, fecha_registro, ult_mod, usuario, tedad) FROM stdin;
75	V-4813038	FRANCIS MARISOL	MIJARES URQUIA	02127143825	0	NANCYUZCATE1157@HOTMAIL.COM	2019-10-18 00:00:00	2019-10-18 00:00:00	1	\N
76	V-24088484	LUIS ENRIQUE	FAJARDO GUEVARA	02128718851	0	LFAJARDOEO@GMAIL.COM	2019-10-18 00:00:00	2019-10-18 00:00:00	1	\N
79	V-19753901	ZAIRA	ESCALONA	02124439458	0	ivette@hotmail.com	2019-10-18 00:00:00	2019-10-18 00:00:00	1	\N
80	V-24663577	DIAZ	GALLARDO	04142112805	0	JACSIMIRXUDAICY@GMAIL.COM	2019-10-18 00:00:00	2019-10-18 00:00:00	1	\N
81	V-17556477	BRHEME	PEREZ 	04241431514	0	BAHEME_19862@HOTMAIL.COM	2019-10-18 00:00:00	2019-10-18 00:00:00	1	\N
83	V-20629763	JOSE	POVEA	02124382868	0	OSUNASEBASTIAN331@GMAIL.COM	2019-10-18 00:00:00	2019-10-18 00:00:00	1	\N
84	V-11921332	AZOCAR	CHARLIT	04263353434	0	MARITZAOLI0@GMAIL.COM	2019-10-18 00:00:00	2019-10-18 00:00:00	1	\N
85	V-14789333	CHARLIT	AZOCAR	04149134055	0	MARITZAOLI0@GMAIL.COM	2019-10-18 00:00:00	2019-10-18 00:00:00	1	\N
86	V-187497374	CHRYSTIAN	BOLIVAR	02126727689	0	CHRYSTIANBOL@GMAIL.COM	2019-10-18 00:00:00	2019-10-18 00:00:00	1	\N
87	V-19819452	KATHERIN	INFANTE	02126727689	0	YOLEIDYKAT@GMAIL.COM	2019-10-18 00:00:00	2019-10-18 00:00:00	1	\N
89	V-27659593	GEOVANY	BALDISERRA	04128058286	0	BALDISERRA_P@GMAIL.COM	2019-10-18 00:00:00	2019-10-18 00:00:00	1	\N
91	V-10119560	DOUGLAS	DOMINGUEZ	04126245151	0	DOUGLASBULDO@HOTMAIL.COM	2019-10-18 00:00:00	2019-10-18 00:00:00	1	\N
92	V-25148298	ENDARNAYBER	MANZANO	04126082439	0	NAYBERMANZANO@GMAIL.COM	2019-10-18 00:00:00	2019-10-18 00:00:00	1	\N
93	V-25210962	JESSICA	GARCIA	02128628231	0	JCSSICAKGARCIAS@GMAIL.COM	2019-10-18 00:00:00	2019-10-18 00:00:00	1	\N
94	V-10489990	MARIA	SANCHEZ	02128732749	0	MISBBSANCHEZ@HOTMAIL.COM	2019-10-18 00:00:00	2019-10-18 00:00:00	1	\N
97	V-12398375	Elvis G	Quevedo Barrios	02124922865	0	ELVISQVEVEDOBA@GMAIL.COM	2019-10-21 00:00:00	2019-10-21 00:00:00	1	\N
101	V-12096773	JOAN	MENDOZA 	04149182161	0	JAMKTM23@HOTMAIL.COM	\N	2019-10-21 00:00:00	1	\N
102	V-12295775	NATHALI	RODRIGUEZ	04164213787	0	nathalydelcrodriguez@gmail.com	\N	2019-10-21 00:00:00	1	\N
104	V-14735549	Meili	lugo	04165242155	0	meili_lugo_@hotmail.com	\N	2019-10-21 00:00:00	1	\N
105	V-12294960	YOLLIS	LEON	04141507881	0	YOLLISLEON1975@GMAIL.COM	\N	2019-10-21 00:00:00	1	\N
106	V-8763666	YSAURA	BLANCO	04264541261	0	YSAURA.1569@GMAIL.COM	\N	2019-10-21 00:00:00	1	\N
107	V-8754900	MAYERLICA	CEDENO	04164039864	0	MAYERLICA@GMAIL.COM	\N	2019-10-21 00:00:00	1	\N
108	V-12826215	CARMEN	CORDOVA	04124811727	0	CARMENCORDOVA1976@GMAIL.COM	\N	2019-10-21 00:00:00	1	\N
109	V-16497549	MAYERLYS	SERRANO	04125407819	0	ARGELISAXELAVAREZ@GMAIL.COM	\N	2019-10-21 00:00:00	1	\N
110	V-5106004	LUIS	PEREZ	02128752318	0	PEREZLUIS123@GMAIL.COM	2019-10-21 00:00:00	2019-10-21 00:00:00	1	\N
111	V-15663212	MARIA	RUIZ	021245846815	0	MRUIZ@GMAIL.COM	2019-10-21 00:00:00	2019-10-21 00:00:00	1	\N
112	V-22063537	YUSMARI	BASTIDAS	02124875112	0	YBASTIDAS@GMAIL.COM	2019-10-21 00:00:00	2019-10-21 00:00:00	1	\N
114	V-20220170	JULIE	HERNANDEZ	04127226298	0	HFANAYJULIE@GMAIL.COM	2019-10-21 00:00:00	2019-10-21 00:00:00	1	\N
115	V-12071093	DEIVIS	SALAZAR	02128581384	0	DEIVIS197485@GMAIL.COM	2019-10-21 00:00:00	2019-10-21 00:00:00	1	\N
116	V-20210664	HECMAN	RODIGUEZ 	04142505301	0	HECMARRODUIGUEZ.25@GMAIL.COM	2019-10-21 00:00:00	2019-10-21 00:00:00	1	\N
118	V-25304732	DAVID	MEDINA	04143942727	0	DAVIDMEDINA.LEAL@HOTMAIL.COM	\N	\N	1	\N
120	V-17563621	YAYCELIS	MARCANO	04241071647	0	R-LOPEZ_V@HOTMAIL.COM	\N	\N	1	\N
121	V-25097811	YUBIANYS	LEZAMA	02124736292	0	YUBIANNYSPACHECO@HOTMAIL.COM	\N	\N	1	\N
122	V-19733877	FREDDY	RONDON	04122085198	0	FREDDYRONDON1903@HOTMAIL.COM	\N	\N	1	\N
123	V-11943517	GIORGINA	BLANCO	02125611860	0	GEORGINACO@HOTMAIL.COM	\N	\N	1	\N
124	V-25735577	ORLEANY	GUERRERO	04262180761	0	ORLY26.1996@GMAIL.COM	\N	\N	1	\N
125	V-23695625	ORIANI	FLORES	02128710637	0	ORIANNYFLORES@GMAIL.COM	\N	\N	1	\N
126	V-23724947	AUDRY	FERNANDEZ	04143091858	0	AUDREYFERNANDEZ77@GMAIL.COM	\N	\N	1	\N
127	V-26131391	HILARY	VASQUEZ	04241662946	0	LICORNITAS2@MAIL.COM	\N	\N	1	\N
128	V-04242831664	ALAN	JOHAN	04242831664	0	JOHANALAC1986@GMAIL.COM	\N	\N	1	\N
129	V-18734435	YUSBELI	RAMIREZ	04167218765	0	YUSBELI1990@HOTMAIL.COM	\N	\N	1	\N
130	V-23965827	ALONDRA	PAZ	04141186231	0	PAZCASTILLO2502@GMAIL.COM	\N	\N	1	\N
131	V-19398929	YANIRA	SUAREZ	04241242008	0	YASUAREZ39@GMAIL.COM	\N	\N	1	\N
132	V-13894098	LENYS	RAMIREZ	04164930430	0	LENYSRAMIREZ@HOTMAIL.COM	\N	\N	1	\N
133	V-10516275	ALVINO	BARRIOS	04167253195	0	JOEL_161999@HOTMAIL.COM	\N	\N	1	\N
134	V-24655595	ORIANA	DELGADILLO	04241416978	0	DELGADILLOORIANA@GMAIL.COM	\N	\N	1	\N
136	V-16618201	YORLI	RAMIREZ	04241707671	0	YORLYCAROLINA@GMAIL.COM	\N	\N	1	\N
137	V-19710831	JOSIRET	MARTINEZ	04241473296	0	JOSAMIRPRADA88@GMAIL.COM	\N	\N	1	\N
138	V-18529889	DAYANA	BASTIDAS	04162004102	0	DAYANA_BASTIDAS@HOTMAIL.COM	\N	\N	1	\N
139	V-20154960	SANDRA	BELLO 	04129346254	0	SAND.BELLO@GMAIL.COM	\N	\N	1	\N
88	V-5541862	MIRNA	GONZALEZ	04242303126	0	DOBIEN1960@GMAIL.COM	2019-10-18 00:00:00	2019-10-18 00:00:00	1	1960-12-01
77	V-11992694	EDUARDO	QUIROZ 	04123781473	0	eduardobeik@gmail.com	\N	2019-10-18 00:00:00	1	1973-11-10
117	V-13895400	AMBAR	MENA	04122016350	0	AMBAR.THEFACTIR@GMAIL.COM	\N	\N	1	1980-11-06
82	V-9477499	JESUS	PUENTES	04169348952	0	PUENTESJ@GMAIL.COM	2019-10-18 00:00:00	2019-10-18 00:00:00	1	1963-10-05
119	V-16871939	ROJAS	RENZO	04241071647	0	R_LOPEZ_V@HOTMAIL.COM	\N	\N	1	1985-09-07
135	V-15404979	DEINNYS	SANDOBAL	041296395109	0	DEINYS29@HOTMAIL.COM	\N	\N	1	1982-09-04
78	V-18889155	ELIMAR	PEREZ	04128189911	0	elimarperez1987@gmail.com	2019-10-18 00:00:00	2019-10-18 00:00:00	1	1987-09-01
100	V-10346183	CARMEN	BELLO	04141009707	0	bienaventurada77@hotmail.com	\N	2019-10-21 00:00:00	1	1967-07-03
103	V-10346343	Lisset	vergara	041602120132	0	isamois@hotmail.es	\N	2019-10-21 00:00:00	1	1970-06-05
90	V-18930351	DENNY	WILSON	02123527256	0	DENYWILSON70@GMAIL.COM	2019-10-18 00:00:00	2019-10-18 00:00:00	1	1989-05-10
113	V-22036537	YUSMARI	BASTIDAS	02124922865	0	MARITZAOLI0@GMAIL.COM	2019-10-21 00:00:00	2019-10-21 00:00:00	1	1988-03-08
98	V-9812723	MARIA ELENA	RODRIGUEZ	04126560692	0	MARIELP0308@GMAIL.COM	\N	2019-10-21 00:00:00	1	1968-03-08
95	V-13110003	YANETTE	RAMIREZ	04164156743	0	YANETTE_CORO@HOTMAIL.COM	2019-10-18 00:00:00	2019-10-18 00:00:00	1	1975-02-08
99	V-5529397	Cristina	Marvelia	04143659929	0	marvelia_1996@hotmail.com	\N	2019-10-21 00:00:00	1	1959-02-06
140	V-19966280	CELESTE	GAMBOA 	04241390864	0	CELESTEGAMBOA956@GMAIL.COM	\N	\N	1	\N
141	V-26967914	DOUGLEISY	COA	04242172158	0	SARITABALZA@GMAIL.COM	\N	\N	1	\N
142	V-24058347	GLEIDYS	MENDEZ	04263197426	0	GLEYDYSSSS@GMAIL.COM	\N	\N	1	\N
143	V-24883354	DAYANA	SALAS	04120232324	0	DAYANASALAS0404@GMAIL.COM	\N	\N	1	\N
144	V-17855202	DAYANA	CANO 	04265147313	0	DAYANACCANOMI987@GMAIL.COM	\N	\N	1	\N
145	V-24295373	ANDRES	ALVARADO	04244371673	0	ANDRESDANIELR@HOTMAIL.COM	\N	\N	1	\N
146	V-17116529	JOSE	GONZALEZ	041208807374	0	JOUSCOU_29@HOTMAIL.COM	\N	\N	1	\N
149	V-20229321	ELEAZAR	MENDOZA	04149189835	0	EMENDOZA@GMAIL.CON	\N	2019-10-22 00:00:00	1	\N
150	V-6420263	MEILI	NACACHE	04129927709	0	MNACACHE@HOTMAIL.COM	\N	2019-10-22 00:00:00	1	\N
151	V-6044719	OCTAVIANO	VELIZ	04143234989	0	LILIANA_NVELIZ@HOTMAIL.COM	\N	2019-10-22 00:00:00	1	\N
152	V-10110446	CARLOS	ABACHE	02128923773	0	CARLOSABACHE@GMAIL.COM	\N	2019-10-22 00:00:00	1	\N
153	V-7999399	BIAGIO	AVIGLIANO	0414154891	0	AVIAGIO@YAHOO.COM	\N	2019-10-22 00:00:00	1	\N
155	V-19373368	MIJARES	BASTIDAS	04242540052	0	FRANKJESUS181186@GMAIL.COM	\N	\N	1	\N
157	V-16952288	JORGE	ROMERO	04163115563	0	JORGEORIANAROMERO@GMAIL.COM 	\N	2019-10-22 00:00:00	1	\N
159	V-25219937	WILSON	VEITIA	04129528122	0	WILSONJ_VEITIAG@HOTMAIL.COM	\N	\N	1	\N
161	V-21117054	PHILLIPS	MANJARES	04126042093	0	PHILLIPSMANJARESSOS@GMAIL.COM	\N	\N	1	\N
162	V-6400296	RAQUEL	FERNANDEZ	04267166856	0	raqueldeflores@hotmail.com	\N	2019-10-22 00:00:00	1	\N
163	V-13952650	DAYIRA	BORROME	04128013590	0	DAYIRA16022012@GMAIL.COM	\N	\N	1	\N
164	V-10187615	JAVIER	SUAREZ	04241328500	0	JAVIERJUAREZ10187615@GMAIL.COM	\N	\N	1	\N
165	V-25939121	KELLIAM	OJEDA	04140416571	0	KIMBERLINXLA@GMAIL.OM	\N	\N	1	\N
166	V-12977168	DALYANA	RODRIGUEZ	04140237140	0	dalyana.@gmail.com	\N	2019-10-22 00:00:00	1	\N
167	V-20675074	YULEYSY	SANTRICH	04125744182	0	YULI160992@HOTMAIL.COM	\N	\N	1	\N
169	V-14291200	ALMELIS	RODRIGUEZ	04264010583	0	almelisrodriguez@gmail.com	\N	\N	1	\N
170	V-16263266	ROBERTH	DELGADO	04242689078	0	VPRD@HOTMAIL.COM	\N	2019-10-22 00:00:00	1	\N
171	V-15105579	YODELKIS	RODRIGUEZ	04242188746	0	YODELNAI065@GMAIL.COM	\N	2019-10-22 00:00:00	1	\N
172	V-9349189	MARY	PERNIA	04242497640	0	maryarellano@gmail.com	\N	2019-10-22 00:00:00	1	\N
174	V-19037515	BEATRIZ	ROMERO	04141092173	0	mayra.rb27@gmail.com	\N	2019-10-22 00:00:00	1	\N
175	V-19852004	DAYVALYN DEL CARMEN	GONZALEZ	04268218138	0	dayvlyn@hotmail.com	\N	\N	1	\N
176	V-17974424	BEIDIMAR	ZAMBRANO	02124310894	0	BEIDIMAR123@HOTMAIL.COM	\N	\N	1	\N
179	V-18441934	CHAILENE	YANEZ	04241409542	0	charlein7510@gmail.com	\N	\N	1	\N
180	V-18331977	YULIMAR	FERNANDEZ	04264085797	0	YULIMARFERNANDEZTORO@GMAIL.COM	\N	\N	1	\N
182	V-17443442	LUIS	TOVAR 	04267167138	0	luistovar699@gmail.com	\N	\N	1	\N
183	V-17618807	GINET	DOMINGUEZ	04141356386	0	Dominguezginet@yaboo.com.ve	\N	\N	1	\N
184	V-16115214	ALIM	VELEZ	04141319880	0	Gabalymo6o1@hotmail.com	\N	\N	1	\N
185	V-2474324	MARIA	MARTINEZ	04260357318	0	MJORGELIS@HOTMAIL.COM	\N	\N	1	\N
187	V-11690541	EDGAR	MOLINA	04242494827	0	CLAUDIA_MARYG@GMAIL.COM	\N	\N	1	\N
188	V-22021557	EDUARDO	ABREU	04165365721	0	eduardoabreub@gmail.com	\N	\N	1	\N
189	V-26908782	WILFREED	PEÑA 	04242958460	0	wilfreedgarcia07@gmail.com	\N	\N	1	\N
192	V-25482760	MICHEL	VALERO	04243745949	0	argenis_06apala@hotmail.com	\N	\N	1	\N
193	V-17563805	ISABEL	RONDON	04267140955	0	isbelRondon@hotmail.com	\N	\N	1	\N
194	V-6350672	YAJAIRA	BRITO	04242383390	0	landaetabrito@gmail.com	\N	\N	1	\N
195	V-6358518	YAJAIRA	BRITO 	04242383350	0	avintorcomunal@gmail.com	\N	\N	1	\N
196	V-18021344	desiree	chirinos	04129915077	0	desirre.das@hotmail.com	\N	\N	1	\N
197	V-17802649	DEIVIS	MATOS	04242004926	0	YONAIDIMONTAÑO10@GMAIL.COM	\N	\N	1	\N
198	V-6670943	MARIA	GIL	04143224201	0	mariarosahazael@gmail.com	\N	\N	1	\N
199	V-17146818	MILENY	GUERRERO	04163100197	0	carolinag123@gmail.com	\N	\N	1	\N
200	V-7269453	JOSE	MAYORGA	04121362089	0	jlms_04@hotmail.com	\N	\N	1	\N
201	V-18314559	YILEHTZI	LUCENA	04242246654	0	yilelluce@gmail.com	\N	\N	1	1988-10-03
96	V-12484229	FABIOLA	GARCIA	02124514242	0	GFABIOLA@GMAIL.COM	2019-10-18 00:00:00	2019-10-18 00:00:00	1	1976-12-10
147	V-19767690	KIMBERLIN	VALERA	04142127758	0	KIMBERLINXLA@GMAIL.OM	\N	\N	1	1988-11-03
181	V-9462324	CARMEN	GUTIERREZ	04122029867	0	carmenguti1103@gmail.com	\N	\N	1	1969-11-03
186	V-17490981	LUISELA	APARICIO	04140102672	0	LUISELAC@HOTMAIL.COM	\N	\N	1	1985-10-04
156	V-17268191	LUIS	GUERRERO	04167108802	0	JULIOGUERRERO2689@GMAIL.COM	\N	2019-10-22 00:00:00	1	1983-10-02
191	V-9413780	MARIA	PEREZ	04149192919	0	MARIAPEREZ123@GMAIL.COM	\N	2019-10-22 00:00:00	1	1968-09-01
190	V-17801717	MARIA	GUZMAN	04160336327	0	MARIO_LG@HOTMAIL.COM	\N	2019-10-22 00:00:00	1	1987-08-03
148	V-18109146	ADEL	GONZALEZ	04126050110	0	ADEL_JOSE@HOTMAIL.COM	\N	2019-10-22 00:00:00	1	1987-07-10
173	V-11921000	CARLOS	FERNANDEZ	02126727402	0	GALAXIA_GROUP@YAHOO.COM	\N	2019-10-22 00:00:00	1	1971-06-06
168	V-18222899	BLANCO	ROMERO	04242962922	0	JULIO.187@GMAIL.COM	\N	\N	1	1987-05-04
178	V-6244949	ANA	MORA	04164230490	0	anamoracastro2@gmail.com	\N	\N	1	1963-02-01
154	V-11146377	MIGDALIA	GONZALEZ	04167246018	0	MIGDAGONZ@GMAIL.COM	\N	2019-10-22 00:00:00	1	1970-01-10
160	V-15820503	JOSE	GANCHOZO	0414024387	0	JOSEGANCHOZO99@GMAIL.COM	\N	\N	1	1982-01-09
177	V-10821111	MILEIDA	LABRADOR	04143702062	0	enriquelabrador@hotmail.com	\N	\N	1	1972-01-01
202	V-10879382	FRANCISCA	VILLARROEL	02125612014	0	francysvv1972@gmail.com	\N	2019-10-22 00:00:00	1	\N
203	V-18485676	Yeisel	RODRIGUEZ	041262361005	0	yeirrodriguez_02@gmail.com	\N	\N	1	1988-08-02
204	V-17974731	KEILY	ZAMBRANO	04242285359	0	KEILYZAT@HOTMAIL.COM	\N	\N	1	1988-01-28
205	V-11954618	CESAR	LARA 	04264042078	0	CESAR.LARA3000@GMAIL.COM	\N	\N	1	1977-09-27
206	V-14954618	CESAR	LARA	04264042078	0	CESAR.LARA3000@GMAIL.COM	\N	\N	1	1977-09-27
207	V-11951338	YOSTON	RIVAS 	04120295266	0	yosari@hotmail.com	\N	\N	1	1974-05-19
208	V-17779924	TOMAS ENRIQUE	AMUNDARAIN	04143160172	0	yajairacasa.cs35@gmail.com	\N	\N	1	1982-12-24
209	V-14036940	OSCAR	GONZALEZ	04242706892	0	oscar.gonzalez@hotmail.con	\N	\N	1	1980-01-01
210	V-999	q	q	1	0	q@q.com	\N	\N	17	2019-10-02
211	V-10692135	MARIA G	BLANCO CARRILLO	04168174958	0	maria.blanco.1@hotmail.com	\N	\N	1	1970-03-10
158	V-17120219	NOHELIA	ESPINOZA	04142461800	0	NOHELIAESPINOZA@GMAIL.COM	\N	\N	1	\N
212	V-6005227	OMAR	LEON	04168379400	0	OMARLEON19602@GMAIL.COM	\N	\N	19	1960-07-28
213	V-16537958	MARIOXI	SEGOVIA 	04129072535	0	MARIOXISEGOVIA@GMAIL.COM	\N	\N	19	1983-06-26
214	V-26064658	DAYERLIN	CHACON	04120213027	0	DAYERLING5@GMAIL.COM	\N	\N	19	1997-09-13
215	V-26740546	FREDDY	CASTRO 	04242133321	0	FREDDYJAVIERCE@HOTMAIL.COM	\N	\N	19	1999-02-23
216	V-17675933	GONZALEZ	IRENE 	04142398530	0	IGONZALEZ695@GMAIL.COM	\N	\N	19	1987-03-25
217	V-19513672	FRANCYS	MUNOZ	04242501425	0	FRANCYS.VANEZOO7@GMAIL.COM	\N	\N	19	1988-05-08
218	V-24277800	ROSA	OCHOA 	04129090005	0	rosa.ochoa.12@gmail.com	\N	\N	19	1995-03-14
219	V-19378797	yeraldin	cardozo	04129505530	0	cardozoyeraldin04@gmail.com	\N	\N	19	1989-12-22
220	V-18190256	YENIRE	GIL 	04263205893	0	JPIEROSANTELLA32@GMAIL.COM	\N	\N	19	1987-08-21
221	V-22036878	DOUGLAS	OROPEZA	04127201002	0	DOUGLASOROPEZA0394@GMAIL.COM	\N	\N	19	1994-03-08
222	V-14203264	NOMAN JAVIER	CASTILLO	04125875097	0	NOMAR.CASTILLO@HOTMAIL.COM	\N	\N	19	1979-07-15
223	V-14728401	JESUS	PEREZ	04242747493	0	JESUS_PEREZ24@HOTMAIL.COM	\N	\N	19	1981-05-24
224	V-19508270	DAVID	ANTHONY	04262203996	0	ANTHONY1990_28@HOTMAIL.COM	\N	\N	19	1990-12-28
225	V-14535798	YOHEMI	ABARCA 	04268170617	0	MELANIEALIENDOZZZ8@GMAIL.COM	\N	\N	19	1979-09-23
226	V-18932677	ANDREINA	ARAUJO	04141565214	0	HANDREYNA23@GMAIL.COM	\N	\N	19	1989-05-23
227	V-10828147	MARIA	IBARRA	04122569795	0	CALOPAVAKE1@HOTMAIL.COM	\N	\N	19	1973-03-31
228	V-19291614	JERMAINE	JIMENEZ	04123981668	0	JIMENEZJER18@GMAIL.COM	\N	\N	19	1988-05-26
229	V-15761264	ALEXANDER	BRITO 	04261124710	0	KINGBRITO312702@GMAIL.COM	\N	\N	19	1980-11-07
230	V-10904810	CONTRERAS	MOLINA 	04241126153	0	ELIGIOMOLINA1974@HOTMAIL.COM	\N	\N	19	1974-10-02
260	V-10511134	TIBISAY	LONGA	04242019069	0	TIBY_SAY2010@HOTMAIL.COM	\N	\N	1	1968-10-30
261	V-13395269	MARIA	NIEVES	04142567615	0	GRISMARNIEVES2611@GMAIL.COM	\N	\N	1	1979-10-27
262	V-9455026	BERTA	DIAZ 	04120250546	0	YUSTEZZ_1185@HOTMAIL.COM	\N	\N	1	1964-09-17
232	V-11171503	JACKELINE	CHACARE	04242689991	0	JANKEILISJOSELYN@GMAIL.COM	\N	\N	19	1970-08-24
233	V-21759535	DIANA	TERAN	04241193021	0	DIANATERAN-1993@HOTMAIL.COM	\N	\N	19	1993-10-14
234	V-16827867	RAFAEL	MAGO	04242746976	0	RAFAELMAGO61@GMAIL.COM	\N	\N	19	1982-09-30
263	V-15324851	FANNY	SILVA	04141523394	0	SILVAFANNY19@HOTMAIL.COM	\N	\N	1	1981-08-19
264	V-14650316	ZUYEN	PEREZ	04261152293	0	ZUYENEPEREZ316@GMAIL.COM	\N	\N	1	1979-05-08
265	V-6693427	ELSA	BARRIOS	04241874427	0	ELSAFLAGH69JB@GMAIL.COM	\N	\N	1	1969-11-28
235	V-11444240	CARMEN	PALMA	04166298381	0	PGCARMEN_73@HOTMAIL.COM	\N	\N	19	1973-04-02
236	V-26483068	ANDER	DURAN 	04242268561	0	duranander18@gmail.com	\N	\N	19	1997-05-16
237	V-25347188	LUIS	COLINA	04149057532	0	LUIS_COLINA18@HOTMAIL.COM	\N	\N	19	1996-01-02
238	V-19465952	DANNUY	HERRERRA	04243609535	0	DANNUYHERRERA@GMAIL.COM	\N	\N	19	1991-02-28
239	V-7947676	YULMA	ARELLANO	04242711417	0	YULMARARELL1ANO@GMAIL.COM	\N	\N	19	1974-10-28
266	V-11990326	ERIKA	GUERRERO 	04142709332	0	ERIKAGUERERRO@GMAIL.COM	\N	\N	1	1972-09-11
241	V-17453895	IRMA	RODRIGUEZ	04143280711	0	YRMARODRIGUEZ06@GMAIL.COM	\N	\N	1	1985-05-20
242	V-12961201	PETRA	MONTANO 	04266102375	0	MONTANOPETRA71@GMAIL.COM	\N	\N	1	1971-10-02
243	V-26574367	LUIS	VASQUEZ	04162182049	0	LUISALBERTOVASQUEZ1997@HOTMAIL.COM	\N	\N	1	1997-01-09
244	V-22907005	ELSYS	GONZALEZ	04123725143	0	ELSYSBETANCOURT2014@GMAIL.COM	\N	\N	1	1993-06-16
245	V-25516753	MICHAEL	PEDROZA	04160110623	0	michael.douglas3096@gmail.com	\N	\N	1	1996-11-30
246	V-13049501	EGLEE	SANCHEZ	04241762814	0	EGLECAROLINA14@HOTMAIL.COM	\N	\N	1	1979-11-14
247	V-22536424	MARIA	MERCADO	04149016049	0	MERCADOMARIA31716@GMAIL.COM	\N	\N	1	1992-05-21
248	V-13993925	OMILSA	PERDOMO	04260362525	0	OMILSAPERDOMO@HOTMAIL.COM	\N	\N	1	1979-09-11
249	V-20028535	YANINA	PALACIOS 	04241432841	0	PALACIOSYANINANA2802@GMAIL.COM	\N	\N	1	1990-02-28
231	V-25624627	CORALIS	URRUETA	04169203665	0	coralis12@gmail.com	\N	\N	1	\N
250	V-13405592	NAYCI	VILLANUEVA	04141086490	0	NAICYMARGARETE@HOTMAIL.COM	\N	\N	1	1977-04-24
251	V-27294656	LUNA	VITAL	04141025057	0	dlunasport1999c.a@hotmail.com	\N	\N	1	1999-01-28
252	V-6263351	DAYSA	FLORES	04141025057	0	dlunasport1999c.a@hotmail.com	\N	\N	1	1963-07-22
253	V-15714753	DESIREE	MONTILVA	04242383350	0	landaetabrito@gmail.com	\N	\N	1	1981-07-01
255	V-11560872	WILLIAM	MONTEROLA	04241592278	0	123.MONTEROLA123@GMAIL.COM	\N	\N	1	1973-02-11
256	V-18003971	YOMAIRA	SOSA	04120141084	0	yomaira594@hotmail.com	\N	\N	1	1986-12-22
257	V-17947914	ELVIA	CHIRINOS	04126036204	0	ELYMAR@GMAIL.COM	\N	\N	1	1985-07-27
258	V-16432278	MANUEL	CHACON	04242218368	0	manuelchacon708@hotmail.com	\N	\N	1	1982-04-28
259	V-12827725	CAROLINA	ECHEZURIA	04127144183	0	ORIANABUITRAGO.18@GMAIL.COM	\N	\N	1	1971-12-27
267	V-16604231	YOHANDY	ROJAS	04143709678	0	victormcaminito@gmail.com	\N	\N	1	1983-07-13
268	V-17962532	JOHANNA	SOLIS	04241722102	0	JSOLIS18@HOTMAIL.COM	\N	\N	1	1984-10-18
270	V-10497612	MARIA	GUZMAN 	04162114170	0	MARIAGUZMAN45@HOTMAIL.COM	\N	\N	1	1968-03-30
271	V-6390672	ISABEL	BRITO	04242383350	0	landaetabrito@gmail.com	\N	\N	1	1959-01-08
272	V-10113261	ROSARIO	LOPEZ 	04242684658	0	ALYULUIS89@YAHOO.CS	\N	\N	1	1966-11-07
273	V-6216307	ALICIA	TORRES 	04167024279	0	anastaciamargorie1964@hotmail.com	\N	\N	19	1964-09-19
274	V-14225270	YORMARY	VERGARA 	04125413244	0	YORMARYVERGARA@HOTMAIL.COM	\N	\N	19	1978-03-04
275	V-25740460	MARIA	OCHOA	04120116615	0	MARIAVALENTINA27@GMAIL.COM	\N	\N	19	1997-02-27
276	V-10691280	MARIA	ABREU	04129630404	0	carlosgarabano2@gmail.com	\N	\N	19	1966-08-06
277	V-28014813	ANTHONY	CEDENO	04242338223	0	YUDITHBLANCO2009@HOTMAIL.COM	\N	\N	19	1999-12-08
278	V-11930566	GILBERTO	PEREIRA	04166318720	0	OPTICASANMARINO@HOTMAIL.COM	\N	\N	19	1972-10-24
279	V-14965416	EMIYALITH	CORREA	04123340830	0	CEERCC28@HOTMAIL.COM	\N	\N	19	1981-05-28
280	E-81663838	BRINEZ	TRIVINO	04122944517	0	OSCARTRIVIÑO@GMAIL.COM	\N	\N	19	1956-03-27
281	V-12361078	JUAN	CAMACHO	04261196909	0	JCAMACHOMELENDEZ@HOTMAIL.COM	\N	\N	19	1967-03-17
282	V-13126320	EDUARDO	NADALES O	04143061642	0	EDUARDONADALES@YAHOO.ES	\N	\N	19	1976-08-19
283	V-23200890	CEDENO	SERRANO	04241204845	0	LUISARODRIGUEZ69@GMAIL.COM	\N	\N	19	1993-09-17
284	V-17076336	WILLIE	PEREZ V	04242514278	0	WPARGENISVELASCO1984@GMAIL.COM	\N	\N	19	1985-11-25
285	V-6510746	YETZI	RAMIREZ 	04142353597	0	YETZIRAMIREZ2015@GMAIL.COM	\N	\N	19	1967-06-01
286	V-18002367	SCARLA	SEIJAS	04241041873	0	SCARLA.ELI.SEIJAS@GMAIL.COM	\N	\N	19	1987-05-19
287	V-12056884	MARYURI M	BLANCO N	04123703605	0	MARYURIBLANCO17@GMAIL.COM	\N	\N	1	1974-07-24
288	V-13171083	JESUS	ESCALANTE	04169011189	0	JESUSESCALANTE69@HOTMAIL.COM	\N	\N	1	1977-10-15
289	V-11935110	GUSTAVO	ALTUVE	04129597885	0	SOMBRAZOZO@GMAIL.COM	\N	\N	1	1973-11-22
290	V-15378808	KAREN	FRANCO	04129913305	0	karen.karolona.franco@gmail.com	\N	\N	1	1982-11-25
291	V-25530255	CINDY	PINERO	04126104162	0	CINDYMARIA_20@HOTMAIL.COM	\N	\N	1	1997-06-14
292	V-21134293	LUIS	HERNANDEZ	04241066010	0	LUIS.YORAKU@GMAIL.COM	\N	\N	1	1993-11-10
293	V-27954241	YULIAN	RODRIGUEZ	04129842485	0	YULIANJ68@GMAIL.COM	\N	\N	1	2000-07-10
294	V-6229771	ARGENIS	ELORZA	0414005631	0	ARGEMARI701@HOTMAIL.COM	\N	\N	1	1964-05-21
295	V-12470276	YENNY	MERENTES	04142765485	0	yennymerentes@hotmail.com	\N	\N	1	1973-03-20
296	V-12824265	MARIA	MEDINA	04167047922	0	MARIAMARLENYMEDINA@GMAIL.COM	\N	\N	1	1977-06-12
297	V-14276385	BERNIES	POVEDA	04242620582	0	BERNISPO@GMAIL.COM	\N	\N	1	1979-03-16
298	V-18369098	MAYERLI	ZUNIGA 	04140327883	0	ANICAELV@GMAIL.COM	\N	\N	1	1986-02-21
299	V-18840819	MIGUEL	SILVA	04141305792	0	SILVAMIGUEL124@HOTMAIL.COM	\N	\N	19	1985-11-26
300	V-5977404	YADIRA	MURO	04241815396	0	YADIRAMURO23@GMAIL.COM	\N	\N	19	1961-11-23
301	V-15198301	JORGE	VERGARA	04241362955	0	JLVCI27@GMAIL.COM	\N	\N	19	1981-10-27
303	V-5528846	DANIEL	URBINA	04242755812	0	YENISARRIOJA@GMAIL.COM	\N	\N	19	1976-03-06
304	V-26774772	MARIA	GUERRERO	04242753267	0	MARIA.DGC01@GMAIL.COM	\N	\N	19	\N
305	V-21103328	YORDI	PAREDES	04242759974	0	YORDY_PAREDES@OUTTLOOK.COM	\N	\N	19	1993-05-17
306	V-22382594	GERALDINE	BERDUGO	0416097254	0	GERABR_94@HOTMAIL.COM	\N	\N	19	1994-01-05
307	V-6956862	CRUZ	TOLEDO 	04264888343	0	cruztoledoh@hotmail.com	\N	\N	19	1968-04-16
308	V-26063597	MAIKEL	REINA	04268186275	0	MAIKEL200983@HOTMAIL.COM	\N	\N	19	1997-01-13
309	V-22032491	ANTHONY	DIAZ	04125480021	0	ANTHONNY.JOSE@HOTMAIL.COM	\N	\N	19	1994-05-18
310	V-17286121	LISMAR	AGUILAR	04243390112	0	BRILLIEAGUILAR32@YAHOO.COM	\N	\N	19	1986-09-11
311	V-24420581	ANA	GUAINA	04243624469	0	ANA_TERESA_238@HOTMAIL.COM	\N	\N	19	1996-06-17
312	V-20221605	JENNIFER	HERRERA	042693191443	0	JENNIFER_3223@hotmail.com	\N	\N	19	1992-12-22
313	V-16599578	JOGUER	JIMENEZ	04242697919	0	JOGUER27@GMAIL.COM	\N	\N	19	1984-07-27
314	V-13233467	JAIRO	PENA	04169391660	0	PENAJAIRO2014@GMAIL.COM	\N	\N	19	\N
315	V-15787694	HECTOR	ESPINOZA 	04127114684	0	HECTORESPINOZA@HOTMAIL.COM	\N	\N	19	\N
316	V-16473590	JEMMY	URBANO	04242364609	0	JEMMY280385@GMAIL.COM	\N	\N	19	\N
318	V-15420624	DAVID	ESPINOZA	04167274702	0	DAVIDESPINOZA063@GMAIL.COM	\N	\N	19	\N
319	V-9052328	CESAR	RAMIREZ 	04242879508	0	RAMIREZ_CESAR101@HOTMAIL.COM	\N	\N	19	\N
320	V-10092300	LEONARDO	JIMENEZ	04242213670	0	DAVIDGRIS@HOTMAIL.COM	\N	\N	19	\N
322	V-5858454	GUILLERMO	ROJAS	5858454	0	GR7335799@GMAIL.COM	\N	\N	19	\N
323	V-10310119	FREDDY	SEGOVIA	04263303051	0	SEGOVIAFREDDY02@GMAIL.COM	\N	\N	19	\N
325	V-10106578	JAIRO	RAMIREZ	04162139003	0	JAREZ23@HOTMAIL.COM	\N	\N	19	\N
326	V-5905127	TAISON	ALCALA	04141504361	0	TAISON.BRAYAN@GMAIL.COM	\N	\N	19	\N
328	V-14992490	RONALD	FRAGA	04142670225	0	RONALDFRAGA082@GMAIL.COM	\N	\N	19	1981-05-01
329	V-6326375	JUDITH	ESPINOZA	04242915188	0	NAZARETHHANTILLANO@GMAIL.COM	\N	\N	19	1966-05-30
330	V-25253599	YURIMAR	CEBALLOS	04126397596	0	YACM29@GMAIL.COM	\N	\N	19	1994-12-29
331	V-12093831	MARYORIE	MEDINA	04126397596	0	YACM29@GMAIL.COM	\N	\N	19	1974-10-07
332	V-17390212	JOSE	GOMEZ	04261152484	0	JOSEG1011@YAHOO.COM	\N	\N	19	1984-11-10
333	V-9410657	RAMON	BRITO	04143265157	0	MARCOSBRITO08@HOTMAIL.COM	\N	\N	19	1964-09-16
334	V-12562079	JORGE	SANCHEZ	04241222855	0	yelissierra@hotmail.com	\N	\N	19	1972-10-19
335	V-26951977	KIMBERLY	GONZALEZ	04143883839	0	KIMDANIELA30@GMAIL.COM	\N	\N	19	1999-09-30
336	V-16176437	YSBELYS	HERRERA	04242057246	0	ISBELISHERRERA@HOTMAIL.COM	\N	\N	19	1982-07-18
337	V-20308346	KIMBERLIN	CONCEPCION	042417296487	0	CARACAS92@LIVE.COM	\N	\N	19	1992-04-06
338	V-18485472	JONATHAN	GONZALEZ	04248771150	0	JONATHAN0237@HOTMAIL.COM	\N	\N	19	1987-12-30
339	V-24206116	NAZARETH	ANTILLANO	04242915188	0	NAZARETHANTILLANO@GMAIL.COM	\N	\N	19	1995-12-02
340	V-19266819	MIGUEL	PEREZ	04142253895	0	PEREZLUIS123@GMAIL.COM	\N	\N	19	1989-10-13
341	V-6682785	NELLY	HERRERA	04127125859	0	NELLYHERRERAGUZMAN@GMAIL.COM	\N	\N	19	1972-02-15
342	V-11312723	PEDRO	HERRERA	04127163453	0	YCRA37@HOTMAIL.COM	\N	\N	19	1974-11-18
343	V-4163051	RAUL	IRALA	04143895541	0	RAULIRALA@HOTMAIL.COM	\N	\N	19	1953-05-27
344	V-17709389	NAYROBI	IZAGUIRRE	04141273160	0	NAIROBIZA@HOTMAIL.COM	\N	\N	19	1985-12-29
345	V-22280918	DAYANA	MONTIEL	04243271656	0	DAYANAMONTIEL89@HOTMAIL.COM	\N	\N	19	1989-12-26
346	V-9860452	IVON	VICUNA	04167194124	0	YVONVICUNA@GMAIL.COM	\N	\N	19	1968-11-12
347	V-6190203	JUAN	MUJICA	04123958394	0	JUANMUJICA65@GMAIL.COM	\N	\N	19	1965-04-24
348	V-5313082	XIOMARA	ISTURIZ	04265106355	0	XIOMARA.ISTURIZ1969@GMAIL.COM	\N	\N	19	1961-05-10
349	V-10625232	ALCIRA	MEDINA	04212364971	0	DANIELAVILLA25@HOTMAIL.COM	\N	\N	19	1970-07-16
350	V-20175280	ANYIMAR	SIVIRA 	04261141844	0	DAURISOFIA22@GMAIL.COM	\N	\N	19	1989-12-31
351	V-11562494	CANDIDA	GONZALEZ	04241085960	0	JESUSJIMENEZ50@HOTMAIL.COM	\N	\N	19	1971-06-13
302	V-15838795	EVELYN	URBINA	04242620582	0	URBINA_EVELYN_UNEFA@YAHOO.ES	\N	\N	19	1983-11-29
352	V-11471627	YENNY	UZCANGA	04123765333	0	JOSBEL.UZCANGA@HOTMAIL.COM	\N	\N	19	1973-05-26
353	E-83078198	JOSE	ORTIZ	04168253154	0	YARINYESY@HOTMAIL.COM	\N	\N	19	1999-09-29
354	V-6827391	AURISTELA	LEON	04264159865	0	MISCINCONUNIS@GMAIL.COM	\N	\N	19	1965-01-09
324	V-9159117	ANTONIO	SERRANO	04162231266	0	ANTONIOJOSESERRANO672@GMAIL.COM	\N	\N	23	\N
355	V-6340438	ROSA	MUJICA	04241579334	0	KARELIN_DANIEL_J@HOTMAIL.COM	\N	\N	19	1969-08-30
356	V-14130645	LUZ	LOPEZ	04142735316	0	LUZ5560@GMAIL.COM	\N	\N	19	1977-04-04
357	V-26104484	KIMBERLY	VALENCIA	04142644589	0	LUZ5560@GMAIL.COM	\N	\N	19	1997-08-29
358	V-16663948	MARVIN	MARINO 	04143694524	0	KIMBERLYVALENCIA36@GMAIL.COM	\N	\N	19	1982-09-11
359	V-24331665	KEILA	SUBERO	04241579334	0	KEILAR.SUBEROMUJICA@GMAIL.COM	\N	\N	19	1994-07-08
360	V-13841927	JHONNY	MORALES	04168157601	0	JHONNY_MORALES13@HOTMAIL.COM	\N	\N	19	1979-09-28
361	V-17142304	INES	HERRERA	04127407990	0	INESHERRERA1984@GMAIL.COM	\N	\N	19	1984-01-10
362	V-10628732	YOEL	FERNNADEZ	04163060546	0	JOELFERNNADEZ@GMAIL.COM	\N	\N	19	\N
363	V-12123075	BIVANYS	TIRADO	04242692337	0	DORIS.TIRADO@GMAIL.COM	\N	\N	19	1977-09-30
364	V-24883228	DORIAN	LIZRAZO 	0412716621	0	DORISLIZARAZO11@GMAIL.COM	\N	\N	19	1973-04-11
365	V-14334418	HERNAN	PERDOMO	04242772934	0	HERNANPERDOMO524@HOTMAIL.COM	\N	\N	19	1977-01-01
366	V-18829455	ANDRI	YANEZ	04125542338	0	ANDRICAROLINAYANEZ@GMAIL.COM	\N	\N	19	1988-10-03
367	V-22444405	GUSTAVO	HERRERA	04242298903	0	GUSTAVO.OCHUN@HOTMAIL.COM	\N	\N	19	1984-04-14
368	V-16085907	NORA	BIERNA	04143665831	0	NORAVIERMAL23@GMAIL.COM	\N	\N	19	1979-07-12
369	V-6454518	ODRIS DEL CARMEN	MURO	04129516557	0	YOTZY73@GMAIL.COM	\N	\N	19	1967-10-25
370	V-19201091	LISBETH	RAMOS	04263997368	0	LISBETHRAMOS@GMAIL.COM	\N	\N	19	1986-09-19
371	V-6392554	UBILERMA	ANGULO	04168000021	0	OBILERMAANGULO@GMAIL.COM	\N	\N	19	1962-01-16
372	V-22355101	ANGELICA	ARAY	04162108020	0	ELFLACO1989.2208@GMAIL.COM	\N	\N	19	1990-11-11
373	V-6708455	NINOSKA	ZAPATA	042680687615	0	ZROLANDO99@GMAIL.COM	\N	\N	19	1966-11-08
374	V-10632021	JHONNY	MONTILLA	04269153277	0	ENRIQUEMONTILLA1969@GMAIL.COM	\N	\N	19	1971-01-14
375	V-16670300	LUIS	REYES	04168027635	0	LUISGUILLERMOREYES@OUTLOOK.COM	\N	\N	19	1984-09-19
376	V-15166658	MILANGEL	SANCHEZ	04127271884	0	MILAGNELLSANCHEZ@GMAIL.COM	\N	\N	19	1981-02-05
377	V-14046439	ESERBICa	GOMEZ 	04241201953	0	ESIRBICAM@GMAIL.COM	\N	\N	19	1979-06-15
378	V-4578591	JAIME	ALDANA	04241386617	0	ANAYUMARY_30@HOTMAIL.COM	\N	\N	19	1957-10-21
379	V-20870443	YONELVIS	VILLANUEVA	04263931849	0	YANELVISELISA@GMAIL.COM	\N	\N	19	1988-06-05
380	V-14791126	DEYSI	QUINTERO	04141567498	0	WILKERU2009@HOTMAIL.COM	\N	\N	19	1981-03-23
381	V-22900373	MARTHA	MARTINEZ	04242477035	0	MARTHAMARTINEZ@GMAIL.COM	\N	\N	19	1969-08-08
382	V-14789353	MARITZA	OLIVARES	04149134055	0	MARITZAOLI0@GMAIL.COM	\N	\N	19	1979-03-27
383	V-14720470	AURA	FIGUEROA 	04129637070	0	AURAFIGUEROA160@GMAIL.COM	\N	\N	19	1980-06-16
384	V-18357374	anny	LOPEZ	04241796759	0	annylopez244@gmail.com	\N	\N	19	\N
385	V-3159505	miriam	marin	04160132556	0	miriammarin1947@gmail.com	\N	\N	19	\N
386	V-16543100	SCARLA	BARROS	04164767333	0	NATIBERTH@HOTMAIL.COM	\N	\N	19	1984-10-20
387	V-24275860	CIBELES	LOZANO	04242674852	0	CIBELOLOZANO@GMAIL.COM	\N	\N	19	1994-11-20
388	V-14385183	ANAIS	VILLEGAS	04241345469	0	VILLEGASANAIS35@GMAIL.COM	\N	\N	19	1980-03-02
389	V-14745562	MARISOL	MAIZ	04242279287	0	DAYERLING.URIEPERO@GMAIL.COM	\N	\N	19	1971-06-24
390	V-18111804	YSBERLI	VASQUEZ	04141807500	0	YSBERLI@GMAIL.COM	\N	\N	19	1989-05-01
391	V-5594338	ASCENCIO	GONZALEZ	04122358486	0	TITOGON35@GMAIL.COM	\N	\N	19	1956-10-06
392	V-7929274	CANALES	LUIS 	04143023775	0	LUISCANALES2111@HOTMAIL.COM	\N	\N	19	1966-11-08
393	V-21174944	JESUS	SALAZAR	04149029917	0	YSBERLI@GMAIL.COM	\N	\N	19	1992-03-05
394	V-23618807	MARIA	FERNANDEZ	04241613571	0	MARIADESIREEFERNANDEZ24@GMAIL.COM	\N	\N	19	1994-10-24
395	V-15757466	VICCELIA	MEZA	04143134045	0	VICKYMEZAO981@GMAIL.COM	\N	\N	19	1981-09-24
396	V-13458460	BETZABETH	EVANS	04122447877	0	EVANSBETZABETH1@GMAIL.COM	\N	\N	19	1979-04-21
397	V-6849923	JULIO	BURGUILLOS	04241708592	0	BURGUILLOSLOPEZ@GMAIL.COM	\N	\N	19	1988-05-15
398	V-5635672	EDECIO	BAZARASARTE	04142859524	0	EDECIOBARAZARTE@HOTMAIL.COM	\N	\N	19	1960-04-08
399	V-12411215	OMELIA	ABREU	04242078353	0	OMELY@GMAIL.COM	\N	\N	19	1974-10-21
400	V-14194094	HENRY	MEDINA	04122950494	0	SOLID19203@HOTMAIL.COM	\N	\N	19	\N
401	V-6509317	NELSON	DA COSTA	04142503447	0	NELSON.DACOSTA@FARMATODO	\N	\N	19	\N
402	V-15890821	VICTOR	GONZALEZ	04242545375	0	VICTORVIDALGONZALEZVCG@HOTMAIL.COM	\N	\N	19	\N
403	V-18094232	JEINIE	MENESES	04242579197	0	JEIMENESES@HOTMAIL.COM	\N	\N	19	1989-02-04
404	V-19105862	YOHANNA	ADAN	04242856859	0	YOHANNADAMS@HOTMAIL.COM	\N	\N	19	1984-06-30
405	V-10793853	ARGENIS	CALZADILLA	04167395172	0	calzadillaargenis@gmail.com	\N	\N	19	1970-02-20
406	V-10383010	JOSE	JIMENEZ	04241825236	0	JOSELUISJ29157535@GMAIL.COM	\N	\N	19	1970-03-11
407	V-15161907	YULIMAR	LABRADOR	04142562579	0	YULIMARBELLALABRADOR@GMAIL.COM	\N	\N	19	1982-06-10
408	V-6116798	JUAN	TERRASI	04242273560	0	GILMAFLOREZ54@GMAIL.COM	\N	\N	19	1962-08-02
409	V-19354762	MARIA	INTRIAGO	04260357899	0	MALEIIH.6@GMAIL.COM	\N	\N	19	\N
410	V-6929641	GOMEZ	DONAIRE	04241095012	0	DONAIREANA@HOTMAIL.COM	\N	\N	19	1966-09-29
411	V-17118257	EKATERINA	CARRILLO 	04242112173	0	CEKATHERINA@GMAIL.COM	\N	\N	19	1985-01-23
412	V-19634868	ANTHONY	CARRILLO	04242827456	0	VIANCAATHONELA13@GMAIL.COM	\N	\N	19	1989-12-21
413	V-9156953	OMAR	VILLA	04241312175	0	OMARVILLA@GMAIL.COM	\N	\N	19	1962-11-26
414	V-6451292	DOMIAN	CONTRERAS	04143663185	0	DOMIANCONTRERAS@GMAIL.COM	\N	\N	19	1966-04-22
415	V-4083890	LUISA	URQUIOLA	04167103705	0	MORELLAGOMEZ@GMAIL.COM	\N	\N	19	\N
416	V-11486966	CECILIA	GUERRERO	04142486423	0	KATIUSKA27GUERRERO@GMAIL.COM	\N	\N	19	\N
417	V-18521872	WILNIURKA	GRAFFE	04143397446	0	WILNIURKA@GMAIL.COM	\N	\N	19	\N
418	V-12295246	GLADYS	PEREIRA	04129110637	0	GLADYS0704@HOTMAIL.COM	\N	\N	19	\N
419	V-16004696	GEISY	FLORES	04123985403	0	FLORESGEISY@GMAIL.COM	\N	\N	19	1983-12-15
420	V-11487648	NORKA	VELIZ 	04127019188	0	NORKADUARTE@GMAIL.COM	\N	\N	19	\N
421	V-17144850	JOHANNA	GOUVEIA	04261118873	0	JOHAGOUVEIA08@GMAIL.COM	\N	\N	19	1986-08-31
422	V-17720856	ERICKA	DIAZ	04129077352	0	GARRIDOHAROLD@GMAIL.COM	\N	\N	19	1986-12-02
423	V-26861580	YERSILA	MOROCAIMA	04129936810	0	MOROCAIMAYERSILA@GMAIL.COM	\N	\N	19	1989-11-11
424	V-16034547	MAILOLY	LAFFONT	04128286760	0	MDALVLM@GMAIL.COM	\N	\N	19	1974-03-10
425	V-12483265	MAILOLY DEL VALLE	LAFFONT	12483265	0	MEDLULM@GMAIL.COM	\N	\N	19	1974-03-10
426	V-20594129	EMILEIDYS	ZONILLA	04142216399	0	EMILIAYANES_01@HOTMAIL.COM	\N	\N	19	1992-12-30
427	V-27916524	CRISTHOPER	CISMALLA	04141007900	0	belkisrodriguez123@gmail.com	\N	\N	19	2000-12-28
428	V-14019236	BELKIS	RODRIGUEZ 	04141007900	0	BELKISRODRIGUEZ123@GMAIL.COM	\N	\N	19	1977-10-02
429	V-20616256	MAIRET	RIVERO	04242840704	0	MILANRIVERO1603@GMAIL.COM	\N	\N	19	1993-03-16
430	V-19203384	DELIA	GUEVARA	0414075990	0	DELIAGUEVARA89@GMAIL.COM	\N	\N	19	1989-01-26
431	V-5580233	MARITZA	MOLINA	04141075990	0	DELIAGUEVARA89@GMAIL.COM	\N	\N	19	1957-02-13
432	V-25866444	RISYORLEY	GARCIA	04142344116	0	RISYORLEYGARCIA.17@GMAIL.COM	\N	\N	19	1996-01-26
433	V-8394092	LUZMILA	LOPEZ	04261988358	0	LUZMILADECASTRO9@GMAIL.COM	\N	\N	19	\N
434	V-19163823	SEMIRAMIS	LLAMOCAS	04129905102	0	LLAMOZASSEMIRAMIMIST@GMAIL.COM	\N	\N	19	1989-11-30
435	V-19379035	HAIRAM	SAUAREZ	04126038358	0	AIRAN.SH@GMAIL.COM	\N	\N	19	1988-08-21
436	V-6643094	JOSE	PERERO	04125429093	0	JOSEPERERO07@HOTMAIL.COM	\N	\N	19	1965-03-13
437	V-12562670	CARLOS	MORA	04242675255	0	CMORA.MEDI@GMAIL.COM	\N	\N	19	1976-02-02
438	V-16669966	DAMARYS	MENDEZ	04120263642	0	MENDEZDAMARY530@GMAIL.COM	\N	\N	19	1984-10-07
439	V-11036180	JOSE	BELLO	04242549320	0	UNCORAZONCOMOELDECRISTO@GMAIL.COM	\N	\N	19	1969-02-15
440	V-8883072	ZULAY	ZAMORA	04142537963	0	ZULAT.Q.M@HOTMAIL.COM	\N	\N	19	\N
441	V-15588093	DANNY	SANTIAGO	04241747695	0	GOMASLLANOANDES@GMAIL.COM	\N	\N	19	1982-08-27
442	V-13401161	ROBERT	GONZALEZ	04241466721	0	YAKARYCARRIZALEZ@GMAIL.COM	\N	\N	19	1979-09-09
443	V-10000021	JORGE	CAMPOS	042621333636	0	VERONICACAMPO46@GMAIL.COM	\N	\N	19	1968-06-16
444	V-11277282	NANCY	GUTIERREZ	04126010715	0	NANCYGUTIERREZ@GMAIL.COM	\N	\N	19	1968-06-06
445	V-14165148	ANDREINA	LINARES	04142295123	0	ANDREINAJJJ@HOTMAIL.COM	\N	\N	19	1979-06-04
446	V-18357573	BRIGITTE	PEREZ	04142586079	0	BRIGITTEDPEREZS@GMAIL.COM	\N	\N	19	1988-11-02
447	V-18487731	ARMANDO	FERMIN	04143241066	0	ARMANDOFERMIN@GMAIL.COM	\N	\N	19	1990-01-21
448	V-21306578	NELY	PEÑA	04247276460	0	LINROSAGUILLEN@GMAIL.COM	\N	\N	19	1986-04-15
449	V-19084195	HAYDEE	MONTANO	04168198457	0	HAIDEMON86@GMAIL.COM	\N	\N	19	1980-12-17
450	V-10038723	LOLI	BARRETO 	04129642836	0	LOLYMARBARRETO6985@GMAIL.COM	\N	\N	19	1969-03-03
451	V-18314052	RENZO	FAJARDO	04129737795	0	MARIAJCALVO002@GMAIL.COM	\N	\N	19	1987-04-30
452	V-16525664	MARIA	CALVO	04141183463	0	MARIACALVO002@GMAIL.COM	\N	\N	19	1983-01-07
453	V-6207146	FRANCIS	MILANO	04142956912	0	FRANCIS_MILANO@HOTMAIL.COM	\N	\N	19	\N
454	V-13885815	OMAR	ZAMBRANO	04241194427	0	ALCALIDA@HOTMAIL.COM	\N	\N	19	1979-07-23
455	V-7958516	MERLIS	ANDARA	041413627528	0	MERLIS_ARCANGEL@HOTMAIL.COM	\N	\N	19	\N
456	V-12093634	MARIA	ESPINOZA	04162098438	0	MARIAESPIN.08@GMAIL.COM	\N	\N	19	\N
457	V-17720602	JOSEIBY	FLORES	04261862105	0	JOSEIBI602@GAIL.COM	\N	\N	19	\N
458	V-5617697	DIEGO	FLORES	04261529639	0	DIEGOF697@GMAIL.COM	\N	\N	19	\N
459	V-6843875	LEYDI	PINTO	04123646054	0	LEYDIPINTOM@GMAIL.COM	\N	\N	19	\N
460	V-6391000	ANA	BLANCO	04242959068	0	ANABLANCO1957@GMAIL.COM	\N	\N	19	1957-12-10
461	V-14045463	VLIMARID	BRAVO	04264156096	0	VNBM_@HOTMAIL.COM	\N	\N	19	1979-11-09
462	V-10545243	YENNY	LEON	04168965741	0	PI8434425@GMAIL.COM	\N	\N	19	1970-04-09
463	V-25038841	ANABEL	CARDOZA	04168015693	0	ANABELCARDOZA464@GMAIL.COM	\N	\N	19	1995-12-05
464	V-19559149	ROBERT	MARTINEZ	04120308537	0	G.O.V.E@HOTMAIL.COM	\N	\N	19	1989-09-09
465	V-10304758	MARIA	RIVAS	04249464585	0	ARTERESA2011@GMAIL.COM	\N	\N	19	1969-07-24
466	V-12385649	RAFAEL	RANGEL	04120890264	0	RAFAELRANGEL731@GMAIL.COM	\N	\N	19	1975-03-21
467	V-20995371	JUAN	ARNAL	04149183169	0	JUANMANUELVE15@GMAIL.COM	\N	\N	19	1991-10-22
468	V-24671539	YULIBETH	MARQUEZ	04142447672	0	YULIBETH.M17@GMAIL.COM	\N	\N	19	1956-05-30
469	V-12302464	MARIA	YONUSG	04141140798	0	MARIAYONUS6@GMAIL.COM	\N	\N	1	1975-12-03
470	V-19562788	KIMBERLING	PENA	04242557229	0	LABELLAKIM59@HOTMAIL.COM	\N	\N	1	1990-01-14
471	V-25225909	GRECIA	MATERAN	04148282885	0	FIGUEROAESTHEFANIA@GMAIL.COM	\N	\N	1	1996-09-19
472	V-23618472	KAREN	MENDOZA	04262126211	0	karenmendoza2007@hotmail.com	\N	\N	1	1993-08-12
473	V-27401102	ROMAN	RODRIGUEZ	04242015144	0	ROMANTONIO761@GMAIL.COM	\N	\N	1	1998-08-03
474	V-19555067	LEONARDO	LOZADA	04123340025	0	LEOLOZADAC@GMAIL.COM	\N	\N	1	1989-02-06
475	V-15201482	YETZICA	ACEVEDO	04242505149	0	YETZICAACEVEDO@GMAIL.COM	\N	\N	1	1980-05-20
476	V-19065000	YOALI	RODIGUEZ	04143302070	0	CHRISYOALY11@GMAIL.COM	\N	\N	1	1987-05-27
477	V-7956891	ALIRIO	ROMERO	04241874916	0	MILVN209@GMAIL.COM	\N	\N	1	1966-03-17
478	V-16473360	JACKELINE	SEGOVIA	04120220001	0	JACKELINESEGOVIA@GMAIL.COM	\N	\N	1	1981-05-29
479	V-20501031	MARIA	GONZALEZ	04140157252	0	MARIASM6P@GMAIL.COM	\N	\N	1	1992-11-04
480	V-24981365	ANTONIA	CONTRERAS	04141018576	0	ANTOCONZU@GMAIL.COM	\N	\N	1	1962-12-15
481	V-6212522	CARLOS	AVENDANO 	04162051533	0	CARLOSALBAA@HOTMAIL.COM	\N	\N	1	1966-01-22
482	V-19532431	JOHANNA	MORON	04242263872	0	JOHANNAMORON2@GMAIL.COM	\N	\N	1	1988-10-23
483	V-15206211	ZULAY	LIZANDRO	04268203834	0	ZULAYLIZANDRO@GMAIL.COM	\N	\N	1	1975-02-03
484	V-15366525	PEDRO	CHACON	04129891578	0	PEDROJESUSCHACON@GMAIL.COM	\N	\N	19	1980-07-17
485	V-6670540	VELASQUEZ	LUBIA	04166222622	0	BIENESTARCUANTICAALTERNATIVA@GMAIL.COM	\N	\N	19	1971-03-10
486	V-1086986	ISABEL	LUNA	0212411525	0	ISABELLUNA@GMAIL.COM	\N	\N	19	\N
487	V-19954006	ARNELYYS	GUEVARA	04242285043	0	ANREINAGUEVARA5489@GMAIL.COM	\N	\N	19	1989-04-05
488	V-26352218	LUZ	JIMENEZ	04140819191	0	YENN.2597@GMAIL.COM	\N	\N	19	1997-03-25
489	V-4358701	ESMIR	SOTO	04129566605	0	E.SOTOPULIDO@GMAIL.COM	\N	\N	19	1956-03-07
490	V-8379699	LIBDA	CARABALLO	04242187990	0	LIBDAFEBE@GMAIL.COM	\N	\N	19	1964-10-06
491	V-11489148	MANUEL	YNOJOSA 	04265158609	0	YNOJOSAMA44@GMAIL.COM	\N	\N	19	1973-08-07
492	V-14141646	RONALD	MARQUEZ	04241768332	0	MARQUEZRONALD2@GMAIL.COM	\N	\N	19	1977-10-01
493	V-14867701	JAVIER	GALVIS	04242947765	0	JAVIERGALVIS@GMAIL.COM	\N	\N	19	1982-01-16
494	V-18849160	ANA	REYES	04263121523	0	ANAREYESMAR2@GMAIL.COM	\N	\N	19	1986-05-20
495	V-4976432	MARLENY	TOLOZA	04167083949	0	ISOLINATARMERO1970@GMAIL.COM	\N	\N	19	1956-01-17
496	V-20114758	GIOVANA	BLANCO	04241767225	0	GIO221709@GMAIL.COM	\N	\N	19	1991-07-27
497	V-21051430	YEYFRI 	 ROJAS	04242181232	0	JEYFRI_2812@HOTMAIL.COM	\N	\N	19	1992-12-28
498	V-17562801	LUCILA	BARRIOS	04168064569	0	LUCILABM.86@GMAIL.COM	\N	\N	19	1986-01-11
499	V-21378861	GALVIS	SONIA	04142261617	0	GALVISOSONIA@OUTLOOK.COM	\N	\N	19	1992-07-22
500	V-24219262	LEONARDO	RANGEL	04242496228	0	RANGELEO@GMAIL.COM	\N	\N	19	1993-03-08
501	V-10564683	DAMASO	GARRIDO	04242821681	0	ARTURO.LOPEZ1661@HOTMAIL.COM	\N	\N	19	1964-12-11
502	V-3988627	SAGRARIO	RODRIGUEZ	04242205274	0	SARIOROGUE@HOTMAIL.COM	\N	\N	19	1954-01-25
503	V-11569953	YANSEY	RODRIGUEZ	04242598047	0	YANSYRODRIGUEZ0673@GMAIL.COM	\N	\N	19	1973-03-04
504	V-18071944	LIVIA	GUDINO	04242427125	0	LIVIAGUDIÑO@HOTMAIL.COM	\N	\N	19	1982-10-19
505	V-8632483	RAFAEL	ASCANIO	04141211948	0	ASCANIO@GMAIL.COM	\N	\N	19	1968-08-03
506	V-13251832	DEYANIRA	MARTINEZ	04122074827	0	DEYANIRA18@LIVE.COM	\N	\N	19	1978-09-21
507	V-21130697	ROBINSON	ANGULO	04126264122	0	ROBINSON2804@GMAIL.COM	\N	\N	19	1994-03-15
508	V-22910774	ENYERBERT	TORRES 	04242940704	0	ENGERBERTORRES1993@GMAIL.CON	\N	\N	19	1993-05-21
509	V-15910637	JONATHAN	RODRIGUEZ	04241440825	0	JERH2707@GMAIL.COM	\N	\N	19	1983-07-27
510	V-16903538	ASTRID	HERRERA	04241336218	0	ASTRID24@GMAIL.COM	\N	\N	19	1984-12-24
511	V-11020646	DAVID	GALAVIS	04264139453	0	DAVIDGALAVIZ0404@GMAIL.COM	\N	\N	19	1973-08-10
512	V-12975434	MARTIN	QUINTANA	04242624752	0	MARTINQUINTANALUGO@GMAIL.COM	\N	\N	19	1975-05-24
513	V-6732730	TONI	CARBALLO	04143707209	0	TONICARBALLO66@GMAIL.COM	\N	\N	19	1966-03-08
514	V-9962935	AMALIA	VIVAS	04142114430	0	mariyader1987@hotmail.com	\N	\N	19	1966-04-06
515	V-15131060	SOPRANO	ROSA	04141463017	0	ROSASOPRANO18@GMAIL.COM	\N	\N	19	1981-03-19
516	V-20990178	MIYERLIN	ROSALES	04143667399	0	MIYERLYN.ANGELICA@GMAIL.COM	\N	\N	19	1993-06-21
517	V-14129142	AGNI	LUCENA	04142011849	0	YNONTEC@GMAIL.COM	\N	\N	19	1978-12-07
518	V-18598397	NESTOR	HOLGUIN	04142011849	0	YNONTEC@GMAIL.COM	\N	\N	19	1981-01-24
519	V-18026578	YAJAIRA	OLLAVERS	04164276565	0	ceshmarck@gmail.com	\N	\N	19	1979-11-19
520	V-9958963	MIRIAM	REYES	04143667399	0	MIYERLYN.ANGELICA@GMAIL.COM	\N	\N	19	1970-12-17
521	V-13456185	LUISA	CABRILES	04127249634	0	REBOLLEDOMAURO94@GMAIL.COM	\N	\N	19	1980-06-21
522	V-10633995	HAYDEE	REYES	04143667399	0	MIYERLYN.ANGELICA@GMAIL.COM	\N	\N	19	1972-08-21
523	V-6344627	MOISES	GARCIA	04141263812	0	PELON.GARCIAMOI.@GMAIL.COM	\N	\N	19	1969-08-21
524	V-13636342	MAYLIN	MARTINEZ	04241748393	0	MAYLIN_ORTIZ@HOTMAIL.COM	\N	\N	1	\N
544	V-2289772	YULIESKA	BARRADAS	04122897722	0	YULI_B21@HOTMAIL.COM	\N	\N	19	1993-04-21
549	V-5220295	LEONIDA	GARCIA	04120247122	0	LEOGRE33@GMAIL.COM	\N	\N	19	1958-05-12
528	V-9787368	INES	BARRIOS	04149278500	0	INESBARRIOS_16@HOTMAIL.COM	\N	\N	1	1969-10-16
529	V-21117121	BRUCE	RODRIGUEZ	04241224674	0	AGBETAA.20@GMAIL.COM	\N	\N	1	1992-10-18
530	V-13996107	DANILO	LEAL	04269100309	0	CHISTYANOO1@HOTMAIL.COM	\N	\N	19	1979-03-15
531	V-9327559	GREGORIO	NAVA	04140760889	0	NAVADIANA2018@GMAIL.COM	\N	\N	19	1965-05-27
532	V-18492491	SUSANA	RIVAS	04264402253	0	SANITARIVASS@GMAIL.COM	\N	\N	19	1986-05-27
533	V-8017896	LUIS	AVENDANO	04168080576	0	GELINGOMEZ@GMAIL.COM	\N	\N	19	1963-04-22
526	V-13253008	MAIRA	MONTILLA	04165979147	0	MAIRAMONTILLA008@GMAIL.COM	\N	\N	19	\N
534	V-15876300	VERONICA	RODRIGUEZ	04167220848	0	VERONICACHACON@HOTMAIL.COM	\N	\N	19	1980-07-09
535	V-12908610	YORGGI	MENDOZA	04242275801	0	YORGGIMAR@GMAIL.COM	\N	\N	19	1977-03-26
536	V-8246696	SONIA	RODRIGUEZ	04122580619	0	SONIA51BALLESTEROS@GMAIL.COM	\N	\N	19	1965-06-17
537	V-14053669	MADELAINE	BASABE	04141560544	0	MADELAYBASABE@HOTMAIL.COM	\N	\N	19	1978-01-25
538	V-13384315	LUISA	RODRIGUEZ 	04140319252	0	LUISARODRIGUEZ69@GMAIL.COM	\N	\N	19	1969-08-25
539	V-17691797	GABRIELA	GUEVARA	17691797	0	YORGGIMAR@GMAIL.COM	\N	\N	19	1986-08-08
540	V-11014849	MAYULIS	CHACON	04160107922	0	MCHACONZOO8@GMAIL.COM	\N	\N	19	1973-07-23
541	V-13887346	NOHEMI	VIDAL	04262635101	0	VIDALNOHEMI1@GMAIL.COM	\N	\N	19	1966-06-15
542	V-9480023	EMMA	DELGADO	04163097423	0	EMMDELDELGADO@HOTAMAIL.COM	\N	\N	19	1967-09-08
543	V-9402354	CARLOS	MEZA 	04149267365	0	MEZACAR64@GMAIL.COM	\N	\N	19	1964-12-02
545	V-11483978	LESBIA	ECHENIQUE	04149059318	0	ECHENIQUEJA@GMAIL.COM	\N	\N	19	1970-02-09
546	V-19510115	DAIRELIS	RODRIGUEZ	04127287291	0	GIOVANNI2011@GMAIL.COM	\N	\N	19	1988-06-15
547	V-14386958	ANA	NUNEZ	04164067882	0	ANA.NU@HOTMAIL.COM	\N	\N	19	1978-10-06
548	V-10802632	ERIKA	PAYEN	04242843520	0	ERIKAPAYEN@HOTMAIL.COM	\N	\N	19	1972-09-28
525	V-13636312	MAYLIN	MARTINEZ	04241748393	0	maylin-ortiz@hotmail.com	\N	\N	1	\N
550	V-8462840	ANTONIO	MAGO	04166251283	0	RAFAEL_MAGO@BANVENEZ.COM	\N	\N	19	1959-09-27
551	V-16086155	FRANCISCO	MARIN	04143376040	0	FAMARINOS5@GMAIL.COM	\N	\N	19	1983-10-05
552	V-6136707	LUIS	GANDICA	04165334426	0	LUISE.GAMDICA@GMAIL.COM	\N	\N	19	1963-01-20
553	V-20603971	YUSELY	BELLO	04143200348	0	YUSELY_BELLO@HOTMAIL.COM	\N	\N	19	1990-07-02
554	V-15328534	YANESKA	SALAVERRIA	04263192529	0	HENRYALVIAREZ8@GMAIL.COM	\N	\N	19	1976-11-15
555	V-11667385	ALFREDO	YANEZ	04141408049	0	ALFREDOJYL0609@GMAIL.COM	\N	\N	19	1972-06-09
556	V-23188757	SOL	BOTTO 	04241358521	0	BOTTOSOLMERY@GMAIL.COM	\N	\N	19	1963-04-18
557	V-10786969	NURVIA	PARACARE	04269165921	0	NURVIA_3@HOTMAIL.COM	\N	\N	19	1969-08-11
558	V-30313916	FRANKLIN	GONZALEZ	04264099362	0	MAIELENADELGADO2010@HOTMAIL.COM	\N	\N	19	1978-08-27
559	V-12455581	MARILYN	RODRIGUEZ	04141167325	0	ERICKECHENIQUE98@GMAIL.COM	\N	\N	19	1976-05-11
560	V-13125232	SUGEIDI	GONZALEZ	04242883990	0	SUGEIDYGONZALEZ@GMAIL.COM	\N	\N	19	1976-08-20
561	V-17561126	INGRID	RANGEL	04242135061	0	ingridcrm25@gmail.com	\N	\N	19	1984-06-25
562	V-17691310	GERALDINE	AZUAJE	04142916060	0	geraldine.azuaje@gmail.com	\N	\N	19	1985-05-18
563	V-17976444	JOSELIN	AZUAJE	04141223596	0	YOSELIN.AZUAJE84@GMAIL.COM	\N	\N	19	1984-03-06
564	V-20175634	YORJAN	AZUAJE	04242660424	0	YORJAN.AZUAJE.86@GMAIL.COM	\N	\N	19	1986-04-21
565	V-21467851	JUAN	ORTEGA 	04241307414	0	JO890369@GMAIL.COM	\N	\N	19	1991-10-25
566	V-13944178	OMAIRA	CORREA	04128215189	0	OMAIRAINES@GMAIL.COM	\N	\N	19	1980-05-21
567	V-20706921	LUIS	TERAN	04125984114	0	TERANLUISJAVIER8@GMAIL.COM	\N	\N	19	1989-04-16
568	V-6333913	SUYIN	GUATAIPU	04241280716	0	SU.Y.IN151@HOTMAIL.COM	\N	\N	19	1968-05-15
569	V-13782115	NELSON	CARABALI	04242004408	0	CARABALINILSON@GMAIL.COM	\N	\N	19	1976-12-28
570	V-14667507	URIMARE	DOMINGUEZ	04145471889	0	URIMARE24@GMAIL.COM	\N	\N	19	1980-07-24
614	V-22752631	DREILYS	CASTILLO	04241173852	0	DREILYSCASTILLO@GMAIL.COM	\N	\N	19	1992-12-07
615	V-16598001	YUSMARY	CAMARGO	04163060095	0	YUSMARYCAMARGO22@GMAIL.COM	\N	\N	19	1984-06-22
527	V-10181835	AURA	GAVIDIA	04241081100	0	WILESK.PEREZ@GMAIL.COM	\N	\N	19	\N
572	V-29698807	ANDREINA	YUGURI	04143114240	0	ANDREINAYUGURIZOO@GMAIL.COM	\N	\N	19	2002-01-06
573	V-25799126	KENDER	BERRIOS 	04241488510	0	KENDERBERRIOS2017@GMAIL.COM	\N	\N	19	1997-06-09
574	V-13727035	JHOAN	MIJARES	04142314771	0	JHO_MIJARESACEVEDO@GMAIL.COM	\N	\N	19	1979-07-19
575	V-23685723	MARIA	ROMERO	04129246657	0	marla-romero-41-mkra@gmail.com	\N	\N	19	1990-09-23
576	V-22765184	YATSIRY	ROJAS 	04129006656	0	ROJASYATSI@GMAIL.COM	\N	\N	19	1994-05-02
577	V-13493742	CARMEN	HERMOSO	04120122076	0	YOIHERMOSO19@GMAIL.COM	\N	\N	19	1978-06-04
578	V-27318653	CARLOS	ESPITIA 	04141050473	0	SOYCARLOS0703@GMAIL.COM	\N	\N	19	1998-05-25
579	V-17082302	MARISOL	SANCHEZ	04268379505	0	SERENOSLAPROTECCION@HOTMAIL.COM	\N	\N	19	1984-01-28
580	E-84604510	PAULA	JIMENEZ	04125794469	0	AND.REITA26@GMAIL.COM	\N	\N	19	1993-08-26
581	V-26908441	JHOAN	LOBO	04262118637	0	keya_lcal@hotamail.com	\N	\N	19	1998-12-04
582	V-27160759	RAMOS	ENYELO	04269216582	0	ENYELORAMOS@GMAIL.COM	\N	\N	19	2000-03-21
583	V-18111400	DEIVIS	YUGURI 	04242371665	0	OVIYUGURI@GMAIL.COM	\N	\N	19	1987-10-01
584	V-12041793	ANGEL	ANGARITA	04166053679	0	ANGARITAANGELIGUILLERMO@HOTMAIL.COM	\N	\N	19	1972-07-26
585	V-19511462	EDGAR	ALAVA	04242208696	0	EDGAR19.ALAVA@GMAIL.COM	\N	\N	19	1989-02-09
586	V-29862919	GEORGECARIS	MARTINEZ	04242079461	0	JORGELIS27@GMAIL.COM	\N	\N	19	2000-06-26
587	V-16227251	MARIA	SANCHEZ	04141046221	0	MS8765668@GMAIL.COM	\N	\N	19	1981-03-13
588	V-13126032	VICTOR	CONTRERAS	04143029772	0	VJCU2003@GMAIL.COM	\N	\N	19	1978-02-14
589	V-25504278	CARLOS	ROJAS	04243622194	0	karlos_rojas97@hotmail.com	\N	\N	19	1997-03-29
590	V-18600533	YUSMAIRY	SARMIENTO	04242811525	0	YUSMAZO28@HOTMAIL.COM	\N	\N	19	1986-07-03
591	V-23654995	DARWIN	GARCIA	04143227449	0	DARVINVIZCAINO@GMAIL.COM	\N	\N	19	1995-02-26
592	V-13321165	LILIBETH	PERDOMO	04241495184	0	LILIPA530@GMIL.COM	\N	\N	19	1973-11-10
593	V-12166351	BERROTERAN	CARMEN	04241428549	0	CARYJOSET@GMAIL.COM	\N	\N	19	1976-02-05
594	V-16405554	YULEINYS	GARCIA	04242538646	0	YULEINY_G29@HOTMAIL.COM	\N	\N	19	1982-09-30
595	V-17802018	NAYROBYS	RAMIREZ	04241434088	0	NAYROBYSRAMIREZ178@GMAIL.COM	\N	\N	19	1985-12-12
596	V-11022406	BLANCA	TARAZONA 	04243396089	0	NELSONRANGEL12@HOTAMAIL.COM	\N	\N	19	1966-03-02
597	V-17557996	ALBERTO	RODRIGUEZ	04241434088	0	albertorodriguez1130dc@gmail.com	\N	\N	19	1984-09-11
598	V-8512771	JORGE	GRATEROL	04269054132	0	GRATEROLMEDINA01@GMAIL.COM	\N	\N	19	1966-06-19
599	V-10152174	YOLEIDA	CALDERON 	04265109851	0	YOLEIDA_CALDERON@HOTMAIL.COM	\N	\N	19	1969-03-28
600	V-13599826	YESENIA	GALVIS	04241346749	0	yeseniagalvis59@gmail.com	\N	\N	19	1978-05-21
601	V-14675161	EVA	GONZALEZ	04122024304	0	E_marg176@hotmail.com 	\N	\N	19	1981-02-04
602	E-84553345	LIUDMILA 	MIRANDA 	04162000810	0	PUPA0111@YAHOO.ES	\N	\N	19	1978-11-01
603	V-10745243	YOVEL	GUERRERO	04242556843	0	YOVEL.GUERRERO@GMAIL.COM	\N	\N	19	1971-10-31
604	V-22752479	CARLOS	AGUILUZ	04243510812	0	AGUILUZ1974@GMAIL.COM	\N	\N	19	1974-05-27
605	V-13287492	EMILCE	VELASQUEZ	04126991292	0	EMILCEVELAS@HOTMAIL.COM	\N	\N	19	1977-02-23
606	V-84419394	PEDRO	REY	04242392123	0	REYPEDRO29@GMAIL.COM	\N	\N	19	1963-04-29
607	E-84419392	PEDRO	REY	04242392123	0	REYPEDRO29@GMAIL.COM	\N	\N	19	1963-04-29
608	V-12113832	WILMER	UZCATEGUI	04263112847	0	WILMERUZCATEGUI8@GMAIL.COM	\N	\N	19	1974-04-06
609	V-15820735	JHOLMER	GRANADO 	04241397326	0	JHOLMERGRANADOS@GMAIL.COM	\N	\N	19	1975-09-27
610	V-15327187	DANIEL	DAVILA	04123079403	0	FRANCISDATICA24@GMAIL.COM	\N	\N	19	1981-10-12
611	E-21072511	de carga	Prueba	1	0	q@q.com	\N	\N	1	2019-11-13
612	V-23189271	INGRID	ANGULO	04161970436	0	INGRID_PAOLA:1994@HOTMAIL.COM	\N	\N	19	1994-04-10
613	V-19494031	JESSICA	ROJAS	04120123910	0	JESSICAGROJASP@GMAIL.COM	\N	\N	19	1989-08-28
616	V-12258071	MARIA	VASQUEZ	04242528061	0	MAIVAVI@HOTMAIL.COM	\N	\N	19	1975-11-22
617	V-20492102	ALEXANDRA	MEZA	04242429408	0	ALEX21915@HOTMAIL.COM	\N	\N	19	1989-04-19
618	V-13125369	NENINA	VALBUENA	04142992348	0	NENINAVT@HOTMAIL.COM	\N	\N	19	1973-12-25
619	V-6397691	MIRTHA	BORJAS	04241708666	0	VASQUEZ.6511@GMAIL.COM	\N	\N	19	1965-11-11
620	V-17400125	YESSICA	BAZARARTE	04241102152	0	VARGASYESICA282@GMAIL.COM	\N	\N	19	1985-06-07
621	V-14412134	LISSET	TOVAR	04125856436	0	LTOVAR@FARMATODO.COM	\N	\N	19	1978-03-20
571	V-21072511	q	q	12346	0	q@q.com	\N	\N	1	\N
622	V-12411331	EDIXON	RAMIREZ	04241557657	0	EDIXONJESUA1407@GMAIL.COM	\N	\N	19	1974-07-14
623	V-17476772	YERLI	MUJICA 	04241613051	0	YERLYM990@GMAIL.COM	\N	\N	19	1987-10-17
624	V-25038259	BRIGITTE	MARTINEZ 	04140333761	0	BRIGITTEM224@GMAIL.COM	\N	\N	19	1995-10-31
625	V-19558283	KARLA	RAMOS	04242873098	0	KARLA151088@GMAIL.COM	\N	\N	19	1988-10-15
626	V-13419984	YENNY	GONZALEZ	04242182827	0	YENNY1937.GONZALEZ@GMAIL.COM	\N	\N	19	1997-09-19
627	V-21414912	RAQUEL	ULLOA	04242394268	0	RAQUEL_ULLOA_1994@HOTMAIL.COM	\N	\N	19	1994-03-23
628	V-21415985	REINALDO	LOPEZ	04241668740	0	REINALDO.LOPEZ1102@GMAIL.COM	\N	\N	19	1994-02-11
629	V-24906057	MARIAN	MARTINEZ	04129896720	0	MARIANNATY96@GMAIL.COM	\N	\N	19	1996-02-09
630	V-24618966	KEILIN	DURAN	04241313659	0	KEILIN.DURAN0106@GMAIL.COM	\N	\N	19	1993-06-01
631	V-26726140	WINIFER	MENDEZ	04241538964	0	YORGELISURBINA38@GMAIL.COM	\N	\N	19	1998-11-27
632	V-20466481	DIEGO	MARTINEZ 	04142876420	0	DIALMAPE230990@GMAIL.COM	\N	\N	19	1990-09-23
633	V-24698198	ELIDA	URREA	04241217689	0	ELIDEURREA93@GMAIL.COM	\N	\N	19	1993-07-24
634	V-16331633	ARMANDO	GARCIA	04162373130	0	GARCIA100@HOTMAIL.COM	\N	\N	19	\N
635	V-9379433	MARIA	FERNANDEZ	04142292685	0	MIGUEL.AFF1990@GMAIL.COM	\N	\N	19	1968-05-26
636	V-6103394	ANGEL	MARTINEZ	04141068421	0	AHMARTINEZ64@HOTMAIL.COM	\N	\N	19	1964-02-10
637	V-13968817	YDACIS	MONAGAS	04125446214	0	ASTEMO3@GMAIL.COM	\N	\N	19	1979-09-19
638	V-13968897	YDACIS	MONAGAS	04125446214	0	ASTEMO3@GMAIL.COM	\N	\N	19	\N
639	V-17965131	KARINA	EVARISTO	04241711634	0	karinaevaristop@gmail.com	\N	\N	19	1987-07-03
640	V-18936323	WILDER	GAVIDIA	04125905017	0	karinaevaristop@gmail.com	\N	\N	19	1987-01-01
641	V-12821184	MAIRELYS	GARCIA	04242071219	0	GMAYRELIS@HOTMAIL.COM	\N	\N	19	1976-12-29
642	V-13582796	YELITZA	BRACAMONTE	04143004088	0	YANESSKYBRACAMONTE@HOTMAIL.COM	\N	\N	19	1977-12-23
643	V-14020422	LISSET	PEREZ	04162032533	0	GREYMAR2012@GMAIL.COM	\N	\N	19	1979-11-13
644	V-6653732	ROLANDO	BARRIOS	04268150014	0	PERUCHOLEON2021@GMAIL.COM	\N	\N	19	1967-01-29
645	V-10625491	MARIA	SUCRE	04140316387	0	MARIAELENASUCRE17@HOTMAIL.COM	\N	\N	19	1967-07-17
646	V-13251234	ESTELA	VANEGAS	04141531474	0	ENDIMAR286@HOTMAIL.COM	\N	\N	19	1976-09-03
647	V-16879784	CAROLINA	TORRES	04143004088	0	CARMENTORRES@GMAIL.COM	\N	\N	19	1982-12-24
648	V-14363829	SANDRA	MEJIA	04242750248	0	MEMY27@HOTMAIL.COM	\N	\N	19	1981-05-27
649	V-6892490	LUIS	SILVA	02126722932	0	LUISSANARES65@GMAIL.COM	\N	\N	19	1965-02-14
650	V-17929289	JEAN	ZAMBRANO	17929289	0	JCZAMBRANO.MCCD1985@HOTMAIL.COM	\N	\N	19	1985-10-17
651	V-14200413	JJONNY	UMBRIA	04242043081	0	JHONNYUMBRIA2014@HOTMAIL.COM	\N	\N	19	1979-04-29
652	V-6433472	ENYER	ROJAS 	04265143683	0	JOSEHOSSNE@HOTMAIL.COM	\N	\N	19	1962-08-15
653	V-14127345	NELLYS	CONTRERAS 	04166269242	0	NELLYCOM@GMAIL.COM	\N	\N	19	1979-10-29
654	V-14688529	RAFAEL	ANSELMI	04163291998	0	RAFAELJOHANO134@GMAIL.COM	\N	\N	19	2002-01-30
655	V-10544286	YAMILETH	MORALES	04261141844	0	DAURISOFIA22@GMAIL.COM	\N	\N	19	1970-03-19
657	V-12950649	ANA	GIL	04145611918	0	ALEXANDRA.ILUADD21@GMAIL.COM	\N	\N	19	1977-05-21
656	V-16224048	MARGARITA	BARRETO	04122154574	0	BMARGERLIN@GMAIL.COM	\N	\N	19	\N
658	V-11917615	ANGELICA	MORALES	04120209349	0	ANGELICAMORALESC@GMAIL.COM	\N	\N	19	1975-05-21
659	V-6727662	HECTOR	PIANGO	04143782190	0	HECTORMOROCHO2014@GMAIL.COM	\N	\N	19	1965-12-31
660	V-17706211	JESUS	GONZALEZ	04142221452	0	ANABELCARDOZZ464@GMAIL.COM	\N	\N	19	1985-03-15
661	V-21535768	LEONILK	ZAPATA	04125813231	0	LEONILKZAPATA@GMAIL.COM	\N	\N	19	1994-04-07
662	V-14387566	JENNY	PAREDES	04241943896	0	LEIDYYENNY@HOTMAIL.COM	\N	\N	19	1980-06-06
663	V-14666990	MARICARMEN	GUEVARA	04125403068	0	MCGUEVARA81@GMAIL.COM	\N	\N	19	1981-05-29
664	V-12469009	YBRHAIM	LOPEZ	04168370180	0	AFRICVICTORIA26@GMAIL.COM	\N	\N	19	\N
665	V-13070164	LUZ	PABON	04127044921	0	LUZSTELLAP2000@YAHOO.COM	\N	\N	19	1977-12-05
666	V-13833179	MARIA	CORRO	04242338836	0	MARIACM1510@GMAIL.COM	\N	\N	19	1978-10-15
667	V-6222007	sobeida	ortega	04142521144	0	sobeida_46@hotmail.com	\N	\N	19	\N
668	V-5005837	RUPERTA	GARCIA	04166137435	0	RUPERTAGARCIA27@GMAIL.COM	\N	\N	19	\N
669	V-11557499	ENIBETH	CLEMENTE 	0414341285	0	ENIBETHCLEMENTE@GMAIL.COM 	\N	\N	19	\N
670	V-6323930	ALEXIS	GONZALEZ	04141835153	0	HUGOOCANDO@GMAIL.COM	\N	\N	19	1966-04-30
269	V-13123687	HILDA	SOTO	04147868299	0	SOTOHILDA7@GMAIL.COM	\N	\N	19	1977-10-02
671	V-10470839	MARTA	VALENTE	04142588970	0	MARTAVALENTE1970@GMAIL.COM	\N	\N	19	1970-04-13
672	V-10336498	INES	FLORES	04143898931	0	BENDECIDAXCRISTO27102015@GMAIL.COM	\N	\N	19	1971-01-24
673	V-26547612	ALBERTH	AGUERO	04242964431	0	EFRANEGUERO27@GMAIL.COM	\N	\N	19	1986-07-03
674	V-5304676	SALAS	FLORES	04141527645	0	SARAOFELIAFLORES@HOTMAIL.COM	\N	\N	19	1960-11-12
675	V-25284793	AIDRE	VILLARROEL	04129848073	0	ALBAIVILLARROEL.0216@GMAIL.COM	\N	\N	19	1994-12-15
676	V-23154648	BENISSON	DUBREUSE	04120975895	0	FERDUBREUSE17@GMAIL.COM	\N	\N	19	1978-06-13
677	V-19662443	RAFAEL	MESA	04123707485	0	RAFELJOSEMEZA@GMAIL.COM	\N	\N	19	1985-08-03
678	V-6294814	MARIA	MJARES	04242819102	0	MM51838@GMAIL.COM	\N	\N	19	1966-11-19
679	V-10276178	YOLANDA	GONZALEZ	04122701909	0	YOLANDA13UNIV@GMAIL.COM	\N	\N	19	1970-11-13
680	V-15131045	MAIRY	CAMACARO	04142606499	0	CANATE_01@HOTMAIL.COM	\N	\N	19	1980-05-24
681	V-20124532	JOSE	OBANDO	20124532	0	OBANDOJOSE235@GMAIL.COM	\N	\N	19	1981-05-21
682	V-17386838	YANALY	RONDON 	04241864430	0	RONDONJANALY@GMAIL.COM	\N	\N	19	1981-01-05
683	V-15876885	MAYORIS	RAMOS 	04246707674	0	NAZA.RAMOS.@GMAIL.COM	\N	\N	19	1983-04-28
684	V-18604640	LUIS	SALAS	04126268145	0	LUISSALAS_1@HOTMAIL.COM	\N	\N	19	1987-06-30
685	V-5513775	OLIVIA	FIGUEROA	04169194483	0	OLIVIAJ_FIGUEROAT@GMAIL.COM	\N	\N	19	1959-06-26
686	V-10669800	BEIDEBER	HERNANDEZ	04169145679	0	beideber39@hotmail.com	\N	\N	19	1973-07-01
687	V-16526758	MAYERLIN	CASTRO	04266172793	0	MAYEFI84@GMAIL.COM	\N	\N	19	1982-12-04
688	V-21344065	KAISMARH 	YNOJOSA 	04141186001	0	BAMY_KAYS@HOTMAIL.COM 	\N	\N	23	1993-08-29
692	V-6434023	CARMEN 	ROJAS 	04269087309	0	CARMENELENAROJASDEVENEGAS@GMAIL.COM 	\N	\N	23	\N
693	V-15948470	YANEISY	ARISTIGUETA 	04120903896	0	YANEISYARISTIGUETA@GMAIL.COM	\N	\N	19	1983-11-24
694	V-3628148	MERY 	GOMEZ 	04268238286	0	MARIAMEDINABREU87@GMAIL.COM 	\N	\N	23	\N
690	V-11043650	YELITZA	BORGES	04160140687	0	JELIBORG@HOTMAIL.COM	\N	\N	23	\N
695	V-16936350	ELDER	RAMOS	04242960787	0	ELDERRAMOSVARGAS@GMAIL.COM	\N	\N	19	1984-01-12
691	V-22758394	ESMINDA	SIMPSON	04141615527	0	SIMPSON_ESMINDA@HOTMAIL.COM	\N	\N	23	\N
696	V-16284787	MARIA	SANDOVAL	04242960787	0	ELDERRAMOSVARGAS@GMAIL.COM	\N	\N	19	1982-05-27
698	V-6212919	DARVIN 	PRIETO	04125777788	0	CAROL24CASTRO9M@GMAIL.COM 	\N	\N	23	\N
699	V-13348333	MAIDELIS	MATA	04241966012	0	MAIDELIS07@GMAIL.COM	\N	\N	19	1977-09-07
700	V-14048028	IVAN	RUBIO	04241966012	0	MAIDELIS07@GMAIL.COM	\N	\N	19	1978-11-24
701	V-26282412	OSCAR	RIOBUENO	04141092661	0	OSCARJOSERIOBUENO@GMAIL.COM	\N	\N	19	1998-04-04
702	V-19087994	JOANE 	VILLASMIL 	04243136323	0	JOANEVILLASMIL@GMAIL.COM 	\N	\N	23	1986-06-18
703	V-6166959	PETRA	HERNANDEZ	04142500634	0	LUISAFAR40@HOTMAIL.COM	\N	\N	19	\N
704	V-22032416	ANDREA	GUERRERO	04241539864	0	ANDREAGUERRERO1991@HOTMAIL.COM	\N	\N	19	\N
705	V-20033406	MARCOS	HERRERA	04242173922	0	HERRERAMARCO1989@GMAIL.COM	\N	\N	19	1989-04-24
706	V-18403607	LIOREIDY	NAVARRO	04241947470	0	LIOREIDI23@GMAIL.COM	\N	\N	19	1988-03-02
707	V-21105125	MARYELIS	MARTINEZ	04242316313	0	MARYELYS1019@GMAIL.COM	\N	\N	19	1993-06-10
708	V-10367641	ALEIDA	ESCOBAR	04141236572	0	YUSMARYCASTILLO1985@GMAIL.COM	\N	\N	19	1966-06-01
709	V-11157168	MARIA	MONTILLA	04141785314	0	ELIZABETH_MONTILLA@OUTLOOK.COM	\N	\N	19	1967-10-06
710	V-5676517	MARIA	ZAMBRANO	04141356769	0	CENTRO DEL CARNET@HOTMAIL.COM	\N	\N	19	1956-08-26
711	V-15020966	NOEL	ROSALES	04141356769	0	CENTRO DEL CARNET@HOTMAIL.COM	\N	\N	19	1981-06-10
712	V-20827605	WILFREDO	MARIN	04122105169	0	WILFREDOJM_61@HOTMAIL.COM	\N	\N	19	1992-04-29
713	V-25565378	HAROLD	CARIMA	04167217165	0	TORREPISO26@GMAIL.COM	\N	\N	19	1997-04-14
714	V-20637143	JESUS	CAMPERO	04169328845	0	KACHAO4@HOTMAIL.COM	\N	\N	19	1992-03-04
715	V-25174041	ANAHYS	BALZA	04242287437	0	ANAHYSBALZA@GMAIL.COM	\N	\N	19	1997-06-11
716	V-6056508	EDGAR	VASQUEZ	04262171281	0	EDGARVASQUEZALVAREZ@GMAIL.COM	\N	\N	19	1962-10-02
717	V-14757294	YOSEFI	DIAZ	04241832617	0	JR.1908@HOTMAIL.COM	\N	\N	19	1981-12-25
718	V-15378123	JAIME	RUIZ	04241832617	0	JR.1908@HOTMAIL.COM	\N	\N	19	1982-08-19
719	V-11992365	MARYORI	GONZALEZ	04127030226	0	EDGARCHANGO66@GMAIL.COM	\N	\N	19	1972-03-20
720	V-14626283	JULIO	BECERRA	04143691287	0	juliobecerra1974@gmail.com	\N	\N	19	1974-08-11
721	V-6363157	REGULO	VEGAS	04242079544	0	REGULOVEGAS114@GMAIL.COM	\N	\N	19	1960-10-14
722	V-6901327	NUBIA	ACOSTA	04129524284	0	NUBIAACOSTAGARCIA@GMAIL.COM	\N	\N	19	1964-09-07
723	V-6190330	SARA	MEDINA	04260358700	0	SARAIVONEMEDINACHACON@GMAIL.COM	\N	\N	19	\N
724	V-17075791	EDITH	PEREZ	04241736367	0	EMILINAREZ@GMAIL.COM	\N	\N	19	1985-01-31
725	V-12385095	YAMILETH	NARES	04242627331	0	YAMINARES_08@HOTMAIL.COM	\N	\N	19	1975-01-08
726	V-15615779	BERENICE	AGUILAR	04241506120	0	BERENICEAGUILAR0000@GMAIL.COM	\N	\N	19	1982-10-26
727	V-10522176	VICTOR	PRADA	04167868829	0	PLADAVICTOR165@GMAIL.COM	\N	\N	19	1969-07-28
728	V-13641769	GLORIAN	RODRIGUEZ	04120805538	0	GLORIALE21@GMAIL.COM	\N	\N	19	1978-02-21
729	V-11038889	AYLISSET 	VILLALBA	04143725981	0	AYLISSETVILLALBA@HOTMAIL.COM	\N	\N	19	1972-06-22
730	V-11735744	SUYIN	GUEVARA	04123605039	0	SUYINGUEVARA@GMAIL.COM	\N	\N	19	1974-04-13
731	V-23190051	CINDY	TRESPALACIOS	04125550262	0	CINDY_TRESPALACIOS@HOTMAIL.COM	\N	\N	19	1993-07-18
732	V-16292182	LUZ	LOZADA	04143078520	0	LUZLAZALA67@GMAIL.COM	\N	\N	19	1982-11-23
733	V-17269337	YACENIS	GUEVARA	04241803300	0	YACEGUEVARA@GMAIL.COM	\N	\N	19	1985-10-11
734	V-18813450	KARLA	MEDINA	04241528359	0	KARYMEDINA28@HOTMAIL.COM	\N	\N	19	1988-07-28
735	V-19656619	GREGORIS	BRITO	04162309758	0	GREGORISBRITOARAUJO@HOTMAIL.COM	\N	\N	19	1991-11-05
736	V-24674594	ALYS	BALETA	04122959875	0	ALYSB20@GMAIL.COM	\N	\N	19	1972-12-25
737	V-15166551	JUAN	LEON	042420113118	0	JUANANDRES.JCLC@GMAIL.COM	\N	\N	19	1980-09-11
738	V-25369051	YESICA	MALDONADO	04241800986	0	ISABELLA2810@YAHOO.COM	\N	\N	19	1995-12-06
739	V-16029025	NOREIDA	GRAU	04262733263	0	NOREIDAGRAU@HOTMAIL.COM	\N	\N	19	1980-10-03
740	V-18967031	RAUL	DE SOUSA	04140327951	0	DESOUSARAUL258@GMAIL.COM	\N	\N	19	1989-09-15
741	V-19720730	MIRELYS	GUEVARA	04141506854	0	MIRELYS_1989@HOTMAIL.COM	\N	\N	19	1989-09-12
742	V-6868966	FRANCELINA	BARCENAS	04125407619	0	DUQUEBARCENAS@GMAIL.COM	\N	\N	19	1968-04-27
743	V-27664640	THALIS	LOZANO	04242379711	0	THALISLOZANO@GMAIL.COM	\N	\N	19	1998-05-10
744	V-14743090	LUISA	BARRIOS	04143910979	0	CAROLINA BARRIOS71@GMAIL.COM	\N	\N	19	1977-03-30
745	V-6401934	JUAN	SALAZAR	04143910979	0	CAROLINABARRIOS71@GMAIL.COM	\N	\N	19	1956-06-26
746	V-12977345	MARILEN	VOLCAN	04163069340	0	JOSELIN-TOVAR@HOTMAIL.COM	\N	\N	19	1976-03-03
747	V-20753684	KARLA 	RODRIGUEZ 	04160742346	0	DANIAMATERANO6767@GMAIL.COM 	\N	\N	23	1986-12-07
748	V-10863611	DORA	GUALDRON	04242484752	0	ORIANNAP1819@GMAIL.COM	\N	\N	19	1968-07-05
749	V-13686170	CRUZ 	ALVAREZ 	04262127537	0	ELENA.AS2011@GMAIL.COM 	\N	\N	23	1978-05-03
750	V-13159108	YOMARA	HISTOR	04141073181	0	YOSMARAH@YAHOO.ES	\N	\N	19	1977-09-17
751	V-13711106	BETTZY 	CORREA 	04122048429	0	ANTOBET250602@GAMIL.COM 	\N	\N	23	1977-06-25
752	V-14990565	YULEIDY 	FAJARDO 	04120986538	0	YULIFAJARDO64@GMAIL.COM  	\N	\N	23	1981-05-12
753	V-5427927	MIRNA	ARAMBURO	04142017372	0	CENTRODELCARNET@HOTMAIL.COM	\N	\N	19	1953-10-11
754	V-24460677	FRANCIS	CAMACARO	04264157049	0	FRANCIS_CAMACARO@HOTMAIL.COM	\N	\N	19	1994-07-06
755	V-8587646	DAVID	SANDOVAL	04242385404	0	DAVIDSANDOVAL@GMAIL.COM	\N	\N	19	1964-01-20
756	V-13735322	LILIAN	RODRIGUEZ	04128197571	0	ALBERTOGAREIA0212@GMAIL.COM	\N	\N	19	1979-04-01
757	V-15757330	MARIA	BATTIKHA	04242918950	0	JOSEGONZALEZ@GMAIL.COM	\N	\N	19	1983-04-08
758	V-5516897	JESUS	NARANJO	04143910979	0	CAROLINABARRIOS71@GMAIL.COM	\N	\N	19	1955-04-07
759	V-10527899	LILA	MURILLO	04264012793	0	LMURILLO_0104@HOTMAIL.COM	\N	\N	19	1963-04-06
760	V-13158574	MIGUELINA	GUAICARA	04129238875	0	DDCARVAJAL1315@GMAIL.COM	\N	\N	19	1957-08-18
761	V-12952506	CRUZ	MARTINEZ	04149900804	0	MARINAALEXANDRANGR6@GMAIL.COM	\N	\N	19	1974-04-14
762	V-16850346	NATY	SILVA	04166076996	0	NBSILVA1982@GMAIL.COM	\N	\N	19	1982-11-09
763	V-12288447	YINA	HURTADO	04140262770	0	YINAH1974@GMAIL.COM	\N	\N	19	1974-01-13
764	V-20210642	DIONELVKYS	PADRON	04142113813	0	BCANONICO07@GMAIL.COM	\N	\N	19	1991-11-29
765	V-16097013	JUAN	IBARRA	04149225787	0	JUANCARLOSIBARRA3@GMAIL.COM	\N	\N	19	1984-06-14
766	V-12828435	WENDY	HERNANDEZ	12828435	0	WENDYHERNANDEZLAVA864@GMAIL.COM	\N	\N	19	\N
767	V-16097209	YOLIBETH 	PERDOMO 	04168242318	0	YOLIBETH_PERDOMO@HOTMAIL.COM 	\N	\N	23	1979-08-12
768	V-6506613	BELKIS 	ROJAS	04242069732	0	BELKISZORAIDAROJAS@HOTMAIL.COM 	\N	\N	23	1965-01-17
769	V-15073630	ANNEDYS	RIVAS	04242046122	0	ANNEDYSRIVAS@GMAIL.COM	\N	\N	19	1981-07-09
770	V-24477799	MARIA 	SARABIA 	04125754900	0	JOSYBELITRIAGO16@GMAIL.COM 	\N	\N	23	1993-11-01
771	V-16087755	YENETTE	HERRERA	04129609601	0	YINETT.HERRERAJM@GMAIL.COM	\N	\N	19	1983-08-31
772	V-16005646	LIGIA 	GONZALEZ 	04267650658	0	GLIGIA641@GMAIL.COM 	\N	\N	23	1983-06-07
773	V-10793163	RITA	URBINA	04241594624	0	RITAURBINA2@GMAIL.COM	\N	\N	19	1972-04-13
774	V-18275986	DANELLYS 	RIVAS 	04242398479	0	HERSABETANCOURT2013@GMAIL.COM 	\N	\N	23	1986-11-18
775	V-9196896	LIGIA	MORALES	04241444294	0	LIGIAMORALES1959@GMAIL.COM	\N	\N	19	1959-11-25
776	V-12093935	ALFREDO	RONDON	04168107494	0	ALFREDOS23@GMAIL.COM	\N	\N	19	1971-10-23
777	V-7956850	GLENDY 	MUÑOZ 	04129940039	0	GLENELENA11@GAMIL.COM 	\N	\N	23	1967-09-19
778	V-21282653	ENYERBERT	ESPINOZA	04242503883	0	ENGERBERT_15@HOTMAIL.COM	\N	\N	19	1992-05-24
779	V-15645033	ALEXANDER	LOPEZ	04143911903	0	TEC_ALEX_15@HOTMAIL.COM	\N	\N	19	1981-09-15
780	V-19228504	LUREYMAR	GUZMAN	04141202117	0	LUREYMAGUZMAN@GMAIL.COM	\N	\N	19	1989-12-22
781	V-25210094	KELVIN	PEREIRA 	04165296816	0	PEREIRAALBERTO188@GMAIL.COM	\N	\N	19	1993-12-22
782	V-24456475	GEORGINA	DE LA ROSA	04242231972	0	GEORGINA6DELAROSA@GMAIL.COM	\N	\N	19	1996-03-17
783	V-25235828	ALBANY	BELTRAN 	04241342423	0	ABBYCBOOM@GMAIL.COM	\N	\N	19	1996-07-27
784	V-17610928	LUIS	ROJAS	04141476296	0	LUISMIGUELROJAS.2903@HGMAIL.COM	\N	\N	19	1986-03-29
785	V-11228167	WENDY	OVIEDO	04143189877	0	WENDYOVIEDO@HOTMAIL.COM	\N	\N	19	1972-07-20
786	V-9419712	CLAUDETTE	MORENO	04122707700	0	CLAUDETTEROSSANA@GMAIL.COM	\N	\N	19	1969-07-14
787	V-24278350	ANDERSON	YANEZ	04242733893	0	ENDER_4141_DIAZ@HOTMAIL.COM	\N	\N	19	1992-04-29
788	V-17856198	JHONNY	TOVAR	04241534080	0	DEYLOR_87@HOTMAIL.COM	\N	\N	19	1987-02-23
789	V-23692075	CARLOS	PIANGO 	04123768575	0	EPDOE94@GMAIL.COM	\N	\N	19	1994-06-26
790	V-16461581	JEAN	BRITO	04129129200	0	BRITOJEANC@GMAIL.COM	\N	\N	19	1981-12-10
791	V-25767870	ANA	BRICENO	04241986889	0	KARINA952004@GMAIL.COM	\N	\N	19	1995-04-20
792	V-20603402	BETHZABETH	GONZALEZ	04242748524	0	BETZABETH2990@HOTMAIL.COM	\N	\N	19	1990-01-29
793	V-20309108	CARLOS	MARQUEZ	04242172158	0	CARLOSADRIANMARQUEZ@GMAIL.COM	\N	\N	19	1991-04-11
794	V-11933250	RAFAEL	MOLINA 	04265204754	0	RQFELCARRILLO1193@YAHOO.ES	\N	\N	19	1973-03-29
795	V-14140701	MAGLIO	MEDERO	04242289409	0	BEIXVELASQUEZ@GMAIL.COM	\N	\N	19	1974-10-22
796	E-81073142	RUTH	RODRIGUEZ	04242818391	0	RUCITAS54@HOTMAIL.COM	\N	\N	19	1974-11-25
797	V-19327627	FRANK	MEDINA 	0414235966	0	RIBERTMEDINARUIZ2016@GMAIL.COM	\N	\N	19	1986-08-20
798	V-12765290	GUILLERMO	GULER	04120117750	0	DADEYC@GMAIL.COM	\N	\N	19	1976-12-22
799	V-6519529	EMNIO	ALVAREZ	04127010086	0	EMNIOSTEVE@GMAIL.COM	\N	\N	19	1971-02-02
800	V-16472700	EDUARD	MARIN	04164156046	0	EDUARDMARIN82@GMAIL.COM	\N	\N	19	1983-12-05
801	V-5491384	MILAGROS	SAEZ 	04269170202	0	MILAGRO150959@HOTMAIL.COM	\N	\N	19	1959-09-15
802	V-12640319	JONATHAN	PEREIRA	04241936539	0	JHOTANPEREIRA579@GMAIL.COM	\N	\N	19	1974-10-31
803	V-15312444	ALEXANDRA	PEREZ	04128014410	0	ALEXNDRAJPEREZ.16@GMAIL.COM	\N	\N	19	1980-01-16
804	V-11160446	SIMON	RODRIGUEZ	04141328019	0	SIMONRODRIGUEZ11160446@GMAIL.COM	\N	\N	19	1971-08-24
805	V-14428857	DELIS	MOZO	04127237842	0	JOSYBELTRIAS5016@GMAIL.COM	\N	\N	19	1979-09-15
806	V-6211522	FREDDY	GONZALEZ	04141176416	0	FREDDYJESUS23@GMAIL.COM	\N	\N	19	1964-02-23
807	V-20616926	JIGLUDU	GARCIA	04242263016	0	JIGLIDU.GARCIAOS@GMAIL.COM	\N	\N	19	1991-07-05
808	V-14743688	ESTIWAR	RAMOS 	04241947012	0	ESTIWARRAMOS59@GMAIL.COM	\N	\N	19	1981-07-03
809	V-9376869	AMPARO	MORILLO	04149080032	0	JOSYBELITRIAGO16@GMAIL.COM	\N	\N	19	1964-08-08
810	V-6835487	ANDREA	ALPIZA	04165747990	0	ANDREALPIZA1963@GMAIL.COM	\N	\N	19	1963-12-06
811	V-17459454	DONOBAN	VOLCANES	04120134364	0	DONOBANVOLCANES@HOTMAIL.COM	\N	\N	19	1987-03-06
812	V-6504510	JOSE	CORRO	04242807739	0	JOSECORRO211@GMAIL.COM	\N	\N	19	1964-07-02
813	V-12410136	NAIROBIS	SANCHEZ	04167044780	0	NAIROBISJST_13@HOTMAIL.COM	\N	\N	19	1976-05-13
814	V-5978629	LUIS	HERRERA	04242920376	0	MISBELISSOJO@HOTMAIL.COM	\N	\N	19	1963-11-08
815	V-10336682	JHOAN	CANATE	04142606499	0	CANATE_01@HOTMAIL.COM	\N	\N	19	1982-04-14
816	V-22036847	JOSE	TORRES	04241318147	0	MANUELTMORENOSS1992@GMAIL.COM	\N	\N	19	1992-01-10
817	V-12420845	KATTY	CEDENO	04166071536	0	KATTI_0217@HOTMAIL.COM	\N	\N	19	1975-02-17
818	V-6662372	ROSA	PAIVA	04165283707	0	ROSAPAIVA2018@HOTMAIL.COM	\N	\N	19	1967-09-30
819	V-6512552	REINA	SILVA	04261194712	0	DANIAMATERANO6767@GMAIL.COM	\N	\N	19	1965-11-19
820	V-11025218	DIANA	GUADERRAMA	04161667938	0	DIANAMIMUÑEQUITA@GMAIL.COM	\N	\N	19	1971-08-24
821	V-20130712	WILMER	MARTINEZQ	04168260808	0	EL_GRINGO@HOTMAIL.COM	\N	\N	19	1985-12-11
822	V-10514796	IRIS	MATERAN	04262803656	0	IRISELENAMATERAN@GMAIL.COM	\N	\N	19	1969-03-15
823	V-16474740	JUNIOR	FIGUERA	04123936505	0	JUNIORRAMON162@GMAIL.COM	\N	\N	19	1982-03-18
824	V-26484965	RICARDO	SALCEDO	04241590297	0	ANDRESSALCEDO2001@GMAIL.COM	\N	\N	19	1998-08-28
825	V-13066961	MELANIA	ORTIZ	04166092592	0	KIKEALEJA31@GMAIL.COM	\N	\N	19	1977-08-25
826	V-13125833	MARIA	HIDALGO	04241350472	0	MARIELENAHIDALGO5071@GMAIL.COM	\N	\N	19	1975-09-26
827	V-6320225	NAHIR	CAMACARO 	04141122513	0	NAHIR888@GMAIL.COM	\N	\N	19	1968-12-24
828	V-23926640	SHERLING	ABREU	04123682232	0	SHERLINGABREU @GMAIL.COM	\N	\N	19	1995-06-17
829	V-13287760	DEIBY	GUDIO	04242532662	0	DEIBY.GUDIÑO47@GMAIL.COM	\N	\N	19	1975-06-06
830	V-24278977	YHON	MANZANILLA	04241443552	0	YHONBERROTERAN1996@GMAIL.COM	\N	\N	19	1996-06-16
831	V-13139939	ERIKA	DE LA PUENTE	04143354850	0	ERIKADELAPUENTE@GMAIL.COM	\N	\N	19	1976-07-16
832	V-10485992	LUIS	CENTENO	04144669430	0	LUISCENTENOGOLF@HOTMAIL.COM	\N	\N	19	1973-06-20
833	V-14452330	MONICA	DOMINGUEZ	04241292174	0	MONICADOMINGUEZ2108@GMAIL.COM	\N	\N	19	1978-08-21
834	V-16145154	SAMUEL	VEGAS	04142118941	0	SAMUELVEGAS28@GMAIL.COM	\N	\N	19	1981-07-28
835	V-9273641	LUIS	ESPINOZA 	04241481390	0	LUIS.ESPINOZA.MARIN@GMAIL.COM	\N	\N	19	1964-05-31
836	V-26683797	VICTOR	SANABRIA	04241564106	0	VSANAVRIA642@GMAIL.COM	\N	\N	19	1998-05-11
837	V-25751180	CARLOS	ROJAS	04241938486	0	CARLOSRAFAELROJASGUDINO@GMAIL.COM	\N	\N	19	1996-07-31
838	V-11379829	MORELLA	GONZALEZ 	04141248004	0	MORELLASANTOS652@GMAIL.COM	\N	\N	19	1971-09-15
839	E-82154348	MARIA	PENA	04242720660	0	MARIALE1995.MAG@GMAIL.COM	\N	\N	19	1962-09-15
840	V-15844787	ANGELY	LAFIGLIOLA 	04242264911	0	ANGELOIAFIGLIOLA@HOTMAIL.COM	\N	\N	19	1982-06-26
841	V-13304589	WILFREDO	MOTAVITA	04141611250	0	CARLAMOTAVITA2015@GMAIL.COM	\N	\N	19	1979-03-20
842	V-18675354	CARLA	JIMENEZ	04141611250	0	CARLAMOTAVITA2015@GMAIL.COM	\N	\N	19	1988-05-08
843	V-14721804	JOSE	LEON	04123636769	0	JLEON2509@GMAIL.COM	\N	\N	19	1980-09-25
844	V-4580366	FANNY	PEREZ	04261531408	0	FANNYPEREZ2@GMAIL.COM	\N	\N	19	1956-02-22
845	V-6121342	SARA	PEREZ	04162158257	0	SARAPEREZ2203@GMAIL.COM	\N	\N	19	1961-12-01
846	V-12152536	CARMEN	GOITIA	04241854590	0	UVSERVICIUS@GMAIL.COM	\N	\N	19	1974-07-16
847	V-5412138	ANTONIO	BARRETO	04263195565	0	EPSDCSANJUAN@GMAIL.COM	\N	\N	19	1957-06-10
848	V-15314472	GIOVANNI	GARCIA 	04263195565	0	EPSDCSANJUAN@GMAIL.COM	\N	\N	19	1983-03-15
849	V-26271086	DANIEL	SIFONTES	04263195565	0	EPSDCSANJUAN@GMAIL.COM	\N	\N	19	1997-06-29
850	V-6198383	JHONNY	HERNANDEZ	04263195565	0	EPSDCSANJUAN@GMAIL.COM	\N	\N	19	1963-05-23
851	V-13162194	PEDRO	COTE	04263195565	0	EPSDCSANJUAN@GMAIL.COM	\N	\N	19	1962-01-16
852	V-14063500	RAUL	RODRIGUEZ	04263195565	0	EPSDCSANJUAN@GMAIL.COM	\N	\N	19	1975-01-28
853	V-4580643	FRANK	AMAYA 	04263195565	0	EPSDCSANJUAN@GMAIL.COM	\N	\N	19	1955-08-25
854	V-31870503	ABRAHAM	SUBERO	04263195565	0	EPSDCSANJUAN@GMAIL.COM	\N	\N	19	1996-02-05
855	V-10354436	JOSE	PRIETO	04263195565	0	EPSDCSANJUAN@GMAIL.COM	\N	\N	19	1966-01-13
856	V-15344884	JHONNY	SURITA	04263195565	0	EPSDCSANJUAN@GMAIL.COM	\N	\N	19	1980-05-02
857	V-25595439	JOSE	SALAS	04263195565	0	EPSDCSANJUAN@GMAIL.COM	\N	\N	19	1994-12-06
858	V-28129537	CARLOS	RODRIGUEZ	04263195565	0	EPSDCSANJUAN@GMAIL.COM	\N	\N	19	1999-10-27
859	V-13582703	YGOR	MARTINEZ 	04263195565	0	EPSDCSANJUAN@GMAIL.COM	\N	\N	19	1976-07-03
860	V-26421284	ANDRES	MARCHAN	04263195565	0	EPSDCSANJUAN@GMAIL.COM	\N	\N	19	1995-12-02
861	V-4681293	JOSE	TORREALBA	04263195565	0	EPSDCSANJUAN@GMAIL.COM	\N	\N	19	1957-11-16
862	V-6334002	MARY	SUBERO 	04142291699	0	EPSDCSANJUAN@GMAIL.COM	\N	\N	19	1970-06-06
317	V-15113261	NICOMEDES	MARIN	04143269647	0	NICOMEDES150978@HOTMAIL.COM	\N	\N	19	\N
863	V-6276681	SELENE	FALCON	04126276681	0	SELENEFALCONR@GMAIL.COM	\N	\N	19	1969-04-04
864	V-4508893	JOSE	MORFEE 	04164277060	0	AMORFFC@GMAIL.COM	\N	\N	19	1953-03-15
865	V-11672896	CISNEYRIS	RODRIGUEZ	04241432972	0	CISNEIRYSMRG@GMAIL.COM	\N	\N	19	1974-07-06
866	V-16683647	LEONARDO	NADALES	04242440827	0	LEILAZERPA@GMAIL.COM	\N	\N	19	1984-10-29
867	V-18603097	NATALI	VELASQUEZ	04260368828	0	NATALIVELASQUEZRODRIGUEZ@GMAIL.COM	\N	\N	19	1987-09-04
868	V-20629897	MICHELL	MARTINEZ	04140314753	0	MUCHELL0705@GMAIL.COM	\N	\N	19	1989-06-09
869	V-10099085	GLENDY	MENDOZA	04242120370	0	ABICZAY@GMAIL.COM	\N	\N	19	1970-04-09
870	V-6227547	JULIO	PEREIRA	04143397129	0	JULIOCPV.VE@HOTMAIL.COM	\N	\N	19	1967-10-11
871	V-17801953	DARCY 	CAICEDO	04120160237	0	LI.LIBETH25@HOTMAIL.COM 	\N	\N	23	1984-10-07
872	V-16022866	QWENDY	QUIROZ	04241019253	0	QUIROZQWENDY@GMAIL.COM	\N	\N	0	1983-05-05
873	V-6252831	MIRLA	LINARES	04143033491	0	MIRLA6970@HOTMAIL.COM	\N	\N	19	1965-08-13
874	V-22041776	JOYNER	RODRIGUEZ	04163032142	0	ROBERT_JOINER@HOTMAIL.COM	\N	\N	19	1994-10-14
875	V-6868738	JOSE	ACOSTA 	04127254815	0	JOSE.ACOSTA.SAEZ@GMAIL.COM	\N	\N	19	1964-07-22
876	V-17060282	MIGUEL	MENDOZA	04242024567	0	MIGUELM.241083@GMAIL.COM	\N	\N	19	1983-10-24
877	V-9626157	JOSE	TORRES	04143233288	0	JOSETORR881@GMAIL.COM	\N	\N	19	1970-07-28
878	V-11688665	WALTER	CONDE	04242982050	0	WCONDEALUCARD@GMAIL.COM	\N	\N	19	1974-01-28
879	V-5599246	CLAUDIA	TRACK	04242829727	0	CLAUDETTEROSANGER@GMAIL.COM	\N	\N	19	1957-06-18
880	V-26546577	GREISY	MANZANILLA	04163944989	0	RADISBEL.GREIBY@GMAIL.COM	\N	\N	19	1998-05-07
881	V-13232029	RICHARD	ARANGUREN 	04241213038	0	RARANGUREN1@GMAIL.COM	\N	\N	19	1977-02-23
882	V-20701074	RUTMARY	COLMENARES	04126366462	0	MARYCOLMENARESSIU@GMAIL.COM	\N	\N	19	1990-09-19
883	V-11215408	EDITH	PENA	04128041135	0	EDITHYPR@HOTMAIL.COM	\N	\N	19	1972-03-31
884	V-12069240	YNDARA	BARRIOS	04242676128	0	YNDARABARRIOS@YAHOO.COM	\N	\N	19	1974-08-11
885	V-6335294	NORIS	MONTILLA	04265128916	0	NORIS_MONTILLA@HOTMAIL.COM	\N	\N	19	1971-02-17
886	V-6118957	JOSE	GARCIA	04269059936	0	LUCREJUAN@HOTMAIL.COM	\N	\N	19	1965-02-02
887	V-6698543	GUILLERMO	MUJICA 	04129616226	0	GUILLERMUJICA60@HOTMAIL.COM	\N	\N	19	1960-06-25
888	V-17693473	ELY	GUARAMATO	04127024140	0	ELYGUARAMATO@GMAIL.COM	\N	\N	19	1986-11-05
889	V-13374212	MICHAEL	GALLARDO 	04168091065	0	JELCO_1975@HOTMAIL.COM	\N	\N	19	1975-06-29
890	V-18094527	AYERIM	CANONICO	04242144583	0	AYERIMCANONICO@HOTMAIL.COM	\N	\N	19	1987-10-31
891	V-20653551	DEBIE	ALVAREZ	04241899861	0	DEBIEALVAREZ62@HOTMAIL.COM	\N	\N	0	1990-12-30
892	V-28015004	FERRAES	RAMOS	04242185529	0	FERRAEZ001@GMAIL.COM	\N	\N	19	1999-05-10
893	V-19028692	LEYARIT	HERRERA	04127793606	0	LEYAKHS19@GMAIL.COM	\N	\N	19	1990-01-19
894	V-25220257	WILLIAMS	RIVAS	04262124335	0	FLACO_WIANCHO@HOTMAIL.COM	\N	\N	19	1994-10-25
895	V-19314680	YULIMAR	MATA	04143340389	0	YULIMARMARIAM@GMAIL.COM	\N	\N	19	1992-01-15
896	V-27704948	MARIA	ROMERO 	04128218523	0	ALEXAROMERO@HOTMAIL.COM	\N	\N	19	1995-05-12
897	V-19378547	RIVER	SANCHEZ 	04125663935	0	RIVERALEJANDROSANCHEZ@HOTMAIL.COM	\N	\N	19	1988-11-06
898	V-15616282	SANTI	SANCHEZ	04242003457	0	SANTIZOAR.SS@GMAIL.COM	\N	\N	19	1982-10-20
899	V-11834514	YELIS	CISNEROS	04140259886	0	ARIANYS529@GMAIL.COM	\N	\N	19	1973-12-03
900	V-14532324	ANGELICA	JIMENEZ	04168277183	0	ANGELICAJIMENEZZZ0007@HOTMAIL.COM	\N	\N	19	1981-07-24
901	V-24074748	YAHINILETH	VELASQUEZ	04241523314	0	YAINILET79@HOTMAIL.COM	\N	\N	19	1995-12-18
902	V-14123955	JUNAIXY	JAZZ	04242099259	0	JUNAIXYZZ@GMAIL.COM	\N	\N	19	1978-11-13
903	V-25609304	LAURIANYS	CABRITA 	04141001865	0	LAURIANYSCABRITA@GMAIL.COM	\N	\N	19	1995-11-01
904	V-20047770	BERANGELIS	VERA	04242282457	0	LAURIANISCABRITA@GMAIL.COM	\N	\N	19	1991-11-04
905	V-27377204	MARIA	CANCELA 	04141243924	0	MARIAANDREINACANCELA@GMAIL.COM	\N	\N	19	1999-08-25
906	V-26194580	GUSTAVO	TOLEDO	04242445575	0	GUSTAVOJOSETOLEDO78@GMAIL.COM	\N	\N	19	1997-12-10
907	V-24749454	ISIDRO	HERNANDEZ	04241733440	0	ERICK_FER_18@HOTMAIL.COM	\N	\N	19	1995-09-12
908	V-26312535	JOSE	MADRID 	04146622426	0	MADRIDJOSEDANIEL@GMAIL.COM	\N	\N	19	1996-11-10
909	V-11486458	TONY	SANCHEZ	04142025261	0	TJBARRIOS@GMAIL.COM	\N	\N	19	1973-01-13
910	V-11226419	JAMILET	PARRA	04242088112	0	ARJUROJAM@GMAIL.COM	\N	\N	19	1971-06-05
911	V-20227061	DAYANA	MENDOZA	04241678395	0	DMENDOZA.DM6@GMAIL.COM	\N	\N	19	1991-06-15
912	V-22900415	KATHERINE	GONZALEZ	04141254662	0	KPAOLAGONZALEZV93@GMAIL.COM	\N	\N	19	1993-05-30
913	V-20221985	KLEIBERTH	VALERA	04241989127	0	KLEIVERTVALERA0307@GMAIL.COM	\N	\N	19	1990-08-26
914	V-19994745	OLIVER	SEGOVIA	04123796966	0	OLIVERANDRES@GMAIL.COM	\N	\N	19	1990-08-11
915	V-9489952	MIGUEL	OBELMEJIAS	04142274445	0	IWORIOSA@HOTMAIL.COM	\N	\N	19	1970-09-29
916	V-11562205	ISVET	PEREZ	04163080140	0	ISVETH0308@GMAIL.COM	\N	\N	19	1973-10-03
917	V-27488315	SARAY	RAMIREZ 	04242374199	0	ALEXRAMIREZPERICO@GMAIL.COM	\N	\N	19	1996-04-15
918	V-14500872	KARLINA	QUINTERO	04125958394	0	AMERICOQUINTERO14@GMAIL.COM	\N	\N	19	1979-11-18
919	V-6379095	GERARDO	GARCIA	04142397708	0	SONRISA2012@HOTMAIL.COM	\N	\N	19	1967-10-01
920	V-15932892	YSVELIS	ZAMBRANO	04169016221	0	ISVELISCZM@GMAIL.COM	\N	\N	19	1983-05-09
921	V-8745948	ALBA	ALVARADO	04142023617	0	LVIMAR6311@GMAIL.COM	\N	\N	19	1963-02-28
922	V-18403861	MILAGROS	CASTILLO	04264019299	0	MILAGROSC236@GMAIL.COM	\N	\N	19	1988-05-14
923	V-20155161	MARIA	CABALLERO	04128130669	0	MCO372@GMAIL.COM	\N	\N	19	1990-05-13
924	V-6388012	EDITO	INFANTE	04264042342	0	EDITO.INFANNTE@ALCALDIASUCRE.NET	\N	\N	19	1961-08-30
925	V-23610659	ELI	AMUNDARAY	04241637815	0	YAMILETJRAMOS19@GMAIL.COM	\N	\N	19	1991-08-01
926	V-13125667	YAMILETH	RAMOS 	04241637815	0	YAMILETHRAMOS19@GMAIL.COM	\N	\N	19	1975-06-18
927	V-17235826	NOHELIS	RAMOS 	04163025728	0	RAMOSNOHELIS@GMAIL.COM	\N	\N	19	1983-08-13
928	V-6119245	SANTA	LORETO	04241440963	0	BETZACARMONA@HOTMAIL.COM	\N	\N	19	1959-06-23
929	V-6501661	EDGAR	BRICENO	04140246493	0	EDGAR_JOSE.B@HOTMAIL.COM	\N	\N	19	1965-01-08
930	V-7945304	RAMON	HERNANDEZ	04125302645	0	MORAILI_HERNANDEZ@HOTMAIL.COM	\N	\N	19	1965-11-25
931	V-6519173	EDWARD	UBAN	04164000854	0	EDWARD.UBAND@GMAIL.COM	\N	\N	19	1968-10-14
932	V-12484626	CIRA	MARIN	04143148136	0	CIRA.MARINIS@HOTMAIL.COM	\N	\N	19	1976-06-15
933	V-5779709	RAMONA	PINEDA	04261894294	0	VLACRUZ_@HOTMAIL.COM	\N	\N	19	1961-01-10
934	V-19812340	ALBANY	CORDOVA	04262792128	0	ALBANYCORDOVA268@GMAIL.COM	\N	\N	19	1990-03-30
935	V-15700979	JOSE	BRIONES	04140291328	0	KAREMIS@HOTMAIL.COM	\N	\N	19	1981-09-09
936	V-12152502	YRIMA	MORGADO	04242199555	0	YRIMAMORGADO@GMAIL.COM	\N	\N	19	1975-04-28
937	V-13992706	MARYORIS	GOMEZ 	04142258085	0	CHEYLEYNNEY17@GMAIL.COM	\N	\N	19	1980-01-25
938	V-25225925	CHEYLEYMMY	BERROTERAN	04142258085	0	CHEYLEYNNEY17@GMAIL.COM	\N	\N	19	1997-02-17
939	V-14198655	CANDY	ALVARADO	04242717768	0	CANDY_ALVARADO1@HOTMAIL.COM	\N	\N	19	1980-06-06
940	V-18037341	NOHELIS	GONZALEZ	04122914013	0	NOELISZZ22@GMAIL.COM	\N	\N	19	1986-11-01
941	V-13950362	MAIGUALIDA	DESANTIAGO	04143334036	0	MAIDECSANTIAGO@GMAIL.COM	\N	\N	19	1977-07-16
942	V-11920228	PEDRO	MENDOZA	04264601974	0	DELIA1CETT45@GMAIL.COM	\N	\N	19	1975-10-03
943	V-11033683	CELEDONIA	ROACH	04261194712	0	CELEDONIA20@GMAIL.COM	\N	\N	19	1969-12-20
944	V-14387483	VICENTA	PEDROZA	04164008059	0	VICENTAPEDROZA2017@GMAIL.COM	\N	\N	19	1978-11-20
945	V-12377066	YUBISAY	ARCIA	04129841607	0	YUBI.ARCIA@GMAIL.COM	\N	\N	19	1976-02-06
946	V-5519701	VICTOR	NEGRIN	04241856035	0	VICTORNEGRINL@HOTMAIL.COM	\N	\N	19	1959-02-25
947	V-13453883	KENYS	ESPINOZA	04168014360	0	KENYESPINOZA84@GMAIL.COM	\N	\N	19	1977-01-15
948	V-18677119	PAOLA	MURGA	04241277260	0	PAOLAMURGA@GMAIL.COM	\N	\N	19	1986-09-19
949	V-26435999	DUBRASKA	GONZALEZ	04141249389	0	DUBRASKAGONZALEZ999@GMAIL.COM	\N	\N	19	1998-05-27
950	V-12383341	YENNY	ALVARADO	04242444082	0	YENNYALVARADO.0416@GMAIL.COM	\N	\N	19	1976-08-01
951	V-18677798	ESTEILIS	ESTE	04149059734	0	ESTEILISESTE_1603@HOTMAIL.COM	\N	\N	19	1989-08-14
952	V-19195810	GUSTAVO	ROSARIO	04241371543	0	GUSTAVO.ROSARIO90@GMAIL.COM	\N	\N	19	1990-11-14
953	V-18708044	JARVIN	BESERRA	04241385722	0	ELIASJARVINBESERRAPEREZ7@GMAIL.COM	\N	\N	19	1988-03-25
954	V-14756473	LADYS	PADRON	04168093988	0	DENISSEP26@GMAIL.COM	\N	\N	19	1982-03-08
955	V-22523281	EDUARDO	ARTIGAS	04241844244	0	EDUARJAM1@GMAIL.COM	\N	\N	19	1995-07-05
956	V-6642483	SANTA	RIVAS	04149059734	0	ESTEILISESTE_1603@HOTMAIL.COM	\N	\N	19	1963-12-22
957	V-9243435	LIBIA	MENDEZ	04241844244	0	EDUARJAM1@GMAIL.COM	\N	\N	19	1966-08-17
958	V-9954179	MARICARMEN	MADRIZ	04241745607	0	MCMQ4@HOTMAIL.COM	\N	\N	19	\N
959	V-5893348	HENRY	QUERALES	04142361102	0	HQ_CC@HOTMAIL.COM	\N	\N	19	\N
960	V-20751677	ERICKA	PINEDA	04164180959	0	ERKINRAFAEL1877@GMAIL.COM	\N	\N	19	1990-12-10
961	V-10746187	YARIZ	RIVERA	04241018884	0	YARISRIVERA367@GMAIL.COM	\N	\N	19	1975-01-04
962	V-21223434	ENDERWIN	CORREA	04126399019	0	AXDERWINJESUS@GMAIL.COM	\N	\N	19	1992-04-12
963	V-5977690	ZORAIDA	GAMBOA 	04241607680	0	zoraida_gamboa@hotmail.com	\N	\N	19	1960-03-28
964	V-24223690	LUIS	DAZA	04142771440	0	RAMON_LRD@HOTMAIL.COM	\N	\N	19	1968-11-27
965	V-16871852	JOSYBEL 	ITRIAGO	04242562380	0	JOSYBELITRIAGO16@GMAIL.COM	\N	\N	19	1985-06-01
966	V-26113013	GABRIELA	FERNANDEZ	04123082554	0	GABYESMERALDA4@GMAIL.COM	\N	\N	19	1997-01-11
967	V-6907209	OSCAR	BRITO	04123625820	0	OSCARBRYTE@HOTMAIL.COM	\N	\N	19	1965-01-24
968	V-6438787	MARIA DE LOS ANGELES	ROBLES DE RIVERA	04261054882	0	MAEMARY61@HOTMAIL.OM	\N	\N	19	\N
969	V-30470436	YOSCARIS 	NARANJO 	04269171905	0	OSCARELISNARANJO@GMAIL.COM 	\N	\N	23	1999-10-26
970	V-9880865	YLSI	ROSO 	04149085013	0	ILSYROSOS@GMAIL.COM	\N	\N	19	1964-09-15
971	V-22492588	OSCARELIS 	NARANJO	04142400890	0	OSCARELISNARANJO@GMAIL.COM 	\N	\N	23	1992-09-24
972	V-5765881	RAMON	GONZALEZ	04143130370	0	DANIAMATERANO6767@GMAIL.COM	\N	\N	19	1963-05-23
973	V-20754875	WILLIANS 	HERNANDEZ 	04140196812	0	WILIANS.J.HERNANDEZ@GAMIL.COM 	\N	\N	23	1993-05-04
974	V-12993039	WENDY 	RAMIREZ 	04149010757	0	WNDYRAMIREZ_1234@HOTMAIL.COM 	\N	\N	23	1976-07-21
975	V-6857422	MIRNA 	ARCIA 	04142753643	0	ARCIAMINIA@GMAIL.COM 	\N	\N	23	1966-05-07
976	V-15331204	EDWIN 	NOGUERA 	04120157728	0	EDWINNOGUER82@GMAIL.COM 	\N	\N	23	1982-02-21
977	V-18031945	GABRIEL	PEREZ	04123775830	0	LOCOSCOS.686@GMAIL.COM	\N	\N	19	1986-05-09
979	V-9361813	MARIA	VIVAS 	04146857611	0	MARIARISAS@HOTMAIL.COM 	\N	\N	23	1965-11-30
980	V-12973039	WENDY	RAMIREZ	04149010757	0	WENDYRAMIREZ_123@HOTMAIL.COM	\N	\N	19	1976-07-21
981	V-16876809	GINDA	LOPEZ	04126066809	0	GINDALOPEZ@GMAIL.COM	\N	\N	19	1982-07-19
982	V-6693822	LISETTE	MICETT	04143052894	0	ANIYELMOLINA@HOTMAIL.COM 	\N	\N	23	1971-02-06
983	V-24596326	PAOLA	JIMENEZ	04242774583	0	PAOLADARKTHRONE@GMAIL.COM	\N	\N	23	1996-04-25
984	V-4887663	YAMELY 	ORTEGA 	04142867315	0	YAMELY_ORTEGA@HOTMAIL.COM 	\N	\N	23	1958-11-23
985	V-12818383	CARLOS	JAIME	04269114207	0	CARLOSJAIME65@GMAIL.COM	\N	\N	23	1977-08-31
986	V-14645767	JOSE 	MORGADO 	04141097661	0	MORGADOCARDOZOJOSELUIS@GMAIL.COM	\N	\N	23	1979-12-24
987	V-17476248	CARLOS 	RODRIGUEZ	04242781707	0	CARLOS09071986@HOTMAIL.COM	\N	\N	23	1986-07-09
988	V-17456248	CARLOS	RODRIGUEZ	04242781707	0	CARLOS09071986@HOTMAIL.COM	\N	\N	23	1986-07-09
989	V-13405961	JUAN	CENTENO	04126103664	0	LS.CONTRERAS44@GMAIL.COM	\N	\N	23	1978-11-15
990	V-10817152	LUIS 	GONZALEZ	04265183525	0	LUISGONZO19@GMAIL.COM 	\N	\N	23	1973-02-20
991	V-12682161	LIONARD 	CONTRERAS	04142252188	0	LS.CONTRERAS44@GMAIL.COM	\N	\N	23	\N
992	V-12682165	YUBISAY	ESPIDEA 	04142741900	0	YUBIESPIDEA@HOTMAIL.COM 	\N	\N	23	\N
993	V-17967455	URIMARE	ESCALANTE 	04125896344	0	ESURIMARE@GAMIL.COM	\N	\N	23	1986-04-25
994	V-15804674	MIOZOTES 	LICOA	04241617421	0	LICOAESTEFANIA21@GMAIL.COM 	\N	\N	23	1979-04-28
995	V-12097357	YURBANY 	LOPEZ 	04242486570	0	YURBANILOPEZ73@GMAIL.COM 	\N	\N	23	1973-10-09
996	V-19877833	YETZAIDA 	VILLAMARIN 	04264862586	0	YETZAIDAVILLAMARIN@GMAIL.COM 	\N	\N	23	1991-09-04
997	V-15942937	YURIS	PINEDA	04164180959	0	YURISPINEDA83@GMAIL.COM	\N	\N	19	1983-10-15
998	V-12711054	YOLAIDY	ROJAS	04241558915	0	MILI240873@HOTMAIL.COM	\N	\N	19	1975-08-24
999	V-14908430	GLADYS 	ZAMBRANO 	04123696896	0	GLADYSSAMBRANO@HOTMAIL.COM	\N	\N	23	1979-06-21
1000	V-14281656	CARMEN	FRANCISCONY 	04241898389	0	ELIZAFRANCISCONY@GMAIL.COM	\N	\N	23	1980-11-07
1001	V-19380587	RIVERO 	JIMENEZ 	04242198923	0	RONALDJJR66@GMAIL.COM 	\N	\N	23	1988-06-05
1002	V-16321849	LIONARD	CONTRERAS	04142252188	0	LS.CONTRERAS44@GMAIL.COM	\N	\N	23	\N
1003	V-10511366	YARI	ROLDAN 	04125595083	0	YMRA1969@GMAIL.COM	\N	\N	23	1969-01-13
1004	V-10169674	RIGOBERTO 	ZAMBRANO	04129293764	0	ZAMBRANOR29@GMAIL.COM  	\N	\N	23	1968-12-23
1005	V-6018389	THENNY 	ROLDAN	04126181120	0	THENNYPON89@GAMIL.COM 	\N	\N	23	1960-06-17
1006	V-13692716	MILAGROS	DOMINGUEZ	04123753035	0	MILIDOMINGUEZ79@GMAIL.COM	\N	\N	23	1979-07-06
1007	V-11025977	GISET	MACHADO	04168101155	0	GISETMACH@HOTMAIL.COM	\N	\N	23	1968-09-10
1008	V-15439314	MARY	URBAEZ	04261201614	0	MARYBAEZ09@GMAIL.COM	\N	\N	23	1981-03-28
1009	V-16343128	LEYDI	GASPAR	041223632784	0	DANIAMATERANO6767@GMAIL.COM	\N	\N	23	1985-01-11
1010	V-23616174	YENNIFER	TORREGLOSA	04142582998	0	DAVIER123@HOTMAIL.COM	\N	\N	23	1989-12-25
1011	V-10506202	KEYLA 	MAITA	04168300856	0	KEYLAMAITA2@GMAIL.COM	\N	\N	23	1969-09-10
1012	V-12961103	MARILYN 	GARCIA 	04242499227	0	MARILINGARCIA500@GMAIL.COM 	\N	\N	23	1976-06-05
1013	V-6894392	JOSEFINA 	GOMEZ	04264476455	0	LA_RECORDADA@HOTMAIL.COM 	\N	\N	23	1963-09-18
1014	V-6895922	MARIA 	ARISMENDI 	04143960328	0	VICTOR0055RA@GAMAIL.COM 	\N	\N	23	1965-12-29
1015	V-18555029	KELVIS 	UGUETO 	04241745677	0	WILDERJSERRANO@GMAIL.COM 	\N	\N	23	1956-11-04
1016	V-14286249	DAYANA	SANDOVAL 	04143262986	0	DSANDOVALALFARO@GAMAIL.COM  	\N	\N	23	1978-01-27
1017	V-83772051	REALES 	REALES	041223906539	0	ELEAZAR_MOTTA@GOTMAIL.COM 	\N	\N	23	1966-10-08
1018	V-12667682	MARIBEL	REALES 	04123906539	0	ELEAZAR_MOTTA@GOTMAIL.COM	\N	\N	23	1964-08-17
1019	V-6144591	MARTHA	ALFARO	04143262986	0	DSANDOVALALFARO@GAMAIL.COM	\N	\N	23	\N
689	V-7958123	ROSA	RODRIGUEZ	04241903007	0	ROSA.RDELANGUISI@GMAIL.COM	\N	\N	23	\N
1020	V-10519963	SANDRA	SARRAZA	04261181092	0	RODI160661@GAMIL.COM 	\N	\N	23	\N
1021	V-24593496	JACKNELYS	GONZALEZ 	04262976880	0	JACKEELYS093@GMAIL.COM 	\N	\N	23	1993-09-17
1022	V-9062360	FELICIA 	DIAZ 	04122695559	0	FELICIAAPD1612@GMAIL.COM 	\N	\N	23	1964-12-16
1023	V-6683545	FRANCISCO 	NIEVES 	04241466688	0	JAVIERNIEVES414@GAMIL.COM 	\N	\N	23	1975-03-22
1024	V-26210979	MARIA 	COLINA 	04129144962	0	PAOLARONDON77@GMAIL.COM 	\N	\N	23	1995-11-28
1025	V-14050949	RAUL 	PARRA 	04169106134	0	ING.RAULPARRA@GMAIL.COM 	\N	\N	23	1979-04-30
1026	V-15800017	WOLFANF 	PAEZ 	04127072530	0	WOLFANEPAEZH@GMAIL.COM 	\N	\N	23	1981-11-28
1027	V-16359863	DAYANA	AGUILERA 	04242097029	0	DYA_181@HOTMAIL..COM	\N	\N	19	1984-08-15
1028	V-12916924	EDICZA	GONZALEZ	04142314762	0	GONZALEZEDICZA59@GMAIL.COM	\N	\N	19	1976-03-25
1029	V-18275419	GLENNY 	ACOSTA 	04241902347	0	GLENNYACOSTA@HOTMAIL.COM	\N	\N	23	1987-04-20
1030	V-17531271	YESSICA	RAMIREZ	04242869821	0	YESSICARAMIREZ024@GMAIL.COM	\N	\N	19	1984-05-29
1031	V-18819407	ENY	RAMIREZ 	04123901257	0	ENNYLAFLACA@HOTMAIL.COM	\N	\N	19	1989-01-25
1032	V-24317652	AYARI	MARTINEZ	04142704310	0	AYARINMT@GMAIL.COM 	\N	\N	23	1991-12-29
1033	V-8497987	DAYANIRA	MARTINEZ	04142258248	0	DEYANIRA11.MARTINEZ@HOTMAIL.COM	\N	\N	19	1966-09-04
1034	V-17554531	GABRIELA 	BATA 	04242645838	0	GABRIELABATA@GMAIL.COM 	\N	\N	23	1987-06-25
1035	V-14452990	DAYURIMARE	GONZALEZ	04243625087	0	DAYURE@GMAIL.COM	\N	\N	19	1981-05-18
1036	V-6315275	JORGE	MONSALVE 	04269063111	0	JORGELUISMONSALVE24@GMAIL.COM	\N	\N	19	1965-11-02
1037	V-23612093	LUIS	CARTAYA	04263157841	0	JORGELUISMONSALVE24@GMAIL.COM	\N	\N	19	1981-11-16
1038	V-10884171	JULITZA	LEON 	04249532219	0	LEONJULITZAMA@GMAIL.COM	\N	\N	19	1973-04-23
1039	V-4277507	NORA	GUERRERO	04142867665	0	NORITA.GUERRERO24@GMAIL.COM	\N	\N	19	1956-09-24
1040	V-17286500	ANA	AZUAJE	04127259293	0	ANALUNA3285@GMAIL.COM	\N	\N	19	1985-03-04
1041	V-12824188	ELISA	PEREZ	04129637693	0	ELISIAPEREZPEREZ@GMAIL.COM	\N	\N	19	1969-03-03
1042	V-9367276	MARIA	PEREZ	04241338438	0	MARIACONSUELOPEREZF@GMAIL.COM	\N	\N	19	1965-08-13
1043	V-10384368	DAYHANA	LARA	04168219443	0	DAYHANALARA@HOTMAIL.COM	\N	\N	19	1971-02-12
1044	V-14774153	DAHIXIRY	RODRIGUEZ	04142340662	0	DAHIXIRY_COROMOTO@HOTMAIL.COM	\N	\N	19	1978-01-14
1045	V-5631461	MARIA	BASTIDAS	04242393678	0	BASTIDAS0616@GMAIL.COM	\N	\N	19	1959-07-09
1046	V-14165962	ARGENIS	MUJICA	04123848169	0	TORRES_220561@HOTMAIL.COM	\N	\N	19	1980-10-17
1049	V-12909409	BLANCA	CABRERA	04241730523	0	SAINTAIMECABRERA@HOTMAIL.COM	\N	\N	19	\N
1050	V-12260289	YSMELDE	ZAMBRANO	04143728043	0	YAMILETHBRAYAN@HOTMAIL.COM	\N	\N	19	1975-05-30
1047	V-4246792	MIRALDI	GUDINO	04142904037	0	MIRAL54@HOTMAIL.COM	\N	\N	23	\N
1048	V-5074955	GONZALEZ	ANA	04127319817	0	ANACARO_61@HOTMAIL.COM	\N	\N	23	\N
1051	V-6233529	ESTHER	LOPEZ	04129290310	0	JACKYJEANTH@HOTMAIL.COM	\N	\N	19	\N
1052	V-18994779	ELDERBER 	GIL	04262151564	0	YORLENISGIL@GMAIL.COM 	\N	\N	23	1988-07-08
1053	V-5410675	MILAGRO 	REYES	04262117670	0	MILAGROSREYESDOMINGUEZ@GMAIL.COM 	\N	\N	23	1958-03-16
1054	V-6166551	GRANIERO DE GONZALEZ	JACKELINE MARIA	04120579212	0	RAFAELGONZALEZ05@GMAIL.COM	\N	\N	1	\N
1055	V-13285135	ADRIANA	APONTE	04242285983	0	MANDALOVIDAMAR@GMAIL.COM	\N	\N	1	\N
1056	V-82263532	EBERTO 	BARBOZA	04142549922	0	EVERTOBARBOZA96@GMAIL.COM 	\N	\N	23	1963-10-20
1057	V-10391766	OSMEL	CONTRERAS	04242203974	0	OSMELJOSECONTRERASROJAS@GMAIL.COM	\N	\N	1	1969-02-18
1058	V-6234749	REYES	RODRIGUEZ	04143265562	0	ARACELA06@HOTMAIL.COM	\N	\N	1	1967-06-10
1059	V-16030430	ELENA 	GOMEZ 	04141184618	0	ELENA8K@GMAIL.COM 	\N	\N	23	1983-01-04
1060	V-10480664	NORA 	GUTIERREZ 	04129990523	0	NARIBEL12@OUTLOOK.COM 	\N	\N	23	1972-11-21
1061	V-19430728	YAJAIRA	MARTINEZ	04123681954	0	MARTINEZ_YAJAIRA@OUTLOL.ES	\N	\N	1	1987-03-21
1062	V-13420914	ALITZA	BRACHO	04120980780	0	ALITZA_LUCIA@HOTMAIL.COM	\N	\N	1	1977-11-17
327	V-16599198	NIURKA	VIELMA	04122533073	0	VIELMA_H_TEEI@GMAIL.COM	\N	\N	23	\N
1063	V-6653971	ALBANIA 	MONTILLA	04144921854	0	ALBA-LALA@HOTMAIL.COM 	\N	\N	23	1968-09-26
1064	V-16600960	MARILYN	YEGUEZ	04129396503	0	MARILINYEGUEZ83@GMAIL.COM	\N	\N	1	1983-08-02
1065	V-20135109	AZUAJE 	JOSMARY	04142132438	0	JOSMARY_KARINA1@HOTMAIL.COM 	\N	\N	23	1990-02-02
1066	V-13384946	CAROLINA	UZCATEGUI	04169109874	0	CARO1262008@HOTMAIL.COM	\N	\N	1	1978-06-12
1067	V-19658134	BRAYAN 	FRENANDEZ 	04242229273	0	BRAYANFR00@GMAIL.COM 	\N	\N	23	1991-09-23
1068	V-15582908	ANA 	RODRIGUEZ	04143125052	0	ENLEROMERO281107@GMAIL.COM 	\N	\N	23	1981-11-24
1069	V-14064471	ERAINE 	GONZALEZ	04265110343	0	GERAINER@HOTMAIL.COM	\N	\N	23	1979-01-19
1070	V-10520459	JOSE	ROSALES	04168355715	0	ABRAHAM1130@GMAIL.COM	\N	\N	1	1967-11-30
1071	V-16087079	CARMEN	URBINA 	04261068461	0	CARMENURBINA11@GMAIL.COM 	\N	\N	23	1984-01-21
1072	V-12260772	ROSAURA	HERNANDEZ	04242322435	0	HROSANNA36@GMAIL.COM	\N	\N	1	1972-05-03
1073	V-10526923	YAMILETH	DEL ROSARIO	04268214431	0	GYAMILETH23@GMAIL.COM	\N	\N	19	\N
1074	V-3189070	JHONNY	IBARRA	04123737208	0	JOHNNYIBARRAPATIÑO@GMAIL.COM	\N	\N	19	\N
1075	V-12837426	DANIEL	ACUNA 	04242007573	0	ELCHINOFMV@GMAIL.COM	\N	\N	19	1973-09-22
1076	V-13515513	FREDDY 	ESPINOZA 	04122093624	0	FREDDYAEG78@GMAIL.COM 	\N	\N	23	1978-02-21
1077	V-15572268	OMAR 	TRILLO	04164222697	0	OMARTRILLO@HOTMAIL.COM 	\N	\N	23	1982-10-01
1078	V-12056514	DANIELA 	PALACIOS 	04142310761	0	DANIELAPALACIOS12.DP@GMAIL.COM 	\N	\N	23	1973-09-20
1079	V-11161203	FLOR 	GARCIA 	04149239416	0	FLORGARCIA994@GMAIL.COM 	\N	\N	23	\N
1080	V-25207084	YASMERI	FERMIN	04129985817	0	YASMELIFERMIN7@GMAIL.COM	\N	\N	19	1994-03-25
1081	V-6516425	OLGA	OSORIO	04142912388	0	HELLENHENRIQUEZ21@GMAIL.COM	\N	\N	19	1967-06-25
1082	V-19380994	DOSMERY	TORO	04128035024	0	HELLENHENRIQUEZ.2108@GMAIL.COM	\N	\N	19	1987-11-12
1083	V-11029908	ELENA	OSORIO	04129189271	0	HELLENHENRIQUEZ.21@GMAIL.COM	\N	\N	19	1972-01-08
1084	V-13245857	MIRIAM	CENTENO 	04269141357	0	CENTENOMIRIAM@GMAIL.COM	\N	\N	19	1974-02-14
1085	V-22783336	BENJAMIN 	ACEVEDO 	04242254659	0	BENJA.ACV2.MIJARES@GAMIL.COM 	\N	\N	0	1992-09-18
1086	V-20097431	HILBELIS 	RODRIGUEZ	04141347820	0	HILBELISJOSELIN@GAMIL.COM 	\N	\N	23	1991-01-01
1087	V-11310911	MARIA	SALAZAR	04127321294	0	FABIOLASALAZAR1907@GMAIL.COM	\N	\N	19	1973-07-09
1088	V-26435455	MARIA	MENDOZA 	04143077943	0	MANDOZAM2162@GMAIL.COM 	\N	\N	23	1996-04-06
254	E-82296106	WILLIAM	SANCHEZ	04149065165	0	PERMIROSAL.3000@GMAIL.COM	\N	\N	19	1976-10-29
1089	V-14109372	JOSELI	GONZALEZ	04162112476	0	JOSELIGON50@HOTMAIL.COM	\N	\N	19	\N
978	V-6358480	JORGE 	QUINTERO	04143361131	0	WENDYRAMIREZ_1234@HOTMAIL.COM	\N	\N	19	1962-11-05
1090	V-24436319	ANA	GARIZABALO 	04143077943	0	MENDOZAM2162@GMAIL.COM 	\N	\N	23	1968-06-20
1091	V-20192281	ARIANNY 	VELASQUEZ 	04125486340	0	DANNAMARCANO@HOTMAIL.COM 	\N	\N	23	1990-10-11
1092	V-25210703	GUSTAVO 	SILVA 	04242702926	0	GUSTAVO7SILVA@GAMIL.COM 	\N	\N	23	1997-01-19
1093	V-15342886	KELLY	ROMANO	04242954211	0	KELLY1010PATRICIA@HOTMAIL.COM	\N	\N	19	1981-03-10
1094	V-10147488	PABLO	HENANDEZ	04241435452	0	PABLO6360@HOTMAIL.COM	\N	\N	19	1963-05-26
1095	V-6075905	ORLANDO	BASTARDO	04242011892	0	BASTARDOORLANDO4@GMAIL.COM	\N	\N	19	1956-09-30
1096	V-9139171	JOSE	VIVAS	04164050694	0	JOSEFVIVAS24@GMAIL.COM	\N	\N	19	1966-01-25
1097	V-12562991	RICHARD 	GERARDO 	04242219549	0	GERARDO.RICHARD@GAMIL.COM 	\N	\N	23	1976-07-06
1098	V-19351001	YOSELYN 	SIVIRA 	04241399548	0	YOSELINSIVIRA99@GMAIL.COM 	\N	\N	23	1988-09-09
1099	V-15581289	ERIKA	GONZALEZ	04122141484	0	VANESSAGONZALEZ2525@GMAIL.COM	\N	\N	19	1982-03-25
1100	V-16674327	ELIZABETH 	REALES 	04123906539	0	ELEAZAR_MOTTA@GOTMAIL.COM	\N	\N	23	\N
1101	V-9482473	YOMAIRA 	RONDON 	04142047393	0	YRONDON394@GMAIL.COM 	\N	\N	23	\N
1102	V-12762672	ODALIS 	CARRASQUEL	04242830002	0	ODALISCARRASQUEL@HOTMAIL.COM 	\N	\N	23	\N
1103	V-11166544	KATIUSKA	RUSSO	04143206042	0	KATIRUSS@HOTMAIL.COM	\N	\N	19	\N
1104	V-18042963	ELIBETH	GONZALEZ	04242751217	0	TAZMANIA_2711@HOTMAIL.COM	\N	\N	19	\N
1105	V-10537650	IRIAN 	ALVARADO 	04149393704	0	IRIANALVARADO40@GMAIL.COM 	\N	\N	23	\N
1106	V-11612501	MARIA	LOPEZ	04163105650	0	MARIALORENZA@HOTMAIL.COM	\N	\N	19	\N
1107	V-12461954	KARLA	PACHECO	04141736030	0	KARLAYSP19@HOTMAIL.COM	\N	\N	19	\N
1108	V-12671239	LEONEL 	ORTEGA 	04129952852	0	LEO23ORTEGA@GMAIL.COM 	\N	\N	23	\N
1109	V-13066088	MARIANA	GUTIERREZ	04242171104	0	LAGUTI.MARIANA@GMAIL.COM	\N	\N	19	\N
1110	V-6041366	JULIA 	NAVARRO 	04268143082	0	JULIAVEDANAVARRO@GMAIL.COM 	\N	\N	23	\N
1111	V-14017326	AMBAR	YUSTI	04241195884	0	AMBARYUSTI@GMAIL.COM	\N	\N	19	\N
1112	V-10002724	ANHELIS 	GIL	04264087010	0	ANHSUYIN@GMAIL.COM 	\N	\N	23	\N
1113	V-6727353	NANCY 	FERNANDEZ 	04266065419	0	NANCYTAF65@GMAIL.COM 	\N	\N	23	\N
1114	V-6901353	ROSA 	OROPEZA 	04242332980	0	ROSAOMAIRAOROPEZA@GMAIL.COM 	\N	\N	23	\N
1115	V-16574252	ANEYDA	SOSA	04242193539	0	ANEYDASOSA@GMAIL.COM	\N	\N	19	1980-05-26
1116	V-6239934	CARMEN 	CAMPOS 	04264153537	0	MISLEOS0919@GMAIL.COM 	\N	\N	23	\N
1117	V-12358480	YENNI	REYES	04241196920	0	MARILIN_50@HOTMAIL.COM	\N	\N	19	1974-12-05
1118	V-6226439	MARIA 	CAICEDO	04242836299	0	LEO23ORTEGA@GMAIL.COM	\N	\N	23	\N
1119	V-12057912	YOLIMAR 	TORREALBA 	04241766755	0	YOLIMARTORREALBA71@GAMIL.COM 	\N	\N	23	\N
1120	V-9414608	JOSE 	SULBARAN 	04244636166	0	REINALDOSULBARAN@GMAIL.COM 	\N	\N	23	\N
1121	V-22523011	MARIA 	CALDERON	04129223213	0	MARIELIN27@GMAIL.COM 	\N	\N	23	\N
1122	V-22689633	MANUEL 	CORREA 	04129223213	0	MARIELIN27@GMAIL.COM	\N	\N	23	\N
1123	V-8902951	FREDDY 	VELASQUEZ 	04141710029	0	LIBIAMCOLORADO@GMAIL.COM 	\N	\N	23	\N
697	V-14142495	MARIELA	DURAN	04166048560	0	MARIELADURANV@HOTMAIL.COM 	\N	\N	23	\N
1124	V-3711098	MARITZA 	TERAN 	02126936009	0	ELBATCISNEROS@GMAIL.COM 	\N	\N	23	\N
1125	V-4218570	LIVIDA 	SIMOZA 	04143020477	0	ACRS0212@GMAIL.COM 	\N	\N	23	\N
1126	V-11084088	ALI	PRIETO	04163045839	0	ALI_PRIETO2471@HOTMAIL.COM	\N	\N	19	1971-04-24
1127	V-12835136	GUSTAVO	ANGULO	04141217443	0	GUSTAVO21977@GMAIL.COM	\N	\N	19	1977-10-02
1128	V-10257566	MARIA	SULBARAN	04129100047	0	PAULASULBARAN.15@GMAIL.COM	\N	\N	19	\N
1129	V-4312160	ONEIDA	ESTANGA	04265822449	0	ONEIDAJ.E.R.@GMAIL.COM	\N	\N	19	\N
1130	V-7929999	LEIDA	RODRIGUEZ	04262214770	0	LEIDARODRIGUEZ08@HOTMAIL.COM	\N	\N	19	\N
1131	V-12834596	ONEYDA	TOYO	04141140488	0	ONEYDA.TOYO2211@HOTMAIL.COM	\N	\N	19	\N
1132	V-14267380	OSCAR 	MARQUINA 	04264184403	0	MIREYASOSA@GMAIL.COM 	\N	\N	23	1975-07-23
1133	V-15787804	YEICY 	TORRES 	04141002857	0	YEITOR@HOTMAIL.COM 	\N	\N	23	1981-04-20
1134	V-14585835	LILIA 	MONROY 	04241377716	0	CHIC_CAROLINA@HOTMAIL.COM 	\N	\N	23	1978-11-16
1135	V-21469372	JOSE 	PEREZ 	04127008210	0	CONFECCIONESCROOSPINE@GMAIL.COM 	\N	\N	23	1993-07-28
1136	V-12729637	PIA 	CAPOTE	04127008210	0	CONFECCIONESCROOSPINE@GMAIL.COM	\N	\N	23	1974-12-25
1137	V-10181168	AIDA 	FLORES 	04127008210	0	CONFECCIONESCROOSPINE@GMAIL.COM	\N	\N	23	1968-12-23
1138	V-12627997	MILAGROS	REYES	04125646185	0	LALITA171175@GMAIL.COM	\N	\N	19	1975-11-17
1139	V-6962123	PABLO	COLMENARES	04242905699	0	YENYMAYELINOJEDA@GMAIL.COM	\N	\N	19	1965-01-24
1140	V-10486048	MIGUEL	BASTIDAS	04269093837	0	BASTIDASMIGUEL@GMAIL.COM	\N	\N	19	\N
1141	V-8748466	EDUARDO	UTRERA	04123766911	0	YAIUTRERA@GMAIL.COM	\N	\N	19	1965-04-03
1142	V-27876864	YOHANDRY	VALERA	04143287951	0	YOHANDRYVDVMEJIA@GMAIL.COM	\N	\N	19	1999-07-30
1143	V-21516547	YETSSYVETH	CHIRINOS	04140440437	0	YETCHIGO94@GMAIL.COM	\N	\N	19	1994-08-05
1144	V-25969348	KEVIN	RAMOS 	04242022386	0	KEVINJRBITO@GMAIL.COM	\N	\N	19	1994-10-10
1145	V-13128703	LISBETH	OSECHAS	04127203370	0	LISBETH1036@GMAIL.COM	\N	\N	19	1977-03-24
1146	V-10111351	ELIANA	BOLIVAR	02125527504	0	ELIANACAROLYN@GMAIL.COM	\N	\N	19	1969-12-29
1147	V-6110646	SERGIO	LAYA	04160101967	0	SERGIO-ABRHAM9@HOTMAIL.COM	\N	\N	19	1962-06-11
1148	V-5965583	DOMINGO	APONTE	04141326441	0	DOMINGO959@HOTMAIL.COM	\N	\N	19	1959-09-11
1149	V-19738423	TRINO	MEJIAS	04142722978	0	NT_TRINO@HOTMAIL.COM	\N	\N	19	1991-12-11
1150	V-10864394	FERNANDO	ROJAS	04128117881	0	FGRM1968@GMAIL.COM	\N	\N	19	1968-01-07
1151	V-13419870	YIRSA	CORDOBA	04242996108	0	yirsacor75@hotmail.com	\N	\N	19	1975-11-18
1152	V-12831650	YUSMIRIAN	RAMIREZ	04265127415	0	YUSMIRIAN5@GMAIL.COM	\N	\N	19	1976-08-22
1153	V-14017014	DELIA	RIVAS	04144668155	0	DELIASEBSEBSERZ@GMAIL.COM	\N	\N	19	1980-01-01
1154	V-20362570	MERILIN	VELASQUEZ	04242522288	0	MERILINSVF@GMAIL.COM	\N	\N	19	1990-11-26
1155	V-17815177	RUDDY	ROSALES	04168270664	0	ROSALESRUDDY36@GMAIL.COM	\N	\N	19	1986-06-13
1156	E-84386191	FELIX	MARTINEZ	04141260854	0	FELIXELCUBANO@GMAIL.COM	\N	\N	19	1963-07-28
1157	V-6440894	AURORA	ROSALES	04269076398	0	AURORAROSALES12@GMAIL.COM	\N	\N	19	1961-05-12
1158	V-9137217	RAMON	BURQUILLO	04241069388	0	BURQUILLOGENIUS@HOTMAIL.COM	\N	\N	19	1961-10-19
1159	V-12835645	FERNANDO	VIZCAYA	04268533447	0	FERNANDOVIZCAYA8@GMAIL.COM	\N	\N	19	1971-04-30
1160	V-17558155	JOSE	PENA	04149901024	0	JOSEDANILO_17@HOTMAIL.COM	\N	\N	19	1984-07-28
1161	V-20028451	GERALDINE	SERRANO	04142191565	0	GERALDINEUNSR@HOTMAIL.COM	\N	\N	19	1989-04-18
1162	V-13873565	NINOSKA	PAEZ	04129745197	0	NINOCORRO@HOTMAIL.COM	\N	\N	19	1977-07-31
1163	V-24335646	ANAIS	LADEUS	04262115401	0	IRENEYOHANA132@GMAIL.COM	\N	\N	19	1991-09-15
1164	V-22047392	ELIZABETH	CALVO 	04242424404	0	ELIZACALVO31@GMAIL.COM	\N	\N	19	1994-03-31
1165	V-12358563	MERVIN	PLAZA 	04241578676	0	MORENOROSMERY417@GMAIL.COM	\N	\N	19	1975-11-05
1166	V-15557798	LUIS	VARGAS	04165275832	0	LUISVARGAS1604@GMAIL.COM	\N	\N	19	1980-06-11
1167	V-10315598	LARRY	BASTIDAS	04120207955	0	LACHINA_20@HOTMAIL.COM	\N	\N	19	1969-10-19
1168	V-27439608	MARIA	GONZALEZ	04261825632	0	MARIFER_117@HOTMAIL.COM	\N	\N	19	1973-05-03
1169	V-469172	CUSTO	ARROYO	04269066770	0	ALEXISARROYO1954@HOTMAIL.COM	\N	\N	19	1954-10-31
1170	V-14926466	LUZ	ALVARADO	04264892144	0	LOAN2401@GMAIL.COM	\N	\N	19	1978-05-21
1171	V-20302526	ARIANMY	COLLS	04142261995	0	ICARYCOLLS@GMAIL.COM 	\N	\N	23	1990-05-05
1172	V-18037820	YESSICA	RAMIREZ	04266126994	0	YESICATECPENSA@HOTMAIL.COM	\N	\N	19	1987-10-08
1173	V-18640997	INGRID	DIAZ 	04167338868	0	DIAZBLANCOINGRID@GMAIL.COM	\N	\N	19	1982-04-07
1174	V-10790319	CARLOS	MORALES 	04242426564	0	MAKEY-100@HOTMAIL.COM	\N	\N	19	1972-01-03
1175	V-16117541	MIGUEL	DELGADO 	04127001858	0	VI6117541@HOTMAIL.COM	\N	\N	19	1981-12-11
1176	V-6318523	RAFAELA	NARANJO	04263272178	0	WHITNEYULIANA2021@HOTMAIL.COM	\N	\N	19	1965-01-14
1177	V-19228733	YEFERSON 	YDROBO	04262189426	0	YEFFERSONYDROBO@GMAIL.COM 	\N	\N	23	1987-09-13
1178	V-9099820	CARMEN	TINEO	04243444504	0	ANARELYSTINEO@GMAIL.COM 	\N	\N	23	1964-12-15
1179	V-9957235	OMAR 	DAVILA	04242090784	0	IFOIMPORT104CA@HOTMAIL.COM 	\N	\N	23	1966-10-09
1180	V-15844903	HERLLIS	VEGA 	04143119812	0	ANSONI1@HOTMAIL.COM 	\N	\N	23	1980-03-17
1181	V-6961530	CLARA 	DIAZ	04143032320	0	DIAZCLARA04@GMAIL.COM 	\N	\N	23	1963-01-28
240	V-10474108	SILVIA	ROJAS	04168368906	0	SILVIACORO.071@GMAIL.COM	\N	\N	23	\N
1182	V-16376100	ARAUJO	WILMER 	04241560110	0	ARAUJOWILMER796@GMAIL.COM 	\N	\N	23	1979-07-10
1183	V-16168789	XIOLIMAR	POLANCO	04242090784	0	IFOIMPORT104CA@HOTMAIL.COM	\N	\N	23	1983-07-10
1184	V-19288857	JHONATHAN 	AREVALO	04242090784	0	IFOIMPORT104CA@HOTMAIL.COM	\N	\N	23	1988-10-16
1185	V-21377095	BURGUILLO 	YUDEISY 	04242707007	0	JACKELINEBURGUILLO285@GMAIL.COM 	\N	\N	23	1986-03-16
1186	V-14775262	YELITZA	MERINO 	04126123561	0	YELIGERE-22@HOTMAIL.COM	\N	\N	19	1981-10-24
1187	V-22777100	JEFERSON 	SOJO 	04142526832	0	DJ.JEFERSON.SOJO@GAMAIL.COM 	\N	\N	23	1994-05-05
1188	V-6302433	MANUEL	SOJO 	04164013944	0	DJ.JEFERSON.SOJO@GAMAIL.COM	\N	\N	23	1962-01-15
1189	V-12055455	CARMEN	ALVAREZ	04261179430	0	CARMENJ1904@HOTMAIL.COM	\N	\N	19	1973-02-19
1190	V-19023202	GUZMAN 	YAJAIRA	04242696603	0	JAIROGUZMAN595@GMAIL.COM 	\N	\N	23	\N
1191	V-12403081	ANYERLING	RIVAS	04143231032	0	ARIVAS599@GMAIL.COM 	\N	\N	23	1975-09-28
1192	V-16198789	XIOLIMAR	POLANCO	04242090784	0	IFOIMPORT104CA@HOTMAIL.COM	\N	\N	23	1983-07-17
1193	V-17981123	KLEIBERT	GONZALEZ	04123740499	0	kleibers.gonzalez@hotmail.com	\N	\N	19	1987-12-31
1194	V-11564126	ALEXANDER	LINARES	04167145008	0	DEIVISQUINTERORIVAS@GMAIL.COM	\N	\N	19	1974-05-30
1195	V-19986844	GERMANIA 	ROMERO 	02125736474	0	CAROLYNAROMERO05@GAMIL.COM 	\N	\N	0	1990-04-05
1196	V-24831947	NEIVIS	LOPEZ	04149277257	0	MARTIN_6908@OUTLOOK.COM	\N	\N	19	1991-10-23
1198	V-6894357	JOSE	BLANCO 	04162147449	0	CAJADEAHORROIACFA@GMAIL.COM 	\N	\N	23	1964-06-11
1199	V-6073742	DAXELYS	TIAPA	04241309970	0	MARTIN_6908@OUTLOOK.COM	\N	\N	19	1972-08-10
1197	V-19710261	NOHELI 	HERRERA 	04241017830	0	ADRIANA_2881@HOTMAIL.COM 	\N	\N	23	1991-09-28
1200	V-23682674	YANET	ALARCON 	04242558780	0	LENNYSSITA@GMAIL.COM	\N	\N	19	1964-02-08
1201	V-16285150	KELVIS	CASTELLANO 	04127270548	0	KELVISRONDY@GMAIL.COM	\N	\N	19	1982-06-29
321	V-5141104	SAMUEL	PINTO	04241775417	0	SAMMIPINTO2013@GMAIL.COM	\N	\N	23	\N
1202	V-6336780	JUAN	FIGUERA	04122979866	0	JUANFIGUERA.969.@HOTMAIL.COM	\N	\N	19	1969-05-19
1203	V-9398802	YAXINARDO 	CALDERON 	04241524530	0	YAXINARDO67@GAMIL.COM 	\N	\N	23	\N
1204	V-15190497	YENNY	VASQUEZ	04241350886	0	YENNYMARIAVASQUEZ76@GMAIL.COM	\N	\N	19	1976-08-23
1205	V-12049928	MIGUEL	PULIDO	04241350886	0	YENNYMARIAVASQUEZ76@GMAIL.COM	\N	\N	19	1970-06-28
1206	V-18460498	JOEL 	TOVAR 	04129126857	0	JOELTOVAR739@GMAIL.COM	\N	\N	23	\N
1207	V-4853828	JUDITH	MIJARES 	04141132771	0	MIREINA58@HOTMAIL.COM 	\N	\N	23	\N
1208	V-14406298	ADEGLIS 	MENDOZA 	04141044874	0	ADEGLIS78@GMAIL.COM 	\N	\N	23	\N
1209	V-13459729	SARAY 	ORTUÑO 	04142456528	0	SARAYORTUÑO@GMAIL.COM  	\N	\N	23	\N
1210	V-3994655	MARIA 	ANGULO 	04129629773	0	YUBENLEON036@GMAIL.COM 	\N	\N	23	\N
1211	V-10633167	MIRNA 	MIJARES	04263660662	0	MIRNAMIJARES@HOTMAIL.COM 	\N	\N	23	\N
1212	E-32895342	PAOLA	PACHECO 	04142132999	0	PAULAAHD09@GMAIL.COM	\N	\N	19	1979-08-08
1213	V-32895342	PAOLA	ARIAS	04241812200	0	PAULAAHD09@GMAIL.COM	\N	\N	19	1979-08-08
1214	V-15930871	MARIA 	JARAMILLO 	04264191254	0	MJ924076@GMAIL.COM 	\N	\N	23	1972-11-19
1215	V-19396079	CHRISTIAN 	GONZALEZ 	04241509787	0	CHRISTIANKEILA19@GMAIL.COM 	\N	\N	23	1988-05-22
1216	V-12293581	JONATHAN 	ROMERO 	04142322497	0	ORIGINALBOYKEN@GMAIL.COM 	\N	\N	23	1976-04-16
1217	V-15700822	ADRIANA	VILLEGAS	04242797448	0	MARIANGONZ9@GMAIL.COM	\N	\N	19	1981-01-05
1218	V-20801842	TANIUSKA 	GONZALEZ	04125512761	0	AKSUINAT_15@HOTMAIL.COM 	\N	\N	23	1991-12-15
1219	V-11026477	YELITZA 	NUÑEZ	04265166045	0	YELINATHALI19@GMAIL.COM 	\N	\N	23	1972-09-10
1220	V-18492025	MARIAM	VILLEGAS	04241085800	0	MARIAMGON29@GMAIL.COM	\N	\N	19	1987-09-20
1221	V-6693118	ISABEL 	GONZALEZ 	04122557303	0	ISABELLAGONZALEZ.1967@GMAIL.COM 	\N	\N	23	1967-11-19
1222	V-18814541	MONICA 	MANSILLA 	04242363478	0	ACINOM.SMA24@GMAIL.COM 	\N	\N	23	1989-06-24
1223	V-11063501	ERASMO	MERCADO	04167205527	0	CARMENJOSEF46@GMAIL.COM	\N	\N	19	1973-02-02
1224	V-12500448	GELVIS	CARRION 	04167205527	0	CARMENJOSEF46@GMAIL.COM	\N	\N	19	1973-07-16
1225	V-15835779	MARIA	GARCIA	04127287688	0	ENMANUELMARIA@HOTMAIL.COM	\N	\N	19	1982-07-17
1226	V-14163165	ARMANDO	RAMIREZ	04141109705	0	MINEBODILY@HOTMAIL.ES	\N	\N	19	1979-09-09
1227	V-17557396	BETSY 	RONDON 	04264053408	0	BETSY.98@GAMIL.COM 	\N	\N	23	1984-09-05
1228	V-19368869	CARLOS	MATOS	04241701095	0	CMATOS978@GMAIL.COM	\N	\N	19	1991-06-08
1229	V-10521352	YAMILETH	DE NOBEGA	04167181869	0	YAMILETHDENOBEGA@HOTMAIL.COM	\N	\N	19	1967-10-30
1230	V-21232935	CARLOS 	APONTE	04241549218	0	CRAMAGALLANES@GAMIL.COM 	\N	\N	23	1992-02-02
1231	V-20050509	DAVID	GUZMAN	04142042657	0	DAVIDGUZMAN22@HOTMAIL.COM	\N	\N	19	1986-12-30
1232	V-25244213	STEFANY	BERROTERAN 	04241549218	0	CRAMAGALLANES@GMAIL.COM	\N	\N	23	1995-11-08
1233	V-18069780	MARIO	OJEDA	04263120772	0	STEVEN.145ALCEDO@GMAIL.COM	\N	\N	19	1983-09-21
1234	V-20050508	GUZMAN 	LUIS 	04241894750	0	LUISGUZMANGUERRA80@GMAIL.COM 	\N	\N	23	1989-09-16
1235	V-11656922	DAXELYS	TIAPA	04241309970	0	MARTIN_6908@OUTLOOK.COM	\N	\N	19	1972-08-10
1236	V-6435262	FIDEL 	COLMENARES 	04142764052	0	TAIDIRISCOLMENARES@HTOMAIL.COM 	\N	\N	23	\N
1237	V-5190236	JESUS	SIFONTES	04167231704	0	JESUS27SIFONTESS@HOTMAIL.COM	\N	\N	19	1954-10-31
1238	V-19511842	MILANYELI	GIL	04241763702	0	MILANYELI.GIL@HOTMAIL.COM	\N	\N	19	1990-12-03
1239	V-17697735	BRICEÑO	CARLOS	04242161421	0	CARLOSBRICEÑO2269@GMAIL.COM	\N	\N	23	1987-09-22
1240	V-14428974	ANABEL	ESTRADA	04242385027	0	ESTRADAGIL14@.COM	\N	\N	19	1981-03-04
1241	V-23648193	ROBERT	RONDON	04141374484	0	ROBERTRONDONGARCIA@GMAIL.COM	\N	\N	19	1990-06-10
1242	V-16178485	MERY	GONZALEZ	04120233601	0	M.GONZALEZMALAVE@GMAIL.COM	\N	\N	19	1982-07-31
1243	V-17772199	JONATHAN	GUERRERO	04141159070	0	JONATHANCSM@HOTMAIL.COM	\N	\N	19	1984-10-21
1244	V-13158520	NEIVIS	MONZON 	04164259367	0	NEIVIS.MONZON16@GMAIL.COM	\N	\N	19	1976-11-16
1245	V-19372627	MEDINA 	FRANK 	04141235966	0	ROBERTMEDINARUIZ2016@GMAIL.COM	\N	\N	23	1986-08-20
1246	V-18749497	DANIELA	NOVOA	04242956292	0	D-NOVOA21@HOTMAIL.COM	\N	\N	19	1988-03-21
1247	V-16082292	ROSANNA	RIOS	04123739264	0	ROSANNA.RIOSGUZMAN@GMAIL.COM	\N	\N	19	1982-09-01
1248	V-15820201	DEIVI	GONZALEZ	04129801643	0	DEIVI_G@HOTMAIL.COM	\N	\N	19	1982-01-27
1249	V-12618015	MARIA	FUENTES	04142824958	0	MARIAALEJANDRA769@HOTMAIL.COM	\N	\N	19	1976-06-12
1250	V-20132093	RAINEL	PATINO	04127176183	0	RINELTVES@GMAIL.COM	\N	\N	19	1992-10-06
1251	V-10380874	ARELIS	ARRAEZ	04141122033	0	ARRAEZARELIS6@GMAIL.COM	\N	\N	19	1970-02-28
1252	V-13860720	MARY 	UZCATEGUI 	04242961258	0	MARYFLORUZ@GAMIL.COM	\N	\N	23	1979-12-08
1253	V-5965522	ANGEL	PUERTA 	04268048079	0	ANGELPUERTA65@GMAIL.COM	\N	\N	19	1959-04-30
1254	V-15723148	HAIDER	MARTINEZ 	04161798584	0	BRIYMAR.WKA@GMAIL.COM 	\N	\N	23	1982-07-08
1255	V-10110671	WILLIAMS	MARTINEZ	04262993018	0	WILLIAMS36@GMAIL.COM	\N	\N	19	1970-05-31
1256	V-8774110	SONIA	BENITEZ	04142792594	0	ARIADNAOSI0@HOTMAIL.COM	\N	\N	19	1969-04-02
1257	V-16673424	JAMPIER	SALOMON	04241836828	0	JAMPIERSIMPO42@GMAIL.COM	\N	\N	19	1983-11-16
1258	V-6174081	GREGORIO 	MARIN	04168397728	0	SIRIAVIANNEY@GMAIL.COM 	\N	\N	23	1964-03-22
1259	V-11567425	YAJAIRA 	HERRERA 	04142508745	0	YULIANYULIAN92@GMAIL.COM 	\N	\N	23	1970-08-03
1260	V-6129011	HUMBERTO	NIETO	04168349360	0	YUSMARYNIETO@GMAIL.COM	\N	\N	19	1962-05-17
1261	V-27223075	PAULIMAR 	SANCHEZ 	04241904016	0	CASTILLOPAULI1309@GMAIL.COM 	\N	\N	23	1999-03-13
1262	V-10117329	BELKIS	ZAMBRANO	04127264402	0	KARELY2546@GMAIL.COM	\N	\N	19	1966-09-06
1263	V-15420748	INDIRA	CAMPOS 	04143340932	0	INDIRACAMPOS15@GMAIL.COM	\N	\N	19	1980-09-20
1264	V-5306011	CRUZ	MEJIAS	04129380859	0	DIEGOMEJIAS5849@GMAIL.COM	\N	\N	19	1958-05-03
1265	V-6333872	DIEGO	MEJIAS	6333872	0	DIEGOMEJIAS5849@GMAIL.COM	\N	\N	19	1969-12-30
1266	V-12912653	ISABEL 	GONZALEZ	04164117578	0	ISAVALE08@HOTMAIL.COM 	\N	\N	23	\N
1267	V-19710342	BELKYS	MAITA 	04143654988	0	BELKYSMAITA88@GMAIL.COM 	\N	\N	23	1988-01-20
1268	V-6308621	ANTONIO	LABANA 	04141515117	0	LABANAJOSEA@GMAIL.COM 	\N	\N	23	\N
1269	V-13533310	WILMER	JIMENEZ	04242230450	0	JONATHANPEREIRA579@GMAIL.COM	\N	\N	19	1974-01-08
1270	V-5518888	PEDRO	CAMEJO	04162172784	0	PEDRONICOLASCAMEJO55@GMAIL.COM	\N	\N	19	1955-08-01
1271	V-16461514	FREED	YEMEZ	04241828150	0	FREIDALYFRELDERLY@HOTMAIL.COM	\N	\N	19	1982-10-21
1272	V-29741842	EDUARDO	FLORES	04242950944	0	EDUARDO_R_FLORES_@HOTMAIL.COM	\N	\N	19	2001-04-29
1273	V-6936829	WILLIAMS	FLORES	04241734634	0	WILLIAMFLORES693@GMAIL.COM	\N	\N	19	1966-10-14
1274	V-27588714	RAMIRO	DIAZ	04149085997	0	ADRIANAMAURERA123@GMAIL.COM	\N	\N	19	2000-11-17
1275	V-13479573	HUGO	GARCIA	04126297525	0	HUGOGARCIAELNENE@HOTMAIL.COM	\N	\N	19	1979-05-16
1276	V-17530299	WILMER	CHACON 	04142526074	0	CHACONX917.@GMAIL.COM	\N	\N	19	1984-07-07
1277	V-8188163	MIGUEL	CONTRAMAESTRE	04267063620	0	JONATHANPEREIRAS579@GMAIL.COM	\N	\N	19	1965-09-27
1278	V-6823071	JOSE	VIERA	02122642618	0	JONATHANPEREIRA579@GMAIL.COM	\N	\N	19	1965-04-18
1279	V-10887403	SIMON	FERNANDEZ	04241339791	0	FERNANDEZSIMON256@GMAIL.COM	\N	\N	19	1970-03-13
1280	V-10797810	LINDA	RAMIREZ	04168105434	0	RAMIREZYAMILETH42@GMAIL.COM	\N	\N	19	1973-06-24
\.


--
-- Data for Name: t_tpago; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.t_tpago (id_tpago, tpago, id_usuario, fecha_registro, ult_mod, estatus) FROM stdin;
2	Domiciliado en cuenta	0	\N	\N	0
1	Tarjeta de debito	0	\N	\N	0
3	Transferencia del mismo banco	0	\N	\N	0
4	Transferencia otros bancos	0	\N	\N	0
\.


--
-- Data for Name: t_tpoliza; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.t_tpoliza (id_tpoliza, tpoliza, id_usuario, fecha_registro, ult_mod, factor, estatus) FROM stdin;
1	TCH	0	2019-09-01 00:00:00	2019-09-01 00:00:00	25.7600000000000016	0
2	TCHP	0	2019-09-01 00:00:00	2019-09-01 00:00:00	73.5	0
3	TCHP (50%)	0	2019-09-01 00:00:00	2019-09-01 00:00:00	55.3599999999999994	0
4	TCHP (33%)	0	2019-09-01 00:00:00	2019-09-01 00:00:00	45.6300000000000026	0
5	VIDA	0	2019-09-01 00:00:00	2019-09-01 00:00:00	0	0
14	1	1	\N	\N	1	1
\.


--
-- Data for Name: t_usuarios; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.t_usuarios (id_user, username, clave, id_persona, id_rol, id_usuario, fecha_registro, ult_mod, estatus) FROM stdin;
1	master	123456	1	2	0	1992-05-12 00:00:00	2019-09-05 00:00:00	0
18	aromero	5678	23	3	1	\N	\N	0
19	klucas	123456	24	9	1	\N	\N	0
17	mchari	1234	22	3	1	\N	\N	0
16	katha	123	21	3	1	2019-10-16 00:00:00	2019-10-16 00:00:00	0
20	pirala	8976	25	10	1	\N	\N	0
21	mvielma	1234	26	12	1	\N	\N	0
22	nperez	1234	27	12	1	\N	\N	0
23	dgarvan	1234	28	9	1	\N	\N	0
24	mpeña	123	29	13	1	\N	\N	0
25	kquintero	quintero	30	12	1	\N	\N	0
26	aitriago	Lisette12#	31	2	1	\N	\N	0
27	ebermudez	12345	32	2	1	\N	\N	0
28	asegovia	selafe01*	33	2	1	\N	\N	0
\.


--
-- Data for Name: t_vendedores; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.t_vendedores (id_vendedor, identificacion, nombres, apellidos, telefono, id_coordinador, correo, fecha_registro, ult_mod, id_usuario, cod_vendedor, estatus) FROM stdin;
56	V-15366525	NELLYS	FLORES	04142686162	17	asesoradeventasnflores@gmail.com	\N	\N	17	38029	0
57	V-5217077	ZAIDA	MARCANO	04140275053	17	Marcanozaida@gmail.com	\N	\N	17	38030	0
58	V-16474461	RONNI J	MAICAN M	04242516115	18	ronnimaican1@gmail.com	\N	\N	17	38031	0
52	V-6507281	DANIA MARIA	MATERANO A	04142582642	17	Daniamaterno67@hotmail.com	\N	\N	17	3111	0
59	V-14064471	ERAINE	GONZALEZ	04265110343	18	klucas@seguroslafe.com	\N	\N	18	38032	0
60	V-10821234	AMARILIS	LARA	04126040264	18	Amarilisrenaware@hotmail.com	\N	\N	18	38033	0
35	V-6890055	CARMEN	APONTE	04141629550	17	aracelis0024@gmail.com	\N	\N	17	349630	0
31	V-7684861	ROSA	ESTEVES	04141349268	17	Rosavi06@hotmail.com	\N	\N	17	36973	0
32	V-6181730	GRACINDA	PINTO LOPEZ	04142320314	17	graci_pinto16@hotmail.com	\N	\N	17	38013	0
34	V-16722571	RAFAEL	SILVA	04243054501	17	rainerafaels20@gmail.com	\N	\N	17	38019	0
33	V-9367276	MARIA C	PEREZ P	04126398730	17	mariaconsuelouni7@gmail.com	\N	\N	17	38015	0
47	V-6103394	ANGEL	MARTINEZ	04266111911	18	aamartinez64@hotmail.com	\N	\N	18	38007	0
38	V-13526368	MARLYN	CARVAJAL D 	04121582908	18	marlyncarvajal20@gmail.com	\N	\N	18	38016	0
39	V-16082841	CIGDIA LORENA	PERTUZ VILORIA	04168330754	18	lorenapertuz25@gmail.com	\N	\N	18	38010	0
41	V-5408341	DAVID JOSE	BARRITEAU ESCOBAR	04264084808	18	dbarriteau@hotmail.com	\N	\N	18	38012	0
42	V-23613866	URAY CARNEIRO 	IBRAHIM MARTIN	04167108927	18	Ibrahimuray@gmail.com	\N	\N	18	38014	0
43	V-10474108	SILVIA C	ROJAS M	04168368906	18	silviacoro.0715@gmail.com	\N	\N	18	38022	0
45	V-22358154	YOILIS	PENA G	042420741425	18	yoilispegui3192@hotmail.com	\N	\N	18	38025	0
40	V-9096610	GRATEROL P	DANIA M	02128703541	18	klucas@seguroslafe.com	\N	\N	18	38011	0
46	V-11038889	AYLISSET	VILLALBA	041437425981	18	aylissetvillalba@hotmail.com	\N	\N	18	38009	0
50	V-4674203	CARRILLO GARABAN	GRACIELA CRISTINA	04162703425	17	Gracielacarrillo25@hotmail.com	\N	\N	1	38027	0
36	V-6092769	SAID	FAGUNDEZ	04141632499	17	AFAGUNDEZ418@GMAIL.COM	\N	\N	1	38026	0
37	V-9166338	ARNOLDO	VALERIO	04241250163	18	valeroarnoldo@gmail.com	\N	\N	1	38008	0
44	V-6117556	MILEIDY	RODRIGUEZ	04168346415	18	Mileidy1231@hotmail.com       	\N	\N	1	38017	0
48	V-8023125	ALVARO	ANGULO	02128221100	18	aangulo@seguroslafe.com	\N	\N	1	30756	0
51	V-5977690	ZORAIDA	GAMBOA P	04241607680	17	zoraida_gamboa@hotmail.com	\N	\N	17	37533	0
53	V-4974029	NICOLAS E	VELASQUEZ	04147172864	18	nicolasvelasquez1958@gmail.com	\N	\N	18	38028	0
54	V-4006110	ROSARIO	MORFFE	04241732990	17	rosariomorffe@hotmail.com	\N	\N	17	38021	0
55	V-16283015	ROMMEL	MARCANO B	04241445024	17	roam23_8@hotmail.com	\N	\N	17	38024	0
61	V-4166041	CARMEN	ANGULO	04142007866	18	CARMENANGULO16@GMAIL.COM	\N	\N	18	32472	0
62	V-6546700	ALIS I	MALAVE C	04241380927	17	ALISMALAVE@HOTMAIL.COM	\N	\N	17	38034	0
63	V-6859358	MIREYA J	OVELMEJIAS	04142020893	17	MIREYAOVELMEJIAS18@GMAIL.COM	\N	\N	17	38036	0
64	V-10181427	ESPERANZA	ARTILES	04141257374	18	COACH44ESPERANZA@GMAIL.COM	\N	\N	18	38035	0
65	V-13959095	NORKIS	DIAZ	04142883254	18	NDEICE2DD@GMAIL.COM	\N	\N	18	38037	0
\.


--
-- Data for Name: t_ventas; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.t_ventas (id_venta, id_tomador, id_poliza, id_vendedor, id_comision, tipo_pago, referencia_pago, monto, cuotas_canceladas, extorno, fecha_extorno, id_usuario, fecha_registro, ult_mod, id_plan, id_tpoliza, tventa, solicitud, id_semana, estatus_venta, id_sem) FROM stdin;
622	460	94	39	1	2	0	0	0	\N	\N	19	2019-11-12 00:00:00	\N	3	2	1	405861	63	L	66
510	364	131	43	1	2	0	0	0	\N	\N	19	2019-12-11 00:00:00	\N	2	5	1	84300	62	L	66
165	88	89	37	1	2	\N	\N	\N	\N	\N	1	2019-10-18 00:00:00	2019-10-18 00:00:00	2	2	1	405501	60	L	66
969	757	84	38	1	4	8920	136325	1	\N	\N	19	2019-12-09 00:00:00	\N	1	2	1	407709	67	L	67
927	726	89	37	1	2	0	0	0	\N	\N	19	2019-12-02 00:00:00	\N	2	2	1	407970	66	X	66
1186	947	69	32	1	2	0	0	0	\N	\N	19	2019-12-17 00:00:00	\N	1	1	1	405430	68	X	68
1281	999	131	50	1	3	1597	17000	1	\N	\N	23	2020-01-13 00:00:00	\N	2	5	1	83827	74	X	74
1008	790	69	46	1	2	0	0	0	\N	\N	19	2019-12-09 00:00:00	\N	1	1	1	408033	67	L	69
989	777	69	43	1	2	0	0	0	\N	\N	23	2019-12-09 00:00:00	\N	1	1	1	407668	67	L	69
1212	964	69	51	1	3	5808	91957.1699999999983	1	\N	\N	19	2019-12-17 00:00:00	\N	1	1	1	408148	68	L	68
1225	973	84	34	1	3	5227	142000	1	\N	\N	23	2019-12-17 00:00:00	\N	1	2	1	408179	68	L	68
1237	938	69	52	1	3	3373	44006.6699999999983	1	\N	\N	19	2019-12-17 00:00:00	\N	1	1	1	408252	68	L	68
538	387	89	54	1	2	0	0	0	\N	\N	19	2019-12-11 00:00:00	\N	2	2	1	405771	62	L	68
159	82	\N	37	1	2	\N	\N	\N	\N	\N	1	2019-10-18 00:00:00	2019-10-18 00:00:00	1	5	1	84010	60	L	68
1261	986	69	45	1	3	3740	67523.3399999999965	1	\N	\N	23	2020-01-13 00:00:00	\N	1	1	1	406925	72	L	72
1065	843	89	34	1	2	0	0	0	\N	\N	19	2019-12-10 00:00:00	\N	2	2	1	407596	67	L	69
1027	808	69	51	1	2	0	0	0	\N	\N	19	2019-12-09 00:00:00	\N	1	1	1	407889	67	L	69
1046	826	69	58	1	2	0	0	0	\N	\N	19	2019-12-10 00:00:00	\N	1	1	1	408110	67	L	69
903	706	84	31	1	2	0	0	0	\N	\N	19	2019-11-29 00:00:00	\N	1	2	1	407758	66	L	69
172	95	68	31	1	2	\N	\N	\N	\N	\N	1	2019-10-18 00:00:00	2019-10-18 00:00:00	1	1	1	405392	60	X	60
646	449	69	43	1	4	35740	65000	1	\N	\N	1	2019-11-13 00:00:00	\N	1	1	1	407662	63	L	63
813	636	131	45	1	2	0	0	0	\N	\N	19	2019-11-26 00:00:00	\N	2	5	1	84137	65	X	65
892	699	69	37	1	3	2650525669	87940	1	\N	\N	19	2019-11-29 00:00:00	\N	1	1	1	407964	66	L	66
916	717	131	37	1	3	612	16000	1	\N	\N	19	2019-12-02 00:00:00	\N	2	5	1	82878	66	L	66
1213	964	131	51	1	3	5854	16000	1	\N	\N	19	2019-12-17 00:00:00	\N	2	5	1	81247	68	L	68
1238	937	84	52	1	3	4251	125391.669999999998	1	\N	\N	19	2019-12-17 00:00:00	\N	1	2	1	408253	68	L	68
623	461	74	39	1	2	0	0	0	\N	\N	19	2019-11-12 00:00:00	\N	2	1	1	406748	63	L	66
968	745	82	32	1	3	916231	46500	1	\N	\N	19	2019-12-04 00:00:00	\N	1	2	1	406914	66	L	66
940	736	69	31	1	3	52372060	99356.6699999999983	1	\N	\N	19	2019-12-03 00:00:00	\N	1	1	1	408027	66	L	66
880	689	\N	39	1	1	\N	\N	0	\N	\N	23	\N	\N	\N	\N	3	0	66	L	66
960	752	69	52	1	3	0110	55023.3399999999965	1	\N	\N	23	2019-12-03 00:00:00	\N	1	1	1	406580	66	L	66
669	503	84	46	1	2	0	0	0	\N	\N	19	2019-11-18 00:00:00	\N	1	2	1	406940	64	L	68
928	727	69	37	1	2	0	0	0	\N	\N	19	2019-12-02 00:00:00	\N	1	1	1	407965	66	L	69
970	758	87	32	1	3	69730	36900	1	\N	\N	19	2019-12-09 00:00:00	\N	2	2	1	406913	67	L	67
1066	844	83	50	1	3	185700964	91191	1	\N	\N	19	2019-12-10 00:00:00	\N	1	2	1	407583	67	L	67
1020	801	84	39	1	2	0	0	0	\N	\N	19	2019-12-09 00:00:00	\N	1	2	1	406749	67	X	67
773	599	69	58	1	2	0	0	0	\N	\N	19	2019-11-25 00:00:00	\N	1	1	1	408039	65	L	68
677	510	88	41	1	2	0	0	0	\N	\N	19	2019-11-18 00:00:00	\N	2	2	1	407727	64	L	68
724	553	89	54	1	2	0	0	0	\N	\N	19	2019-11-20 00:00:00	\N	2	2	1	405780	64	L	68
191	112	84	45	1	2	\N	\N	\N	\N	\N	1	2019-10-21 00:00:00	2019-10-21 00:00:00	1	2	1	405617	60	L	68
193	113	129	45	1	2	\N	\N	\N	\N	\N	1	2019-10-21 00:00:00	2019-10-21 00:00:00	2	5	1	84129	60	L	68
692	523	89	38	1	2	0	0	0	\N	\N	19	2019-11-19 00:00:00	\N	2	2	1	407702	64	L	68
1252	982	69	43	1	2	0	0	0	\N	\N	23	2020-01-07 00:00:00	\N	1	1	1	407654	69	X	69
1099	872	131	48	1	2	0	0	0	\N	\N	19	2019-12-13 00:00:00	\N	2	5	1	82689	68	L	74
1009	790	131	46	1	2	0	0	0	\N	\N	19	2019-12-09 00:00:00	\N	2	5	1	84160	67	L	69
1282	1000	69	50	1	2	0	0	0	\N	\N	23	2020-01-13 00:00:00	\N	1	1	1	408161	74	X	74
638	475	84	46	1	2	0	0	0	\N	\N	1	2019-11-13 00:00:00	\N	1	2	1	407506	63	X	63
1262	986	131	45	1	3	3740	16000	1	\N	\N	23	2020-01-13 00:00:00	\N	2	5	1	82934	72	L	72
716	545	79	35	1	2	0	0	0	\N	\N	19	2019-11-19 00:00:00	\N	3	1	1	405411	64	L	68
740	568	69	58	1	2	0	0	0	\N	\N	19	2019-11-20 00:00:00	\N	1	1	1	407799	64	L	68
732	561	69	58	1	2	0	0	0	\N	\N	19	2019-11-20 00:00:00	\N	1	1	1	407892	64	L	68
700	532	84	46	1	2	0	0	0	\N	\N	19	2019-11-19 00:00:00	\N	1	2	1	407518	64	L	69
990	778	94	43	1	2	0	0	0	\N	\N	19	2019-12-09 00:00:00	\N	3	2	1	407664	67	L	69
1028	809	69	51	1	2	0	0	0	\N	\N	19	2019-12-09 00:00:00	\N	1	1	1	408156	67	L	69
904	707	84	31	1	2	0	0	0	\N	\N	19	2019-11-29 00:00:00	\N	1	2	1	407761	66	L	69
327	211	74	50	1	2	\N	\N	\N	\N	\N	1	2019-12-11 00:00:00	\N	2	1	1	405375	60	L	60
661	495	84	34	1	3	39655	136325	1	\N	\N	19	2019-11-18 00:00:00	\N	1	2	1	406640	64	L	64
299	198	69	38	1	2	\N	\N	\N	\N	\N	1	2019-12-11 00:00:00	\N	1	1	1	406777	60	L	60
300	199	84	38	1	2	\N	\N	\N	\N	\N	1	2019-12-11 00:00:00	\N	1	2	1	406781	60	L	60
254	161	89	44	1	2	\N	\N	\N	\N	\N	1	2019-12-11 00:00:00	\N	2	2	1	406868	60	L	60
279	179	69	32	1	2	\N	\N	\N	\N	\N	1	2019-12-11 00:00:00	\N	1	1	1	405579	60	L	60
160	83	87	41	1	2	\N	\N	\N	\N	\N	1	2019-10-18 00:00:00	2019-10-18 00:00:00	2	2	1	405597	60	L	60
169	92	90	41	1	2	\N	\N	\N	\N	\N	1	2019-10-18 00:00:00	2019-10-18 00:00:00	2	2	1	405967	60	L	60
304	203	69	42	1	2	\N	\N	\N	\N	\N	1	2019-12-11 00:00:00	\N	1	1	1	405931	60	L	60
170	93	90	41	1	2	\N	\N	\N	\N	\N	1	2019-10-18 00:00:00	2019-10-18 00:00:00	2	2	1	405595	60	L	60
167	90	90	41	1	2	\N	\N	\N	\N	\N	1	2019-10-18 00:00:00	2019-10-18 00:00:00	2	2	1	405970	60	L	60
290	189	94	41	1	2	\N	\N	\N	\N	\N	1	2019-12-11 00:00:00	\N	3	2	1	406698	60	L	60
893	700	131	37	1	2	0	0	0	\N	\N	19	2019-11-29 00:00:00	\N	2	5	1	82882	66	X	66
961	753	84	37	1	3	39860	146392	1	\N	\N	19	2019-12-04 00:00:00	\N	1	2	1	407753	66	L	66
929	728	84	37	1	3	2343	179718	1	\N	\N	19	2019-12-02 00:00:00	\N	1	2	1	407963	66	L	66
1253	717	84	37	1	3	0	235292	1	\N	\N	23	2020-01-07 00:00:00	\N	1	2	1	407977	69	X	69
632	223	84	46	1	2	0	0	0	\N	\N	1	2019-11-13 00:00:00	\N	1	2	1	406938	63	L	66
881	692	\N	39	1	1	\N	\N	0	\N	\N	23	\N	\N	\N	\N	3	0	66	L	66
941	737	69	34	1	3	2652944138	60007	1	\N	\N	19	2019-12-03 00:00:00	\N	1	1	1	406641	66	L	66
477	337	69	48	1	2	0	0	0	\N	\N	19	2019-12-11 00:00:00	\N	1	1	1	406541	62	L	66
480	339	69	48	1	2	0	0	0	\N	\N	19	2019-12-11 00:00:00	\N	1	1	1	406539	62	L	66
1283	1001	69	50	1	2	0	0	0	\N	\N	23	2020-01-13 00:00:00	\N	1	1	1	408167	74	X	74
971	759	69	32	1	3	50204	110290	1	\N	\N	19	2019-12-09 00:00:00	\N	1	1	1	407556	67	L	67
1226	973	131	34	1	3	5227	16000	1	\N	\N	23	2019-12-17 00:00:00	\N	2	5	1	408179	68	X	68
905	708	69	31	1	2	0	0	0	\N	\N	19	2019-11-29 00:00:00	\N	1	1	1	407757	66	L	74
1214	965	84	51	1	1	99757264	125392.669999999998	1	\N	\N	19	2019-12-17 00:00:00	\N	1	2	1	407803	68	L	68
1239	978	131	34	1	3	6065	16000	1	\N	\N	19	2019-12-17 00:00:00	\N	2	5	1	81679	68	L	68
280	180	69	44	1	2	\N	\N	\N	\N	\N	1	2019-12-11 00:00:00	\N	1	1	1	406892	60	L	68
1147	913	84	54	1	3	20221985	274016.679999999993	2	\N	\N	19	2019-12-16 00:00:00	\N	1	2	1	405772	68	L	68
1029	810	69	51	1	2	0	0	0	\N	\N	19	2019-12-09 00:00:00	\N	1	1	1	408149	67	X	67
917	719	68	41	1	2	0	0	0	\N	\N	19	2019-12-02 00:00:00	\N	1	1	1	407993	66	L	69
293	192	90	41	1	2	\N	\N	\N	\N	\N	1	2019-12-11 00:00:00	\N	2	2	1	405590	60	L	60
155	78	90	31	1	2	\N	\N	\N	\N	\N	1	2019-10-18 00:00:00	2019-10-18 00:00:00	2	2	1	405968	60	X	60
156	79	89	31	1	2	\N	\N	\N	\N	\N	1	2019-10-18 00:00:00	2019-10-18 00:00:00	2	2	1	405972	60	X	60
157	80	89	31	1	2	\N	\N	\N	\N	\N	1	2019-10-18 00:00:00	2019-10-18 00:00:00	2	2	1	405971	60	X	60
286	185	94	46	1	2	\N	\N	\N	\N	\N	1	2019-12-11 00:00:00	\N	3	2	1	405918	60	L	60
314	207	84	46	1	2	\N	\N	\N	\N	\N	1	2019-12-11 00:00:00	\N	1	2	1	406843	60	L	60
294	193	90	41	1	2	\N	\N	\N	\N	\N	1	2019-12-11 00:00:00	\N	2	2	1	405588	60	L	60
190	111	73	45	1	2	\N	\N	\N	\N	\N	1	2019-10-21 00:00:00	2019-10-21 00:00:00	2	1	1	405615	60	L	60
192	111	129	45	1	2	\N	\N	\N	\N	\N	1	2019-10-21 00:00:00	2019-10-21 00:00:00	2	5	1	84131	60	L	60
918	719	130	37	1	2	0	0	0	\N	\N	19	2019-12-02 00:00:00	\N	2	5	1	83718	66	X	66
962	696	131	37	1	3	39860	16000	1	\N	\N	19	2019-12-04 00:00:00	\N	2	5	1	84389	66	L	66
930	728	131	37	1	3	2343	16000	1	\N	\N	19	2019-12-02 00:00:00	\N	2	5	1	82886	66	L	66
894	699	131	37	1	3	2650525669	17000	1	\N	\N	19	2019-11-29 00:00:00	\N	2	5	1	82887	66	L	66
1189	949	84	48	1	2	0	0	0	\N	\N	19	2019-12-17 00:00:00	\N	1	2	1	408507	68	X	68
556	403	84	44	1	2	0	0	0	\N	\N	19	2019-12-11 00:00:00	\N	1	2	1	406741	62	L	66
589	432	84	48	1	2	0	0	0	\N	\N	19	2019-12-11 00:00:00	\N	1	2	1	407607	63	L	66
633	470	84	46	1	2	0	0	0	\N	\N	1	2019-11-13 00:00:00	\N	1	2	1	406947	63	L	66
641	478	69	46	1	2	0	0	0	\N	\N	1	2019-11-13 00:00:00	\N	1	1	1	406806	63	L	66
649	485	69	57	1	2	0	0	0	\N	\N	19	2019-11-13 00:00:00	\N	1	1	1	407590	63	L	66
942	737	131	34	1	3	2652944138	16000	1	\N	\N	19	2019-12-03 00:00:00	\N	2	5	1	81680	66	L	66
1086	317	\N	48	1	1	\N	\N	0	\N	\N	19	\N	\N	\N	\N	3	0	67	L	67
972	760	84	31	1	3	1900919044	185866.630000000005	1	\N	\N	19	2019-12-09 00:00:00	\N	1	2	1	408025	67	L	67
1176	937	84	52	1	2	0	0	0	\N	\N	19	2019-12-17 00:00:00	\N	1	2	1	408253	68	X	68
1227	974	84	34	1	3	6067	166500	1	\N	\N	23	2019-12-17 00:00:00	\N	1	2	1	408176	68	X	68
1304	1015	84	35	1	3	0	173225	1	\N	\N	23	2020-01-22 00:00:00	\N	1	2	1	407673	74	X	74
1030	811	94	31	1	2	0	0	0	\N	\N	19	2019-12-10 00:00:00	\N	3	2	1	408029	67	L	69
906	709	74	54	1	2	0	0	0	\N	\N	19	2019-11-29 00:00:00	\N	2	1	1	405768	66	L	69
1215	966	84	51	1	3	900826095	136325.339999999997	1	\N	\N	19	2019-12-17 00:00:00	\N	1	2	1	407689	68	L	68
664	498	84	46	1	2	0	0	0	\N	\N	19	2019-11-18 00:00:00	\N	1	2	1	407515	64	L	68
656	491	81	41	1	2	0	0	0	\N	\N	19	2019-11-18 00:00:00	\N	3	1	1	407725	64	L	68
789	467	84	46	1	2	0	0	0	\N	\N	19	2019-11-25 00:00:00	\N	1	2	1	407540	65	L	68
1148	812	69	54	1	3	3696	76806.6600000000035	1	\N	\N	19	2019-12-16 00:00:00	\N	1	1	1	405773	68	L	68
1341	1047	\N	38	1	1	\N	\N	0	\N	\N	19	\N	\N	\N	\N	3	0	74	X	74
992	780	84	46	1	2	0	0	0	\N	\N	19	2019-12-09 00:00:00	\N	1	2	1	407522	67	L	69
1049	829	69	58	1	2	0	0	0	\N	\N	19	2019-12-10 00:00:00	\N	1	1	1	408121	67	L	69
882	693	84	38	1	2	0	0	0	\N	\N	19	2019-11-29 00:00:00	\N	1	2	1	407708	66	L	69
625	463	79	39	1	4	503506	40431	1	\N	\N	19	2019-11-12 00:00:00	\N	3	1	1	406957	63	L	63
836	656	\N	34	1	1	\N	\N	0	\N	\N	19	\N	\N	\N	\N	3	0	65	X	65
642	479	84	46	1	2	0	0	0	\N	\N	1	2019-11-13 00:00:00	\N	1	2	1	407505	63	X	63
860	369	69	36	1	2	0	0	0	\N	\N	19	2019-11-27 00:00:00	\N	1	1	1	405450	65	X	65
907	710	84	37	1	3	39834	150075	1	\N	\N	19	2019-12-02 00:00:00	\N	1	2	1	407951	66	L	66
895	700	131	37	1	3	2650525669	16000	1	\N	\N	19	2019-11-29 00:00:00	\N	2	5	1	82882	66	L	66
1190	949	131	48	1	2	0	0	0	\N	\N	19	2019-12-17 00:00:00	\N	2	5	1	82698	68	X	68
943	738	84	50	1	3	2625500915	203741.670000000013	1	\N	\N	19	2019-12-03 00:00:00	\N	1	2	1	407574	66	L	66
634	471	69	46	1	2	0	0	0	\N	\N	1	2019-11-13 00:00:00	\N	1	1	1	406948	63	L	66
952	746	69	38	1	3	40001	69973.3399999999965	1	\N	\N	19	2019-12-03 00:00:00	\N	1	1	1	408201	66	L	66
883	694	\N	39	1	1	\N	\N	0	\N	\N	23	\N	\N	\N	\N	3	0	66	L	66
963	749	69	52	1	3	9159	55000	1	\N	\N	19	2019-12-04 00:00:00	\N	1	1	1	407817	66	L	66
1031	812	69	54	1	3	2666743696	76806.6600000000035	1	\N	\N	19	2019-12-10 00:00:00	\N	1	1	1	405773	67	X	67
1012	793	84	46	1	2	0	0	0	\N	\N	19	2019-12-09 00:00:00	\N	1	2	1	407784	67	L	69
973	761	69	31	1	3	5390	62456.6699999999983	1	\N	\N	19	2019-12-09 00:00:00	\N	1	1	1	408003	67	L	67
1177	938	69	52	1	2	0	0	0	\N	\N	19	2019-12-17 00:00:00	\N	1	1	1	408252	68	X	68
1228	974	131	34	1	3	6067	18000	1	\N	\N	23	2019-12-17 00:00:00	\N	2	5	1	408176	68	X	68
993	781	84	46	1	2	0	0	0	\N	\N	19	2019-12-09 00:00:00	\N	1	2	1	408035	67	L	69
931	729	69	46	1	2	0	0	0	\N	\N	19	2019-12-03 00:00:00	\N	1	1	1	407781	66	L	69
1241	975	84	34	1	3	6638	34250	1	\N	\N	19	2019-12-17 00:00:00	\N	1	2	1	84060	68	L	68
670	504	69	46	1	2	0	0	0	\N	\N	19	2019-11-18 00:00:00	\N	1	1	1	406942	64	L	68
919	720	89	41	1	2	0	0	0	\N	\N	19	2019-12-02 00:00:00	\N	2	2	1	407636	66	L	69
1255	717	84	37	1	4	6738	235292	1	\N	\N	23	2020-01-07 00:00:00	\N	1	2	1	407977	71	L	71
1069	846	69	38	1	2	0	0	0	\N	\N	19	2019-12-10 00:00:00	\N	1	1	1	406039	67	L	71
1342	1048	\N	38	1	1	\N	\N	0	\N	\N	19	\N	\N	\N	\N	3	0	74	X	74
645	482	84	39	1	4	43947	125400	1	\N	\N	1	2019-11-13 00:00:00	\N	1	2	1	406956	63	L	63
621	459	\N	39	1	1	\N	\N	0	\N	\N	19	2019-12-11 00:00:00	\N	\N	\N	3	0	63	L	63
620	458	\N	39	1	1	\N	\N	0	\N	\N	19	2019-12-11 00:00:00	\N	\N	\N	3	0	63	L	63
619	457	\N	39	1	1	\N	\N	0	\N	\N	19	2019-12-11 00:00:00	\N	\N	\N	3	0	63	L	63
618	456	\N	39	1	1	\N	\N	0	\N	\N	19	2019-12-11 00:00:00	\N	\N	\N	3	0	63	L	63
617	455	\N	39	1	1	\N	\N	0	\N	\N	19	2019-12-11 00:00:00	\N	\N	\N	3	0	63	L	63
616	439	74	41	1	4	11093	30160	1	\N	\N	19	2019-12-11 00:00:00	\N	2	1	1	407000	63	L	63
870	680	69	52	1	2	0	0	0	\N	\N	19	2019-11-27 00:00:00	\N	1	1	1	406602	65	X	65
908	711	131	37	1	1	39834	16000	1	\N	\N	19	2019-12-02 00:00:00	\N	2	5	1	82913	66	L	66
896	701	69	45	1	3	3778	142000	2	\N	\N	19	2019-11-29 00:00:00	\N	1	1	1	406879	66	L	66
335	215	84	46	1	2	\N	\N	\N	\N	\N	19	2019-12-11 00:00:00	\N	1	2	1	406665	61	L	66
338	218	84	46	1	2	\N	\N	\N	\N	\N	19	2019-12-11 00:00:00	\N	1	2	1	406668	61	L	66
341	221	84	46	1	2	\N	\N	\N	\N	\N	19	2019-12-11 00:00:00	\N	1	2	1	406672	61	L	66
344	224	89	46	1	2	\N	\N	\N	\N	\N	19	2019-12-11 00:00:00	\N	2	2	1	405842	61	L	66
347	227	69	46	1	2	\N	\N	\N	\N	\N	19	2019-12-11 00:00:00	\N	1	1	1	405986	61	L	66
348	228	84	46	1	2	0	0	0	\N	\N	19	2019-12-11 00:00:00	\N	1	2	1	405908	61	L	66
374	241	84	46	1	2	0	0	0	\N	\N	1	2019-12-11 00:00:00	\N	1	2	1	406655	61	L	66
1204	956	69	48	1	2	0	0	0	\N	\N	19	2019-12-17 00:00:00	\N	1	1	1	408502	68	X	68
944	738	131	50	1	3	2625500915	16000	1	\N	\N	19	2019-12-03 00:00:00	\N	2	5	1	83831	66	L	66
627	465	74	46	1	2	0	0	0	\N	\N	19	2019-11-12 00:00:00	\N	2	1	1	407544	63	L	66
635	472	84	46	1	2	0	0	0	\N	\N	1	2019-11-13 00:00:00	\N	1	2	1	406949	63	L	66
920	721	84	38	1	2	0	0	0	\N	\N	19	2019-12-02 00:00:00	\N	1	2	1	407704	66	X	66
713	542	84	39	1	2	0	0	0	\N	\N	19	2019-11-19 00:00:00	\N	1	2	1	405982	64	L	68
1229	975	84	34	1	3	6638	225925	1	\N	\N	23	2019-12-17 00:00:00	\N	1	2	1	407882	68	L	68
1242	980	131	34	1	3	6067	18000	1	\N	\N	19	2019-12-17 00:00:00	\N	2	5	1	82752	68	L	68
666	500	84	46	1	2	0	0	0	\N	\N	19	2019-11-18 00:00:00	\N	1	2	1	406822	64	L	68
689	521	69	53	1	2	0	0	0	\N	\N	19	2019-11-19 00:00:00	\N	1	1	1	406896	64	X	64
681	513	74	41	1	2	0	0	0	\N	\N	19	2019-11-18 00:00:00	\N	2	1	1	407723	64	L	68
650	487	89	41	1	2	0	0	0	\N	\N	19	2019-11-18 00:00:00	\N	2	2	1	407634	64	L	68
1032	813	69	52	1	3	1088	54941	1	\N	\N	19	2019-12-10 00:00:00	\N	1	1	1	408172	67	L	67
974	762	69	31	1	3	1763	44006.6699999999983	1	\N	\N	19	2019-12-09 00:00:00	\N	1	1	1	407552	67	L	67
1013	794	74	38	1	3	4286	44260	1	\N	\N	19	2019-12-09 00:00:00	\N	2	1	1	408202	67	L	67
729	558	89	31	1	2	0	0	0	\N	\N	19	2019-11-20 00:00:00	\N	2	2	1	406906	64	L	68
1256	717	84	37	1	4	6738	235292	1	\N	\N	23	2020-01-07 00:00:00	\N	1	2	1	407977	71	X	71
171	94	69	37	1	2	\N	\N	\N	\N	\N	1	2019-10-18 00:00:00	2019-10-18 00:00:00	1	1	1	405513	60	L	60
301	200	84	42	1	2	\N	\N	\N	\N	\N	1	2019-12-11 00:00:00	\N	1	2	1	405929	60	L	60
653	489	95	41	1	3	22630	36700	1	\N	\N	19	2019-11-18 00:00:00	\N	3	2	1	407720	64	L	64
152	75	87	37	1	4	2587224265	93500	2	\N	\N	1	2019-10-18 00:00:00	2019-10-18 00:00:00	2	2	1	405514	60	L	60
553	400	\N	44	1	1	\N	\N	0	\N	\N	19	2019-12-11 00:00:00	\N	\N	\N	3	0	62	L	62
154	77	\N	44	1	1	\N	\N	0	\N	\N	1	2019-10-18 00:00:00	2019-10-18 00:00:00	\N	\N	3	-1	60	L	60
176	97	\N	37	1	3	375	19250	2	\N	\N	1	2019-10-21 00:00:00	2019-10-21 00:00:00	1	5	1	84018	60	X	60
175	97	74	37	1	3	375	77280	3	\N	\N	1	2019-10-21 00:00:00	2019-10-21 00:00:00	2	1	1	405518	60	X	60
765	591	84	35	1	3	9829	154775	1	\N	\N	19	2019-11-25 00:00:00	\N	1	2	1	405415	65	L	65
833	653	82	31	1	3	9159	64225	1	\N	\N	19	2019-11-26 00:00:00	\N	1	2	1	406991	65	L	65
819	640	131	45	1	3	9397	16000	1	\N	\N	19	2019-11-26 00:00:00	\N	2	5	1	82879	65	L	65
763	589	69	37	1	3	0	0	0	\N	\N	19	2019-11-25 00:00:00	\N	1	1	1	407944	65	L	65
697	530	69	34	1	3	1927	141880	2	\N	\N	19	2019-11-19 00:00:00	\N	1	1	1	405455	64	L	64
1088	863	69	46	1	2	0	0	0	\N	\N	19	2019-12-10 00:00:00	\N	1	1	1	407794	67	L	69
994	782	84	46	1	2	0	0	0	\N	\N	19	2019-12-09 00:00:00	\N	1	2	1	407785	67	L	69
1051	831	84	58	1	2	0	0	0	\N	\N	19	2019-12-10 00:00:00	\N	1	2	1	408118	67	L	69
884	693	131	38	1	2	0	0	0	\N	\N	19	2019-11-29 00:00:00	\N	2	5	1	81668	66	L	69
457	319	\N	48	1	1	\N	\N	0	\N	\N	19	2019-12-11 00:00:00	\N	\N	\N	3	0	62	L	62
372	248	69	46	1	2	0	0	0	\N	\N	1	2019-12-11 00:00:00	\N	1	1	1	406661	61	L	66
933	731	89	46	1	2	0	0	0	\N	\N	19	2019-12-03 00:00:00	\N	2	2	1	407545	66	L	66
725	554	83	39	1	2	0	0	0	\N	\N	19	2019-11-20 00:00:00	\N	1	2	1	406955	64	L	68
1218	968	\N	39	1	1	\N	\N	0	\N	\N	19	\N	\N	\N	\N	3	0	68	L	68
357	236	90	35	1	2	0	0	0	\N	\N	19	2019-12-11 00:00:00	\N	2	2	1	405900	61	L	66
639	476	84	46	1	2	0	0	0	\N	\N	1	2019-11-13 00:00:00	\N	1	2	1	407512	63	L	66
885	690	\N	38	1	1	\N	\N	0	\N	\N	23	\N	\N	\N	\N	3	0	66	L	66
1243	973	131	34	1	3	5227	16000	1	\N	\N	19	2019-12-17 00:00:00	\N	2	5	1	82803	68	L	68
829	649	82	41	1	2	0	0	0	\N	\N	19	2019-11-26 00:00:00	\N	1	2	1	407638	65	L	68
1033	803	69	51	1	3	7608	44007	1	\N	\N	19	2019-12-10 00:00:00	\N	1	1	1	408152	67	L	67
1230	975	131	34	1	3	6638	34250	1	\N	\N	23	2019-12-17 00:00:00	\N	2	5	1	407882	68	X	68
742	570	69	58	1	2	0	0	0	\N	\N	19	2019-11-20 00:00:00	\N	1	1	1	406944	64	L	68
678	234	74	41	1	2	0	0	0	\N	\N	19	2019-11-18 00:00:00	\N	2	1	1	407640	64	L	68
830	650	69	41	1	2	0	0	0	\N	\N	19	2019-11-26 00:00:00	\N	1	1	1	407637	65	L	68
823	643	74	41	1	2	0	0	0	\N	\N	19	2019-11-26 00:00:00	\N	2	1	1	407724	65	L	68
822	642	89	41	1	2	0	0	0	\N	\N	19	2019-11-26 00:00:00	\N	2	2	1	407635	65	L	68
665	499	84	46	1	2	0	0	0	\N	\N	19	2019-11-18 00:00:00	\N	1	2	1	407517	64	L	68
671	505	69	46	1	2	0	0	0	\N	\N	19	2019-11-18 00:00:00	\N	1	1	1	407503	64	L	68
663	497	89	46	1	2	0	0	0	\N	\N	19	2019-11-18 00:00:00	\N	2	2	1	407514	64	L	68
662	496	94	46	1	2	0	0	0	\N	\N	19	2019-11-18 00:00:00	\N	3	2	1	407513	64	L	68
782	608	69	58	1	2	0	0	0	\N	\N	19	2019-11-25 00:00:00	\N	1	1	1	0	65	L	68
775	601	69	58	1	2	0	0	0	\N	\N	19	2019-11-25 00:00:00	\N	1	1	1	408050	65	L	68
781	607	84	58	1	2	0	0	0	\N	\N	19	2019-11-25 00:00:00	\N	1	2	1	0	65	L	68
774	600	84	58	1	2	0	0	0	\N	\N	19	2019-11-25 00:00:00	\N	1	2	1	408054	65	L	68
1165	929	83	32	1	3	9019	104641.679999999993	1	\N	\N	19	2019-12-16 00:00:00	\N	1	2	1	406918	68	L	68
235	151	\N	48	1	1	\N	\N	0	\N	\N	1	2019-12-11 00:00:00	\N	\N	\N	3	-1	60	L	60
654	490	75	41	1	2	0	0	0	\N	\N	19	2019-11-18 00:00:00	\N	2	1	1	407719	64	L	68
655	490	129	41	1	2	0	0	0	\N	\N	19	2019-11-18 00:00:00	\N	2	5	1	84084	64	L	68
788	614	84	46	1	2	0	0	0	\N	\N	19	2019-11-25 00:00:00	\N	1	2	1	407511	65	L	68
787	613	84	46	1	2	0	0	0	\N	\N	19	2019-11-25 00:00:00	\N	1	2	1	407501	65	L	68
872	682	69	52	1	2	0	0	0	\N	\N	19	2019-11-27 00:00:00	\N	1	1	1	407815	65	L	68
846	660	82	39	1	2	0	0	0	\N	\N	19	2019-11-27 00:00:00	\N	1	2	1	405980	65	L	68
727	556	69	31	1	2	0	0	0	\N	\N	19	2019-11-20 00:00:00	\N	1	1	1	406990	64	L	68
1151	915	69	31	1	3	9478	78806.6600000000035	1	\N	\N	19	2019-12-16 00:00:00	\N	1	1	1	407551	68	L	68
687	519	84	53	1	2	0	0	0	\N	\N	19	2019-11-19 00:00:00	\N	1	2	1	406871	64	L	68
718	547	89	33	1	2	0	0	0	\N	\N	19	2019-11-19 00:00:00	\N	2	2	1	406618	64	L	68
734	562	69	58	1	2	0	0	0	\N	\N	19	2019-11-20 00:00:00	\N	1	1	1	405999	64	L	68
735	563	69	58	1	2	0	0	0	\N	\N	19	2019-11-20 00:00:00	\N	1	1	1	407898	64	L	68
1089	864	74	54	1	2	0	0	0	\N	\N	19	2019-12-10 00:00:00	\N	2	1	1	405774	67	X	67
1070	847	84	48	1	2	0	0	0	\N	\N	19	2019-12-10 00:00:00	\N	1	2	1	407625	67	L	74
1287	1002	\N	39	1	1	\N	\N	0	\N	\N	23	\N	\N	\N	\N	3	0	72	L	72
965	537	131	51	1	2	0	0	0	\N	\N	19	2019-12-04 00:00:00	\N	2	5	1	81243	66	L	69
975	763	84	31	1	2	0	0	0	\N	\N	19	2019-12-09 00:00:00	\N	1	2	1	408028	67	L	69
909	712	89	41	1	2	0	0	0	\N	\N	19	2019-12-02 00:00:00	\N	2	2	1	407982	66	L	69
921	722	67	38	1	2	0	0	0	\N	\N	19	2019-12-02 00:00:00	\N	1	1	1	407707	66	L	69
262	164	79	48	1	2	\N	\N	\N	\N	\N	1	2019-12-11 00:00:00	\N	3	1	1	401914	60	X	60
354	234	74	41	1	2	0	0	0	\N	\N	19	2019-12-11 00:00:00	\N	2	1	1	406690	61	X	61
360	239	79	44	1	4	17578171	247800	3	\N	\N	19	2019-12-11 00:00:00	\N	3	1	1	405626	61	X	61
363	241	84	46	1	2	0	0	0	\N	\N	1	2019-12-11 00:00:00	\N	1	2	1	406655	61	X	61
282	182	69	44	1	2	\N	\N	\N	\N	\N	1	2019-12-11 00:00:00	\N	1	1	1	406861	60	L	60
744	571	\N	51	1	1	\N	\N	0	\N	\N	1	\N	\N	\N	\N	3	0	64	X	64
297	196	94	43	1	2	\N	\N	\N	\N	\N	1	2019-12-11 00:00:00	\N	3	2	1	405834	60	L	66
416	282	69	53	1	2	0	0	0	\N	\N	19	2019-12-11 00:00:00	\N	1	1	1	406958	61	L	66
402	270	79	35	1	2	0	0	0	\N	\N	1	2019-12-11 00:00:00	\N	3	1	1	405410	61	L	66
433	295	68	32	1	2	0	0	0	\N	\N	1	2019-12-11 00:00:00	\N	1	1	1	406610	62	L	66
337	217	84	46	1	2	\N	\N	\N	\N	\N	19	2019-12-11 00:00:00	\N	1	2	1	406667	61	L	66
437	299	69	36	1	2	0	0	0	\N	\N	19	2019-12-11 00:00:00	\N	1	1	1	405451	62	L	66
352	232	69	40	1	2	0	0	0	\N	\N	19	2019-12-11 00:00:00	\N	1	1	1	405664	61	L	66
443	305	90	41	1	2	0	0	0	\N	\N	19	2019-12-11 00:00:00	\N	2	2	1	407650	62	L	66
488	344	84	39	1	2	0	0	0	\N	\N	19	2019-12-11 00:00:00	\N	1	2	1	405866	62	L	66
223	139	69	46	1	2	\N	\N	\N	\N	\N	1	2019-12-11 00:00:00	\N	1	1	1	406656	60	L	66
396	264	69	32	1	2	0	0	0	\N	\N	1	2019-12-11 00:00:00	\N	1	1	1	405577	61	L	66
397	265	79	32	1	2	0	0	0	\N	\N	1	2019-12-11 00:00:00	\N	3	1	1	405573	61	L	66
356	235	74	41	1	2	0	0	0	\N	\N	19	2019-12-11 00:00:00	\N	2	1	1	406690	61	L	66
359	238	90	41	1	2	0	0	0	\N	\N	19	2019-12-11 00:00:00	\N	2	2	1	406686	61	L	66
266	168	89	44	1	2	\N	\N	\N	\N	\N	1	2019-12-11 00:00:00	\N	2	2	1	406730	60	L	67
207	124	89	46	1	2	\N	\N	\N	\N	\N	1	2019-12-11 00:00:00	\N	2	2	1	405839	60	L	66
209	126	84	46	1	2	\N	\N	\N	\N	\N	1	2019-12-11 00:00:00	\N	1	2	1	405990	60	L	66
218	134	84	46	1	2	\N	\N	\N	\N	\N	1	2019-12-11 00:00:00	\N	1	2	1	405906	60	L	66
512	366	69	43	1	2	0	0	0	\N	\N	19	2019-12-11 00:00:00	\N	1	1	1	405973	62	L	66
508	363	69	43	1	2	0	0	0	\N	\N	19	2019-12-11 00:00:00	\N	1	1	1	404884	62	L	66
513	367	69	43	1	2	0	0	0	\N	\N	19	2019-12-11 00:00:00	\N	1	1	1	405798	62	L	66
509	364	69	43	1	2	0	0	0	\N	\N	19	2019-12-11 00:00:00	\N	1	1	1	405528	62	L	66
511	365	94	43	1	2	0	0	0	\N	\N	19	2019-12-11 00:00:00	\N	3	2	1	405538	62	L	66
439	301	89	50	1	2	0	0	0	\N	\N	19	2019-12-11 00:00:00	\N	2	2	1	406980	62	L	66
376	250	69	38	1	2	0	0	0	\N	\N	1	2019-12-11 00:00:00	\N	1	1	1	406779	61	L	66
631	469	67	46	1	2	0	0	0	\N	\N	1	2019-11-13 00:00:00	\N	1	1	1	406936	63	L	66
636	473	84	46	1	2	0	0	0	\N	\N	1	2019-11-13 00:00:00	\N	1	2	1	406950	63	L	66
487	343	82	39	1	2	0	0	0	\N	\N	19	2019-12-11 00:00:00	\N	1	2	1	405862	62	L	66
490	346	89	39	1	2	0	0	0	\N	\N	19	2019-12-11 00:00:00	\N	2	2	1	405858	62	L	66
469	330	69	48	1	2	0	0	0	\N	\N	19	2019-12-11 00:00:00	\N	1	1	1	405953	62	L	66
476	336	69	48	1	2	0	0	0	\N	\N	19	2019-12-11 00:00:00	\N	1	1	1	406533	62	L	66
468	329	69	48	1	2	0	0	0	\N	\N	19	2019-12-11 00:00:00	\N	1	1	1	406540	62	L	66
472	333	74	48	1	2	0	0	0	\N	\N	19	2019-12-11 00:00:00	\N	2	1	1	406531	62	L	67
530	381	131	34	1	2	0	0	0	\N	\N	19	2019-12-11 00:00:00	\N	2	5	1	82611	62	L	66
1451	1131	\N	38	1	1	\N	\N	0	\N	\N	19	\N	\N	\N	\N	3	0	76	L	76
1192	950	131	48	1	2	0	0	0	\N	\N	19	2019-12-17 00:00:00	\N	2	5	1	82701	68	L	74
364	241	84	46	1	2	0	0	0	\N	\N	1	2019-12-11 00:00:00	\N	1	2	1	406655	61	X	61
898	701	131	45	1	3	3778	32000	2	\N	\N	19	2019-11-29 00:00:00	\N	2	5	1	84130	66	L	66
333	213	84	46	1	2	\N	\N	\N	\N	\N	19	2019-12-11 00:00:00	\N	1	2	1	406648	61	L	66
336	216	84	46	1	2	\N	\N	\N	\N	\N	19	2019-12-11 00:00:00	\N	1	2	1	406666	61	L	66
339	219	89	46	1	2	\N	\N	\N	\N	\N	19	2019-12-11 00:00:00	\N	2	2	1	406670	61	L	66
340	220	89	46	1	2	\N	\N	\N	\N	\N	19	2019-12-11 00:00:00	\N	2	2	1	406671	61	L	66
342	222	69	46	1	2	\N	\N	\N	\N	\N	19	2019-12-11 00:00:00	\N	1	1	1	406669	61	L	66
345	225	69	46	1	2	\N	\N	\N	\N	\N	19	2019-12-11 00:00:00	\N	1	1	1	406654	61	L	66
346	226	94	46	1	2	\N	\N	\N	\N	\N	19	2019-12-11 00:00:00	\N	3	2	1	406673	61	L	66
368	244	89	46	1	2	0	0	0	\N	\N	1	2019-12-11 00:00:00	\N	2	2	1	405913	61	L	66
371	247	94	46	1	2	0	0	0	\N	\N	1	2019-12-11 00:00:00	\N	3	2	1	406682	61	L	66
373	249	84	46	1	2	0	0	0	\N	\N	1	2019-12-11 00:00:00	\N	1	2	1	406674	61	L	66
430	204	89	44	1	2	0	0	0	\N	\N	1	2019-12-11 00:00:00	\N	2	2	1	406866	62	L	66
302	201	74	42	1	2	\N	\N	\N	\N	\N	1	2019-12-11 00:00:00	\N	2	1	1	405930	60	L	67
444	306	89	41	1	2	0	0	0	\N	\N	19	2019-12-11 00:00:00	\N	2	2	1	407656	62	L	66
447	309	90	41	1	2	0	0	0	\N	\N	19	2019-12-11 00:00:00	\N	2	2	1	407642	62	L	66
448	310	86	41	1	2	0	0	0	\N	\N	19	2019-12-11 00:00:00	\N	1	2	1	407651	62	L	66
976	764	84	31	1	3	2807	125391.669999999998	1	\N	\N	19	2019-12-09 00:00:00	\N	1	2	1	406630	67	L	67
1015	796	84	32	1	3	8364	125391.669999999998	1	\N	\N	19	2019-12-09 00:00:00	\N	1	2	1	407557	67	L	67
934	479	84	46	1	2	0	0	0	\N	\N	19	2019-12-03 00:00:00	\N	1	2	1	407505	66	L	69
353	233	87	41	1	2	0	0	0	\N	\N	19	2019-12-11 00:00:00	\N	2	2	1	406684	61	L	66
505	360	69	52	1	2	0	0	0	\N	\N	19	2019-12-11 00:00:00	\N	1	1	1	406576	62	L	66
563	410	69	32	1	2	0	0	0	\N	\N	19	2019-12-11 00:00:00	\N	1	1	1	406611	63	L	66
1059	839	84	34	1	3	84051748	205192	1	\N	\N	19	2019-12-10 00:00:00	\N	1	2	1	408177	67	L	67
602	443	69	42	1	2	0	0	0	\N	\N	19	2019-12-11 00:00:00	\N	1	1	1	405946	63	L	66
594	436	73	41	1	2	0	0	0	\N	\N	19	2019-12-11 00:00:00	\N	2	1	1	406694	63	L	66
596	438	86	41	1	2	0	0	0	\N	\N	19	2019-12-11 00:00:00	\N	1	2	1	407718	63	L	66
593	435	86	41	1	2	0	0	0	\N	\N	19	2019-12-11 00:00:00	\N	1	2	1	407722	63	L	66
592	434	86	41	1	2	0	0	0	\N	\N	19	2019-12-11 00:00:00	\N	1	2	1	407717	63	L	66
595	437	95	41	1	2	0	0	0	\N	\N	19	2019-12-11 00:00:00	\N	3	2	1	406688	63	L	66
603	444	69	43	1	2	0	0	0	\N	\N	19	2019-12-11 00:00:00	\N	1	1	1	405975	63	L	66
605	446	84	43	1	2	0	0	0	\N	\N	19	2019-12-11 00:00:00	\N	1	2	1	407659	63	L	66
614	454	84	48	1	2	0	0	0	\N	\N	19	2019-12-11 00:00:00	\N	1	2	1	407606	63	L	66
586	430	84	48	1	2	0	0	0	\N	\N	19	2019-12-11 00:00:00	\N	1	2	1	407604	63	L	66
615	454	131	48	1	2	0	0	0	\N	\N	19	2019-12-11 00:00:00	\N	2	5	1	808863	63	L	66
587	430	131	48	1	2	0	0	0	\N	\N	19	2019-12-11 00:00:00	\N	2	5	1	80862	63	L	66
610	451	84	37	1	2	0	0	0	\N	\N	19	2019-12-11 00:00:00	\N	1	2	1	405881	63	L	66
612	451	131	37	1	2	0	0	0	\N	\N	19	2019-12-11 00:00:00	\N	2	5	1	84373	63	L	66
609	450	68	37	1	2	0	0	0	\N	\N	19	2019-12-11 00:00:00	\N	1	1	1	405883	63	L	66
577	422	69	33	1	2	0	0	0	\N	\N	19	2019-12-11 00:00:00	\N	1	1	1	406621	63	L	67
514	367	129	43	1	2	0	0	0	\N	\N	19	2019-12-11 00:00:00	\N	2	5	1	84301	62	L	66
540	389	74	54	1	2	0	0	0	\N	\N	19	2019-12-11 00:00:00	\N	2	1	1	405781	62	L	66
537	386	74	54	1	2	0	0	0	\N	\N	19	2019-12-11 00:00:00	\N	2	1	1	405770	62	L	66
637	474	89	46	1	2	0	0	0	\N	\N	1	2019-11-13 00:00:00	\N	2	2	1	407504	63	L	66
524	377	69	38	1	2	0	0	0	\N	\N	19	2019-12-11 00:00:00	\N	1	1	1	405805	62	L	66
527	380	84	38	1	2	0	0	0	\N	\N	19	2019-12-11 00:00:00	\N	1	2	1	405888	62	L	66
528	380	131	38	1	2	0	0	0	\N	\N	19	2019-12-11 00:00:00	\N	2	5	1	84306	62	L	66
496	351	88	31	1	2	0	0	0	\N	\N	19	2019-12-11 00:00:00	\N	2	2	1	405403	62	L	67
899	703	\N	31	1	1	\N	\N	0	\N	\N	19	\N	\N	\N	\N	3	0	66	L	66
451	313	79	39	1	2	0	0	0	\N	\N	19	2019-12-11 00:00:00	\N	3	1	1	406793	62	L	66
520	373	68	51	1	2	0	0	0	\N	\N	19	2019-12-11 00:00:00	\N	1	1	1	406834	62	L	67
518	371	83	51	1	2	0	0	0	\N	\N	19	2019-12-11 00:00:00	\N	1	2	1	407690	62	L	67
522	375	83	51	1	2	0	0	0	\N	\N	19	2019-12-11 00:00:00	\N	1	2	1	407691	62	L	66
517	370	87	51	1	2	0	0	0	\N	\N	19	2019-12-11 00:00:00	\N	2	2	1	406833	62	L	67
503	358	69	52	1	2	0	0	0	\N	\N	19	2019-12-11 00:00:00	\N	1	1	1	406589	62	L	66
504	359	69	52	1	2	0	0	0	\N	\N	19	2019-12-11 00:00:00	\N	1	1	1	406593	62	L	66
599	441	84	42	1	2	0	0	0	\N	\N	19	2019-12-11 00:00:00	\N	1	2	1	405932	63	L	66
600	442	84	42	1	2	0	0	0	\N	\N	19	2019-12-11 00:00:00	\N	1	2	1	405757	63	L	66
601	442	131	42	1	2	0	0	0	\N	\N	19	2019-12-11 00:00:00	\N	2	5	1	84257	63	L	66
923	723	\N	37	1	1	\N	\N	0	\N	\N	19	\N	\N	\N	\N	3	0	66	L	66
236	152	\N	48	1	1	\N	\N	0	\N	\N	1	2019-12-11 00:00:00	\N	\N	\N	3	-1	60	L	60
449	311	89	41	1	2	0	0	0	\N	\N	19	2019-12-11 00:00:00	\N	2	2	1	407648	62	L	66
450	312	90	41	1	2	0	0	0	\N	\N	19	2019-12-11 00:00:00	\N	2	2	1	407645	62	L	66
445	307	69	41	1	2	0	0	0	\N	\N	19	2019-12-11 00:00:00	\N	1	1	1	407647	62	L	66
1034	814	69	52	1	3	5843	81000	1	\N	\N	19	2019-12-10 00:00:00	\N	1	1	1	408005	67	L	67
1054	834	84	58	1	2	0	0	0	\N	\N	19	2019-12-10 00:00:00	\N	1	2	1	408059	67	X	67
955	409	69	31	1	2	0	0	0	\N	\N	19	2019-12-03 00:00:00	\N	1	1	1	407756	66	L	68
977	765	84	31	1	3	8751	125391.669999999998	1	\N	\N	19	2019-12-09 00:00:00	\N	1	2	1	406631	67	L	67
1016	797	84	39	1	2	0	0	0	\N	\N	19	2019-12-09 00:00:00	\N	1	2	1	406760	67	X	67
1123	890	84	31	1	3	40148	136325	1	\N	\N	19	2019-12-16 00:00:00	\N	1	2	1	408021	68	L	68
1206	958	\N	48	1	1	\N	\N	0	\N	\N	19	\N	\N	\N	\N	3	0	68	L	68
1166	930	69	32	1	3	5853	73390	1	\N	\N	19	2019-12-16 00:00:00	\N	1	1	1	406917	68	L	68
1180	941	69	52	1	3	3986	54940	1	\N	\N	19	2019-12-17 00:00:00	\N	1	1	1	408259	68	L	68
911	714	74	41	1	2	0	0	0	\N	\N	19	2019-12-02 00:00:00	\N	2	1	1	407987	66	L	74
1269	990	\N	48	1	1	\N	\N	0	\N	\N	23	\N	\N	\N	\N	3	0	72	L	72
935	732	69	46	1	2	0	0	0	\N	\N	19	2019-12-03 00:00:00	\N	1	1	1	407535	66	L	69
947	741	69	32	1	2	0	0	0	\N	\N	19	2019-12-03 00:00:00	\N	1	1	1	406912	66	L	69
997	784	84	46	1	2	0	0	0	\N	\N	19	2019-12-09 00:00:00	\N	1	2	1	407787	67	L	69
956	750	84	56	1	2	0	0	0	\N	\N	19	2019-12-03 00:00:00	\N	1	2	1	405964	66	X	66
1270	991	\N	56	1	1	\N	\N	0	\N	\N	23	\N	\N	\N	\N	3	0	74	X	74
704	534	82	51	1	2	0	0	0	\N	\N	19	2019-11-19 00:00:00	\N	1	2	1	407683	64	L	68
712	541	69	39	1	2	0	0	0	\N	\N	19	2019-11-19 00:00:00	\N	1	1	1	405815	64	L	68
1036	816	84	52	1	3	9166	133000	1	\N	\N	19	2019-12-10 00:00:00	\N	1	2	1	408007	67	L	67
978	766	\N	35	1	1	\N	\N	0	\N	\N	19	\N	\N	\N	\N	3	0	67	L	67
1232	976	131	34	1	2	0	0	0	\N	\N	23	2019-12-17 00:00:00	\N	2	5	1	408175	68	X	68
1207	959	\N	48	1	1	\N	\N	0	\N	\N	19	\N	\N	\N	\N	3	0	68	L	68
680	512	88	41	1	2	0	0	0	\N	\N	19	2019-11-18 00:00:00	\N	2	2	1	407716	64	L	68
824	644	74	41	1	2	0	0	0	\N	\N	19	2019-11-26 00:00:00	\N	2	1	1	407728	65	L	68
728	557	69	31	1	2	0	0	0	\N	\N	19	2019-11-20 00:00:00	\N	1	1	1	406993	64	L	68
831	651	74	41	1	2	0	0	0	\N	\N	19	2019-11-26 00:00:00	\N	2	1	1	407731	65	L	68
832	652	89	41	1	2	0	0	0	\N	\N	19	2019-11-26 00:00:00	\N	2	2	1	407715	65	L	68
825	645	68	41	1	2	0	0	0	\N	\N	19	2019-11-26 00:00:00	\N	1	1	1	407633	65	L	68
826	646	74	41	1	2	0	0	0	\N	\N	19	2019-11-26 00:00:00	\N	2	1	1	407639	65	L	68
672	506	69	46	1	2	0	0	0	\N	\N	19	2019-11-18 00:00:00	\N	1	1	1	407507	64	L	68
673	506	131	46	1	2	0	0	0	\N	\N	19	2019-11-18 00:00:00	\N	2	5	1	84145	64	L	68
667	501	94	46	1	2	0	0	0	\N	\N	19	2019-11-18 00:00:00	\N	3	2	1	407510	64	L	68
778	604	69	58	1	2	0	0	0	\N	\N	19	2019-11-25 00:00:00	\N	1	1	1	0	65	L	68
777	603	69	58	1	2	0	0	0	\N	\N	19	2019-11-25 00:00:00	\N	1	1	1	408058	65	L	68
783	609	69	58	1	2	0	0	0	\N	\N	19	2019-11-25 00:00:00	\N	1	1	1	0	65	L	68
776	602	69	58	1	2	0	0	0	\N	\N	19	2019-11-25 00:00:00	\N	1	1	1	408053	65	L	68
784	610	84	58	1	2	0	0	0	\N	\N	19	2019-11-25 00:00:00	\N	1	2	1	0	65	L	68
770	596	84	58	1	2	0	0	0	\N	\N	19	2019-11-25 00:00:00	\N	1	2	1	408047	65	L	68
769	595	84	58	1	2	0	0	0	\N	\N	19	2019-11-25 00:00:00	\N	1	2	1	407894	65	L	68
1167	931	69	32	1	3	5888	80565	1	\N	\N	19	2019-12-16 00:00:00	\N	1	1	1	405431	68	L	68
675	508	74	41	1	2	0	0	0	\N	\N	19	2019-11-18 00:00:00	\N	2	1	1	407730	64	L	68
400	268	69	32	1	2	0	0	0	\N	\N	1	2019-12-11 00:00:00	\N	1	1	1	406609	61	L	68
398	266	69	32	1	2	0	0	0	\N	\N	1	2019-12-11 00:00:00	\N	1	1	1	405574	61	L	68
790	615	94	46	1	2	0	0	0	\N	\N	19	2019-11-25 00:00:00	\N	3	2	1	407516	65	L	68
791	616	69	46	1	2	0	0	0	\N	\N	19	2019-11-25 00:00:00	\N	1	1	1	407548	65	L	68
792	617	84	46	1	2	0	0	0	\N	\N	19	2019-11-25 00:00:00	\N	1	2	1	407546	65	L	68
869	679	69	52	1	2	0	0	0	\N	\N	19	2019-11-27 00:00:00	\N	1	1	1	406596	65	L	68
867	677	69	52	1	2	0	0	0	\N	\N	19	2019-11-27 00:00:00	\N	1	1	1	407814	65	L	68
868	678	69	52	1	2	0	0	0	\N	\N	19	2019-11-27 00:00:00	\N	1	1	1	406579	65	L	68
871	681	69	52	1	2	0	0	0	\N	\N	19	2019-11-27 00:00:00	\N	1	1	1	407750	65	L	68
853	665	69	39	1	2	0	0	0	\N	\N	19	2019-11-27 00:00:00	\N	1	1	1	405956	65	L	68
854	666	82	39	1	2	0	0	0	\N	\N	19	2019-11-27 00:00:00	\N	1	2	1	406954	65	L	68
851	464	89	39	1	2	0	0	0	\N	\N	19	2019-11-27 00:00:00	\N	2	2	1	406801	65	L	68
525	378	83	38	1	2	0	0	0	\N	\N	19	2019-12-11 00:00:00	\N	1	2	1	406787	62	L	68
688	520	69	53	1	2	0	0	0	\N	\N	19	2019-11-19 00:00:00	\N	1	1	1	406971	64	L	68
474	335	82	48	1	2	0	0	0	\N	\N	19	2019-12-11 00:00:00	\N	1	2	1	406536	62	L	68
475	335	131	48	1	2	0	0	0	\N	\N	19	2019-12-11 00:00:00	\N	2	5	1	80860	62	L	68
651	487	131	56	1	2	0	0	0	\N	\N	19	2019-11-18 00:00:00	\N	2	5	1	83697	64	L	68
736	564	84	58	1	2	0	0	0	\N	\N	19	2019-11-20 00:00:00	\N	1	2	1	405984	64	L	68
924	724	69	37	1	2	0	0	0	\N	\N	19	2019-12-02 00:00:00	\N	1	1	1	407971	66	L	69
888	696	131	37	1	2	0	0	0	\N	\N	19	2019-11-29 00:00:00	\N	2	5	1	82740	66	L	69
1091	866	84	53	1	2	0	0	0	\N	\N	19	2019-12-13 00:00:00	\N	1	2	1	406978	68	L	69
936	733	84	46	1	2	0	0	0	\N	\N	19	2019-12-03 00:00:00	\N	1	2	1	407502	66	L	69
900	688	88	41	1	2	0	0	0	\N	\N	23	2019-11-29 00:00:00	\N	2	2	1	407990	66	L	69
912	715	89	41	1	2	0	0	0	\N	\N	19	2019-12-02 00:00:00	\N	2	2	1	407984	66	L	69
1017	798	69	39	1	2	0	0	0	\N	\N	19	2019-12-09 00:00:00	\N	1	1	1	406805	67	L	69
559	406	68	31	1	2	0	0	0	\N	\N	19	2019-12-11 00:00:00	\N	1	1	1	406998	63	L	66
558	405	69	53	1	2	0	0	0	\N	\N	19	2019-12-11 00:00:00	\N	1	1	1	406962	63	L	66
889	697	\N	38	1	1	\N	\N	0	\N	\N	23	\N	\N	\N	\N	3	0	66	L	66
493	348	94	31	1	2	0	0	0	\N	\N	19	2019-12-11 00:00:00	\N	3	2	1	406995	62	L	66
901	704	\N	31	1	1	\N	\N	0	\N	\N	19	\N	\N	\N	\N	3	0	66	L	66
957	751	69	52	1	3	2774	61006.6699999999983	1	\N	\N	23	2019-12-03 00:00:00	\N	1	1	1	408004	66	L	66
575	420	\N	33	1	1	\N	\N	0	\N	\N	19	2019-12-11 00:00:00	\N	\N	\N	3	0	63	L	63
1037	817	69	52	1	3	2867	73390	1	\N	\N	19	2019-12-10 00:00:00	\N	1	1	1	408009	67	L	67
1271	992	\N	50	1	1	\N	\N	0	\N	\N	23	\N	\N	\N	\N	3	0	72	L	72
1208	960	69	51	1	3	1867	51514.6699999999983	1	\N	\N	19	2019-12-17 00:00:00	\N	1	1	1	407587	68	L	68
1168	932	69	37	1	3	2949	100000	1	\N	\N	19	2019-12-17 00:00:00	\N	1	1	1	407972	68	L	68
660	494	69	45	1	2	0	0	0	\N	\N	19	2019-11-18 00:00:00	\N	1	1	1	406926	64	L	68
564	411	84	50	1	2	0	0	0	\N	\N	19	2019-12-11 00:00:00	\N	1	2	1	406982	63	L	68
668	502	84	46	1	2	0	0	0	\N	\N	19	2019-11-18 00:00:00	\N	1	2	1	406939	64	L	68
683	515	84	46	1	2	0	0	0	\N	\N	19	2019-11-19 00:00:00	\N	1	2	1	407509	64	L	68
779	605	69	58	1	2	0	0	0	\N	\N	19	2019-11-25 00:00:00	\N	1	1	1	0	65	L	68
585	429	69	48	1	2	0	0	0	\N	\N	19	2019-12-11 00:00:00	\N	1	1	1	407005	63	L	68
676	509	89	41	1	2	0	0	0	\N	\N	19	2019-11-18 00:00:00	\N	2	2	1	407714	64	L	68
576	421	89	33	1	2	0	0	0	\N	\N	19	2019-12-11 00:00:00	\N	2	2	1	405315	63	L	68
767	593	69	57	1	2	0	0	0	\N	\N	19	2019-11-25 00:00:00	\N	1	1	1	407589	65	L	68
786	612	84	46	1	2	0	0	0	\N	\N	19	2019-11-25 00:00:00	\N	1	2	1	407539	65	L	68
526	379	74	38	1	2	0	0	0	\N	\N	19	2019-12-11 00:00:00	\N	2	1	1	405789	62	L	68
1154	918	83	31	1	3	63666	88691.6699999999983	1	\N	\N	19	2019-12-16 00:00:00	\N	1	2	1	408020	68	L	68
739	567	84	58	1	2	0	0	0	\N	\N	19	2019-11-20 00:00:00	\N	1	2	1	407879	64	L	68
1346	1048	\N	38	1	1	\N	\N	0	\N	\N	23	\N	\N	\N	\N	3	0	74	L	74
998	784	131	46	1	2	0	0	0	\N	\N	19	2019-12-09 00:00:00	\N	2	5	1	84147	67	L	74
1074	851	84	48	1	2	0	0	0	\N	\N	19	2019-12-10 00:00:00	\N	1	2	1	407928	67	L	74
999	785	69	46	1	2	0	0	0	\N	\N	19	2019-12-09 00:00:00	\N	1	1	1	407790	67	L	69
1092	867	69	53	1	2	0	0	0	\N	\N	19	2019-12-13 00:00:00	\N	1	1	1	405761	68	L	69
925	725	94	39	1	2	0	0	0	\N	\N	19	2019-12-02 00:00:00	\N	3	2	1	405813	66	L	69
937	734	84	46	1	2	0	0	0	\N	\N	19	2019-12-03 00:00:00	\N	1	2	1	407550	66	L	69
913	716	74	41	1	2	0	0	0	\N	\N	19	2019-12-02 00:00:00	\N	2	1	1	407844	66	L	69
1018	799	69	39	1	2	0	0	0	\N	\N	19	2019-12-09 00:00:00	\N	1	1	1	406804	67	L	69
1056	836	69	58	1	2	0	0	0	\N	\N	19	2019-12-10 00:00:00	\N	1	1	1	408109	67	L	69
281	181	73	44	1	2	\N	\N	\N	\N	\N	1	2019-12-11 00:00:00	\N	2	1	1	406733	60	L	60
194	114	84	46	1	2	\N	\N	\N	\N	\N	1	2019-10-21 00:00:00	2019-10-21 00:00:00	1	2	1	406826	60	L	60
195	115	84	46	1	2	\N	\N	\N	\N	\N	1	2019-10-21 00:00:00	2019-10-21 00:00:00	1	2	1	406662	60	L	60
284	183	84	46	1	2	\N	\N	\N	\N	\N	1	2019-12-11 00:00:00	\N	1	2	1	406659	60	L	60
285	184	84	46	1	2	\N	\N	\N	\N	\N	1	2019-12-11 00:00:00	\N	1	2	1	405987	60	L	60
684	516	84	53	1	2	0	0	0	\N	\N	19	2019-11-19 00:00:00	\N	1	2	1	406870	64	X	64
647	483	69	43	1	4	16897173	64000	1	\N	\N	1	2019-11-13 00:00:00	\N	1	1	1	405796	63	L	63
427	234	89	41	1	2	0	0	0	\N	\N	1	2019-12-11 00:00:00	\N	2	2	1	406685	62	X	62
709	539	82	51	1	1	0	0	0	\N	\N	19	2019-11-19 00:00:00	\N	1	2	1	407686	64	X	64
1272	993	84	50	1	3	5903	143841.670000000013	1	\N	\N	23	2020-01-13 00:00:00	\N	1	2	1	408138	72	L	72
733	562	69	58	1	2	0	0	0	\N	\N	19	2019-11-20 00:00:00	\N	1	1	1	405999	64	X	64
876	685	79	48	1	2	0	0	0	\N	\N	19	2019-11-27 00:00:00	\N	3	1	1	407613	65	X	65
815	638	\N	53	1	1	\N	\N	0	\N	\N	19	\N	\N	\N	\N	3	0	65	L	65
685	517	69	53	1	3	2636555075	235370.010000000009	3	\N	\N	19	2019-11-19 00:00:00	\N	1	1	1	406769	64	L	64
693	164	79	48	1	4	9159	62253.3399999999965	2	\N	\N	1	2019-11-19 00:00:00	\N	3	1	1	401914	64	L	64
717	546	84	33	1	3	2640071460	143841.670000000013	1	\N	\N	19	2019-11-19 00:00:00	\N	1	2	1	405735	64	L	64
237	153	\N	48	1	1	\N	\N	0	\N	\N	1	2019-12-11 00:00:00	\N	\N	\N	3	-1	60	L	60
741	569	69	58	1	3	2638965270	659280	12	\N	\N	19	2019-11-20 00:00:00	\N	1	1	1	407878	64	L	64
267	169	69	44	1	2	\N	\N	\N	\N	\N	1	2019-12-11 00:00:00	\N	1	1	1	406727	60	L	60
276	176	89	44	1	2	\N	\N	\N	\N	\N	1	2019-12-11 00:00:00	\N	2	2	1	406891	60	L	60
275	175	89	44	1	2	\N	\N	\N	\N	\N	1	2019-12-11 00:00:00	\N	2	2	1	406867	60	L	60
780	606	84	58	1	2	0	0	0	\N	\N	19	2019-11-25 00:00:00	\N	1	2	1	0	65	X	65
852	664	\N	39	1	1	\N	\N	0	\N	\N	19	\N	\N	\N	\N	3	0	65	L	65
766	592	69	35	1	4	18316	85000	1	\N	\N	19	2019-11-25 00:00:00	\N	1	1	1	405420	65	L	65
834	654	69	31	1	3	8348	51600	1	\N	\N	19	2019-11-26 00:00:00	\N	1	1	1	406904	65	L	65
858	670	69	37	1	3	6911	242000	2	\N	\N	19	2019-11-27 00:00:00	\N	1	1	1	407956	65	L	65
752	578	82	37	1	3	83057	69825	1	\N	\N	19	2019-11-25 00:00:00	\N	1	2	1	407960	65	L	65
759	585	82	37	1	3	83057	64225	1	\N	\N	19	2019-11-25 00:00:00	\N	1	2	1	405936	65	L	65
758	584	82	37	1	3	83057	87938	1	\N	\N	19	2019-11-25 00:00:00	\N	1	2	1	401943	65	L	65
840	428	69	34	1	2	0	0	0	\N	\N	19	2019-11-27 00:00:00	\N	1	1	1	407598	65	L	65
153	76	89	37	1	4	2588164002	220200	3	\N	\N	1	2019-10-18 00:00:00	2019-10-18 00:00:00	2	1	1	405885	60	L	60
161	84	69	34	1	4	86924021182	44006.6699999999983	1	\N	\N	1	2019-10-18 00:00:00	2019-10-18 00:00:00	1	1	1	405711	60	L	60
162	85	\N	34	1	4	86924021182	19250	1	\N	\N	1	2019-10-18 00:00:00	2019-10-18 00:00:00	1	5	1	83749	60	L	60
624	462	74	39	1	4	3109	112000	2	\N	\N	19	2019-11-12 00:00:00	\N	2	1	1	405976	63	L	63
648	484	69	56	1	4	56887	55623.3399999999965	1	\N	\N	19	2019-11-13 00:00:00	\N	1	1	1	407558	63	L	63
163	86	84	31	1	4	87962261321	141391.670000000013	1	\N	\N	1	2019-10-18 00:00:00	2019-10-18 00:00:00	1	2	1	405712	60	L	60
180	101	\N	35	1	1	\N	\N	0	\N	\N	1	2019-10-21 00:00:00	2019-10-21 00:00:00	\N	\N	3	-1	60	L	60
181	102	\N	35	1	1	\N	\N	0	\N	\N	1	2019-10-21 00:00:00	2019-10-21 00:00:00	\N	\N	3	-1	60	L	60
183	104	\N	35	1	1	\N	\N	0	\N	\N	1	2019-10-21 00:00:00	2019-10-21 00:00:00	\N	\N	3	-1	60	L	60
184	105	\N	35	1	1	\N	\N	0	\N	\N	1	2019-10-21 00:00:00	2019-10-21 00:00:00	\N	\N	3	-1	60	L	60
185	106	\N	35	1	1	\N	\N	0	\N	\N	1	2019-10-21 00:00:00	2019-10-21 00:00:00	\N	\N	3	-1	60	L	60
186	107	\N	35	1	1	\N	\N	0	\N	\N	1	2019-10-21 00:00:00	2019-10-21 00:00:00	\N	\N	3	-1	60	L	60
187	108	\N	35	1	1	\N	\N	0	\N	\N	1	2019-10-21 00:00:00	2019-10-21 00:00:00	\N	\N	3	-1	60	L	60
188	109	\N	35	1	1	\N	\N	0	\N	\N	1	2019-10-21 00:00:00	2019-10-21 00:00:00	\N	\N	3	-1	60	L	60
179	100	\N	35	1	1	\N	\N	0	\N	\N	1	2019-10-21 00:00:00	2019-10-21 00:00:00	\N	\N	3	-1	60	L	60
182	103	\N	35	1	1	\N	\N	0	\N	\N	1	2019-10-21 00:00:00	2019-10-21 00:00:00	\N	\N	3	-1	60	L	60
177	98	\N	35	1	1	\N	\N	0	\N	\N	1	2019-10-21 00:00:00	2019-10-21 00:00:00	\N	\N	3	-1	60	L	60
640	477	69	37	1	2	0	0	0	\N	\N	1	2019-11-13 00:00:00	\N	1	1	1	405512	63	L	66
828	648	74	41	1	2	0	0	0	\N	\N	19	2019-11-26 00:00:00	\N	2	1	1	406999	65	L	68
1000	785	131	46	1	2	0	0	0	\N	\N	19	2019-12-09 00:00:00	\N	2	5	1	84148	67	L	69
1019	800	84	39	1	2	0	0	0	\N	\N	19	2019-12-09 00:00:00	\N	1	2	1	406754	67	L	69
794	619	69	46	1	2	0	0	0	\N	\N	19	2019-11-25 00:00:00	\N	1	1	1	407537	65	L	69
801	626	69	46	1	2	0	0	0	\N	\N	19	2019-11-25 00:00:00	\N	1	1	1	407525	65	L	69
808	633	84	46	1	2	0	0	0	\N	\N	19	2019-11-26 00:00:00	\N	1	2	1	407521	65	L	69
795	620	89	46	1	2	0	0	0	\N	\N	19	2019-11-25 00:00:00	\N	2	2	1	407533	65	L	69
178	99	\N	35	1	1	\N	\N	0	\N	\N	1	2019-10-21 00:00:00	2019-10-21 00:00:00	\N	\N	3	-1	60	L	60
189	110	73	37	1	2	\N	\N	\N	\N	\N	1	2019-10-21 00:00:00	2019-10-21 00:00:00	2	2	1	405511	60	L	60
174	96	\N	37	1	4	12325	38500	2	\N	\N	1	2019-10-18 00:00:00	2019-10-18 00:00:00	1	5	1	84015	60	L	60
173	96	84	37	1	4	45628	250783.339999999997	2	\N	\N	1	2019-10-18 00:00:00	2019-10-18 00:00:00	1	2	1	405515	60	L	60
702	526	\N	43	1	1	\N	\N	0	\N	\N	19	\N	\N	\N	\N	3	407632	64	X	64
164	87	\N	34	1	4	87962261321	16000	1	\N	\N	1	2019-10-18 00:00:00	2019-10-18 00:00:00	1	5	1	84058	60	L	60
686	518	131	53	1	3	5075	48000	3	\N	\N	19	2019-11-19 00:00:00	\N	2	5	1	82784	64	L	64
168	91	69	38	1	4	25927680	44067	1	\N	\N	1	2019-10-18 00:00:00	2019-10-18 00:00:00	1	1	1	406778	60	L	60
694	528	69	34	1	4	48607011	71506.6699999999983	1	\N	\N	1	2019-11-19 00:00:00	\N	1	1	1	406636	64	L	64
196	116	84	46	1	2	\N	\N	\N	\N	\N	1	2019-10-21 00:00:00	2019-10-21 00:00:00	1	2	1	406827	60	L	60
726	555	69	31	1	3	782923	54939.9400000000023	1	\N	\N	19	2019-11-20 00:00:00	\N	1	1	1	406903	64	L	64
816	639	69	45	1	2	0	0	0	\N	\N	19	2019-11-26 00:00:00	\N	1	1	1	406875	65	X	65
711	540	69	51	1	2	0	0	0	\N	\N	19	2019-11-19 00:00:00	\N	1	1	1	407834	64	L	74
809	634	\N	45	1	1	\N	\N	0	\N	\N	19	\N	\N	\N	\N	3	0	65	L	65
760	586	82	37	1	3	83057	69825	1	\N	\N	19	2019-11-25 00:00:00	\N	1	2	1	407766	65	L	65
746	572	83	37	1	3	83057	96025	1	\N	\N	19	2019-11-25 00:00:00	\N	1	2	1	407762	65	L	65
1273	994	84	50	1	3	9646	186125	1	\N	\N	23	2020-01-13 00:00:00	\N	1	2	1	407581	72	L	72
753	579	72	37	1	3	83057	12880	1	\N	\N	19	2019-11-25 00:00:00	\N	2	1	1	407763	65	L	65
241	157	\N	48	1	1	\N	\N	0	\N	\N	1	2019-12-11 00:00:00	\N	\N	\N	3	-1	60	L	60
199	117	84	31	1	4	88163173427	143841.670000000013	1	\N	\N	1	2019-12-11 00:00:00	\N	1	2	1	406909	60	L	60
277	177	69	31	1	2	\N	\N	\N	\N	\N	1	2019-12-11 00:00:00	\N	1	1	1	406809	60	L	60
320	209	79	31	1	4	114152343	38860	1	\N	\N	1	2019-12-11 00:00:00	\N	3	1	1	4053970	60	L	60
329	209	\N	35	1	1	52343	31126.6699999999983	1	\N	\N	1	2019-12-11 00:00:00	\N	\N	\N	2	14036940	60	L	60
270	170	\N	44	1	1	\N	\N	0	\N	\N	1	2019-12-11 00:00:00	\N	\N	\N	3	-1	60	L	60
271	171	\N	44	1	1	\N	\N	0	\N	\N	1	2019-12-11 00:00:00	\N	\N	\N	3	-1	60	L	60
272	172	\N	44	1	1	\N	\N	0	\N	\N	1	2019-12-11 00:00:00	\N	\N	\N	3	-1	60	L	60
274	174	\N	44	1	1	\N	\N	0	\N	\N	1	2019-12-11 00:00:00	\N	\N	\N	3	-1	60	L	60
273	173	\N	44	1	1	\N	\N	0	\N	\N	1	2019-12-11 00:00:00	\N	\N	\N	3	-1	60	L	60
295	194	84	34	1	4	204102953	139229.170000000013	1	\N	\N	1	2019-12-11 00:00:00	\N	1	2	1	405560	60	L	60
1312	1020	\N	48	1	1	\N	\N	0	\N	\N	23	\N	\N	\N	\N	3	0	74	L	74
296	195	\N	34	1	4	83316315	50750	1	\N	\N	1	2019-12-11 00:00:00	\N	1	5	1	83754	60	L	60
312	205	69	34	1	4	878217958402	44006.6699999999983	1	\N	\N	1	2019-12-11 00:00:00	\N	1	1	1	406575	60	L	60
313	206	\N	34	1	4	87821795402	17000	1	\N	\N	1	2019-12-11 00:00:00	\N	1	5	1	83747	60	L	60
298	197	69	43	1	4	4020010	44006.6699999999983	1	\N	\N	1	2019-12-11 00:00:00	\N	1	1	1	405197	60	L	60
303	202	\N	42	1	1	\N	\N	0	\N	\N	1	2019-12-11 00:00:00	\N	\N	\N	3	-1	60	L	60
292	191	\N	41	1	1	\N	\N	0	\N	\N	1	2019-12-11 00:00:00	\N	\N	\N	3	-1	60	L	60
703	526	\N	43	1	2	0	0	0	\N	\N	19	\N	\N	\N	\N	2	407666	64	X	64
695	528	131	34	1	4	48607011	27500	1	\N	\N	1	2019-11-19 00:00:00	\N	2	5	1	81676	64	L	64
719	548	84	52	1	4	8199	132909	1	\N	\N	19	2019-11-19 00:00:00	\N	1	2	1	406594	64	L	64
258	163	74	48	1	2	\N	\N	\N	\N	\N	1	2019-12-11 00:00:00	\N	2	1	1	406517	60	L	60
817	640	131	45	1	2	0	0	0	\N	\N	19	2019-11-26 00:00:00	\N	2	5	1	82879	65	X	65
835	655	69	31	1	3	8378	80909.6699999999983	1	\N	\N	19	2019-11-26 00:00:00	\N	1	1	1	407751	65	L	65
754	580	67	37	1	3	83057	28140	1	\N	\N	19	2019-11-25 00:00:00	\N	1	1	1	407942	65	L	65
761	587	69	37	1	3	83057	54940	1	\N	\N	19	2019-11-25 00:00:00	\N	1	1	1	407767	65	L	65
865	675	69	52	1	4	524213	135000	3	\N	\N	19	2019-11-27 00:00:00	\N	1	1	1	406601	65	L	65
747	573	82	37	1	3	83057	64225	1	\N	\N	19	2019-11-25 00:00:00	\N	1	2	1	405941	65	L	65
877	686	82	37	1	3	83057	69825	1	\N	\N	19	2019-11-27 00:00:00	\N	1	2	1	407957	65	L	65
855	667	\N	37	1	1	\N	\N	0	\N	\N	19	\N	\N	\N	\N	3	0	65	L	65
768	594	69	57	1	2	0	0	0	\N	\N	19	2019-11-25 00:00:00	\N	1	1	1	407592	65	L	68
981	769	89	41	1	2	0	0	0	\N	\N	19	2019-12-09 00:00:00	\N	2	2	1	407854	67	L	69
796	621	69	46	1	2	0	0	0	\N	\N	19	2019-11-25 00:00:00	\N	1	1	1	407534	65	L	69
803	628	84	46	1	2	0	0	0	\N	\N	19	2019-11-26 00:00:00	\N	1	2	1	407530	65	L	69
802	627	89	46	1	2	0	0	0	\N	\N	19	2019-11-26 00:00:00	\N	2	2	1	407527	65	L	69
861	671	69	32	1	3	20400	54940	1	\N	\N	19	2019-11-27 00:00:00	\N	1	1	1	406616	65	L	65
841	658	69	34	1	3	5561	74190	1	\N	\N	19	2019-11-27 00:00:00	\N	1	1	1	407883	65	L	65
842	658	131	34	1	3	85561	19250	1	\N	\N	19	2019-11-27 00:00:00	\N	2	5	1	81681	65	L	65
859	269	\N	32	1	1	\N	\N	0	\N	\N	19	\N	\N	\N	\N	3	0	65	L	65
873	683	69	52	1	3	2919	44006.6699999999983	1	\N	\N	19	2019-11-27 00:00:00	\N	1	1	1	406597	65	L	65
866	676	69	52	1	3	788706	51516.6699999999983	1	\N	\N	19	2019-11-27 00:00:00	\N	1	1	1	406595	65	L	65
764	590	83	51	1	3	761324	88691.6699999999983	1	\N	\N	19	2019-11-25 00:00:00	\N	1	2	1	406837	65	L	65
847	661	74	39	1	3	83222	60320	2	\N	\N	19	2019-11-27 00:00:00	\N	2	1	1	405859	65	L	65
848	662	84	39	1	3	9826	136325	1	\N	\N	19	2019-11-27 00:00:00	\N	1	2	1	406800	65	L	65
389	257	83	31	1	4	9232	107058	1	\N	\N	1	2019-12-11 00:00:00	\N	1	2	1	406562	61	L	61
390	258	89	31	1	4	9635	73400	1	\N	\N	1	2019-12-11 00:00:00	\N	2	2	1	405401	61	L	61
362	239	\N	44	1	4	17578171	60750	3	\N	\N	19	2019-12-11 00:00:00	\N	1	5	1	82610	61	L	61
361	239	79	44	1	4	17578171	247800	3	\N	\N	19	2019-12-11 00:00:00	\N	3	1	1	405626	61	L	61
350	229	\N	37	1	4	670090	16000	1	\N	\N	19	2019-12-11 00:00:00	\N	1	5	1	84008	61	L	61
351	230	69	37	1	4	1026	197622	3	\N	\N	19	2019-12-11 00:00:00	\N	1	1	1	405870	61	L	61
412	280	89	37	1	4	34304	206800	3	\N	\N	19	2019-12-11 00:00:00	\N	2	2	1	405873	61	L	61
415	281	129	37	1	4	1212133072	10584	1	\N	\N	19	2019-12-11 00:00:00	\N	2	5	1	84016	61	L	61
414	281	74	37	1	1	1212133072	91000	1	\N	\N	19	2019-12-11 00:00:00	\N	2	1	1	405516	61	L	61
367	243	84	46	1	1	0	0	0	\N	\N	1	2019-12-11 00:00:00	\N	1	2	1	406933	61	L	61
384	84	131	34	1	4	86924021182	16000	1	\N	\N	1	2019-12-11 00:00:00	\N	2	5	1	837499	61	L	61
383	85	69	34	1	4	086924021182	63256.6699999999983	1	\N	\N	1	2019-12-11 00:00:00	\N	1	1	1	405456	61	L	61
382	87	131	34	1	4	19819452	16000	1	\N	\N	1	2019-12-11 00:00:00	\N	2	5	1	840588	61	L	61
381	87	84	34	1	4	19819452	141391.670000000013	1	\N	\N	1	2019-12-11 00:00:00	\N	1	2	1	405720	61	L	61
377	251	69	34	1	4	36523	95000	1	\N	\N	1	2019-12-11 00:00:00	\N	1	1	1	405713	61	L	61
378	252	131	34	1	1	0	0	0	\N	\N	1	2019-12-11 00:00:00	\N	2	5	1	83750	61	L	61
380	253	131	34	1	4	6523	16000	1	\N	\N	1	2019-12-11 00:00:00	\N	2	5	1	83751	61	L	61
598	440	\N	42	1	1	\N	\N	0	\N	\N	19	2019-12-11 00:00:00	\N	\N	\N	3	0	63	L	63
607	448	84	37	1	4	8853	125392	1	\N	\N	19	2019-12-11 00:00:00	\N	1	2	1	405882	63	L	63
613	453	\N	37	1	1	\N	\N	0	\N	\N	19	2019-12-11 00:00:00	\N	\N	\N	3	0	63	L	63
562	409	\N	31	1	1	\N	\N	0	\N	\N	19	2019-12-11 00:00:00	\N	\N	\N	3	0	63	L	63
604	445	84	43	1	4	07112019	154777	1	\N	\N	19	2019-12-11 00:00:00	\N	1	2	1	407660	63	L	63
626	464	74	39	1	2	0	0	0	\N	\N	19	2019-11-12 00:00:00	\N	2	1	1	406801	63	X	63
1274	994	131	50	1	3	9646	17000	1	\N	\N	23	2020-01-13 00:00:00	\N	2	5	1	83730	72	L	72
1314	1022	69	39	1	2	0	0	0	\N	\N	23	2020-01-22 00:00:00	\N	1	1	1	406858	74	X	74
696	529	84	34	1	3	2632640159	153100	1	\N	\N	1	2019-11-19 00:00:00	\N	1	2	1	405707	64	L	64
657	492	69	45	1	3	39659	137046.679999999993	2	\N	\N	19	2019-11-18 00:00:00	\N	1	1	1	406746	64	L	64
278	178	88	32	1	2	\N	\N	\N	\N	\N	1	2019-12-11 00:00:00	\N	2	2	1	405576	60	L	60
720	549	84	50	1	3	90588071340	147258.329999999987	1	\N	\N	19	2019-11-20 00:00:00	\N	1	2	1	406986	64	L	64
1450	1130	\N	38	1	1	\N	\N	0	\N	\N	19	\N	\N	\N	\N	3	0	76	L	76
818	639	69	45	1	3	9397	86940.3300000000017	1	\N	\N	19	2019-11-26 00:00:00	\N	1	1	1	406875	65	L	65
755	581	69	37	1	3	83057	54940	1	\N	\N	19	2019-11-25 00:00:00	\N	1	1	1	405938	65	L	65
748	574	82	37	1	3	83057	64225	1	\N	\N	19	2019-11-25 00:00:00	\N	1	2	1	405944	65	L	65
478	337	131	48	1	2	0	0	0	\N	\N	19	2019-12-11 00:00:00	\N	2	5	1	80861	62	L	66
417	283	69	51	1	2	0	0	0	\N	\N	19	2019-12-11 00:00:00	\N	1	1	1	406629	61	L	68
1001	786	69	46	1	2	0	0	0	\N	\N	19	2019-12-09 00:00:00	\N	1	1	1	407792	67	L	69
418	284	84	52	1	2	0	0	0	\N	\N	19	2019-12-11 00:00:00	\N	1	2	1	406578	61	L	69
1039	819	69	52	1	2	0	0	0	\N	\N	19	2019-12-10 00:00:00	\N	1	1	1	407749	67	L	69
982	770	69	51	1	2	0	0	0	\N	\N	23	2019-12-09 00:00:00	\N	1	1	1	407805	67	L	69
797	622	69	46	1	2	0	0	0	\N	\N	19	2019-11-25 00:00:00	\N	1	1	1	407531	65	L	69
804	629	89	46	1	2	0	0	0	\N	\N	19	2019-11-26 00:00:00	\N	2	2	1	407529	65	L	69
1058	838	69	58	1	2	0	0	0	\N	\N	19	2019-12-10 00:00:00	\N	1	1	1	408060	67	L	69
485	342	74	39	1	2	0	0	0	\N	\N	19	2019-12-11 00:00:00	\N	2	1	1	405857	62	X	62
762	588	82	37	1	3	83057	64225	1	\N	\N	19	2019-11-25 00:00:00	\N	1	2	1	407937	65	L	65
849	663	82	39	1	3	3810	79275	1	\N	\N	19	2019-11-27 00:00:00	\N	1	2	1	405979	65	L	65
843	659	69	34	1	3	55189	82000	1	\N	\N	19	2019-11-27 00:00:00	\N	1	1	1	407881	65	L	65
837	657	69	34	1	3	11019100	120390	1	\N	\N	19	2019-11-27 00:00:00	\N	1	1	1	407595	65	L	65
658	492	131	45	1	3	39659	34000	2	\N	\N	19	2019-11-18 00:00:00	\N	2	5	1	84138	64	L	64
721	550	83	50	1	3	223969	88691.6699999999983	1	\N	\N	19	2019-11-20 00:00:00	\N	1	2	1	407577	64	L	64
743	524	\N	38	1	1	\N	\N	0	\N	\N	1	\N	\N	\N	\N	3	0	64	L	64
628	466	69	46	1	2	0	0	0	\N	\N	19	2019-11-12 00:00:00	\N	1	1	1	406937	63	X	63
682	514	69	43	1	2	0	0	0	\N	\N	19	2019-11-19 00:00:00	\N	1	1	1	407657	64	L	74
750	576	82	37	1	3	83057	64225	1	\N	\N	19	2019-11-25 00:00:00	\N	1	2	1	407938	65	L	65
749	575	82	37	1	3	83057	64225	1	\N	\N	19	2019-11-25 00:00:00	\N	1	2	1	405942	65	L	65
751	577	85	37	1	3	83057	61166.6699999999983	1	\N	\N	19	2019-11-25 00:00:00	\N	1	2	1	407959	65	L	65
1275	995	89	50	1	3	5905	84400	1	\N	\N	23	2020-01-13 00:00:00	\N	2	2	1	407812	72	L	72
850	464	89	39	1	2	0	0	0	\N	\N	19	2019-11-27 00:00:00	\N	2	2	1	406801	65	X	65
756	582	87	37	1	3	83057	39900	1	\N	\N	19	2019-11-25 00:00:00	\N	2	2	1	407765	65	L	65
857	669	\N	37	1	1	\N	\N	0	\N	\N	19	\N	\N	\N	\N	3	0	65	L	65
856	668	\N	37	1	1	\N	\N	0	\N	\N	19	\N	\N	\N	\N	3	0	65	L	65
208	125	84	46	1	2	\N	\N	\N	\N	\N	1	2019-12-11 00:00:00	\N	1	2	1	405837	60	L	60
845	529	131	34	1	3	2632640159	16000	1	\N	\N	19	2019-11-27 00:00:00	\N	2	5	1	84057	65	L	65
844	659	131	34	1	3	563810	37250	1	\N	\N	19	2019-11-27 00:00:00	\N	2	5	1	82751	65	L	65
838	657	131	34	1	3	91001101	17000	1	\N	\N	19	2019-11-27 00:00:00	\N	2	5	1	81698	65	L	65
839	656	\N	34	1	1	\N	\N	0	\N	\N	19	\N	\N	\N	\N	3	0	65	L	65
874	684	69	52	1	3	49832	77500	1	\N	\N	19	2019-11-27 00:00:00	\N	1	1	1	407745	65	L	65
674	507	69	46	1	2	0	0	0	\N	\N	19	2019-11-18 00:00:00	\N	1	1	1	407508	64	X	64
644	481	69	37	1	4	1942475521	229908	3	\N	\N	1	2019-11-13 00:00:00	\N	1	1	1	405877	63	L	63
698	530	131	34	1	3	1927	32000	2	\N	\N	19	2019-11-19 00:00:00	\N	2	5	1	84047	64	L	64
659	493	69	45	1	3	39661	51523.3399999999965	1	\N	\N	19	2019-11-18 00:00:00	\N	1	1	1	406747	64	L	64
722	551	84	50	1	3	60280	125391.669999999998	1	\N	\N	19	2019-11-20 00:00:00	\N	1	2	1	406987	64	L	64
714	543	69	57	1	4	1947710594	65873	1	\N	\N	19	2019-11-19 00:00:00	\N	1	1	1	407591	64	L	64
730	559	69	32	1	3	55669	73500	1	\N	\N	19	2019-11-20 00:00:00	\N	1	1	1	406615	64	L	64
200	118	84	46	1	2	\N	\N	\N	\N	\N	1	2019-12-11 00:00:00	\N	1	2	1	406651	60	L	60
204	121	94	46	1	2	\N	\N	\N	\N	\N	1	2019-12-11 00:00:00	\N	3	2	1	406812	60	L	60
206	123	69	46	1	2	\N	\N	\N	\N	\N	1	2019-12-11 00:00:00	\N	1	1	1	405923	60	L	60
210	127	69	46	1	2	\N	\N	\N	\N	\N	1	2019-12-11 00:00:00	\N	1	1	1	405911	60	L	60
212	129	84	46	1	2	\N	\N	\N	\N	\N	1	2019-12-11 00:00:00	\N	1	2	1	405920	60	L	60
215	131	84	46	1	2	\N	\N	\N	\N	\N	1	2019-12-11 00:00:00	\N	1	2	1	406000	60	L	60
220	136	69	46	1	2	\N	\N	\N	\N	\N	1	2019-12-11 00:00:00	\N	1	1	1	406650	60	L	60
221	137	69	46	1	2	\N	\N	\N	\N	\N	1	2019-12-11 00:00:00	\N	1	1	1	406652	60	L	60
219	135	84	46	1	2	\N	\N	\N	\N	\N	1	2019-12-11 00:00:00	\N	1	2	1	405921	60	L	60
224	140	84	46	1	2	\N	\N	\N	\N	\N	1	2019-12-11 00:00:00	\N	1	2	1	406657	60	L	60
225	141	84	46	1	2	\N	\N	\N	\N	\N	1	2019-12-11 00:00:00	\N	1	2	1	406658	60	L	60
227	143	94	46	1	2	\N	\N	\N	\N	\N	1	2019-12-11 00:00:00	\N	3	2	1	406643	60	L	60
229	145	94	46	1	2	\N	\N	\N	\N	\N	1	2019-12-11 00:00:00	\N	3	2	1	406646	60	L	60
230	146	84	46	1	2	\N	\N	\N	\N	\N	1	2019-12-11 00:00:00	\N	1	2	1	405994	60	L	60
253	160	69	46	1	2	\N	\N	\N	\N	\N	1	2019-12-11 00:00:00	\N	1	1	1	406660	60	L	60
706	536	69	51	1	2	0	0	0	\N	\N	19	2019-11-19 00:00:00	\N	1	1	1	407682	64	L	68
202	119	\N	33	1	2	\N	\N	\N	\N	\N	1	2019-12-11 00:00:00	\N	1	5	1	84144	60	L	66
738	566	69	58	1	2	0	0	0	\N	\N	19	2019-11-20 00:00:00	\N	1	1	1	407900	64	L	68
1040	820	69	52	1	2	0	0	0	\N	\N	19	2019-12-10 00:00:00	\N	1	1	1	407748	67	X	67
1002	786	131	46	1	2	0	0	0	\N	\N	19	2019-12-09 00:00:00	\N	2	5	1	84149	67	L	69
798	623	69	46	1	2	0	0	0	\N	\N	19	2019-11-25 00:00:00	\N	1	1	1	407532	65	L	69
805	630	89	46	1	2	0	0	0	\N	\N	19	2019-11-26 00:00:00	\N	2	2	1	407528	65	L	69
481	335	84	48	1	2	0	0	0	\N	\N	19	2019-12-11 00:00:00	\N	1	2	1	406537	62	X	62
862	672	84	33	1	2	0	0	0	\N	\N	19	2019-11-27 00:00:00	\N	1	2	1	407825	65	L	69
983	771	89	41	1	2	0	0	0	\N	\N	19	2019-12-09 00:00:00	\N	2	2	1	407998	67	L	69
771	597	84	58	1	2	0	0	0	\N	\N	19	2019-11-25 00:00:00	\N	1	2	1	407897	65	X	65
1022	803	69	51	1	2	0	0	0	\N	\N	19	2019-12-09 00:00:00	\N	1	1	1	408152	67	X	67
1276	996	84	50	1	3	2780	125391.669999999998	1	\N	\N	23	2020-01-13 00:00:00	\N	1	2	1	408137	72	L	72
355	234	74	41	1	2	0	0	0	\N	\N	19	2019-12-11 00:00:00	\N	2	1	1	406696	61	X	61
1441	697	\N	48	1	1	\N	\N	0	\N	\N	23	\N	\N	\N	\N	3	0	76	L	76
198	117	84	31	1	4	88163173427	143841.670000000013	1	\N	\N	1	2019-12-11 00:00:00	\N	1	2	1	406909	60	X	60
213	130	94	46	1	2	\N	\N	\N	\N	\N	1	2019-12-11 00:00:00	\N	3	2	1	405914	60	X	60
785	611	77	56	1	1	1	168720.5	1	\N	\N	1	2019-11-25 00:00:00	\N	3	1	1	10489029	65	X	65
820	639	131	45	1	3	9397	16000	1	\N	\N	19	2019-11-26 00:00:00	\N	2	5	1	84136	65	L	65
757	583	84	37	1	3	83057	12391.6700000000001	1	\N	\N	19	2019-11-25 00:00:00	\N	1	2	1	407762	65	L	65
205	122	69	46	1	2	\N	\N	\N	\N	\N	1	2019-12-11 00:00:00	\N	1	1	1	405843	60	L	74
226	142	84	46	1	2	\N	\N	\N	\N	\N	1	2019-12-11 00:00:00	\N	1	2	1	405995	60	L	60
875	685	79	48	1	2	0	0	0	\N	\N	19	2019-11-27 00:00:00	\N	3	1	1	407613	65	X	65
330	97	\N	37	1	2	\N	\N	\N	\N	\N	1	2019-12-11 00:00:00	\N	1	5	1	84018	60	X	60
1060	839	131	34	1	3	8405	47000	1	\N	\N	19	2019-12-10 00:00:00	\N	2	5	1	81697	67	L	67
322	211	74	50	1	2	\N	\N	\N	\N	\N	1	2019-12-11 00:00:00	\N	2	1	1	405375	60	X	60
323	211	74	50	1	2	\N	\N	\N	\N	\N	1	2019-12-11 00:00:00	\N	2	1	1	405375	60	X	60
324	211	74	50	1	2	\N	\N	\N	\N	\N	1	2019-12-11 00:00:00	\N	2	1	1	405375	60	X	60
260	165	69	48	1	2	\N	\N	\N	\N	\N	1	2019-12-11 00:00:00	\N	1	1	1	406529	60	X	60
326	211	74	50	1	2	\N	\N	\N	\N	\N	1	2019-12-11 00:00:00	\N	2	1	1	405375	60	X	60
317	208	99	43	1	2	\N	\N	\N	\N	\N	1	2019-12-11 00:00:00	\N	1	3	1	405981	60	X	60
316	208	99	43	1	2	\N	\N	\N	\N	\N	1	2019-12-11 00:00:00	\N	1	3	1	405981	60	X	60
318	209	79	31	1	4	114152343	38860	1	\N	\N	1	2019-12-11 00:00:00	\N	3	1	1	405397	60	X	60
319	209	79	31	1	4	114152343	38860	1	\N	\N	1	2019-12-11 00:00:00	\N	3	1	1	405397	60	X	60
349	229	89	37	1	4	670090	73400	1	\N	\N	19	2019-12-11 00:00:00	\N	2	2	1	405508	61	L	61
325	211	74	50	1	2	\N	\N	\N	\N	\N	1	2019-12-11 00:00:00	\N	2	1	1	405375	60	X	60
263	166	\N	48	1	1	\N	\N	0	\N	\N	1	2019-12-11 00:00:00	\N	\N	\N	3	406518	60	X	60
244	157	\N	48	1	2	\N	\N	\N	\N	\N	1	2019-12-11 00:00:00	\N	1	5	1	76273	60	X	60
305	204	89	44	1	2	\N	\N	\N	\N	\N	1	2019-12-11 00:00:00	\N	2	2	1	406866	60	X	60
306	204	89	44	1	2	\N	\N	\N	\N	\N	1	2019-12-11 00:00:00	\N	2	2	1	406866	60	X	60
307	204	89	44	1	2	\N	\N	\N	\N	\N	1	2019-12-11 00:00:00	\N	2	2	1	406866	60	X	60
308	204	89	44	1	2	\N	\N	\N	\N	\N	1	2019-12-11 00:00:00	\N	2	2	1	406866	60	X	60
309	204	89	44	1	2	\N	\N	\N	\N	\N	1	2019-12-11 00:00:00	\N	2	2	1	406866	60	X	60
310	204	89	44	1	2	\N	\N	\N	\N	\N	1	2019-12-11 00:00:00	\N	2	2	1	406866	60	X	60
311	204	89	44	1	2	\N	\N	\N	\N	\N	1	2019-12-11 00:00:00	\N	2	2	1	406866	60	X	60
197	117	84	31	1	4	88163173427	143841.670000000013	1	\N	\N	1	2019-12-11 00:00:00	\N	1	2	1	406909	60	X	60
259	163	74	48	1	2	\N	\N	\N	\N	\N	1	2019-12-11 00:00:00	\N	2	1	1	406517	60	X	60
242	157	\N	48	1	2	\N	\N	\N	\N	\N	1	2019-12-11 00:00:00	\N	1	5	1	76273	60	X	60
245	158	\N	48	1	2	\N	\N	\N	\N	\N	1	2019-12-11 00:00:00	\N	1	5	1	76269	60	X	60
252	158	\N	48	1	2	\N	\N	\N	\N	\N	1	2019-12-11 00:00:00	\N	1	5	1	76269	60	X	60
283	182	69	44	1	2	\N	\N	\N	\N	\N	1	2019-12-11 00:00:00	\N	1	1	1	406861	60	X	60
269	168	89	44	1	2	\N	\N	\N	\N	\N	1	2019-12-11 00:00:00	\N	2	2	1	406730	60	X	60
268	168	89	44	1	2	\N	\N	\N	\N	\N	1	2019-12-11 00:00:00	\N	2	2	1	406730	60	X	60
240	156	\N	48	1	1	\N	\N	0	\N	\N	1	2019-12-11 00:00:00	\N	\N	\N	3	-1	60	L	60
291	190	\N	41	1	1	\N	\N	0	\N	\N	1	2019-12-11 00:00:00	\N	\N	\N	3	-1	60	L	60
233	149	\N	48	1	1	\N	\N	0	\N	\N	1	2019-12-11 00:00:00	\N	\N	\N	3	-1	60	L	60
234	150	\N	48	1	1	\N	\N	0	\N	\N	1	2019-12-11 00:00:00	\N	\N	\N	3	-1	60	L	60
257	162	\N	48	1	1	\N	\N	0	\N	\N	1	2019-12-11 00:00:00	\N	\N	\N	3	-1	60	L	60
264	166	\N	48	1	1	\N	\N	0	\N	\N	1	2019-12-11 00:00:00	\N	\N	\N	3	-1	60	L	60
232	148	\N	48	1	1	\N	\N	0	\N	\N	1	2019-12-11 00:00:00	\N	\N	\N	3	-1	60	L	60
238	154	\N	48	1	1	\N	\N	0	\N	\N	1	2019-12-11 00:00:00	\N	\N	\N	3	-1	60	L	60
578	423	89	54	1	2	0	0	0	\N	\N	19	2019-12-11 00:00:00	\N	2	2	1	405767	63	L	66
394	262	67	32	1	2	0	0	0	\N	\N	1	2019-12-11 00:00:00	\N	1	1	1	406848	61	L	68
331	97	74	37	1	2	\N	\N	\N	\N	\N	1	2019-12-11 00:00:00	\N	2	1	1	405518	60	L	68
863	673	69	33	1	2	0	0	0	\N	\N	19	2019-11-27 00:00:00	\N	1	1	1	407821	65	X	65
878	687	79	41	1	2	0	0	0	\N	\N	19	2019-11-29 00:00:00	\N	3	1	1	407988	66	L	69
984	772	69	51	1	2	0	0	0	\N	\N	23	2019-12-09 00:00:00	\N	1	1	1	407888	67	L	69
211	128	84	46	1	2	\N	\N	\N	\N	\N	1	2019-12-11 00:00:00	\N	1	2	1	405909	60	L	69
228	144	84	46	1	2	\N	\N	\N	\N	\N	1	2019-12-11 00:00:00	\N	1	2	1	406642	60	L	69
214	130	94	46	1	2	\N	\N	\N	\N	\N	1	2019-12-11 00:00:00	\N	3	2	1	405914	60	L	69
1094	868	84	31	1	2	0	0	0	\N	\N	19	2019-12-13 00:00:00	\N	1	2	1	408030	68	L	69
328	158	\N	48	1	1	\N	\N	0	\N	\N	1	2019-12-11 00:00:00	\N	\N	\N	3	-1	60	L	60
334	214	84	46	1	2	\N	\N	\N	\N	\N	19	2019-12-11 00:00:00	\N	1	2	1	406664	61	L	66
343	223	84	46	1	2	\N	\N	\N	\N	\N	19	2019-12-11 00:00:00	\N	1	2	1	406845	61	X	61
287	186	84	46	1	2	\N	\N	\N	\N	\N	1	2019-12-11 00:00:00	\N	1	2	1	406828	60	L	60
265	167	89	44	1	2	\N	\N	\N	\N	\N	1	2019-12-11 00:00:00	\N	2	2	1	406864	60	L	60
289	188	95	41	1	2	\N	\N	\N	\N	\N	1	2019-12-11 00:00:00	\N	3	2	1	406697	60	L	60
365	241	84	46	1	2	0	0	0	\N	\N	1	2019-12-11 00:00:00	\N	1	2	1	406655	61	X	61
985	773	69	41	1	2	0	0	0	\N	\N	19	2019-12-09 00:00:00	\N	1	1	1	407995	67	X	67
413	281	74	35	1	1	1212133072	91000	1	\N	\N	19	2019-12-11 00:00:00	\N	2	1	1	405516	61	X	61
379	253	84	34	1	4	36523	155229.170000000013	1	\N	\N	1	2019-12-11 00:00:00	\N	1	2	1	406569	61	L	61
386	254	131	34	1	4	68093	54000	1	\N	\N	1	2019-12-11 00:00:00	\N	2	5	1	83752	61	L	61
385	254	69	34	1	4	68093	186021	3	\N	\N	1	2019-12-11 00:00:00	\N	1	1	1	406573	61	L	61
456	318	\N	48	1	1	\N	\N	0	\N	\N	19	2019-12-11 00:00:00	\N	\N	\N	3	0	62	L	62
403	271	84	34	1	4	6315	188258.339999999997	1	\N	\N	1	2019-12-11 00:00:00	\N	1	2	1	406566	61	L	61
332	212	93	50	1	4	8644	96458	1	\N	\N	19	2019-12-11 00:00:00	\N	3	2	1	405374	61	L	61
404	272	74	50	1	4	1671	36560	1	\N	\N	1	2019-12-11 00:00:00	\N	2	1	1	405378	61	L	61
405	273	91	50	1	4	0	24466.6699999999983	1	\N	\N	19	2019-12-11 00:00:00	\N	2	2	1	405381	61	L	61
407	275	89	50	1	1	8877467469	36700	1	\N	\N	19	2019-12-11 00:00:00	\N	2	2	1	405379	61	L	61
410	278	84	50	1	4	10402	132911.670000000013	1	\N	\N	19	2019-12-11 00:00:00	\N	1	2	1	406550	61	L	61
411	279	88	50	1	4	63735	61166.6699999999983	1	\N	\N	19	2019-12-11 00:00:00	\N	2	2	1	405380	61	L	61
375	231	\N	41	1	1	\N	\N	0	\N	\N	1	2019-12-11 00:00:00	\N	\N	\N	3	0	61	L	61
419	285	69	52	1	4	67683	44007	1	\N	\N	19	2019-12-11 00:00:00	\N	1	1	1	406584	61	L	61
420	286	69	52	1	4	53670	44006.6699999999983	1	\N	\N	19	2019-12-11 00:00:00	\N	1	1	1	406583	61	L	61
366	242	69	43	1	4	7473	62555	1	\N	\N	1	2019-12-11 00:00:00	\N	1	1	1	405530	61	L	61
392	260	69	31	1	4	96862	73732	1	\N	\N	1	2019-12-11 00:00:00	\N	1	1	1	406907	61	L	61
387	255	69	31	1	4	258	66000	1	\N	\N	1	2019-12-11 00:00:00	\N	1	1	1	406910	61	L	61
388	256	94	31	1	4	612	88691.6699999999983	1	\N	\N	1	2019-12-11 00:00:00	\N	3	2	1	406560	61	L	61
391	259	69	31	1	4	90153	51523.3399999999965	1	\N	\N	1	2019-12-11 00:00:00	\N	1	1	1	406810	61	L	61
1222	969	131	34	1	2	0	0	0	\N	\N	23	2019-12-17 00:00:00	\N	2	5	1	408182	68	X	68
1042	822	69	52	1	3	6987	206900	4	\N	\N	19	2019-12-10 00:00:00	\N	1	1	1	408010	67	L	67
1023	804	69	51	1	3	1818	44007	1	\N	\N	19	2019-12-09 00:00:00	\N	1	1	1	408151	67	L	67
1234	978	69	34	1	3	6065	146006.329999999987	1	\N	\N	23	2019-12-17 00:00:00	\N	1	1	1	406639	68	L	68
1247	947	69	32	1	3	3128	73390	1	\N	\N	19	2019-12-18 00:00:00	\N	1	1	1	405430	68	L	68
393	261	73	32	1	2	0	0	0	\N	\N	1	2019-12-11 00:00:00	\N	2	1	1	406604	61	L	68
399	267	93	32	1	2	0	0	0	\N	\N	1	2019-12-11 00:00:00	\N	3	2	1	405578	61	L	68
401	269	94	32	1	2	0	0	0	\N	\N	1	2019-12-11 00:00:00	\N	3	2	1	405575	61	L	68
501	356	69	52	1	2	0	0	0	\N	\N	19	2019-12-11 00:00:00	\N	1	1	1	406587	62	L	68
438	300	69	36	1	2	0	0	0	\N	\N	19	2019-12-11 00:00:00	\N	1	1	1	405446	62	L	68
1277	997	69	51	1	3	46863	59040.010000000002	1	\N	\N	19	2020-01-13 00:00:00	\N	1	1	1	408159	72	L	72
507	362	\N	43	1	1	\N	\N	0	\N	\N	19	2019-12-11 00:00:00	\N	\N	\N	3	0	62	L	62
498	353	69	31	1	2	0	0	0	\N	\N	19	2019-12-11 00:00:00	\N	1	1	1	406902	62	L	66
497	352	69	31	1	2	0	0	0	\N	\N	19	2019-12-11 00:00:00	\N	1	1	1	406850	62	L	74
1095	869	69	31	1	2	0	0	0	\N	\N	19	2019-12-13 00:00:00	\N	1	1	1	407760	68	L	74
967	756	69	51	1	2	0	0	0	\N	\N	19	2019-12-04 00:00:00	\N	1	1	1	407806	66	L	69
560	407	82	31	1	2	0	0	0	\N	\N	19	2019-12-11 00:00:00	\N	1	2	1	406997	63	L	66
516	369	69	36	1	2	0	0	0	\N	\N	19	2019-12-11 00:00:00	\N	1	1	1	405453	62	X	62
1278	998	69	51	1	2	0	0	0	\N	\N	19	2020-01-13 00:00:00	\N	1	1	1	408160	74	X	74
1043	823	69	58	1	3	6684	88000	2	\N	\N	19	2019-12-10 00:00:00	\N	1	1	1	408117	67	L	67
561	408	88	31	1	2	0	0	0	\N	\N	19	2019-12-11 00:00:00	\N	2	2	1	406989	63	L	74
489	345	74	39	1	2	0	0	0	\N	\N	19	2019-12-11 00:00:00	\N	2	1	1	405864	62	X	62
1196	952	131	48	1	2	0	0	0	\N	\N	19	2019-12-17 00:00:00	\N	2	5	1	82696	68	L	74
533	383	69	34	1	3	5123	67524	1	\N	\N	19	2019-12-11 00:00:00	\N	1	1	1	406635	62	L	62
463	325	\N	48	1	1	\N	\N	0	\N	\N	19	2019-12-11 00:00:00	\N	\N	\N	3	0	62	L	62
462	324	\N	48	1	1	\N	\N	0	\N	\N	19	2019-12-11 00:00:00	\N	\N	\N	3	0	62	L	62
491	347	69	39	1	4	325435	309370.989999999991	3	\N	\N	19	2019-12-11 00:00:00	\N	1	1	1	406792	62	L	62
515	368	74	39	1	4	39534	44960	1	\N	\N	19	2019-12-11 00:00:00	\N	2	1	1	406795	62	L	62
486	342	74	39	1	4	5325	25760	1	\N	\N	19	2019-12-11 00:00:00	\N	2	1	1	405857	62	L	62
484	341	74	39	1	4	880541	25760	1	\N	\N	19	2019-12-11 00:00:00	\N	2	1	1	405860	62	L	62
492	347	131	39	1	4	897478	111750	3	\N	\N	19	2019-12-11 00:00:00	\N	2	5	1	82676	62	L	62
423	289	69	53	1	4	2984	196520.029999999999	3	\N	\N	1	2019-12-11 00:00:00	\N	1	1	1	406974	62	L	62
421	287	69	53	1	4	2609178275	132020.010000000009	3	\N	\N	1	2019-12-11 00:00:00	\N	1	1	1	406959	62	L	62
549	398	84	53	1	4	52955	398722.020000000019	3	\N	\N	19	2019-12-11 00:00:00	\N	1	2	1	406960	62	L	62
425	290	84	53	1	3	2604865104	425000	3	\N	\N	1	2019-12-11 00:00:00	\N	1	2	1	405523	62	L	62
550	398	131	53	1	4	2955	163500	3	\N	\N	19	2019-12-11 00:00:00	\N	2	5	1	82789	62	L	62
426	290	131	53	1	3	69008	48000	3	\N	\N	1	2019-12-11 00:00:00	\N	2	5	1	83729	62	L	62
424	289	131	53	1	4	4879	64500	3	\N	\N	1	2019-12-11 00:00:00	\N	2	5	1	84021	62	L	62
441	303	68	51	1	4	30912	38860	1	\N	\N	19	2019-12-11 00:00:00	\N	1	1	1	406625	62	L	62
435	297	68	51	1	4	3055	32126.6699999999983	1	\N	\N	1	2019-12-11 00:00:00	\N	1	1	1	406829	62	L	62
429	292	82	51	1	4	6187	65000	1	\N	\N	1	2019-12-11 00:00:00	\N	1	2	1	406832	62	L	62
440	302	93	51	1	4	7056	99166.6699999999983	1	\N	\N	19	2019-12-11 00:00:00	\N	3	2	1	406831	62	L	62
428	291	89	41	1	4	0	0	0	\N	\N	1	2019-12-11 00:00:00	\N	2	2	1	406689	62	L	62
442	304	\N	41	1	1	\N	\N	0	\N	\N	19	2019-12-11 00:00:00	\N	\N	\N	3	0	62	L	62
467	328	\N	48	1	1	\N	\N	0	\N	\N	19	2019-12-11 00:00:00	\N	\N	\N	3	0	62	L	62
465	327	\N	48	1	1	\N	\N	0	\N	\N	19	2019-12-11 00:00:00	\N	\N	\N	3	0	62	L	62
464	326	\N	48	1	1	\N	\N	0	\N	\N	19	2019-12-11 00:00:00	\N	\N	\N	3	0	62	L	62
461	323	\N	48	1	1	\N	\N	0	\N	\N	19	2019-12-11 00:00:00	\N	\N	\N	3	0	62	L	62
460	322	\N	48	1	1	\N	\N	0	\N	\N	19	2019-12-11 00:00:00	\N	\N	\N	3	0	62	L	62
459	321	\N	48	1	1	\N	\N	0	\N	\N	19	2019-12-11 00:00:00	\N	\N	\N	3	0	62	L	62
458	320	\N	48	1	1	\N	\N	0	\N	\N	19	2019-12-11 00:00:00	\N	\N	\N	3	0	62	L	62
455	317	\N	48	1	1	\N	\N	0	\N	\N	19	2019-12-11 00:00:00	\N	\N	\N	3	0	62	L	62
454	316	\N	48	1	1	\N	\N	0	\N	\N	19	2019-12-11 00:00:00	\N	\N	\N	3	0	62	L	62
453	315	\N	48	1	1	\N	\N	0	\N	\N	19	2019-12-11 00:00:00	\N	\N	\N	3	0	62	L	62
452	314	\N	48	1	1	\N	\N	0	\N	\N	19	2019-12-11 00:00:00	\N	\N	\N	3	0	62	L	62
502	357	69	52	1	4	89347212697	44006.6699999999983	1	\N	\N	19	2019-12-11 00:00:00	\N	1	1	1	406588	62	L	62
506	361	82	52	1	3	2605482856	80225	1	\N	\N	19	2019-12-11 00:00:00	\N	1	2	1	406581	62	L	62
546	395	84	52	1	3	26241	125391.669999999998	1	\N	\N	19	2019-12-11 00:00:00	\N	1	2	1	406591	62	L	62
532	382	69	34	1	4	1182	62006.6699999999983	1	\N	\N	19	2019-12-11 00:00:00	\N	1	1	1	406637	62	L	62
531	251	69	34	1	4	6875	95000	1	\N	\N	19	2019-12-11 00:00:00	\N	1	1	1	406638	62	L	62
534	383	131	34	1	3	5123	16000	1	\N	\N	19	2019-12-11 00:00:00	\N	2	5	1	84041	62	L	62
432	294	69	37	1	3	3354	99000	1	\N	\N	1	2019-12-11 00:00:00	\N	1	1	1	405874	62	L	62
434	296	74	33	1	3	2592633166	32160	1	\N	\N	1	2019-12-11 00:00:00	\N	2	1	1	406617	62	L	62
543	392	69	45	1	4	59437	62456.6699999999983	1	\N	\N	19	2019-12-11 00:00:00	\N	1	1	1	406919	62	L	62
436	298	69	45	1	4	5350	45000	1	\N	\N	1	2019-12-11 00:00:00	\N	1	1	1	406921	62	L	62
542	391	83	45	1	3	1388	266075.010000000009	3	\N	\N	19	2019-12-11 00:00:00	\N	1	2	1	402770	62	L	62
544	393	84	45	1	4	18245	137000	1	\N	\N	19	2019-12-11 00:00:00	\N	1	2	1	406841	62	L	62
541	390	84	45	1	4	85732	137000	1	\N	\N	19	2019-12-11 00:00:00	\N	1	2	1	406840	62	L	62
545	394	104	45	1	4	8807	55360	1	\N	\N	19	2019-12-11 00:00:00	\N	2	3	1	406927	62	L	62
1170	932	131	37	1	3	2646	16000	1	\N	\N	19	2019-12-17 00:00:00	\N	2	5	1	82735	68	L	68
1024	805	69	51	1	2	0	0	0	\N	\N	19	2019-12-09 00:00:00	\N	1	1	1	407695	67	X	67
1142	909	84	46	1	2	0	0	0	\N	\N	19	2019-12-16 00:00:00	\N	1	2	1	407772	68	X	68
529	381	69	34	1	2	0	0	0	\N	\N	19	2019-12-11 00:00:00	\N	1	1	1	405559	62	L	69
1096	870	69	31	1	2	0	0	0	\N	\N	19	2019-12-13 00:00:00	\N	1	1	1	407752	68	L	69
536	385	\N	54	1	1	\N	\N	0	\N	\N	19	2019-12-11 00:00:00	\N	\N	\N	3	0	62	L	62
535	384	\N	54	1	1	\N	\N	0	\N	\N	19	2019-12-11 00:00:00	\N	\N	\N	3	0	62	L	62
523	376	69	38	1	4	8920	73390	1	\N	\N	19	2019-12-11 00:00:00	\N	1	1	1	406784	62	L	62
547	396	69	40	1	4	2325	44066.6699999999983	1	\N	\N	19	2019-12-11 00:00:00	\N	1	1	1	405675	62	L	62
555	402	\N	44	1	1	\N	\N	0	\N	\N	19	2019-12-11 00:00:00	\N	\N	\N	3	0	62	L	62
554	401	\N	44	1	1	\N	\N	0	\N	\N	19	2019-12-11 00:00:00	\N	\N	\N	3	0	62	L	62
499	354	69	31	1	3	2619	44100	1	\N	\N	19	2019-12-11 00:00:00	\N	1	1	1	406992	62	L	62
495	350	69	31	1	3	6027	51523.3399999999965	1	\N	\N	19	2019-12-11 00:00:00	\N	1	1	1	406996	62	L	62
494	349	69	31	1	4	448	65873.3300000000017	1	\N	\N	19	2019-12-11 00:00:00	\N	1	1	1	406911	62	L	62
1279	422	\N	33	1	1	0	0	0	\N	\N	19	\N	\N	\N	\N	2	407819	72	L	72
1063	841	69	34	1	3	2415	69000	1	\N	\N	19	2019-12-10 00:00:00	\N	1	1	1	405721	67	L	67
1044	824	84	58	1	3	605742255	125391.669999999998	1	\N	\N	19	2019-12-10 00:00:00	\N	1	2	1	408124	67	L	67
1235	978	131	34	1	3	6065	50750	1	\N	\N	23	2019-12-17 00:00:00	\N	2	5	1	406639	68	X	68
597	439	74	41	1	2	0	0	0	\N	\N	19	2019-12-11 00:00:00	\N	2	1	1	407000	63	X	63
608	449	69	43	1	2	0	0	0	\N	\N	19	2019-12-11 00:00:00	\N	1	1	1	407662	63	X	63
691	523	104	38	1	2	0	0	0	\N	\N	19	2019-11-19 00:00:00	\N	2	3	1	407702	64	X	64
629	467	84	46	1	2	0	0	0	\N	\N	19	2019-11-12 00:00:00	\N	1	2	1	407540	63	X	63
745	527	\N	48	1	1	\N	\N	0	\N	\N	19	\N	\N	\N	\N	3	0	64	L	64
591	433	\N	48	1	1	\N	\N	0	\N	\N	19	2019-12-11 00:00:00	\N	\N	\N	3	0	63	L	63
566	413	88	37	1	3	11600268	148816.670000000013	1	\N	\N	19	2019-12-11 00:00:00	\N	2	2	1	405505	63	L	63
568	413	131	37	1	4	11600268	47000	1	\N	\N	19	2019-12-11 00:00:00	\N	2	5	1	84005	63	L	63
567	414	131	37	1	3	11600268	34250	1	\N	\N	19	2019-12-11 00:00:00	\N	2	5	1	84378	63	L	63
573	419	84	35	1	4	26753	130725	1	\N	\N	19	2019-12-11 00:00:00	\N	1	2	1	405419	63	L	63
574	419	129	35	1	4	89702263753	5333.32999999999993	1	\N	\N	19	2019-12-11 00:00:00	\N	2	5	1	83780	63	L	63
572	418	\N	35	1	1	\N	\N	0	\N	\N	19	2019-12-11 00:00:00	\N	\N	\N	3	0	63	L	63
571	417	\N	35	1	1	\N	\N	0	\N	\N	19	2019-12-11 00:00:00	\N	\N	\N	3	0	63	L	63
570	416	\N	35	1	1	\N	\N	0	\N	\N	19	2019-12-11 00:00:00	\N	\N	\N	3	0	63	L	63
569	415	\N	35	1	1	\N	\N	0	\N	\N	19	2019-12-11 00:00:00	\N	\N	\N	3	0	63	L	63
565	412	69	50	1	4	51561	44006.6699999999983	1	\N	\N	19	2019-12-11 00:00:00	\N	1	1	1	406983	63	L	63
582	426	83	50	1	3	0	0	0	\N	\N	19	2019-12-11 00:00:00	\N	1	2	1	406984	63	L	63
715	544	88	57	1	2	0	0	0	\N	\N	19	2019-11-19 00:00:00	\N	2	2	1	407823	64	X	64
699	531	74	39	1	3	16551025	65000	1	\N	\N	19	2019-11-19 00:00:00	\N	2	1	1	405959	64	L	64
723	552	83	50	1	3	807446	88691.9700000000012	1	\N	\N	19	2019-11-20 00:00:00	\N	1	2	1	407579	64	L	64
731	560	69	32	1	3	14069	44006.6699999999983	1	\N	\N	19	2019-11-20 00:00:00	\N	1	1	1	406613	64	L	64
590	432	131	48	1	2	0	0	0	\N	\N	19	2019-12-11 00:00:00	\N	2	5	1	80864	63	L	66
1184	945	69	52	1	3	4806	51523.3399999999965	1	\N	\N	19	2019-12-17 00:00:00	\N	1	1	1	408006	68	L	68
1223	972	84	52	1	3	198011948	180166.320000000007	1	\N	\N	19	2019-12-17 00:00:00	\N	1	2	1	408173	68	L	68
1259	984	84	37	1	3	0179	1635900	12	\N	\N	23	2020-01-08 00:00:00	\N	1	2	1	407976	71	L	71
707	537	69	51	1	2	0	0	0	\N	\N	19	2019-11-19 00:00:00	\N	1	1	1	407687	64	L	69
1006	789	69	46	1	2	0	0	0	\N	\N	19	2019-12-09 00:00:00	\N	1	1	1	408032	67	L	69
966	755	69	51	1	2	0	0	0	\N	\N	19	2019-12-04 00:00:00	\N	1	1	1	407807	66	L	69
946	740	84	46	1	2	0	0	0	\N	\N	19	2019-12-03 00:00:00	\N	1	2	1	407547	66	L	69
910	713	89	41	1	2	0	0	0	\N	\N	19	2019-12-02 00:00:00	\N	2	2	1	407983	66	L	69
986	774	84	51	1	2	0	0	0	\N	\N	23	2019-12-09 00:00:00	\N	1	2	1	407887	67	L	69
1090	865	84	39	1	2	0	0	0	\N	\N	19	2019-12-10 00:00:00	\N	1	2	1	406752	67	L	69
1055	835	84	58	1	2	0	0	0	\N	\N	19	2019-12-10 00:00:00	\N	1	2	1	408119	67	L	69
1053	833	84	58	1	2	0	0	0	\N	\N	19	2019-12-10 00:00:00	\N	1	2	1	408051	67	L	69
922	722	131	38	1	2	0	0	0	\N	\N	19	2019-12-02 00:00:00	\N	2	5	1	81666	66	L	69
987	775	88	41	1	2	0	0	0	\N	\N	19	2019-12-09 00:00:00	\N	2	2	1	407997	67	L	69
652	488	89	41	1	2	0	0	0	\N	\N	19	2019-11-18 00:00:00	\N	2	2	1	407713	64	L	69
914	717	84	37	1	3	612	235292	1	\N	\N	19	2019-12-02 00:00:00	\N	1	2	1	407955	66	L	66
950	744	73	32	1	3	6231	46500	1	\N	\N	19	2019-12-03 00:00:00	\N	2	1	1	406614	66	L	66
201	119	84	46	1	2	\N	\N	\N	\N	\N	1	2019-12-11 00:00:00	\N	1	2	1	405851	60	L	66
1064	842	131	34	1	3	2415	16000	1	\N	\N	19	2019-12-10 00:00:00	\N	2	5	1	84049	67	L	67
1198	953	84	48	1	2	0	0	0	\N	\N	19	2019-12-17 00:00:00	\N	1	2	1	82697	68	X	68
1224	971	131	34	1	2	0	0	0	\N	\N	23	2019-12-17 00:00:00	\N	2	5	1	408180	68	X	68
1280	999	84	50	1	3	1597	170158.339999999997	1	\N	\N	23	2020-01-13 00:00:00	\N	1	2	1	407575	74	X	74
1260	985	69	57	1	2	0	0	0	\N	\N	23	2020-01-08 00:00:00	\N	1	1	1	407824	71	X	74
315	208	99	43	1	2	\N	\N	\N	\N	\N	1	2019-12-11 00:00:00	\N	1	3	1	405981	60	L	68
827	647	89	41	1	2	0	0	0	\N	\N	19	2019-11-26 00:00:00	\N	2	2	1	407641	65	L	68
1098	871	69	57	1	3	2245	44006.6699999999983	1	\N	\N	23	2019-12-13 00:00:00	\N	1	1	1	408017	68	L	68
772	598	69	58	1	2	0	0	0	\N	\N	19	2019-11-25 00:00:00	\N	1	1	1	407736	65	L	68
1185	946	83	32	1	3	4544	126875	1	\N	\N	19	2019-12-17 00:00:00	\N	1	2	1	405432	68	L	68
1158	922	69	50	1	3	8020	44006.6699999999983	1	\N	\N	19	2019-12-16 00:00:00	\N	1	1	1	407810	68	L	68
821	641	69	45	1	2	0	0	0	\N	\N	19	2019-11-26 00:00:00	\N	1	1	1	406842	65	L	68
1337	1043	74	54	1	3	837039	274650	1	\N	\N	19	2020-01-22 00:00:00	\N	2	1	1	405777	74	X	74
814	637	\N	53	1	2	0	0	0	\N	\N	19	\N	\N	\N	\N	2	406880	65	X	65
1007	789	131	46	1	2	0	0	0	\N	\N	19	2019-12-09 00:00:00	\N	2	5	1	84150	67	L	69
1025	806	69	51	1	2	0	0	0	\N	\N	19	2019-12-09 00:00:00	\N	1	1	1	408153	67	L	69
958	750	84	39	1	2	0	0	0	\N	\N	19	2019-12-03 00:00:00	\N	1	2	1	405964	66	L	69
988	776	74	41	1	2	0	0	0	\N	\N	19	2019-12-09 00:00:00	\N	2	1	1	407994	67	L	69
938	507	69	46	1	2	0	0	0	\N	\N	19	2019-12-03 00:00:00	\N	1	1	1	407782	66	L	69
926	719	130	41	1	2	0	0	0	\N	\N	19	2019-12-02 00:00:00	\N	2	5	1	83718	66	L	69
793	618	69	46	1	2	0	0	0	\N	\N	19	2019-11-25 00:00:00	\N	1	1	1	407538	65	L	69
800	625	84	46	1	2	0	0	0	\N	\N	19	2019-11-25 00:00:00	\N	1	2	1	407524	65	L	69
1045	825	69	58	1	2	0	0	0	\N	\N	19	2019-12-10 00:00:00	\N	1	1	1	408052	67	L	69
902	705	84	31	1	2	0	0	0	\N	\N	19	2019-11-29 00:00:00	\N	1	2	1	407759	66	L	69
1159	923	69	32	1	2	0	0	0	\N	\N	19	2019-12-16 00:00:00	\N	1	1	1	406916	68	L	74
1160	924	84	32	1	2	0	0	0	\N	\N	19	2019-12-16 00:00:00	\N	1	2	1	408232	68	L	74
1173	935	131	38	1	2	0	0	0	\N	\N	19	2019-12-17 00:00:00	\N	2	5	1	81669	68	L	74
158	81	89	41	1	2	\N	\N	\N	\N	\N	1	2019-10-18 00:00:00	2019-10-18 00:00:00	2	2	1	405969	60	L	74
1100	873	68	41	1	2	0	0	0	\N	\N	19	2019-12-16 00:00:00	\N	1	1	1	407843	68	L	74
1115	883	74	41	1	2	0	0	0	\N	\N	19	2019-12-16 00:00:00	\N	2	1	1	408290	68	L	74
1116	884	78	41	1	2	0	0	0	\N	\N	19	2019-12-16 00:00:00	\N	3	1	1	407845	68	L	74
1131	898	84	46	1	2	0	0	0	\N	\N	19	2019-12-16 00:00:00	\N	1	2	1	407868	68	L	74
1130	897	84	46	1	2	0	0	0	\N	\N	19	2019-12-16 00:00:00	\N	1	2	1	407866	68	L	74
1440	1123	\N	48	1	1	\N	\N	0	\N	\N	23	\N	\N	\N	\N	3	0	76	L	76
1145	912	84	46	1	2	0	0	0	\N	\N	19	2019-12-16 00:00:00	\N	1	2	1	406678	68	L	74
1083	860	69	48	1	2	0	0	0	\N	\N	19	2019-12-10 00:00:00	\N	1	1	1	407908	67	L	74
1084	861	84	48	1	2	0	0	0	\N	\N	19	2019-12-10 00:00:00	\N	1	2	1	407628	67	L	74
1200	954	69	48	1	2	0	0	0	\N	\N	19	2019-12-17 00:00:00	\N	1	1	1	408510	68	L	74
1187	948	84	48	1	2	0	0	0	\N	\N	19	2019-12-17 00:00:00	\N	1	2	1	408503	68	L	74
1201	954	131	48	1	2	0	0	0	\N	\N	19	2019-12-17 00:00:00	\N	2	5	1	82699	68	L	74
1188	948	131	48	1	2	0	0	0	\N	\N	19	2019-12-17 00:00:00	\N	2	5	1	82694	68	L	74
1199	953	131	48	1	2	0	0	0	\N	\N	19	2019-12-17 00:00:00	\N	2	5	1	82697	68	L	74
1163	927	83	32	1	2	0	0	0	\N	\N	19	2019-12-16 00:00:00	\N	1	2	1	405428	68	L	74
1219	969	69	34	1	2	0	0	0	\N	\N	23	2019-12-17 00:00:00	\N	1	1	1	408182	68	L	74
1221	971	84	34	1	2	0	0	0	\N	\N	23	2019-12-17 00:00:00	\N	1	2	1	408180	68	L	74
1245	969	131	34	1	2	0	0	0	\N	\N	19	2019-12-17 00:00:00	\N	2	5	1	82806	68	L	74
1244	971	131	34	1	2	0	0	0	\N	\N	19	2019-12-17 00:00:00	\N	2	5	1	82804	68	L	74
1240	976	131	34	1	2	0	0	0	\N	\N	19	2019-12-17 00:00:00	\N	2	5	1	81695	68	L	74
886	695	69	37	1	2	0	0	0	\N	\N	19	2019-11-29 00:00:00	\N	1	1	1	407962	66	L	74
1217	967	69	39	1	2	0	0	0	\N	\N	19	2019-12-17 00:00:00	\N	1	1	1	405812	68	L	74
1107	877	73	41	1	2	0	0	0	\N	\N	19	2019-12-16 00:00:00	\N	2	1	1	407996	68	L	74
1120	888	74	41	1	2	0	0	0	\N	\N	19	2019-12-16 00:00:00	\N	2	1	1	407852	68	L	74
1104	875	74	41	1	2	0	0	0	\N	\N	19	2019-12-16 00:00:00	\N	2	1	1	407848	68	L	74
1118	886	74	41	1	2	0	0	0	\N	\N	19	2019-12-16 00:00:00	\N	2	1	1	407847	68	L	74
1117	885	74	41	1	2	0	0	0	\N	\N	19	2019-12-16 00:00:00	\N	2	1	1	407853	68	L	74
1109	878	79	41	1	2	0	0	0	\N	\N	19	2019-12-16 00:00:00	\N	3	1	1	407851	68	L	74
1436	1119	\N	48	1	1	\N	\N	0	\N	\N	23	\N	\N	\N	\N	3	0	76	L	76
1121	889	79	41	1	2	0	0	0	\N	\N	19	2019-12-16 00:00:00	\N	3	1	1	407849	68	L	74
1102	874	83	41	1	2	0	0	0	\N	\N	19	2019-12-16 00:00:00	\N	1	2	1	407999	68	L	74
1112	880	87	41	1	2	0	0	0	\N	\N	19	2019-12-16 00:00:00	\N	2	2	1	408291	68	L	74
1119	887	89	41	1	2	0	0	0	\N	\N	19	2019-12-16 00:00:00	\N	2	2	1	407850	68	L	74
1105	876	94	41	1	2	0	0	0	\N	\N	19	2019-12-16 00:00:00	\N	3	2	1	408000	68	L	74
1103	874	129	41	1	2	0	0	0	\N	\N	19	2019-12-16 00:00:00	\N	2	5	1	84086	68	L	74
1101	873	129	41	1	2	0	0	0	\N	\N	19	2019-12-16 00:00:00	\N	2	5	1	84088	68	L	74
1108	877	130	41	1	2	0	0	0	\N	\N	19	2019-12-16 00:00:00	\N	2	5	1	82613	68	L	74
1325	1031	69	52	1	3	59378	44006.6699999999983	1	\N	\N	19	2020-01-22 00:00:00	\N	1	1	1	408831	74	L	74
1324	1030	69	52	1	3	80812	44006.6699999999983	1	\N	\N	19	2020-01-22 00:00:00	\N	1	1	1	408261	74	L	74
1303	1014	69	52	1	3	7595	54940	1	\N	\N	23	2020-01-22 00:00:00	\N	1	1	1	408263	74	L	74
1321	1027	69	52	1	3	8037	44006.6699999999983	1	\N	\N	19	2020-01-22 00:00:00	\N	1	1	1	408823	74	L	74
1289	1004	69	31	1	3	5144	44006.6699999999983	1	\N	\N	23	2020-01-21 00:00:00	\N	1	1	1	408233	74	L	74
1288	1003	69	31	1	3	7161	44006.6699999999983	1	\N	\N	23	2020-01-21 00:00:00	\N	1	1	1	408234	74	L	74
1328	1033	69	56	1	3	4082	62695.8300000000017	1	\N	\N	19	2020-01-22 00:00:00	\N	1	1	1	407560	74	L	74
1292	1006	69	35	1	3	2275	45000	1	\N	\N	23	2020-01-21 00:00:00	\N	1	1	1	407672	74	L	74
1305	1015	84	35	1	3	0	173225	1	\N	\N	23	2020-01-22 00:00:00	\N	1	2	1	407673	74	L	74
1329	1035	84	50	1	3	4868	140425.010000000009	1	\N	\N	19	2020-01-22 00:00:00	\N	1	2	1	407578	74	L	74
1106	876	130	41	1	2	0	0	0	\N	\N	19	2019-12-16 00:00:00	\N	2	5	1	84085	68	L	74
1122	875	131	41	1	2	0	0	0	\N	\N	19	2019-12-16 00:00:00	\N	2	5	1	84087	68	L	74
991	779	69	43	1	2	0	0	0	\N	\N	19	2019-12-09 00:00:00	\N	1	1	1	407876	67	L	74
806	631	84	46	1	2	0	0	0	\N	\N	19	2019-11-26 00:00:00	\N	1	2	1	407519	65	L	74
1003	787	84	46	1	2	0	0	0	\N	\N	19	2019-12-09 00:00:00	\N	1	2	1	407796	67	L	74
995	782	131	46	1	2	0	0	0	\N	\N	19	2019-12-09 00:00:00	\N	2	5	1	84146	67	L	74
1132	899	69	46	1	2	0	0	0	\N	\N	19	2019-12-16 00:00:00	\N	1	1	1	407869	68	L	74
1140	907	84	46	1	2	0	0	0	\N	\N	19	2019-12-16 00:00:00	\N	1	2	1	407857	68	L	74
1124	891	84	46	1	2	0	0	0	\N	\N	0	2019-12-16 00:00:00	\N	1	2	1	407862	68	L	74
1139	906	84	46	1	2	0	0	0	\N	\N	19	2019-12-16 00:00:00	\N	1	2	1	407856	68	L	74
1138	905	84	46	1	2	0	0	0	\N	\N	19	2019-12-16 00:00:00	\N	1	2	1	407775	68	L	74
1137	904	84	46	1	2	0	0	0	\N	\N	19	2019-12-16 00:00:00	\N	1	2	1	407774	68	L	74
1136	903	84	46	1	2	0	0	0	\N	\N	19	2019-12-16 00:00:00	\N	1	2	1	407855	68	L	74
1135	902	84	46	1	2	0	0	0	\N	\N	19	2019-12-16 00:00:00	\N	1	2	1	408034	68	L	74
1134	901	84	46	1	2	0	0	0	\N	\N	19	2019-12-16 00:00:00	\N	1	2	1	408036	68	L	74
1133	900	84	46	1	2	0	0	0	\N	\N	19	2019-12-16 00:00:00	\N	1	2	1	408038	68	L	74
1078	855	69	48	1	2	0	0	0	\N	\N	19	2019-12-10 00:00:00	\N	1	1	1	407905	67	L	74
1077	854	69	48	1	2	0	0	0	\N	\N	19	2019-12-10 00:00:00	\N	1	1	1	407624	67	L	74
1075	852	69	48	1	2	0	0	0	\N	\N	19	2019-12-10 00:00:00	\N	1	1	1	407909	67	L	74
1072	849	69	48	1	2	0	0	0	\N	\N	19	2019-12-10 00:00:00	\N	1	1	1	407630	67	L	74
1076	853	84	48	1	2	0	0	0	\N	\N	19	2019-12-10 00:00:00	\N	1	2	1	407910	67	L	74
1073	850	84	48	1	2	0	0	0	\N	\N	19	2019-12-10 00:00:00	\N	1	2	1	407911	67	L	74
1202	955	69	48	1	2	0	0	0	\N	\N	19	2019-12-17 00:00:00	\N	1	1	1	407916	68	L	74
1195	952	84	48	1	2	0	0	0	\N	\N	19	2019-12-17 00:00:00	\N	1	2	1	408505	68	L	74
1191	950	84	48	1	2	0	0	0	\N	\N	19	2019-12-17 00:00:00	\N	1	2	1	408512	68	L	74
1439	1122	\N	48	1	1	\N	\N	0	\N	\N	23	\N	\N	\N	\N	3	0	76	L	76
1203	955	131	48	1	2	0	0	0	\N	\N	19	2019-12-17 00:00:00	\N	2	5	1	82691	68	L	74
945	739	89	50	1	2	0	0	0	\N	\N	19	2019-12-03 00:00:00	\N	2	2	1	407580	66	L	74
1233	977	69	51	1	2	0	0	0	\N	\N	19	2019-12-17 00:00:00	\N	1	1	1	407585	68	L	74
953	747	69	52	1	2	0	0	0	\N	\N	23	2019-12-03 00:00:00	\N	1	1	1	407747	66	L	74
1181	942	69	52	1	2	0	0	0	\N	\N	19	2019-12-17 00:00:00	\N	1	1	1	408257	68	L	74
1178	939	69	52	1	2	0	0	0	\N	\N	19	2019-12-17 00:00:00	\N	1	1	1	408011	68	L	74
1050	830	84	58	1	2	0	0	0	\N	\N	19	2019-12-10 00:00:00	\N	1	2	1	404885	67	L	74
1048	828	84	58	1	2	0	0	0	\N	\N	19	2019-12-10 00:00:00	\N	1	2	1	408122	67	L	74
1153	917	69	31	1	2	0	0	0	\N	\N	19	2019-12-16 00:00:00	\N	1	1	1	408001	68	L	74
395	263	69	32	1	2	0	0	0	\N	\N	1	2019-12-11 00:00:00	\N	1	1	1	405580	61	L	74
890	695	131	37	1	2	0	0	0	\N	\N	19	2019-11-29 00:00:00	\N	2	5	1	82885	66	L	74
1172	935	69	38	1	2	0	0	0	\N	\N	19	2019-12-17 00:00:00	\N	1	1	1	408213	68	L	74
1171	934	84	38	1	2	0	0	0	\N	\N	19	2019-12-17 00:00:00	\N	1	2	1	408208	68	L	74
1111	879	67	41	1	2	0	0	0	\N	\N	19	2019-12-16 00:00:00	\N	1	1	1	408293	68	L	74
1113	881	68	41	1	2	0	0	0	\N	\N	19	2019-12-16 00:00:00	\N	1	1	1	408288	68	L	74
1114	882	74	41	1	2	0	0	0	\N	\N	19	2019-12-16 00:00:00	\N	2	1	1	408292	68	L	74
1110	878	131	41	1	2	0	0	0	\N	\N	19	2019-12-16 00:00:00	\N	2	5	1	84096	68	L	74
1004	788	84	46	1	2	0	0	0	\N	\N	19	2019-12-09 00:00:00	\N	1	2	1	408031	67	L	74
996	783	84	46	1	2	0	0	0	\N	\N	19	2019-12-09 00:00:00	\N	1	2	1	407786	67	L	74
1005	788	131	46	1	2	0	0	0	\N	\N	19	2019-12-09 00:00:00	\N	2	5	1	84159	67	L	74
1563	1206	\N	48	1	1	\N	\N	0	\N	\N	23	\N	\N	\N	\N	3	0	79	L	79
1236	979	69	46	1	2	0	0	0	\N	\N	23	2019-12-17 00:00:00	\N	1	1	1	408648	68	L	74
1143	910	69	46	1	2	0	0	0	\N	\N	19	2019-12-16 00:00:00	\N	1	1	1	407777	68	L	74
1141	908	69	46	1	2	0	0	0	\N	\N	19	2019-12-16 00:00:00	\N	1	1	1	407770	68	L	74
1144	911	84	46	1	2	0	0	0	\N	\N	19	2019-12-16 00:00:00	\N	1	2	1	407870	68	L	74
1127	894	84	46	1	2	0	0	0	\N	\N	19	2019-12-16 00:00:00	\N	1	2	1	407861	68	L	74
1126	893	84	46	1	2	0	0	0	\N	\N	19	2019-12-16 00:00:00	\N	1	2	1	407860	68	L	74
1082	859	69	48	1	2	0	0	0	\N	\N	19	2019-12-10 00:00:00	\N	1	1	1	407627	67	L	74
1081	858	69	48	1	2	0	0	0	\N	\N	19	2019-12-10 00:00:00	\N	1	1	1	407907	67	L	74
1080	857	69	48	1	2	0	0	0	\N	\N	19	2019-12-10 00:00:00	\N	1	1	1	407906	67	L	74
1079	856	69	48	1	2	0	0	0	\N	\N	19	2019-12-10 00:00:00	\N	1	1	1	407904	67	L	74
1097	872	69	48	1	2	0	0	0	\N	\N	0	2019-12-13 00:00:00	\N	1	1	1	407925	68	L	74
409	277	84	50	1	2	0	0	0	\N	\N	19	2019-12-11 00:00:00	\N	1	2	1	406552	61	L	74
406	274	89	50	1	2	0	0	0	\N	\N	19	2019-12-11 00:00:00	\N	2	2	1	405377	61	L	74
1157	921	83	50	1	2	0	0	0	\N	\N	19	2019-12-16 00:00:00	\N	1	2	1	407808	68	L	74
1155	919	84	50	1	2	0	0	0	\N	\N	19	2019-12-16 00:00:00	\N	1	2	1	407809	68	L	74
1211	963	69	51	1	2	0	0	0	\N	\N	19	2019-12-17 00:00:00	\N	1	1	1	408158	68	L	74
1210	962	69	51	1	2	0	0	0	\N	\N	19	2019-12-17 00:00:00	\N	1	1	1	408166	68	L	74
1209	961	69	51	1	2	0	0	0	\N	\N	19	2019-12-17 00:00:00	\N	1	1	1	408157	68	L	74
1250	810	69	51	1	2	0	0	0	\N	\N	23	2019-12-19 00:00:00	\N	1	1	1	408149	69	L	74
1248	820	69	52	1	2	0	0	0	\N	\N	19	2019-12-19 00:00:00	\N	1	1	1	407748	69	L	74
1249	864	74	54	1	2	0	0	0	\N	\N	19	2019-12-19 00:00:00	\N	2	1	1	405774	69	L	74
1299	1011	69	52	1	3	3466	62456.6699999999983	1	\N	\N	23	2020-01-21 00:00:00	\N	1	1	1	408834	74	L	74
166	89	90	41	1	2	\N	\N	\N	\N	\N	1	2019-10-18 00:00:00	2019-10-18 00:00:00	2	2	1	405596	60	L	74
1317	1023	69	50	1	3	2990	55000	1	\N	\N	23	2020-01-22 00:00:00	\N	1	1	1	407811	74	L	74
1319	1025	84	46	1	3	8955	125361.669999999998	1	\N	\N	23	2020-01-22 00:00:00	\N	1	2	1	407778	74	L	74
1164	928	83	32	1	2	0	0	0	\N	\N	19	2019-12-16 00:00:00	\N	1	2	1	405425	68	L	74
1311	689	\N	48	1	1	\N	\N	0	\N	\N	23	\N	\N	\N	\N	3	0	74	L	74
1310	1019	\N	48	1	1	\N	\N	0	\N	\N	23	\N	\N	\N	\N	3	0	74	L	74
1182	943	69	52	1	2	0	0	0	\N	\N	19	2019-12-17 00:00:00	\N	1	1	1	408256	68	L	74
1071	848	69	48	1	2	0	0	0	\N	\N	19	2019-12-10 00:00:00	\N	1	1	1	407626	67	L	74
1332	1038	73	31	1	3	14135	85867	1	\N	\N	19	2020-01-22 00:00:00	\N	2	1	1	408236	74	L	74
1298	999	131	50	1	3	1597	17000	1	\N	\N	23	2020-01-21 00:00:00	\N	2	5	1	84062	74	L	74
1294	999	84	50	1	3	1597	142391.670000000013	1	\N	\N	23	2020-01-21 00:00:00	\N	1	2	1	407575	74	L	74
1333	1039	92	50	1	3	49624961	152916.670000000013	1	\N	\N	19	2020-01-22 00:00:00	\N	3	2	1	408139	74	L	74
1345	1047	\N	38	1	1	\N	\N	0	\N	\N	23	\N	\N	\N	\N	3	0	74	L	74
1368	1068	131	48	1	2	0	0	0	\N	\N	23	2020-01-28 00:00:00	\N	2	5	1	85669	75	X	75
1347	1051	\N	38	1	1	\N	\N	0	\N	\N	19	\N	\N	\N	\N	3	0	75	L	75
1377	1075	129	54	1	3	6931	3833333	1	\N	\N	19	2020-01-28 00:00:00	\N	2	5	1	84276	75	L	75
1379	1043	131	54	1	3	7039	24250	1	\N	\N	23	2020-01-28 00:00:00	\N	2	5	1	84273	75	L	75
1356	1060	74	39	1	2	0	0	0	\N	\N	23	2020-01-28 00:00:00	\N	2	1	1	405957	75	X	75
1399	1088	131	48	1	2	0	0	0	\N	\N	23	2020-02-03 00:00:00	\N	2	5	1	82690	76	X	76
1354	1058	69	38	1	3	92310732	201066.660000000003	1	\N	\N	1	2020-01-28 00:00:00	\N	1	1	1	408960	75	L	75
1351	1055	\N	38	1	1	\N	\N	0	\N	\N	1	\N	\N	\N	\N	3	0	75	L	75
1350	1054	\N	38	1	1	\N	\N	0	\N	\N	1	\N	\N	\N	\N	3	0	75	L	75
1378	1043	69	54	1	3	7039	276400	1	\N	\N	23	2020-01-28 00:00:00	\N	1	1	1	405777	75	L	75
1376	1075	69	54	1	3	0292	437000	1	\N	\N	19	2020-01-28 00:00:00	\N	1	1	1	407696	75	L	75
1363	1066	74	50	1	3	0035	176000	1	\N	\N	1	2020-01-28 00:00:00	\N	2	1	1	408140	75	L	75
1361	1064	87	50	1	3	75366298	244666.660000000003	2	\N	\N	1	2020-01-28 00:00:00	\N	2	2	1	408143	75	L	75
1375	1074	\N	43	1	1	\N	\N	0	\N	\N	19	\N	\N	\N	\N	3	0	75	L	75
1374	1073	\N	43	1	1	\N	\N	0	\N	\N	19	\N	\N	\N	\N	3	0	75	L	75
1373	1072	\N	43	1	1	1	1	1	\N	\N	1	\N	\N	\N	\N	2	408346	75	L	75
1359	327	\N	39	1	1	\N	\N	0	\N	\N	23	\N	\N	\N	\N	3	0	75	L	75
1266	949	84	48	1	2	0	0	0	\N	\N	23	2020-01-13 00:00:00	\N	1	2	1	408507	72	L	76
1267	949	131	48	1	2	0	0	0	\N	\N	23	2020-01-13 00:00:00	\N	2	5	1	82698	72	L	76
1193	951	69	48	1	2	0	0	0	\N	\N	19	2019-12-17 00:00:00	\N	1	1	1	408501	68	L	76
1285	1001	69	51	1	2	0	0	0	\N	\N	23	2020-01-14 00:00:00	\N	1	1	1	408167	72	L	76
1268	990	131	48	1	2	0	0	0	\N	\N	23	2020-01-13 00:00:00	\N	2	5	1	80869	72	L	76
1194	951	131	48	1	2	0	0	0	\N	\N	19	2019-12-17 00:00:00	\N	2	5	1	82693	68	L	76
864	674	69	54	1	2	0	0	0	\N	\N	19	2019-11-27 00:00:00	\N	1	1	1	405778	65	L	76
812	636	69	45	1	2	0	0	0	\N	\N	19	2019-11-26 00:00:00	\N	1	1	1	406924	65	L	76
1183	944	69	52	1	2	0	0	0	\N	\N	19	2019-12-17 00:00:00	\N	1	1	1	408255	68	L	76
1162	926	69	32	1	2	0	0	0	\N	\N	19	2019-12-16 00:00:00	\N	1	1	1	405427	68	L	76
1169	933	92	38	1	2	0	0	0	\N	\N	19	2019-12-17 00:00:00	\N	3	2	1	408206	68	L	76
1220	970	69	39	1	2	0	0	0	\N	\N	19	2019-12-17 00:00:00	\N	1	1	1	406764	68	L	76
1149	345	69	39	1	2	0	0	0	\N	\N	19	2019-12-16 00:00:00	\N	1	1	1	406761	68	L	76
1174	936	69	43	1	2	0	0	0	\N	\N	19	2019-12-17 00:00:00	\N	1	1	1	407874	68	L	76
1175	936	131	43	1	2	0	0	0	\N	\N	19	2019-12-17 00:00:00	\N	2	5	1	84294	68	L	76
1125	892	84	46	1	2	0	0	0	\N	\N	19	2019-12-16 00:00:00	\N	1	2	1	407859	68	L	76
1263	987	69	48	1	2	0	0	0	\N	\N	23	2020-01-13 00:00:00	\N	1	1	1	408504	72	L	76
1286	998	69	51	1	2	0	0	0	\N	\N	23	2020-01-14 00:00:00	\N	1	1	1	408160	72	L	76
519	372	82	51	1	2	0	0	0	\N	\N	19	2019-12-11 00:00:00	\N	1	2	1	406628	62	L	76
1026	807	84	51	1	2	0	0	0	\N	\N	19	2019-12-09 00:00:00	\N	1	2	1	407886	67	L	76
580	424	131	53	1	2	0	0	0	\N	\N	19	2019-12-11 00:00:00	\N	2	5	1	82787	63	L	76
1093	867	131	53	1	2	0	0	0	\N	\N	19	2019-12-13 00:00:00	\N	2	5	1	84261	68	L	76
1382	726	74	37	1	2	0	0	0	\N	\N	23	2020-01-31 00:00:00	\N	2	1	1	407978	76	X	76
1443	1125	\N	48	1	1	\N	\N	0	\N	\N	23	\N	\N	\N	\N	3	0	76	L	76
1442	1124	\N	48	1	1	\N	\N	0	\N	\N	23	\N	\N	\N	\N	3	0	76	L	76
1438	1121	\N	48	1	1	\N	\N	0	\N	\N	23	\N	\N	\N	\N	3	0	76	L	76
1437	1120	\N	48	1	1	\N	\N	0	\N	\N	23	\N	\N	\N	\N	3	0	76	L	76
1435	1118	\N	48	1	1	\N	\N	0	\N	\N	23	\N	\N	\N	\N	3	0	76	L	76
1433	1116	\N	48	1	1	\N	\N	0	\N	\N	23	\N	\N	\N	\N	3	0	76	L	76
1431	1114	\N	48	1	1	\N	\N	0	\N	\N	23	\N	\N	\N	\N	3	0	76	L	76
1430	1113	\N	48	1	1	\N	\N	0	\N	\N	23	\N	\N	\N	\N	3	0	76	L	76
1429	1112	\N	48	1	1	\N	\N	0	\N	\N	23	\N	\N	\N	\N	3	0	76	L	76
1427	1110	\N	48	1	1	\N	\N	0	\N	\N	23	\N	\N	\N	\N	3	0	76	L	76
1425	1108	\N	48	1	1	\N	\N	0	\N	\N	23	\N	\N	\N	\N	3	0	76	L	76
1422	1105	\N	48	1	1	\N	\N	0	\N	\N	23	\N	\N	\N	\N	3	0	76	L	76
1419	1102	\N	48	1	1	\N	\N	0	\N	\N	23	\N	\N	\N	\N	3	0	76	L	76
1418	1101	\N	48	1	1	\N	\N	0	\N	\N	23	\N	\N	\N	\N	3	0	76	L	76
1417	1100	\N	48	1	1	\N	\N	0	\N	\N	23	\N	\N	\N	\N	3	0	76	L	76
1453	1132	129	50	1	3	0370	33750	1	\N	\N	23	2020-02-04 00:00:00	\N	2	5	1	81683	76	L	76
1452	1132	74	50	1	3	0370	207340	1	\N	\N	23	2020-02-04 00:00:00	\N	2	1	1	407564	76	L	76
1397	1087	129	34	1	3	3668	35833.3300000000017	1	\N	\N	19	2020-02-03 00:00:00	\N	2	5	1	85622	76	L	76
1395	1087	69	34	1	3	3668	252399.98000000001	1	\N	\N	19	2020-02-03 00:00:00	\N	1	1	1	408867	76	L	76
1401	978	\N	34	1	1	\N	\N	0	\N	\N	19	\N	\N	\N	\N	3	0	76	L	76
1400	1089	\N	34	1	1	\N	\N	0	\N	\N	19	\N	\N	\N	\N	3	0	76	L	76
1398	254	\N	34	1	1	\N	\N	0	\N	\N	19	\N	\N	\N	\N	3	0	76	L	76
1428	1111	\N	39	1	1	\N	\N	0	\N	\N	19	\N	\N	\N	\N	3	0	76	L	76
1426	1109	\N	39	1	1	\N	\N	0	\N	\N	19	\N	\N	\N	\N	3	0	76	L	76
1424	1107	\N	39	1	1	\N	\N	0	\N	\N	19	\N	\N	\N	\N	3	0	76	L	76
1423	1106	\N	39	1	1	\N	\N	0	\N	\N	19	\N	\N	\N	\N	3	0	76	L	76
1421	1104	\N	39	1	1	\N	\N	0	\N	\N	19	\N	\N	\N	\N	3	0	76	L	76
1420	1103	\N	39	1	1	\N	\N	0	\N	\N	19	\N	\N	\N	\N	3	0	76	L	76
1384	1077	129	37	1	3	9395	26666.6699999999983	1	\N	\N	23	2020-01-31 00:00:00	\N	2	5	1	82888	76	L	76
1460	1135	69	37	1	3	0	171333.329999999987	1	\N	\N	23	2020-02-05 00:00:00	\N	1	1	1	407947	76	L	76
1381	1076	69	37	1	3	0953	315733.330000000016	1	\N	\N	23	2020-01-31 00:00:00	\N	1	1	1	407980	76	L	76
1461	1136	74	37	1	3	0	250600	1	\N	\N	23	2020-02-05 00:00:00	\N	2	1	1	407946	76	L	76
1462	1137	79	37	1	3	0	296000	1	\N	\N	23	2020-02-05 00:00:00	\N	3	1	1	407929	76	L	76
1383	1077	89	37	1	3	9395	529500	1	\N	\N	23	2020-01-31 00:00:00	\N	2	2	1	407958	76	L	76
1386	1079	\N	61	1	1	\N	\N	0	\N	\N	23	\N	\N	\N	\N	3	0	76	L	76
1449	302	\N	38	1	1	\N	\N	0	\N	\N	19	\N	\N	\N	\N	3	0	76	L	76
1448	1129	\N	38	1	1	\N	\N	0	\N	\N	19	\N	\N	\N	\N	3	0	76	L	76
1447	1128	\N	38	1	1	\N	\N	0	\N	\N	19	\N	\N	\N	\N	3	0	76	L	76
1459	1134	129	62	1	3	2017	28333.3300000000017	1	\N	\N	23	2020-02-04 00:00:00	\N	2	5	1	83829	76	L	76
1458	1134	69	62	1	3	2017	285400	1	\N	\N	23	2020-02-04 00:00:00	\N	1	1	1	407553	76	L	76
1456	1102	\N	48	1	1	0	0	0	\N	\N	19	\N	\N	\N	\N	2	408523	76	L	76
1455	1101	\N	48	1	1	0	0	0	\N	\N	19	\N	\N	\N	\N	2	408436	76	L	76
1454	1100	\N	48	1	1	0	0	0	\N	\N	19	\N	\N	\N	\N	2	408522	76	L	76
1507	1170	69	34	1	2	0	0	0	\N	\N	19	2020-02-12 00:00:00	\N	1	1	1	409244	77	X	77
1560	1203	\N	48	1	1	\N	\N	0	\N	\N	23	\N	\N	\N	\N	3	0	79	L	79
1466	1141	69	63	1	3	17807	286400	1	\N	\N	19	2020-02-11 00:00:00	\N	1	1	1	408024	77	L	77
1508	1170	129	34	1	3	85621	26666.6699999999983	1	\N	\N	19	2020-02-12 00:00:00	\N	2	5	1	85621	77	L	77
1492	1158	129	34	1	3	24870	90833.3300000000017	1	\N	\N	19	2020-02-11 00:00:00	\N	2	5	1	82755	77	L	77
1509	1170	69	34	1	3	41022	242733.329999999987	1	\N	\N	1	2020-02-12 00:00:00	\N	1	1	1	409244	77	L	77
1491	1158	84	34	1	3	3134	622833.329999999958	1	\N	\N	19	2020-02-11 00:00:00	\N	1	2	1	408184	77	L	77
1465	1140	\N	48	1	1	\N	\N	0	\N	\N	19	\N	\N	\N	\N	3	0	77	L	77
1504	1167	129	50	1	3	8437	45833.3300000000017	1	\N	\N	19	2020-02-11 00:00:00	\N	2	5	1	85996	77	L	77
1503	1167	74	50	1	3	8437	240000	1	\N	\N	19	2020-02-11 00:00:00	\N	2	1	1	409221	77	L	77
1500	1165	74	50	1	2	0	0	0	\N	\N	19	2020-02-11 00:00:00	\N	2	1	1	408142	77	X	77
1510	726	74	37	1	2	0	0	0	\N	\N	19	2020-02-14 00:00:00	\N	2	1	1	407978	78	X	78
1511	1060	74	38	1	2	0	0	0	\N	\N	23	2020-02-17 00:00:00	\N	2	1	1	409142	78	X	78
1523	1180	69	43	1	2	0	0	0	\N	\N	23	2020-02-18 00:00:00	\N	1	1	1	409055	78	X	78
1528	1183	83	37	1	2	0	0	0	\N	\N	23	2020-02-18 00:00:00	\N	1	2	1	409011	78	X	78
1541	1183	69	37	1	2	0	0	0	\N	\N	23	2020-02-18 00:00:00	\N	1	1	1	409011	78	X	78
1087	317	\N	48	1	2	0	0	0	\N	\N	19	\N	\N	\N	\N	2	407913	67	X	67
256	162	\N	48	1	2	\N	\N	\N	\N	\N	1	2019-12-11 00:00:00	\N	\N	\N	2	402202	60	X	60
1152	916	72	31	1	2	0	0	0	\N	\N	19	2019-12-16 00:00:00	\N	2	1	1	408231	68	L	78
1246	980	84	34	1	2	0	0	0	\N	\N	19	2019-12-17 00:00:00	\N	1	2	1	408176	68	L	78
1519	1177	69	43	1	2	0	0	0	\N	\N	23	2020-02-17 00:00:00	\N	1	1	1	409057	78	X	78
1525	240	\N	43	1	1	\N	\N	0	\N	\N	23	\N	\N	\N	\N	3	0	78	L	78
1497	1162	69	52	1	2	0	0	0	\N	\N	19	2020-02-11 00:00:00	\N	1	1	1	408069	77	X	77
1498	1163	91	51	1	2	0	0	0	\N	\N	19	2020-02-11 00:00:00	\N	2	2	1	409104	77	X	77
1542	1192	69	37	1	2	0	0	0	\N	\N	23	2020-02-18 00:00:00	\N	1	1	1	409011	78	X	78
1371	1070	70	51	1	2	0	0	0	\N	\N	1	2020-01-28 00:00:00	\N	1	1	1	408854	75	L	78
1352	1056	88	39	1	2	0	0	0	\N	\N	23	2020-01-28 00:00:00	\N	2	2	1	408802	75	L	78
1348	1052	89	39	1	2	0	0	0	\N	\N	23	2020-01-28 00:00:00	\N	2	2	1	406762	75	L	78
1315	1022	69	39	1	2	0	0	0	\N	\N	23	2020-01-22 00:00:00	\N	1	1	1	406858	74	L	78
1334	1040	93	39	1	2	0	0	0	\N	\N	19	2020-01-22 00:00:00	\N	3	2	1	406751	74	L	78
1331	1037	90	51	1	2	0	0	0	\N	\N	19	2020-01-22 00:00:00	\N	2	2	1	408163	74	L	78
1322	1028	84	52	1	2	0	0	0	\N	\N	19	2020-01-22 00:00:00	\N	1	2	1	408822	74	L	78
1295	1008	69	52	1	2	0	0	0	\N	\N	23	2020-01-21 00:00:00	\N	1	1	1	408254	74	L	78
1300	1012	69	52	1	2	0	0	0	\N	\N	23	2020-01-21 00:00:00	\N	1	1	1	408830	74	L	78
1537	1190	\N	37	1	1	\N	\N	0	\N	\N	23	\N	\N	\N	\N	3	0	78	L	78
1533	1186	129	34	1	3	46707	26666.6699999999983	1	\N	\N	19	2020-02-18 00:00:00	\N	2	5	1	85646	78	L	78
1335	1041	131	33	1	2	0	0	0	\N	\N	19	2020-01-22 00:00:00	\N	2	5	1	83725	74	L	78
1336	1042	129	33	1	2	0	0	0	\N	\N	19	2020-01-22 00:00:00	\N	2	5	1	84227	74	L	78
1513	1172	69	52	1	3	65311	171733.329999999987	1	\N	\N	19	2020-02-17 00:00:00	\N	1	1	1	409122	78	L	78
1365	1067	85	48	1	2	0	0	0	\N	\N	23	2020-01-28 00:00:00	\N	1	2	1	408511	75	L	78
1364	1065	129	48	1	2	0	0	0	\N	\N	23	2020-01-28 00:00:00	\N	2	5	1	80870	75	L	78
1362	1065	69	48	1	2	0	0	0	\N	\N	23	2020-01-28 00:00:00	\N	1	1	1	408521	75	L	78
1353	1057	73	38	1	2	0	0	0	\N	\N	1	2020-01-28 00:00:00	\N	2	1	1	408936	75	L	78
1357	1061	84	38	1	2	0	0	0	\N	\N	1	2020-01-28 00:00:00	\N	1	2	1	408212	75	L	78
1358	1062	79	38	1	2	0	0	0	\N	\N	1	2020-01-28 00:00:00	\N	3	1	1	405962	75	L	78
1372	1071	73	31	1	2	0	0	0	\N	\N	23	2020-01-28 00:00:00	\N	2	1	1	408237	75	L	78
1316	466	69	46	1	2	0	0	0	\N	\N	23	2020-01-22 00:00:00	\N	1	1	1	406937	74	L	78
1320	1026	84	46	1	2	0	0	0	\N	\N	23	2020-01-22 00:00:00	\N	1	2	1	407780	74	L	78
1313	1021	84	46	1	2	0	0	0	\N	\N	23	2020-01-22 00:00:00	\N	1	2	1	408552	74	L	78
1306	909	84	46	1	2	0	0	0	\N	\N	23	2020-01-22 00:00:00	\N	1	2	1	407772	74	L	78
1327	1034	84	46	1	2	0	0	0	\N	\N	23	2020-01-22 00:00:00	\N	1	2	1	407779	74	L	78
1326	1032	84	46	1	2	0	0	0	\N	\N	23	2020-01-22 00:00:00	\N	1	2	1	408551	74	L	78
1344	1050	82	38	1	2	0	0	0	\N	\N	19	2020-01-22 00:00:00	\N	1	2	1	407703	74	L	78
1291	985	69	57	1	2	0	0	0	\N	\N	23	2020-01-21 00:00:00	\N	1	1	1	407824	74	L	78
1369	1069	72	59	1	2	0	0	0	\N	\N	23	2020-01-28 00:00:00	\N	2	1	1	408643	75	L	78
1370	1069	131	59	1	2	0	0	0	\N	\N	23	2020-01-28 00:00:00	\N	2	5	1	85657	75	L	78
1290	1005	83	31	1	2	0	0	0	\N	\N	23	2020-01-21 00:00:00	\N	1	2	1	408235	74	L	78
1339	1045	88	32	1	2	0	0	0	\N	\N	19	2020-01-22 00:00:00	\N	2	2	1	408239	74	L	78
1330	1036	80	51	1	2	0	0	0	\N	\N	19	2020-01-22 00:00:00	\N	3	1	1	408162	74	L	78
1297	1010	69	52	1	2	0	0	0	\N	\N	23	2020-01-21 00:00:00	\N	1	1	1	408821	74	L	78
1307	1016	94	48	1	2	0	0	0	\N	\N	23	2020-01-22 00:00:00	\N	3	2	1	408518	74	L	78
1538	1191	84	37	1	4	9085	489333.330000000016	1	\N	\N	23	2020-02-18 00:00:00	\N	1	2	1	409015	78	L	78
1531	1186	84	34	1	3	46707	558666.670000000042	1	\N	\N	19	2020-02-18 00:00:00	\N	1	2	1	408891	78	L	78
1515	1174	69	52	1	3	2749250835	400000	1	\N	\N	19	2020-02-17 00:00:00	\N	1	1	1	409133	78	L	78
1543	1193	69	52	1	3	3296	171735	1	\N	\N	19	2020-02-18 00:00:00	\N	1	1	1	409135	78	L	78
1544	1194	69	52	1	3	80528	286400	1	\N	\N	19	2020-02-18 00:00:00	\N	1	1	1	409131	78	L	78
1366	1067	129	48	1	2	0	0	0	\N	\N	23	2020-01-28 00:00:00	\N	2	5	1	82700	75	L	78
1318	1024	84	46	1	2	0	0	0	\N	\N	23	2020-01-22 00:00:00	\N	1	2	1	408553	74	L	78
1520	1178	83	65	1	3	1045	654166.670000000042	1	\N	\N	23	2020-02-18 00:00:00	\N	1	2	1	409422	78	L	78
1521	1178	129	65	1	3	1045	67083.3300000000017	1	\N	\N	23	2020-02-18 00:00:00	\N	2	5	1	85852	78	L	78
1264	988	131	48	1	2	0	0	0	\N	\N	23	2020-01-13 00:00:00	\N	2	5	1	82695	72	L	78
1584	1223	69	37	1	1	41175	326816.669999999984	1	\N	\N	19	2020-02-26 00:00:00	\N	1	1	1	409008	79	X	79
1562	1205	129	59	1	2	0	0	0	\N	\N	19	2020-02-26 00:00:00	\N	2	5	1	85957	79	X	79
1552	1199	69	61	1	2	0	0	0	\N	\N	19	2020-02-26 00:00:00	\N	1	1	1	409084	79	X	79
1572	1213	129	34	1	3	3478	26666.6699999999983	1	\N	\N	19	2020-02-26 00:00:00	\N	2	5	1	32895342	79	X	79
1593	1227	129	52	1	2	0	0	0	\N	\N	23	2020-02-26 00:00:00	\N	2	5	1	85954	79	X	79
1590	1162	69	52	1	2	0	0	0	\N	\N	23	2020-02-26 00:00:00	\N	1	1	1	408069	79	X	79
1571	1212	69	34	1	4	3478	326400	1	\N	\N	19	2020-02-26 00:00:00	\N	1	1	1	408892	79	L	79
1576	1217	69	34	1	3	8727	198400	1	\N	\N	19	2020-02-26 00:00:00	\N	1	1	1	409249	79	L	79
1578	1217	129	34	1	3	8727	26666.6699999999983	1	\N	\N	19	2020-02-26 00:00:00	\N	2	5	1	85988	79	L	79
1580	1220	84	34	1	3	8547	516000	1	\N	\N	19	2020-02-26 00:00:00	\N	1	2	1	409250	79	L	79
1581	1220	129	34	1	3	8547	26666.6699999999983	1	\N	\N	19	2020-02-26 00:00:00	\N	2	5	1	85989	79	L	79
1605	1212	129	34	1	3	3478	26666.6699999999983	1	\N	\N	19	2020-02-27 00:00:00	\N	2	5	1	85647	79	L	79
1589	1226	69	32	1	3	2870	171733.329999999987	1	\N	\N	19	2020-02-26 00:00:00	\N	1	1	1	409301	79	L	79
1554	1197	\N	48	1	1	\N	\N	0	\N	\N	23	\N	\N	\N	\N	3	0	79	L	79
1557	321	\N	48	1	1	\N	\N	0	\N	\N	23	\N	\N	\N	\N	3	0	79	L	79
1558	321	\N	48	1	1	0	0	0	\N	\N	19	\N	\N	\N	\N	2	409272	79	L	79
1565	324	\N	48	1	1	\N	\N	0	\N	\N	23	\N	\N	\N	\N	3	0	79	L	79
1566	1207	\N	48	1	1	\N	\N	0	\N	\N	23	\N	\N	\N	\N	3	0	79	L	79
1567	1208	\N	48	1	1	\N	\N	0	\N	\N	23	\N	\N	\N	\N	3	0	79	L	79
1568	1209	\N	48	1	1	\N	\N	0	\N	\N	23	\N	\N	\N	\N	3	0	79	L	79
1569	1210	\N	48	1	1	\N	\N	0	\N	\N	23	\N	\N	\N	\N	3	0	79	L	79
1570	1211	\N	48	1	1	\N	\N	0	\N	\N	23	\N	\N	\N	\N	3	0	79	L	79
1588	1225	84	52	1	1	41189	489333.330000000016	1	\N	\N	19	2020-02-26 00:00:00	\N	1	2	1	409437	79	L	79
1592	1228	89	31	1	3	54308	465500	1	\N	\N	19	2020-02-26 00:00:00	\N	2	2	1	409166	79	L	79
1594	1229	69	31	1	3	7829	214400	1	\N	\N	19	2020-02-26 00:00:00	\N	1	1	1	409162	79	L	79
1555	1200	69	37	1	3	72646	214000	1	\N	\N	19	2020-02-26 00:00:00	\N	1	1	1	409009	79	L	79
1556	1201	84	37	1	3	10126	561333.329999999958	1	\N	\N	19	2020-02-26 00:00:00	\N	1	2	1	409014	79	L	79
1585	1223	69	37	1	1	41175	326816.669999999984	1	\N	\N	19	2020-02-26 00:00:00	\N	1	1	1	409008	79	L	79
1586	1224	129	37	1	1	41175	38333.3300000000017	1	\N	\N	19	2020-02-26 00:00:00	\N	2	5	1	85920	79	L	79
1587	1223	129	37	1	1	41176	38333.3300000000017	1	\N	\N	19	2020-02-26 00:00:00	\N	2	5	1	85906	79	L	79
1609	1069	129	59	1	2	0	0	0	\N	\N	23	2020-03-02 00:00:00	\N	2	5	1	82553	80	X	80
1608	1069	71	59	1	2	0	0	0	\N	\N	23	2020-03-02 00:00:00	\N	1	1	1	409386	80	X	80
1610	1237	67	31	1	2	0	0	0	\N	\N	19	2020-03-02 00:00:00	\N	1	1	1	409164	80	X	80
1619	1245	84	59	1	2	0	0	0	\N	\N	23	2020-03-02 00:00:00	\N	1	2	1	409385	80	X	80
879	571	\N	56	1	1	\N	\N	0	\N	\N	1	\N	\N	\N	\N	3	0	66	X	66
915	718	131	37	1	3	612	16000	1	\N	\N	19	2019-12-02 00:00:00	\N	2	5	1	82883	66	L	66
951	745	87	32	1	3	6231	1	36700	\N	\N	19	2019-12-03 00:00:00	\N	2	2	1	406914	66	X	66
959	752	69	52	1	3	0110	55023.3399999999965	1	\N	\N	23	2019-12-03 00:00:00	\N	1	1	1	406580	66	X	66
1251	981	69	32	1	3	45647	44006.6699999999983	1	\N	\N	19	2019-12-20 00:00:00	\N	1	1	1	405424	69	L	69
891	698	\N	38	1	1	\N	\N	0	\N	\N	23	\N	\N	\N	\N	3	0	66	L	66
887	691	\N	38	1	1	\N	\N	0	\N	\N	23	\N	\N	\N	\N	3	0	66	L	66
939	735	79	39	1	2	0	0	0	\N	\N	19	2019-12-03 00:00:00	\N	3	1	1	406763	66	D	66
1343	1049	\N	39	1	1	\N	\N	0	\N	\N	19	\N	\N	\N	\N	3	0	74	L	74
222	138	94	46	1	2	\N	\N	\N	\N	\N	1	2019-12-11 00:00:00	\N	3	2	1	406653	60	D	60
231	147	94	46	1	2	\N	\N	\N	\N	\N	1	2019-12-11 00:00:00	\N	3	2	1	406647	60	D	60
1483	1152	84	43	1	2	0	0	0	\N	\N	19	2020-02-11 00:00:00	\N	1	2	1	409045	77	D	77
1302	1013	129	54	1	2	0	0	0	\N	\N	23	2020-01-22 00:00:00	\N	2	5	1	84286	74	L	80
1415	1099	74	41	1	2	0	0	0	\N	\N	19	2020-02-03 00:00:00	\N	2	1	1	408277	76	L	80
1067	845	84	50	1	3	5253	159225	1	\N	\N	19	2019-12-10 00:00:00	\N	1	2	1	407576	67	L	67
1068	845	130	50	1	3	185700964	33833.3300000000017	1	\N	\N	19	2019-12-10 00:00:00	\N	2	5	1	83804	67	L	67
1014	795	69	43	1	3	266095	120000	1	\N	\N	19	2019-12-09 00:00:00	\N	1	1	1	404890	67	L	67
1021	802	69	51	1	3	6740	66476.3300000000017	1	\N	\N	19	2019-12-09 00:00:00	\N	1	1	1	408150	67	L	67
1035	815	69	52	1	3	2426	45000	1	\N	\N	19	2019-12-10 00:00:00	\N	1	1	1	408251	67	L	67
1038	818	69	52	1	3	6599	96000	1	\N	\N	19	2019-12-10 00:00:00	\N	1	1	1	408012	67	L	67
1061	840	69	34	1	3	2104	152325	1	\N	\N	19	2019-12-10 00:00:00	\N	1	1	1	407597	67	L	67
1062	840	131	34	1	3	2104	16000	1	\N	\N	19	2019-12-10 00:00:00	\N	2	5	1	82753	67	L	67
583	427	69	34	1	4	30854	79456.6699999999983	1	\N	\N	19	2019-12-11 00:00:00	\N	1	1	1	405714	63	L	63
584	428	131	34	1	4	1841730854	17000	1	\N	\N	19	2019-12-11 00:00:00	\N	2	5	1	84051	63	L	63
1641	1262	89	50	1	2	0	0	0	\N	\N	19	2020-03-03 00:00:00	\N	2	2	1	409229	80	X	80
1623	1245	129	59	1	3	2899	26666.6699999999983	1	\N	\N	23	2020-03-02 00:00:00	\N	2	5	1	82550	80	X	80
1622	1245	84	59	1	3	2899	198400	1	\N	\N	23	2020-03-02 00:00:00	\N	1	2	1	409385	80	X	80
1628	1252	84	43	1	2	0	0	0	\N	\N	23	2020-03-02 00:00:00	\N	1	2	1	409439	80	X	80
1338	1044	88	32	1	2	0	0	0	\N	\N	19	2020-01-22 00:00:00	\N	2	2	1	408240	74	D	74
630	468	84	46	1	2	0	0	0	\N	\N	19	2019-11-12 00:00:00	\N	1	2	1	406680	63	D	63
1047	827	69	58	1	2	0	0	0	\N	\N	19	2019-12-10 00:00:00	\N	1	1	1	408041	67	D	67
1146	293	84	46	1	2	0	0	0	\N	\N	19	2019-12-16 00:00:00	\N	1	2	1	407776	68	D	68
708	538	68	51	1	2	0	0	0	\N	\N	19	2019-11-19 00:00:00	\N	1	1	1	407680	64	D	64
1010	791	84	46	1	2	0	0	0	\N	\N	19	2019-12-09 00:00:00	\N	1	2	1	407797	67	D	67
1085	862	69	48	1	2	0	0	0	\N	\N	19	2019-12-10 00:00:00	\N	1	1	1	407629	67	D	67
1634	778	\N	43	0	1	0	0	0	\N	\N	23	\N	\N	\N	\N	2	409059	80	X	80
1640	1261	131	61	1	2	0	0	0	\N	\N	23	2020-03-03 00:00:00	\N	2	5	1	85664	80	D	80
1642	1199	87	61	1	2	0	0	0	\N	\N	23	2020-03-03 00:00:00	\N	2	2	1	409084	80	D	80
1499	1164	82	51	1	2	0	0	0	\N	\N	19	2020-02-11 00:00:00	\N	1	2	1	408857	77	L	80
1614	1241	72	31	1	2	0	0	0	\N	\N	19	2020-03-02 00:00:00	\N	2	1	1	409168	80	D	80
1616	1243	69	31	1	2	0	0	0	\N	\N	19	2020-03-02 00:00:00	\N	1	1	1	409170	80	D	80
1629	1253	83	32	1	2	0	0	0	\N	\N	19	2020-03-02 00:00:00	\N	1	2	1	409308	80	D	80
1632	1256	68	32	1	2	0	0	0	\N	\N	19	2020-03-02 00:00:00	\N	1	1	1	409312	80	D	80
1633	1257	83	32	1	2	0	0	0	\N	\N	19	2020-03-02 00:00:00	\N	1	2	1	409313	80	D	80
1638	1260	89	32	1	2	0	0	0	\N	\N	19	2020-03-03 00:00:00	\N	2	2	1	409304	80	D	80
1648	1267	84	38	1	2	0	0	0	\N	\N	23	2020-03-03 00:00:00	\N	1	2	1	409146	80	D	80
1630	1254	84	43	1	2	0	0	0	\N	\N	23	2020-03-02 00:00:00	\N	1	2	1	409445	80	D	80
1637	1259	79	43	1	2	0	0	0	\N	\N	23	2020-03-03 00:00:00	\N	3	1	1	409052	80	D	80
1661	1252	69	43	1	2	0	0	0	\N	\N	23	2020-03-03 00:00:00	\N	1	1	1	409439	80	D	80
1643	1262	88	50	1	2	0	0	0	\N	\N	19	2020-03-03 00:00:00	\N	2	2	1	409229	80	D	80
1644	1263	69	52	1	2	0	0	0	\N	\N	19	2020-03-03 00:00:00	\N	1	1	1	409140	80	D	80
1618	1244	88	54	1	2	0	0	0	\N	\N	19	2020-03-02 00:00:00	\N	2	2	1	409341	80	D	80
1620	1246	69	54	1	2	0	0	0	\N	\N	19	2020-03-02 00:00:00	\N	1	1	1	409345	80	D	80
1621	1247	69	54	1	2	0	0	0	\N	\N	19	2020-03-02 00:00:00	\N	1	1	1	409346	80	D	80
1612	1239	69	59	1	2	0	0	0	\N	\N	23	2020-03-02 00:00:00	\N	1	1	1	409037	80	D	80
1617	1239	129	59	1	2	0	0	0	\N	\N	23	2020-03-02 00:00:00	\N	2	5	1	82542	80	D	80
1635	1258	83	59	1	2	0	0	0	\N	\N	23	2020-03-03 00:00:00	\N	1	2	1	409038	80	D	80
1636	1258	129	59	1	2	0	0	0	\N	\N	23	2020-03-03 00:00:00	\N	2	5	1	82990	80	D	80
1639	1261	87	61	1	2	0	0	0	\N	\N	23	2020-03-03 00:00:00	\N	2	2	1	409098	80	D	80
1323	1029	84	46	1	2	0	0	0	\N	\N	23	2020-01-22 00:00:00	\N	1	2	1	408600	74	D	74
1340	1046	88	32	1	2	0	0	0	\N	\N	19	2020-01-22 00:00:00	\N	2	2	1	405433	74	D	74
1254	982	69	43	1	2	0	0	0	\N	\N	23	2020-01-07 00:00:00	\N	1	1	1	407654	71	D	71
1011	792	84	46	1	2	0	0	0	\N	\N	19	2019-12-09 00:00:00	\N	1	2	1	407783	67	D	67
1216	956	69	48	1	2	0	0	0	\N	\N	19	2019-12-17 00:00:00	\N	1	1	1	408502	68	D	68
1265	989	69	48	1	2	0	0	0	\N	\N	23	2020-01-13 00:00:00	\N	1	1	1	408517	72	D	72
932	730	69	46	1	2	0	0	0	\N	\N	19	2019-12-03 00:00:00	\N	1	1	1	407549	66	D	66
964	754	69	52	1	2	0	0	0	\N	\N	19	2019-12-04 00:00:00	\N	1	1	1	406600	66	D	66
1150	914	69	39	1	2	0	0	0	\N	\N	19	2019-12-16 00:00:00	\N	1	1	1	406799	68	D	68
643	480	69	46	1	2	0	0	0	\N	\N	1	2019-11-13 00:00:00	\N	1	1	1	406943	63	D	63
705	535	69	51	1	2	0	0	0	\N	\N	19	2019-11-19 00:00:00	\N	1	1	1	407688	64	D	64
737	565	69	58	1	2	0	0	0	\N	\N	19	2019-11-20 00:00:00	\N	1	1	1	407895	64	D	64
897	702	73	41	1	2	0	0	0	\N	\N	23	2019-11-29 00:00:00	\N	2	1	1	407989	66	D	66
1052	832	69	58	1	2	0	0	0	\N	\N	19	2019-12-10 00:00:00	\N	1	1	1	407899	67	D	67
1179	940	84	52	1	2	0	0	0	\N	\N	19	2019-12-17 00:00:00	\N	1	2	1	408171	68	D	68
1205	957	69	48	1	2	0	0	0	\N	\N	19	2019-12-17 00:00:00	\N	1	1	1	407917	68	D	68
369	245	84	46	1	2	0	0	0	\N	\N	1	2019-12-11 00:00:00	\N	1	2	1	406677	61	D	61
954	748	69	31	1	2	0	0	0	\N	\N	19	2019-12-03 00:00:00	\N	1	1	1	406849	66	D	66
255	159	\N	48	1	2	\N	\N	\N	\N	\N	1	2019-12-11 00:00:00	\N	1	5	1	81408	60	D	60
261	165	\N	33	1	2	\N	\N	\N	\N	\N	1	2019-12-11 00:00:00	\N	1	5	1	80859	60	D	60
358	237	89	41	1	2	0	0	0	\N	\N	19	2019-12-11 00:00:00	\N	2	2	1	406695	61	D	61
370	246	69	46	1	2	0	0	0	\N	\N	1	2019-12-11 00:00:00	\N	1	1	1	406681	61	D	61
1308	1017	79	48	1	2	0	0	0	\N	\N	23	2020-01-22 00:00:00	\N	3	1	1	408520	74	D	74
288	187	69	46	1	2	\N	\N	\N	\N	\N	1	2019-12-11 00:00:00	\N	1	1	1	406663	60	D	60
1231	976	84	34	1	2	0	0	0	\N	\N	23	2019-12-17 00:00:00	\N	1	2	1	408175	68	D	68
1309	1018	94	48	1	2	0	0	0	\N	\N	23	2020-01-22 00:00:00	\N	3	2	1	408519	74	D	74
949	743	69	32	1	2	0	0	0	\N	\N	19	2019-12-03 00:00:00	\N	1	1	1	407584	66	D	66
979	767	84	35	1	2	0	0	0	\N	\N	23	2019-12-09 00:00:00	\N	1	2	1	405413	67	D	67
1257	983	69	37	1	2	0	0	0	\N	\N	23	2020-01-08 00:00:00	\N	1	1	1	405504	71	D	71
980	768	69	51	1	2	0	0	0	\N	\N	23	2019-12-09 00:00:00	\N	1	1	1	407804	67	D	67
701	533	69	48	1	2	0	0	0	\N	\N	19	2019-11-19 00:00:00	\N	1	1	1	402214	64	D	64
239	155	84	46	1	2	\N	\N	\N	\N	\N	1	2019-12-11 00:00:00	\N	1	2	1	406644	60	D	60
243	157	\N	48	1	2	\N	\N	\N	\N	\N	1	2019-12-11 00:00:00	\N	1	5	1	76273	60	D	60
246	158	\N	48	1	2	\N	\N	\N	\N	\N	1	2019-12-11 00:00:00	\N	1	5	1	76269	60	D	60
1057	837	84	58	1	2	0	0	0	\N	\N	19	2019-12-10 00:00:00	\N	1	2	1	408113	67	D	67
710	539	82	51	1	2	0	0	0	\N	\N	19	2019-11-19 00:00:00	\N	1	2	1	407686	64	D	64
1293	1007	84	56	1	2	0	0	0	\N	\N	23	2020-01-21 00:00:00	\N	1	2	1	407559	74	D	74
679	511	68	41	1	2	0	0	0	\N	\N	19	2019-11-18 00:00:00	\N	1	1	1	407729	64	D	64
810	635	69	45	1	2	0	0	0	\N	\N	19	2019-11-26 00:00:00	\N	1	1	1	406874	65	D	65
811	635	131	45	1	2	0	0	0	\N	\N	19	2019-11-26 00:00:00	\N	2	5	1	84132	65	D	65
466	328	69	48	1	2	0	0	0	\N	\N	19	2019-12-11 00:00:00	\N	1	1	1	406532	62	D	62
470	331	69	48	1	2	0	0	0	\N	\N	19	2019-12-11 00:00:00	\N	1	1	1	405954	62	D	62
471	332	94	48	1	2	0	0	0	\N	\N	19	2019-12-11 00:00:00	\N	3	2	1	404896	62	D	62
473	334	79	48	1	2	0	0	0	\N	\N	19	2019-12-11 00:00:00	\N	3	1	1	406530	62	D	62
479	338	94	48	1	2	0	0	0	\N	\N	19	2019-12-11 00:00:00	\N	3	2	1	404892	62	D	62
482	340	84	48	1	2	0	0	0	\N	\N	19	2019-12-11 00:00:00	\N	1	2	1	407602	62	D	62
483	340	131	48	1	2	0	0	0	\N	\N	19	2019-12-11 00:00:00	\N	2	5	1	80855	62	D	62
690	522	69	53	1	2	0	0	0	\N	\N	19	2019-11-19 00:00:00	\N	1	1	1	406885	64	D	64
203	120	\N	46	1	2	\N	\N	\N	\N	\N	1	2019-12-11 00:00:00	\N	1	5	1	84143	60	D	60
216	132	69	46	1	2	\N	\N	\N	\N	\N	1	2019-12-11 00:00:00	\N	1	1	1	405919	60	D	60
217	133	89	46	1	2	\N	\N	\N	\N	\N	1	2019-12-11 00:00:00	\N	2	2	1	406846	60	D	60
1041	821	69	52	1	2	0	0	0	\N	\N	19	2019-12-10 00:00:00	\N	1	1	1	406599	67	D	67
1296	1009	69	52	1	2	0	0	0	\N	\N	23	2020-01-21 00:00:00	\N	1	1	1	406598	74	D	74
799	624	84	46	1	2	0	0	0	\N	\N	19	2019-11-25 00:00:00	\N	1	2	1	407523	65	D	65
408	276	74	50	1	2	0	0	0	\N	\N	19	2019-12-11 00:00:00	\N	2	1	1	405376	61	D	61
422	288	69	53	1	2	0	0	0	\N	\N	1	2019-12-11 00:00:00	\N	1	1	1	405526	62	D	62
431	293	84	46	1	2	0	0	0	\N	\N	1	2019-12-11 00:00:00	\N	1	2	1	406934	62	D	62
446	308	89	41	1	2	0	0	0	\N	\N	19	2019-12-11 00:00:00	\N	2	2	1	407655	62	D	62
500	355	69	52	1	2	0	0	0	\N	\N	19	2019-12-11 00:00:00	\N	1	1	1	406585	62	D	62
1258	983	129	37	1	2	0	0	0	\N	\N	23	2020-01-08 00:00:00	\N	2	5	1	84004	71	D	71
521	374	69	51	1	2	0	0	0	\N	\N	19	2019-12-11 00:00:00	\N	1	1	1	406623	62	D	62
539	388	89	54	1	2	0	0	0	\N	\N	19	2019-12-11 00:00:00	\N	2	2	1	405766	62	D	62
548	397	84	40	1	2	0	0	0	\N	\N	19	2019-12-11 00:00:00	\N	1	2	1	405663	62	D	62
551	399	84	55	1	2	0	0	0	\N	\N	19	2019-12-11 00:00:00	\N	1	2	1	407060	62	D	62
552	399	131	55	1	2	0	0	0	\N	\N	19	2019-12-11 00:00:00	\N	2	5	1	83814	62	D	62
557	404	\N	41	1	2	0	0	0	\N	\N	19	2019-12-11 00:00:00	\N	\N	\N	2	406692	62	D	62
1156	920	83	50	1	2	0	0	0	\N	\N	19	2019-12-16 00:00:00	\N	1	2	1	406985	68	D	68
579	424	69	53	1	2	0	0	0	\N	\N	19	2019-12-11 00:00:00	\N	1	1	1	406898	63	D	63
581	425	131	53	1	2	0	0	0	\N	\N	19	2019-12-11 00:00:00	\N	2	5	1	82775	63	D	63
588	431	84	48	1	2	0	0	0	\N	\N	19	2019-12-11 00:00:00	\N	1	2	1	407605	63	D	63
1128	895	84	46	1	2	0	0	0	\N	\N	19	2019-12-16 00:00:00	\N	1	2	1	407863	68	D	68
606	447	69	43	1	2	0	0	0	\N	\N	19	2019-12-11 00:00:00	\N	1	1	1	405532	63	D	63
1197	953	84	48	1	2	0	0	0	\N	\N	19	2019-12-17 00:00:00	\N	1	2	1	408506	68	D	68
611	452	131	37	1	2	0	0	0	\N	\N	19	2019-12-11 00:00:00	\N	2	5	1	84379	63	D	63
807	632	84	46	1	2	0	0	0	\N	\N	19	2019-11-26 00:00:00	\N	1	2	1	407520	65	D	65
1129	896	84	46	1	2	0	0	0	\N	\N	19	2019-12-16 00:00:00	\N	1	2	1	407865	68	D	68
1349	1053	83	39	1	2	0	0	0	\N	\N	23	2020-01-28 00:00:00	\N	1	2	1	408801	75	D	75
1355	1059	73	39	1	2	0	0	0	\N	\N	23	2020-01-28 00:00:00	\N	2	1	1	406860	75	D	75
1360	1063	79	39	1	2	0	0	0	\N	\N	23	2020-01-28 00:00:00	\N	3	1	1	406802	75	D	75
1367	1068	72	60	1	2	0	0	0	\N	\N	23	2020-01-28 00:00:00	\N	2	1	1	408628	75	D	75
1380	1068	131	60	1	2	0	0	0	\N	\N	23	2020-01-28 00:00:00	\N	2	5	1	85669	75	D	75
1396	1088	69	48	1	2	0	0	0	\N	\N	23	2020-02-03 00:00:00	\N	1	1	1	407914	76	D	76
1403	1090	69	48	1	2	0	0	0	\N	\N	23	2020-02-03 00:00:00	\N	1	1	1	407915	76	D	76
1385	1078	82	61	1	2	0	0	0	\N	\N	23	2020-02-03 00:00:00	\N	1	2	1	408997	76	D	76
1387	1080	84	52	1	2	0	0	0	\N	\N	19	2020-02-03 00:00:00	\N	1	2	1	408829	76	D	76
1392	1085	84	48	1	2	0	0	0	\N	\N	0	2020-02-03 00:00:00	\N	1	2	1	408443	76	D	76
1410	1095	89	41	1	2	0	0	0	\N	\N	19	2020-02-03 00:00:00	\N	2	2	1	408278	76	D	76
1444	1126	69	37	1	2	0	0	0	\N	\N	19	2020-02-03 00:00:00	\N	1	1	1	407979	76	D	76
1445	1127	70	59	1	2	0	0	0	\N	\N	19	2020-02-03 00:00:00	\N	1	1	1	408640	76	D	76
1446	1127	131	59	1	2	0	0	0	\N	\N	19	2020-02-03 00:00:00	\N	2	5	1	85683	76	D	76
1476	1147	87	61	1	2	0	0	0	\N	\N	19	2020-02-11 00:00:00	\N	2	2	1	408999	77	D	77
1477	1148	87	61	1	2	0	0	0	\N	\N	19	2020-02-11 00:00:00	\N	2	2	1	408998	77	D	77
1482	1151	69	43	1	2	0	0	0	\N	\N	19	2020-02-11 00:00:00	\N	1	1	1	409050	77	D	77
1484	1053	83	38	1	2	0	0	0	\N	\N	19	2020-02-11 00:00:00	\N	1	2	1	409141	77	D	77
1485	1153	73	38	1	2	0	0	0	\N	\N	19	2020-02-11 00:00:00	\N	2	1	1	408727	77	D	77
1486	1154	84	64	1	2	0	0	0	\N	\N	19	2020-02-11 00:00:00	\N	1	2	1	408622	77	D	77
1487	1155	69	37	1	2	0	0	0	\N	\N	19	2020-02-11 00:00:00	\N	1	1	1	409001	77	D	77
1488	1155	129	37	1	2	0	0	0	\N	\N	19	2020-02-11 00:00:00	\N	2	5	1	85901	77	D	77
1489	1156	90	37	1	2	0	0	0	\N	\N	19	2020-02-11 00:00:00	\N	2	2	1	409002	77	D	77
1490	1157	84	37	1	2	0	0	0	\N	\N	19	2020-02-11 00:00:00	\N	1	2	1	409003	77	D	77
1464	1139	69	43	1	2	0	0	0	\N	\N	19	2020-02-11 00:00:00	\N	1	1	1	409048	77	D	77
1467	1142	89	48	1	2	0	0	0	\N	\N	19	2020-02-11 00:00:00	\N	2	2	1	408441	77	D	77
1468	1142	129	48	1	2	0	0	0	\N	\N	19	2020-02-11 00:00:00	\N	2	5	1	82703	77	D	77
1471	1144	87	61	1	2	0	0	0	\N	\N	19	2020-02-11 00:00:00	\N	2	2	1	409085	77	D	77
1472	1144	131	61	1	2	0	0	0	\N	\N	19	2020-02-11 00:00:00	\N	2	5	1	85967	77	D	77
1473	1145	77	61	1	2	0	0	0	\N	\N	19	2020-02-11 00:00:00	\N	3	1	1	409083	77	D	77
1474	1146	72	61	1	2	0	0	0	\N	\N	19	2020-02-11 00:00:00	\N	2	1	1	409082	77	D	77
1475	1146	131	61	1	2	0	0	0	\N	\N	19	2020-02-11 00:00:00	\N	2	5	1	85966	77	D	77
1493	1159	84	34	1	2	0	0	0	\N	\N	19	2020-02-11 00:00:00	\N	1	2	1	408871	77	D	77
1494	1159	131	34	1	2	0	0	0	\N	\N	19	2020-02-11 00:00:00	\N	2	5	1	85626	77	D	77
1495	1160	69	52	1	2	0	0	0	\N	\N	19	2020-02-11 00:00:00	\N	1	1	1	408064	77	D	77
1496	1161	69	52	1	2	0	0	0	\N	\N	19	2020-02-11 00:00:00	\N	1	1	1	409121	77	D	77
1501	1165	74	50	1	2	0	0	0	\N	\N	19	2020-02-11 00:00:00	\N	2	1	1	408142	77	D	77
1502	1166	74	50	1	2	0	0	0	\N	\N	19	2020-02-11 00:00:00	\N	2	1	1	408141	77	D	77
1505	1168	73	31	1	2	0	0	0	\N	\N	19	2020-02-11 00:00:00	\N	2	1	1	409161	77	D	77
1506	1169	82	48	1	2	0	0	0	\N	\N	19	2020-02-12 00:00:00	\N	1	2	1	409262	77	D	77
1534	1188	68	61	1	2	0	0	0	\N	\N	23	2020-02-18 00:00:00	\N	1	1	1	409088	78	D	78
1535	1189	69	34	1	2	0	0	0	\N	\N	19	2020-02-18 00:00:00	\N	1	1	1	409241	78	D	78
1536	1189	131	34	1	2	0	0	0	\N	\N	19	2020-02-18 00:00:00	\N	2	5	1	85986	78	D	78
1512	1171	69	38	1	2	0	0	0	\N	\N	23	2020-02-17 00:00:00	\N	1	1	1	408128	78	D	78
1514	1173	69	52	1	2	0	0	0	\N	\N	19	2020-02-17 00:00:00	\N	1	1	1	408827	78	D	78
1516	1175	69	52	1	2	0	0	0	\N	\N	19	2020-02-17 00:00:00	\N	1	1	1	409134	78	D	78
1517	1176	69	34	1	2	0	0	0	\N	\N	19	2020-02-17 00:00:00	\N	1	1	1	408869	78	D	78
1518	1176	129	34	1	2	0	0	0	\N	\N	19	2020-02-17 00:00:00	\N	2	5	1	85624	78	D	78
1522	1179	69	37	1	2	0	0	0	\N	\N	23	2020-02-18 00:00:00	\N	1	1	1	409013	78	D	78
1524	1181	79	43	1	2	0	0	0	\N	\N	23	2020-02-18 00:00:00	\N	3	1	1	409053	78	D	78
1526	1182	84	59	1	2	0	0	0	\N	\N	23	2020-02-18 00:00:00	\N	1	2	1	409023	78	D	78
1527	1182	129	59	1	2	0	0	0	\N	\N	23	2020-02-18 00:00:00	\N	2	5	1	85948	78	D	78
1529	1184	69	37	1	2	0	0	0	\N	\N	23	2020-02-18 00:00:00	\N	1	1	1	409012	78	D	78
1530	1185	74	61	1	2	0	0	0	\N	\N	23	2020-02-18 00:00:00	\N	2	1	1	409086	78	D	78
1532	1187	68	61	1	2	0	0	0	\N	\N	23	2020-02-18 00:00:00	\N	1	1	1	409087	78	D	78
1539	1060	74	38	1	2	0	0	0	\N	\N	23	2020-02-18 00:00:00	\N	2	1	1	409142	78	D	78
1540	1180	69	43	1	2	0	0	0	\N	\N	23	2020-02-18 00:00:00	\N	1	1	1	409055	78	D	78
1545	1183	69	37	1	2	0	0	0	\N	\N	19	2020-02-19 00:00:00	\N	1	1	1	409011	78	D	78
1546	1195	84	48	1	2	0	0	0	\N	\N	0	2020-02-26 00:00:00	\N	1	2	1	409264	79	D	79
1547	1196	69	61	1	2	0	0	0	\N	\N	19	2020-02-26 00:00:00	\N	1	1	1	409092	79	D	79
1548	1195	129	48	1	2	0	0	0	\N	\N	23	2020-02-26 00:00:00	\N	2	5	1	85992	79	D	79
1549	1197	69	48	1	2	0	0	0	\N	\N	23	2020-02-26 00:00:00	\N	1	1	1	409274	79	D	79
1550	1197	129	48	1	2	0	0	0	\N	\N	23	2020-02-26 00:00:00	\N	2	5	1	82418	79	D	79
1551	1198	84	48	1	2	0	0	0	\N	\N	23	2020-02-26 00:00:00	\N	1	2	1	409263	79	D	79
1553	1198	131	48	1	2	0	0	0	\N	\N	23	2020-02-26 00:00:00	\N	2	5	1	85991	79	D	79
1561	1204	69	59	1	2	0	0	0	\N	\N	19	2020-02-26 00:00:00	\N	1	1	1	409031	79	D	79
1564	1204	129	59	1	2	0	0	0	\N	\N	19	2020-02-26 00:00:00	\N	2	5	1	85956	79	D	79
1573	1214	69	52	1	2	0	0	0	\N	\N	23	2020-02-26 00:00:00	\N	1	1	1	409124	79	D	79
1574	1215	69	52	1	2	0	0	0	\N	\N	23	2020-02-26 00:00:00	\N	1	1	1	409126	79	D	79
1575	1216	69	52	1	2	0	0	0	\N	\N	23	2020-02-26 00:00:00	\N	1	1	1	409136	79	D	79
1577	1218	69	52	1	2	0	0	0	\N	\N	23	2020-02-26 00:00:00	\N	1	1	1	409137	79	D	79
1579	1219	69	52	1	2	0	0	0	\N	\N	23	2020-02-26 00:00:00	\N	1	1	1	409138	79	D	79
1582	1221	69	52	1	2	0	0	0	\N	\N	23	2020-02-26 00:00:00	\N	1	1	1	409423	79	D	79
1583	1222	69	52	1	2	0	0	0	\N	\N	23	2020-02-26 00:00:00	\N	1	1	1	409434	79	D	79
1591	1227	69	59	1	2	0	0	0	\N	\N	23	2020-02-26 00:00:00	\N	1	1	1	409029	79	D	79
1595	1230	70	59	1	2	0	0	0	\N	\N	23	2020-02-26 00:00:00	\N	1	1	1	409036	79	D	79
1596	1231	70	59	1	2	0	0	0	\N	\N	19	2020-02-26 00:00:00	\N	1	1	1	409026	79	D	79
1597	1232	129	59	1	2	0	0	0	\N	\N	23	2020-02-26 00:00:00	\N	2	5	1	82437	79	D	79
1598	1231	129	59	1	2	0	0	0	\N	\N	19	2020-02-26 00:00:00	\N	2	5	1	85951	79	D	79
1599	1230	129	59	1	2	0	0	0	\N	\N	23	2020-02-26 00:00:00	\N	2	5	1	85960	79	D	79
1600	1233	70	59	1	2	0	0	0	\N	\N	19	2020-02-26 00:00:00	\N	1	1	1	409035	79	D	79
1601	1233	129	59	1	2	0	0	0	\N	\N	19	2020-02-26 00:00:00	\N	2	5	1	85959	79	D	79
1602	1234	84	59	1	2	0	0	0	\N	\N	23	2020-02-26 00:00:00	\N	1	2	1	409028	79	D	79
1603	1234	129	59	1	2	0	0	0	\N	\N	23	2020-02-26 00:00:00	\N	2	5	1	85953	79	D	79
1604	1235	69	61	1	2	0	0	0	\N	\N	19	2020-02-27 00:00:00	\N	1	1	1	409094	79	D	79
1606	1227	129	59	1	2	0	0	0	\N	\N	19	2020-02-27 00:00:00	\N	2	5	1	85954	79	D	79
1416	1099	74	41	1	2	0	0	0	\N	\N	19	2020-02-03 00:00:00	\N	2	1	1	408277	76	X	76
1559	1202	84	59	1	2	0	0	0	\N	\N	19	2020-02-26 00:00:00	\N	1	2	1	409027	79	X	79
1284	1000	69	51	0	2	0	0	0	\N	\N	23	2020-01-14 00:00:00	\N	1	1	1	408161	72	X	80
1402	1088	131	48	0	2	0	0	0	\N	\N	23	2020-02-03 00:00:00	\N	2	5	1	82690	76	X	80
1405	1091	129	48	0	2	0	0	0	\N	\N	23	2020-02-03 00:00:00	\N	2	5	1	80865	76	X	80
1407	1092	130	48	0	2	0	0	0	\N	\N	23	2020-02-03 00:00:00	\N	2	5	1	81105	76	X	80
1414	1098	129	48	0	2	0	0	0	\N	\N	23	2020-02-03 00:00:00	\N	2	5	1	81106	76	X	80
1413	1098	85	48	0	2	0	0	0	\N	\N	23	2020-02-03 00:00:00	\N	1	2	1	408446	76	X	80
1412	1097	67	48	0	2	0	0	0	\N	\N	23	2020-02-03 00:00:00	\N	1	1	1	408525	76	X	80
1406	1092	84	48	0	2	0	0	0	\N	\N	23	2020-02-03 00:00:00	\N	1	2	1	408445	76	X	80
1404	1091	84	48	0	2	0	0	0	\N	\N	23	2020-02-03 00:00:00	\N	1	2	1	408438	76	X	80
1394	1086	84	48	0	2	0	0	0	\N	\N	23	2020-02-03 00:00:00	\N	1	2	1	408437	76	X	80
1432	1115	74	39	0	2	0	0	0	\N	\N	19	2020-02-03 00:00:00	\N	2	1	1	408730	76	X	80
1434	1117	87	39	0	2	0	0	0	\N	\N	19	2020-02-03 00:00:00	\N	2	2	1	408729	76	X	80
1388	1081	69	52	0	2	0	0	0	\N	\N	19	2020-02-03 00:00:00	\N	1	1	1	408062	76	X	80
1390	1083	69	52	0	2	0	0	0	\N	\N	19	2020-02-03 00:00:00	\N	1	1	1	408063	76	X	80
1391	1084	69	52	0	2	0	0	0	\N	\N	19	2020-02-03 00:00:00	\N	1	1	1	408265	76	X	80
1408	1093	91	41	0	2	0	0	0	\N	\N	19	2020-02-03 00:00:00	\N	2	2	1	408279	76	X	80
1409	1094	89	41	0	2	0	0	0	\N	\N	19	2020-02-03 00:00:00	\N	2	2	1	408266	76	X	80
1411	1096	75	41	0	2	0	0	0	\N	\N	19	2020-02-03 00:00:00	\N	2	1	1	408280	76	X	80
1457	1133	69	38	0	2	0	0	0	\N	\N	23	2020-02-04 00:00:00	\N	1	1	1	408955	76	X	80
1479	1149	129	59	0	2	0	0	0	\N	\N	19	2020-02-11 00:00:00	\N	2	5	1	85941	77	X	80
1480	1150	70	59	0	2	0	0	0	\N	\N	19	2020-02-11 00:00:00	\N	1	1	1	409022	77	X	80
1481	1150	129	59	0	2	0	0	0	\N	\N	19	2020-02-11 00:00:00	\N	2	5	1	85943	77	X	80
1470	1143	129	48	0	2	0	0	0	\N	\N	19	2020-02-11 00:00:00	\N	2	5	1	80871	77	X	80
1469	1143	85	48	0	2	0	0	0	\N	\N	19	2020-02-11 00:00:00	\N	1	2	1	408439	77	X	80
1607	1236	\N	59	0	1	\N	\N	0	\N	\N	23	\N	\N	\N	\N	3	0	80	X	80
1611	1238	84	31	0	3	2350	489333.330000000016	1	\N	\N	19	2020-03-02 00:00:00	\N	1	2	1	409165	80	X	80
1613	1240	69	31	0	3	5967	171733.329999999987	1	\N	\N	19	2020-03-02 00:00:00	\N	1	1	1	409167	80	X	80
1615	1242	84	31	0	3	2764221724	490000	1	\N	\N	19	2020-03-02 00:00:00	\N	1	2	1	409169	80	X	80
1624	1248	69	32	0	3	3198	171733.329999999987	1	\N	\N	19	2020-03-02 00:00:00	\N	1	1	1	409303	80	X	80
1625	1249	69	32	0	3	5006	299399.989999999991	1	\N	\N	19	2020-03-02 00:00:00	\N	1	1	1	409305	80	X	80
1626	1250	69	32	0	3	1857	171733.329999999987	1	\N	\N	19	2020-03-02 00:00:00	\N	1	1	1	409306	80	X	80
1627	1251	69	32	0	3	1544	214400	1	\N	\N	19	2020-03-02 00:00:00	\N	1	1	1	409307	80	X	80
1631	1255	69	32	0	3	5312	214400	1	\N	\N	19	2020-03-02 00:00:00	\N	1	1	1	409310	80	X	80
1645	1264	84	52	0	4	1973	488343.320000000007	1	\N	\N	19	2020-03-03 00:00:00	\N	1	2	1	409469	80	X	80
1646	1265	69	52	0	3	3100	213999	1	\N	\N	19	2020-03-03 00:00:00	\N	1	1	1	409471	80	X	80
1647	1266	\N	37	0	1	\N	\N	0	\N	\N	23	\N	\N	\N	\N	3	0	80	X	80
1649	1268	\N	38	0	1	\N	\N	0	\N	\N	23	\N	\N	\N	\N	3	0	80	X	80
1650	1269	77	51	0	3	2728	53666.6699999999983	1	\N	\N	19	2020-03-03 00:00:00	\N	3	1	1	409115	80	X	80
1651	1270	92	51	0	3	2728	152916.670000000013	1	\N	\N	19	2020-03-03 00:00:00	\N	3	2	1	409415	80	X	80
1652	1271	77	51	0	3	2728	53666.6699999999983	1	\N	\N	19	2020-03-03 00:00:00	\N	3	1	1	409109	80	X	80
1653	1272	77	51	0	3	2728	53666.6699999999983	1	\N	\N	19	2020-03-03 00:00:00	\N	3	1	1	409114	80	X	80
1654	1273	77	51	0	3	2728	561333.329999999958	1	\N	\N	19	2020-03-03 00:00:00	\N	3	1	1	409416	80	X	80
1655	1274	77	51	0	3	2728	561333.329999999958	1	\N	\N	19	2020-03-03 00:00:00	\N	3	1	1	409413	80	X	80
1656	1275	77	51	0	3	2728	53666.6699999999983	1	\N	\N	19	2020-03-03 00:00:00	\N	3	1	1	409411	80	X	80
1657	1276	77	51	0	3	2728	53666.6699999999983	1	\N	\N	19	2020-03-03 00:00:00	\N	3	1	1	409417	80	X	80
1658	1277	77	51	0	3	2728	53666.6699999999983	1	\N	\N	19	2020-03-03 00:00:00	\N	3	1	1	409410	80	X	80
1659	1278	77	51	0	3	2728	53666.6699999999983	1	\N	\N	19	2020-03-03 00:00:00	\N	3	1	1	409414	80	X	80
1660	1279	77	51	0	3	2728	53666.6699999999983	1	\N	\N	19	2020-03-03 00:00:00	\N	3	1	1	409110	80	X	80
1393	1085	129	48	0	2	0	0	0	\N	\N	23	2020-02-03 00:00:00	\N	2	5	1	80872	76	X	80
1662	1280	69	37	0	3	2770671260	548400.010000000009	1	\N	\N	19	2020-03-03 00:00:00	\N	1	1	1	409010	80	X	80
1389	1082	69	52	0	2	0	0	0	\N	\N	19	2020-02-03 00:00:00	\N	1	1	1	408061	76	X	80
1478	1149	68	59	0	2	0	0	0	\N	\N	19	2020-02-11 00:00:00	\N	1	1	1	409021	77	X	80
1463	1138	69	38	0	2	0	0	0	\N	\N	19	2020-02-05 00:00:00	\N	1	1	1	408958	76	X	80
948	742	69	32	1	2	0	0	0	\N	\N	19	2019-12-03 00:00:00	\N	1	1	1	406915	66	X	80
1161	925	69	32	1	2	0	0	0	\N	\N	19	2019-12-16 00:00:00	\N	1	1	1	405429	68	X	80
1301	1013	89	54	1	2	0	0	0	\N	\N	23	2020-01-22 00:00:00	\N	2	2	1	405776	74	L	80
\.


--
-- Name: menu_rol_id_mrol_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.menu_rol_id_mrol_seq', 438, true);


--
-- Name: t_adicionales_id_adicional_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.t_adicionales_id_adicional_seq', 1224, true);


--
-- Name: t_calculo_id_calculo_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.t_calculo_id_calculo_seq', 2, true);


--
-- Name: t_ccoordinador_id_ccoordinador_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.t_ccoordinador_id_ccoordinador_seq', 1, true);


--
-- Name: t_comisiones_id_comision_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.t_comisiones_id_comision_seq', 27, true);


--
-- Name: t_concepto_id_concepto_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.t_concepto_id_concepto_seq', 3, true);


--
-- Name: t_email_id_email_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.t_email_id_email_seq', 9, true);


--
-- Name: t_extornos_id_extorno_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.t_extornos_id_extorno_seq', 32, true);


--
-- Name: t_factor_edad_id_fedad_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.t_factor_edad_id_fedad_seq', 106, true);


--
-- Name: t_liquidacion_id_liquidacion_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.t_liquidacion_id_liquidacion_seq', 1323, true);


--
-- Name: t_menu_id_menu_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.t_menu_id_menu_seq', 26, true);


--
-- Name: t_motivos_id_motivo_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.t_motivos_id_motivo_seq', 2, true);


--
-- Name: t_parentesco_id_parentesco_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.t_parentesco_id_parentesco_seq', 11, true);


--
-- Name: t_personas_id_persona_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.t_personas_id_persona_seq', 33, true);


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

SELECT pg_catalog.setval('public.t_polizas_id_poliza_seq', 131, true);


--
-- Name: t_roles_id_rol_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.t_roles_id_rol_seq', 13, true);


--
-- Name: t_semanas_id_semana_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.t_semanas_id_semana_seq', 80, true);


--
-- Name: t_tomadores_id_tomador_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.t_tomadores_id_tomador_seq', 1280, true);


--
-- Name: t_tpago_id_tpago_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.t_tpago_id_tpago_seq', 11, true);


--
-- Name: t_tpoliza_id_tpoliza_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.t_tpoliza_id_tpoliza_seq', 14, true);


--
-- Name: t_usuarios_id_user_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.t_usuarios_id_user_seq', 28, true);


--
-- Name: t_vendedores_id_vendedor_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.t_vendedores_id_vendedor_seq', 65, true);


--
-- Name: t_ventas_id_venta_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.t_ventas_id_venta_seq', 1662, true);


--
-- Name: t_email email_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.t_email
    ADD CONSTRAINT email_pk PRIMARY KEY (id_email);


--
-- Name: t_adicionales pk_adicionales; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.t_adicionales
    ADD CONSTRAINT pk_adicionales PRIMARY KEY (id_adicional);


--
-- Name: t_ccoordinador pk_ccoordinador; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.t_ccoordinador
    ADD CONSTRAINT pk_ccoordinador PRIMARY KEY (id_ccoordinador);


--
-- Name: t_extornos pk_extorno; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.t_extornos
    ADD CONSTRAINT pk_extorno PRIMARY KEY (id_extorno);


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
-- Name: t_motivos pk_motivo; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.t_motivos
    ADD CONSTRAINT pk_motivo PRIMARY KEY (id_motivo);


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
-- Name: t_liquidacion pk_t_liquidacion; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.t_liquidacion
    ADD CONSTRAINT pk_t_liquidacion PRIMARY KEY (id_liquidacion);


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

