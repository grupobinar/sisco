PGDMP     !                	    w            sisco2    9.4.24    9.4.24 �    �           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                       false            �           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                       false            �           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                       false            �           1262    141856    sisco2    DATABASE     x   CREATE DATABASE sisco2 WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'es_DO.UTF-8' LC_CTYPE = 'es_DO.UTF-8';
    DROP DATABASE sisco2;
             postgres    false                        2615    2200    public    SCHEMA        CREATE SCHEMA public;
    DROP SCHEMA public;
             postgres    false            �           0    0    SCHEMA public    COMMENT     6   COMMENT ON SCHEMA public IS 'standard public schema';
                  postgres    false    6            �           0    0    SCHEMA public    ACL     �   REVOKE ALL ON SCHEMA public FROM PUBLIC;
REVOKE ALL ON SCHEMA public FROM postgres;
GRANT ALL ON SCHEMA public TO postgres;
GRANT ALL ON SCHEMA public TO PUBLIC;
                  postgres    false    6                        3079    11861    plpgsql 	   EXTENSION     ?   CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;
    DROP EXTENSION plpgsql;
                  false            �           0    0    EXTENSION plpgsql    COMMENT     @   COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';
                       false    1            �            1259    141857    menu_rol    TABLE     g   CREATE TABLE public.menu_rol (
    id_mrol bigint NOT NULL,
    id_rol integer,
    id_menu integer
);
    DROP TABLE public.menu_rol;
       public         postgres    false    6            �            1259    141860    menu_rol_id_mrol_seq    SEQUENCE     }   CREATE SEQUENCE public.menu_rol_id_mrol_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 +   DROP SEQUENCE public.menu_rol_id_mrol_seq;
       public       postgres    false    6    173            �           0    0    menu_rol_id_mrol_seq    SEQUENCE OWNED BY     M   ALTER SEQUENCE public.menu_rol_id_mrol_seq OWNED BY public.menu_rol.id_mrol;
            public       postgres    false    174            �            1259    141862    t_plan    TABLE     �   CREATE TABLE public.t_plan (
    id_tplan bigint NOT NULL,
    tplan character varying(20),
    id_usuario integer,
    fecha_registro date,
    ult_mod date
);
    DROP TABLE public.t_plan;
       public         postgres    false    6            �            1259    141865 	   t_polizas    TABLE     7  CREATE TABLE public.t_polizas (
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
    DROP TABLE public.t_polizas;
       public         postgres    false    6            �            1259    141869 	   t_tpoliza    TABLE     �   CREATE TABLE public.t_tpoliza (
    id_tpoliza bigint NOT NULL,
    tpoliza character varying(20),
    id_usuario integer,
    fecha_registro date,
    ult_mod date,
    factor double precision,
    estatus integer DEFAULT 0
);
    DROP TABLE public.t_tpoliza;
       public         postgres    false    6            �            1259    141873    polizas_plan_coberturas    VIEW       CREATE VIEW public.polizas_plan_coberturas AS
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
 *   DROP VIEW public.polizas_plan_coberturas;
       public       postgres    false    176    176    176    176    176    176    177    177    177    175    175    176    6            �            1259    141878    t_adicionales    TABLE     �  CREATE TABLE public.t_adicionales (
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
 !   DROP TABLE public.t_adicionales;
       public         postgres    false    6            �            1259    141881    t_adicionales_id_adicional_seq    SEQUENCE     �   CREATE SEQUENCE public.t_adicionales_id_adicional_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 5   DROP SEQUENCE public.t_adicionales_id_adicional_seq;
       public       postgres    false    6    179            �           0    0    t_adicionales_id_adicional_seq    SEQUENCE OWNED BY     a   ALTER SEQUENCE public.t_adicionales_id_adicional_seq OWNED BY public.t_adicionales.id_adicional;
            public       postgres    false    180            �            1259    141883 	   t_calculo    TABLE     �   CREATE TABLE public.t_calculo (
    id_calculo bigint NOT NULL,
    calculo character varying(100),
    id_usuario integer,
    fecha_registro date,
    ult_mod date
);
    DROP TABLE public.t_calculo;
       public         postgres    false    6            �            1259    141886    t_calculo_id_calculo_seq    SEQUENCE     �   CREATE SEQUENCE public.t_calculo_id_calculo_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 /   DROP SEQUENCE public.t_calculo_id_calculo_seq;
       public       postgres    false    6    181            �           0    0    t_calculo_id_calculo_seq    SEQUENCE OWNED BY     U   ALTER SEQUENCE public.t_calculo_id_calculo_seq OWNED BY public.t_calculo.id_calculo;
            public       postgres    false    182            �            1259    141888    t_ccoordinador    TABLE     m   CREATE TABLE public.t_ccoordinador (
    id_ccoordinador bigint NOT NULL,
    comision_c double precision
);
 "   DROP TABLE public.t_ccoordinador;
       public         postgres    false    6            �            1259    141891 "   t_ccoordinador_id_ccoordinador_seq    SEQUENCE     �   CREATE SEQUENCE public.t_ccoordinador_id_ccoordinador_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 9   DROP SEQUENCE public.t_ccoordinador_id_ccoordinador_seq;
       public       postgres    false    6    183            �           0    0 "   t_ccoordinador_id_ccoordinador_seq    SEQUENCE OWNED BY     i   ALTER SEQUENCE public.t_ccoordinador_id_ccoordinador_seq OWNED BY public.t_ccoordinador.id_ccoordinador;
            public       postgres    false    184            �            1259    141893    t_comisiones    TABLE     n  CREATE TABLE public.t_comisiones (
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
    id_basec integer DEFAULT 1,
    estatus integer DEFAULT 0,
    c_minmax integer DEFAULT 0
);
     DROP TABLE public.t_comisiones;
       public         postgres    false    6            �            1259    141899    t_comisiones_id_comision_seq    SEQUENCE     �   CREATE SEQUENCE public.t_comisiones_id_comision_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 3   DROP SEQUENCE public.t_comisiones_id_comision_seq;
       public       postgres    false    185    6             	           0    0    t_comisiones_id_comision_seq    SEQUENCE OWNED BY     ]   ALTER SEQUENCE public.t_comisiones_id_comision_seq OWNED BY public.t_comisiones.id_comision;
            public       postgres    false    186            �            1259    141901 
   t_concepto    TABLE     �   CREATE TABLE public.t_concepto (
    id_concepto bigint NOT NULL,
    concepto character varying(100),
    id_usuario integer,
    fecha_registro date,
    ult_mod date
);
    DROP TABLE public.t_concepto;
       public         postgres    false    6            �            1259    141904    t_concepto_id_concepto_seq    SEQUENCE     �   CREATE SEQUENCE public.t_concepto_id_concepto_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 1   DROP SEQUENCE public.t_concepto_id_concepto_seq;
       public       postgres    false    6    187            	           0    0    t_concepto_id_concepto_seq    SEQUENCE OWNED BY     Y   ALTER SEQUENCE public.t_concepto_id_concepto_seq OWNED BY public.t_concepto.id_concepto;
            public       postgres    false    188            �            1259    141906 
   t_extornos    TABLE     D  CREATE TABLE public.t_extornos (
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
    fecha_registro date,
    ult_mod date,
    id_estatus integer DEFAULT 0,
    observacion character varying(300),
    motivo integer,
    id_semana integer,
    monto_fraccionado_c double precision,
    monto_extornable_c double precision
);
    DROP TABLE public.t_extornos;
       public         postgres    false    6            �            1259    141909    t_extornos_id_extorno_seq    SEQUENCE     �   CREATE SEQUENCE public.t_extornos_id_extorno_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 0   DROP SEQUENCE public.t_extornos_id_extorno_seq;
       public       postgres    false    6    189            	           0    0    t_extornos_id_extorno_seq    SEQUENCE OWNED BY     W   ALTER SEQUENCE public.t_extornos_id_extorno_seq OWNED BY public.t_extornos.id_extorno;
            public       postgres    false    190            �            1259    141911    t_factor_edad    TABLE     �   CREATE TABLE public.t_factor_edad (
    id_fedad bigint NOT NULL,
    edad integer,
    factor double precision,
    id_usuario integer,
    fecha_registro date,
    ult_mod date,
    estatus integer DEFAULT 0
);
 !   DROP TABLE public.t_factor_edad;
       public         postgres    false    6            �            1259    141915    t_factor_edad_id_fedad_seq    SEQUENCE     �   CREATE SEQUENCE public.t_factor_edad_id_fedad_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 1   DROP SEQUENCE public.t_factor_edad_id_fedad_seq;
       public       postgres    false    6    191            	           0    0    t_factor_edad_id_fedad_seq    SEQUENCE OWNED BY     Y   ALTER SEQUENCE public.t_factor_edad_id_fedad_seq OWNED BY public.t_factor_edad.id_fedad;
            public       postgres    false    192            �            1259    141917    t_liquidacion    TABLE     B  CREATE TABLE public.t_liquidacion (
    id_venta integer,
    comision_liquidada double precision,
    id_liquidacion bigint NOT NULL,
    suma double precision,
    prima double precision,
    fecha_registro date,
    ult_mod date,
    usuario integer,
    comision_c double precision,
    estatus_l integer DEFAULT 0
);
 !   DROP TABLE public.t_liquidacion;
       public         postgres    false    6            �            1259    141920     t_liquidacion_id_liquidacion_seq    SEQUENCE     �   CREATE SEQUENCE public.t_liquidacion_id_liquidacion_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 7   DROP SEQUENCE public.t_liquidacion_id_liquidacion_seq;
       public       postgres    false    6    193            	           0    0     t_liquidacion_id_liquidacion_seq    SEQUENCE OWNED BY     e   ALTER SEQUENCE public.t_liquidacion_id_liquidacion_seq OWNED BY public.t_liquidacion.id_liquidacion;
            public       postgres    false    194            �            1259    141922    t_menu    TABLE     �   CREATE TABLE public.t_menu (
    id_menu bigint NOT NULL,
    id_padre integer DEFAULT 0,
    item character varying(50),
    icono character varying(50),
    orden integer,
    ruta character varying(200),
    hijos integer DEFAULT 0
);
    DROP TABLE public.t_menu;
       public         postgres    false    6            �            1259    141927    t_menu_id_menu_seq    SEQUENCE     {   CREATE SEQUENCE public.t_menu_id_menu_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 )   DROP SEQUENCE public.t_menu_id_menu_seq;
       public       postgres    false    6    195            	           0    0    t_menu_id_menu_seq    SEQUENCE OWNED BY     I   ALTER SEQUENCE public.t_menu_id_menu_seq OWNED BY public.t_menu.id_menu;
            public       postgres    false    196            �            1259    142328 	   t_motivos    TABLE     �   CREATE TABLE public.t_motivos (
    id_motivo bigint NOT NULL,
    motivo character varying(100),
    id_usuario integer,
    fecha_registro date,
    ult_mod date,
    estatus integer DEFAULT 0
);
    DROP TABLE public.t_motivos;
       public         postgres    false    6            �            1259    142326    t_motivos_id_motivo_seq    SEQUENCE     �   CREATE SEQUENCE public.t_motivos_id_motivo_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 .   DROP SEQUENCE public.t_motivos_id_motivo_seq;
       public       postgres    false    222    6            	           0    0    t_motivos_id_motivo_seq    SEQUENCE OWNED BY     S   ALTER SEQUENCE public.t_motivos_id_motivo_seq OWNED BY public.t_motivos.id_motivo;
            public       postgres    false    221            �            1259    141929    t_parentesco    TABLE     �   CREATE TABLE public.t_parentesco (
    id_parentesco bigint NOT NULL,
    parentesco character varying(20),
    id_usuario integer,
    fecha_registro date,
    ult_mod date,
    estatus integer DEFAULT 0
);
     DROP TABLE public.t_parentesco;
       public         postgres    false    6            �            1259    141932    t_parentesco_id_parentesco_seq    SEQUENCE     �   CREATE SEQUENCE public.t_parentesco_id_parentesco_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 5   DROP SEQUENCE public.t_parentesco_id_parentesco_seq;
       public       postgres    false    197    6            	           0    0    t_parentesco_id_parentesco_seq    SEQUENCE OWNED BY     a   ALTER SEQUENCE public.t_parentesco_id_parentesco_seq OWNED BY public.t_parentesco.id_parentesco;
            public       postgres    false    198            �            1259    141934 
   t_personas    TABLE     f  CREATE TABLE public.t_personas (
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
    DROP TABLE public.t_personas;
       public         postgres    false    6            �            1259    141938    t_personas_id_persona_seq    SEQUENCE     �   CREATE SEQUENCE public.t_personas_id_persona_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 0   DROP SEQUENCE public.t_personas_id_persona_seq;
       public       postgres    false    6    199            	           0    0    t_personas_id_persona_seq    SEQUENCE OWNED BY     W   ALTER SEQUENCE public.t_personas_id_persona_seq OWNED BY public.t_personas.id_persona;
            public       postgres    false    200            �            1259    141940    t_plan_comision    TABLE     �   CREATE TABLE public.t_plan_comision (
    id_planc bigint NOT NULL,
    planc character varying(100),
    id_usuario integer,
    fecha_registro date,
    ult_mod date,
    estatus integer DEFAULT 0,
    ventas_min integer
);
 #   DROP TABLE public.t_plan_comision;
       public         postgres    false    6            �            1259    141944    t_plan_comision_id_planc_seq    SEQUENCE     �   CREATE SEQUENCE public.t_plan_comision_id_planc_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 3   DROP SEQUENCE public.t_plan_comision_id_planc_seq;
       public       postgres    false    6    201            		           0    0    t_plan_comision_id_planc_seq    SEQUENCE OWNED BY     ]   ALTER SEQUENCE public.t_plan_comision_id_planc_seq OWNED BY public.t_plan_comision.id_planc;
            public       postgres    false    202            �            1259    141946    t_plan_id_tplan_seq    SEQUENCE     |   CREATE SEQUENCE public.t_plan_id_tplan_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 *   DROP SEQUENCE public.t_plan_id_tplan_seq;
       public       postgres    false    175    6            
	           0    0    t_plan_id_tplan_seq    SEQUENCE OWNED BY     K   ALTER SEQUENCE public.t_plan_id_tplan_seq OWNED BY public.t_plan.id_tplan;
            public       postgres    false    203            �            1259    141948    t_polizas_id_poliza_seq    SEQUENCE     �   CREATE SEQUENCE public.t_polizas_id_poliza_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 .   DROP SEQUENCE public.t_polizas_id_poliza_seq;
       public       postgres    false    176    6            	           0    0    t_polizas_id_poliza_seq    SEQUENCE OWNED BY     S   ALTER SEQUENCE public.t_polizas_id_poliza_seq OWNED BY public.t_polizas.id_poliza;
            public       postgres    false    204            �            1259    141950    t_roles    TABLE     �   CREATE TABLE public.t_roles (
    id_rol bigint NOT NULL,
    rol character varying(40),
    observacion character varying(300),
    id_usuario integer,
    fecha_registro date,
    ult_mod date,
    estatus_rol integer DEFAULT 0
);
    DROP TABLE public.t_roles;
       public         postgres    false    6            �            1259    141954    t_roles_id_rol_seq    SEQUENCE     {   CREATE SEQUENCE public.t_roles_id_rol_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 )   DROP SEQUENCE public.t_roles_id_rol_seq;
       public       postgres    false    6    205            	           0    0    t_roles_id_rol_seq    SEQUENCE OWNED BY     I   ALTER SEQUENCE public.t_roles_id_rol_seq OWNED BY public.t_roles.id_rol;
            public       postgres    false    206            �            1259    141956 	   t_semanas    TABLE     �   CREATE TABLE public.t_semanas (
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
    DROP TABLE public.t_semanas;
       public         postgres    false    6            �            1259    141960    t_semanas_id_semana_seq    SEQUENCE     �   CREATE SEQUENCE public.t_semanas_id_semana_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 .   DROP SEQUENCE public.t_semanas_id_semana_seq;
       public       postgres    false    6    207            	           0    0    t_semanas_id_semana_seq    SEQUENCE OWNED BY     S   ALTER SEQUENCE public.t_semanas_id_semana_seq OWNED BY public.t_semanas.id_semana;
            public       postgres    false    208            �            1259    141962    t_tomadores    TABLE     w  CREATE TABLE public.t_tomadores (
    id_tomador bigint NOT NULL,
    identificacion character varying(20),
    nombres character varying(100),
    apellidos character varying(100),
    telefono character varying(30),
    id_coordinador integer DEFAULT 0,
    correo character varying(30),
    fecha_registro date,
    ult_mod date,
    usuario integer,
    tedad integer
);
    DROP TABLE public.t_tomadores;
       public         postgres    false    6            �            1259    141966    t_tomadores_id_tomador_seq    SEQUENCE     �   CREATE SEQUENCE public.t_tomadores_id_tomador_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 1   DROP SEQUENCE public.t_tomadores_id_tomador_seq;
       public       postgres    false    209    6            	           0    0    t_tomadores_id_tomador_seq    SEQUENCE OWNED BY     Y   ALTER SEQUENCE public.t_tomadores_id_tomador_seq OWNED BY public.t_tomadores.id_tomador;
            public       postgres    false    210            �            1259    141968    t_tpago    TABLE     �   CREATE TABLE public.t_tpago (
    id_tpago bigint NOT NULL,
    tpago character varying(100),
    id_usuario integer,
    fecha_registro date,
    ult_mod date,
    estatus integer DEFAULT 0
);
    DROP TABLE public.t_tpago;
       public         postgres    false    6            �            1259    141972    t_tpago_id_tpago_seq    SEQUENCE     }   CREATE SEQUENCE public.t_tpago_id_tpago_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 +   DROP SEQUENCE public.t_tpago_id_tpago_seq;
       public       postgres    false    6    211            	           0    0    t_tpago_id_tpago_seq    SEQUENCE OWNED BY     M   ALTER SEQUENCE public.t_tpago_id_tpago_seq OWNED BY public.t_tpago.id_tpago;
            public       postgres    false    212            �            1259    141974    t_tpoliza_id_tpoliza_seq    SEQUENCE     �   CREATE SEQUENCE public.t_tpoliza_id_tpoliza_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 /   DROP SEQUENCE public.t_tpoliza_id_tpoliza_seq;
       public       postgres    false    177    6            	           0    0    t_tpoliza_id_tpoliza_seq    SEQUENCE OWNED BY     U   ALTER SEQUENCE public.t_tpoliza_id_tpoliza_seq OWNED BY public.t_tpoliza.id_tpoliza;
            public       postgres    false    213            �            1259    141976 
   t_usuarios    TABLE       CREATE TABLE public.t_usuarios (
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
    DROP TABLE public.t_usuarios;
       public         postgres    false    6            �            1259    141980    t_usuarios_id_user_seq    SEQUENCE        CREATE SEQUENCE public.t_usuarios_id_user_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 -   DROP SEQUENCE public.t_usuarios_id_user_seq;
       public       postgres    false    214    6            	           0    0    t_usuarios_id_user_seq    SEQUENCE OWNED BY     Q   ALTER SEQUENCE public.t_usuarios_id_user_seq OWNED BY public.t_usuarios.id_user;
            public       postgres    false    215            �            1259    141982    t_vendedores    TABLE     �  CREATE TABLE public.t_vendedores (
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
    cod_vendedor integer,
    estatus integer DEFAULT 0
);
     DROP TABLE public.t_vendedores;
       public         postgres    false    6            �            1259    141986    t_vendedores_id_vendedor_seq    SEQUENCE     �   CREATE SEQUENCE public.t_vendedores_id_vendedor_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 3   DROP SEQUENCE public.t_vendedores_id_vendedor_seq;
       public       postgres    false    216    6            	           0    0    t_vendedores_id_vendedor_seq    SEQUENCE OWNED BY     ]   ALTER SEQUENCE public.t_vendedores_id_vendedor_seq OWNED BY public.t_vendedores.id_vendedor;
            public       postgres    false    217            �            1259    141988    t_ventas    TABLE     W  CREATE TABLE public.t_ventas (
    id_venta bigint NOT NULL,
    id_tomador integer,
    id_poliza integer,
    id_vendedor integer,
    id_comision integer,
    tipo_pago integer,
    referencia_pago character varying(100),
    monto double precision,
    cuotas_canceladas integer DEFAULT 0,
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
    DROP TABLE public.t_ventas;
       public         postgres    false    6            �            1259    141992    t_ventas_id_venta_seq    SEQUENCE     ~   CREATE SEQUENCE public.t_ventas_id_venta_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 ,   DROP SEQUENCE public.t_ventas_id_venta_seq;
       public       postgres    false    6    218            	           0    0    t_ventas_id_venta_seq    SEQUENCE OWNED BY     O   ALTER SEQUENCE public.t_ventas_id_venta_seq OWNED BY public.t_ventas.id_venta;
            public       postgres    false    219            �            1259    141994    vendedores_ventas_detalles    VIEW     �  CREATE VIEW public.vendedores_ventas_detalles AS
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
    (((a.nombres)::text || ' '::text) || (a.apellidos)::text) AS vendedor_data,
    b.estatus_venta,
    f.id_concepto AS id_concepto_venta,
    g.identificacion AS tomador_cedula,
    (((g.nombres)::text || ' '::text) || (g.apellidos)::text) AS tomador_nombre,
    e.tplan AS descripcion_plan,
    c.suma AS suma_asegurada
   FROM ((((((public.t_vendedores a
     JOIN public.t_ventas b ON ((a.id_vendedor = b.id_vendedor)))
     LEFT JOIN public.t_polizas c ON ((b.id_poliza = c.id_poliza)))
     LEFT JOIN public.t_tpoliza d ON ((b.id_tpoliza = d.id_tpoliza)))
     LEFT JOIN public.t_plan e ON ((b.id_plan = e.id_tplan)))
     JOIN public.t_concepto f ON ((b.tventa = f.id_concepto)))
     JOIN public.t_tomadores g ON ((b.id_tomador = g.id_tomador)));
 -   DROP VIEW public.vendedores_ventas_detalles;
       public       postgres    false    187    187    177    177    176    176    176    175    175    216    218    218    218    218    218    218    218    218    218    218    216    216    216    209    209    209    209    6            �           2604    141999    id_mrol    DEFAULT     t   ALTER TABLE ONLY public.menu_rol ALTER COLUMN id_mrol SET DEFAULT nextval('public.menu_rol_id_mrol_seq'::regclass);
 ?   ALTER TABLE public.menu_rol ALTER COLUMN id_mrol DROP DEFAULT;
       public       postgres    false    174    173            �           2604    142000    id_adicional    DEFAULT     �   ALTER TABLE ONLY public.t_adicionales ALTER COLUMN id_adicional SET DEFAULT nextval('public.t_adicionales_id_adicional_seq'::regclass);
 I   ALTER TABLE public.t_adicionales ALTER COLUMN id_adicional DROP DEFAULT;
       public       postgres    false    180    179            �           2604    142001 
   id_calculo    DEFAULT     |   ALTER TABLE ONLY public.t_calculo ALTER COLUMN id_calculo SET DEFAULT nextval('public.t_calculo_id_calculo_seq'::regclass);
 C   ALTER TABLE public.t_calculo ALTER COLUMN id_calculo DROP DEFAULT;
       public       postgres    false    182    181            �           2604    142002    id_ccoordinador    DEFAULT     �   ALTER TABLE ONLY public.t_ccoordinador ALTER COLUMN id_ccoordinador SET DEFAULT nextval('public.t_ccoordinador_id_ccoordinador_seq'::regclass);
 M   ALTER TABLE public.t_ccoordinador ALTER COLUMN id_ccoordinador DROP DEFAULT;
       public       postgres    false    184    183            �           2604    142003    id_comision    DEFAULT     �   ALTER TABLE ONLY public.t_comisiones ALTER COLUMN id_comision SET DEFAULT nextval('public.t_comisiones_id_comision_seq'::regclass);
 G   ALTER TABLE public.t_comisiones ALTER COLUMN id_comision DROP DEFAULT;
       public       postgres    false    186    185            �           2604    142004    id_concepto    DEFAULT     �   ALTER TABLE ONLY public.t_concepto ALTER COLUMN id_concepto SET DEFAULT nextval('public.t_concepto_id_concepto_seq'::regclass);
 E   ALTER TABLE public.t_concepto ALTER COLUMN id_concepto DROP DEFAULT;
       public       postgres    false    188    187            �           2604    142005 
   id_extorno    DEFAULT     ~   ALTER TABLE ONLY public.t_extornos ALTER COLUMN id_extorno SET DEFAULT nextval('public.t_extornos_id_extorno_seq'::regclass);
 D   ALTER TABLE public.t_extornos ALTER COLUMN id_extorno DROP DEFAULT;
       public       postgres    false    190    189                        2604    142006    id_fedad    DEFAULT     �   ALTER TABLE ONLY public.t_factor_edad ALTER COLUMN id_fedad SET DEFAULT nextval('public.t_factor_edad_id_fedad_seq'::regclass);
 E   ALTER TABLE public.t_factor_edad ALTER COLUMN id_fedad DROP DEFAULT;
       public       postgres    false    192    191                       2604    142007    id_liquidacion    DEFAULT     �   ALTER TABLE ONLY public.t_liquidacion ALTER COLUMN id_liquidacion SET DEFAULT nextval('public.t_liquidacion_id_liquidacion_seq'::regclass);
 K   ALTER TABLE public.t_liquidacion ALTER COLUMN id_liquidacion DROP DEFAULT;
       public       postgres    false    194    193                       2604    142008    id_menu    DEFAULT     p   ALTER TABLE ONLY public.t_menu ALTER COLUMN id_menu SET DEFAULT nextval('public.t_menu_id_menu_seq'::regclass);
 =   ALTER TABLE public.t_menu ALTER COLUMN id_menu DROP DEFAULT;
       public       postgres    false    196    195                       2604    142331 	   id_motivo    DEFAULT     z   ALTER TABLE ONLY public.t_motivos ALTER COLUMN id_motivo SET DEFAULT nextval('public.t_motivos_id_motivo_seq'::regclass);
 B   ALTER TABLE public.t_motivos ALTER COLUMN id_motivo DROP DEFAULT;
       public       postgres    false    221    222    222                       2604    142009    id_parentesco    DEFAULT     �   ALTER TABLE ONLY public.t_parentesco ALTER COLUMN id_parentesco SET DEFAULT nextval('public.t_parentesco_id_parentesco_seq'::regclass);
 I   ALTER TABLE public.t_parentesco ALTER COLUMN id_parentesco DROP DEFAULT;
       public       postgres    false    198    197            	           2604    142010 
   id_persona    DEFAULT     ~   ALTER TABLE ONLY public.t_personas ALTER COLUMN id_persona SET DEFAULT nextval('public.t_personas_id_persona_seq'::regclass);
 D   ALTER TABLE public.t_personas ALTER COLUMN id_persona DROP DEFAULT;
       public       postgres    false    200    199            �           2604    142011    id_tplan    DEFAULT     r   ALTER TABLE ONLY public.t_plan ALTER COLUMN id_tplan SET DEFAULT nextval('public.t_plan_id_tplan_seq'::regclass);
 >   ALTER TABLE public.t_plan ALTER COLUMN id_tplan DROP DEFAULT;
       public       postgres    false    203    175                       2604    142012    id_planc    DEFAULT     �   ALTER TABLE ONLY public.t_plan_comision ALTER COLUMN id_planc SET DEFAULT nextval('public.t_plan_comision_id_planc_seq'::regclass);
 G   ALTER TABLE public.t_plan_comision ALTER COLUMN id_planc DROP DEFAULT;
       public       postgres    false    202    201            �           2604    142013 	   id_poliza    DEFAULT     z   ALTER TABLE ONLY public.t_polizas ALTER COLUMN id_poliza SET DEFAULT nextval('public.t_polizas_id_poliza_seq'::regclass);
 B   ALTER TABLE public.t_polizas ALTER COLUMN id_poliza DROP DEFAULT;
       public       postgres    false    204    176                       2604    142014    id_rol    DEFAULT     p   ALTER TABLE ONLY public.t_roles ALTER COLUMN id_rol SET DEFAULT nextval('public.t_roles_id_rol_seq'::regclass);
 =   ALTER TABLE public.t_roles ALTER COLUMN id_rol DROP DEFAULT;
       public       postgres    false    206    205                       2604    142015 	   id_semana    DEFAULT     z   ALTER TABLE ONLY public.t_semanas ALTER COLUMN id_semana SET DEFAULT nextval('public.t_semanas_id_semana_seq'::regclass);
 B   ALTER TABLE public.t_semanas ALTER COLUMN id_semana DROP DEFAULT;
       public       postgres    false    208    207                       2604    142016 
   id_tomador    DEFAULT     �   ALTER TABLE ONLY public.t_tomadores ALTER COLUMN id_tomador SET DEFAULT nextval('public.t_tomadores_id_tomador_seq'::regclass);
 E   ALTER TABLE public.t_tomadores ALTER COLUMN id_tomador DROP DEFAULT;
       public       postgres    false    210    209                       2604    142017    id_tpago    DEFAULT     t   ALTER TABLE ONLY public.t_tpago ALTER COLUMN id_tpago SET DEFAULT nextval('public.t_tpago_id_tpago_seq'::regclass);
 ?   ALTER TABLE public.t_tpago ALTER COLUMN id_tpago DROP DEFAULT;
       public       postgres    false    212    211            �           2604    142018 
   id_tpoliza    DEFAULT     |   ALTER TABLE ONLY public.t_tpoliza ALTER COLUMN id_tpoliza SET DEFAULT nextval('public.t_tpoliza_id_tpoliza_seq'::regclass);
 C   ALTER TABLE public.t_tpoliza ALTER COLUMN id_tpoliza DROP DEFAULT;
       public       postgres    false    213    177                       2604    142019    id_user    DEFAULT     x   ALTER TABLE ONLY public.t_usuarios ALTER COLUMN id_user SET DEFAULT nextval('public.t_usuarios_id_user_seq'::regclass);
 A   ALTER TABLE public.t_usuarios ALTER COLUMN id_user DROP DEFAULT;
       public       postgres    false    215    214                       2604    142020    id_vendedor    DEFAULT     �   ALTER TABLE ONLY public.t_vendedores ALTER COLUMN id_vendedor SET DEFAULT nextval('public.t_vendedores_id_vendedor_seq'::regclass);
 G   ALTER TABLE public.t_vendedores ALTER COLUMN id_vendedor DROP DEFAULT;
       public       postgres    false    217    216                       2604    142021    id_venta    DEFAULT     v   ALTER TABLE ONLY public.t_ventas ALTER COLUMN id_venta SET DEFAULT nextval('public.t_ventas_id_venta_seq'::regclass);
 @   ALTER TABLE public.t_ventas ALTER COLUMN id_venta DROP DEFAULT;
       public       postgres    false    219    218            �          0    141857    menu_rol 
   TABLE DATA               <   COPY public.menu_rol (id_mrol, id_rol, id_menu) FROM stdin;
    public       postgres    false    173   d�       	           0    0    menu_rol_id_mrol_seq    SEQUENCE SET     D   SELECT pg_catalog.setval('public.menu_rol_id_mrol_seq', 146, true);
            public       postgres    false    174            �          0    141878    t_adicionales 
   TABLE DATA               �   COPY public.t_adicionales (id_adicional, identificacion, nombres, apellidos, telefono, usuario, fecha_registro, ult_mod, id_venta, edad, id_parentesco, tomador) FROM stdin;
    public       postgres    false    179   \�       	           0    0    t_adicionales_id_adicional_seq    SEQUENCE SET     M   SELECT pg_catalog.setval('public.t_adicionales_id_adicional_seq', 42, true);
            public       postgres    false    180            �          0    141883 	   t_calculo 
   TABLE DATA               ]   COPY public.t_calculo (id_calculo, calculo, id_usuario, fecha_registro, ult_mod) FROM stdin;
    public       postgres    false    181   ��       	           0    0    t_calculo_id_calculo_seq    SEQUENCE SET     F   SELECT pg_catalog.setval('public.t_calculo_id_calculo_seq', 2, true);
            public       postgres    false    182            �          0    141888    t_ccoordinador 
   TABLE DATA               E   COPY public.t_ccoordinador (id_ccoordinador, comision_c) FROM stdin;
    public       postgres    false    183   �       	           0    0 "   t_ccoordinador_id_ccoordinador_seq    SEQUENCE SET     P   SELECT pg_catalog.setval('public.t_ccoordinador_id_ccoordinador_seq', 1, true);
            public       postgres    false    184            �          0    141893    t_comisiones 
   TABLE DATA               �   COPY public.t_comisiones (id_comision, id_tcomision, id_tcalculo, cuota, fecha_registro, ult_mod, id_usuario, min, max, id_plan, id_basec, estatus, c_minmax) FROM stdin;
    public       postgres    false    185   <�       	           0    0    t_comisiones_id_comision_seq    SEQUENCE SET     K   SELECT pg_catalog.setval('public.t_comisiones_id_comision_seq', 27, true);
            public       postgres    false    186            �          0    141901 
   t_concepto 
   TABLE DATA               `   COPY public.t_concepto (id_concepto, concepto, id_usuario, fecha_registro, ult_mod) FROM stdin;
    public       postgres    false    187   ��       	           0    0    t_concepto_id_concepto_seq    SEQUENCE SET     H   SELECT pg_catalog.setval('public.t_concepto_id_concepto_seq', 3, true);
            public       postgres    false    188            �          0    141906 
   t_extornos 
   TABLE DATA               %  COPY public.t_extornos (id_extorno, id_venta, id_vendedor, monto_extornable, monto_cuota, cuotas_extornadas, fraccionar, cuotas_fraccionar, monto_fraccionado, id_usuario, fecha_registro, ult_mod, id_estatus, observacion, motivo, id_semana, monto_fraccionado_c, monto_extornable_c) FROM stdin;
    public       postgres    false    189   �       	           0    0    t_extornos_id_extorno_seq    SEQUENCE SET     H   SELECT pg_catalog.setval('public.t_extornos_id_extorno_seq', 17, true);
            public       postgres    false    190            �          0    141911    t_factor_edad 
   TABLE DATA               m   COPY public.t_factor_edad (id_fedad, edad, factor, id_usuario, fecha_registro, ult_mod, estatus) FROM stdin;
    public       postgres    false    191   ��       	           0    0    t_factor_edad_id_fedad_seq    SEQUENCE SET     J   SELECT pg_catalog.setval('public.t_factor_edad_id_fedad_seq', 105, true);
            public       postgres    false    192            �          0    141917    t_liquidacion 
   TABLE DATA               �   COPY public.t_liquidacion (id_venta, comision_liquidada, id_liquidacion, suma, prima, fecha_registro, ult_mod, usuario, comision_c, estatus_l) FROM stdin;
    public       postgres    false    193   u�       	           0    0     t_liquidacion_id_liquidacion_seq    SEQUENCE SET     P   SELECT pg_catalog.setval('public.t_liquidacion_id_liquidacion_seq', 200, true);
            public       postgres    false    194            �          0    141922    t_menu 
   TABLE DATA               T   COPY public.t_menu (id_menu, id_padre, item, icono, orden, ruta, hijos) FROM stdin;
    public       postgres    false    195   ��       	           0    0    t_menu_id_menu_seq    SEQUENCE SET     A   SELECT pg_catalog.setval('public.t_menu_id_menu_seq', 24, true);
            public       postgres    false    196            �          0    142328 	   t_motivos 
   TABLE DATA               d   COPY public.t_motivos (id_motivo, motivo, id_usuario, fecha_registro, ult_mod, estatus) FROM stdin;
    public       postgres    false    222   4�       	           0    0    t_motivos_id_motivo_seq    SEQUENCE SET     E   SELECT pg_catalog.setval('public.t_motivos_id_motivo_seq', 2, true);
            public       postgres    false    221            �          0    141929    t_parentesco 
   TABLE DATA               o   COPY public.t_parentesco (id_parentesco, parentesco, id_usuario, fecha_registro, ult_mod, estatus) FROM stdin;
    public       postgres    false    197   w�       	           0    0    t_parentesco_id_parentesco_seq    SEQUENCE SET     L   SELECT pg_catalog.setval('public.t_parentesco_id_parentesco_seq', 9, true);
            public       postgres    false    198            �          0    141934 
   t_personas 
   TABLE DATA               �   COPY public.t_personas (id_persona, identificacion, nombres, apellidos, telefono, correo, id_usuario, fecha_registro, ult_mod, id_coordinador) FROM stdin;
    public       postgres    false    199   ��        	           0    0    t_personas_id_persona_seq    SEQUENCE SET     H   SELECT pg_catalog.setval('public.t_personas_id_persona_seq', 21, true);
            public       postgres    false    200            �          0    141862    t_plan 
   TABLE DATA               V   COPY public.t_plan (id_tplan, tplan, id_usuario, fecha_registro, ult_mod) FROM stdin;
    public       postgres    false    175   T�       �          0    141940    t_plan_comision 
   TABLE DATA               t   COPY public.t_plan_comision (id_planc, planc, id_usuario, fecha_registro, ult_mod, estatus, ventas_min) FROM stdin;
    public       postgres    false    201   ��       !	           0    0    t_plan_comision_id_planc_seq    SEQUENCE SET     J   SELECT pg_catalog.setval('public.t_plan_comision_id_planc_seq', 3, true);
            public       postgres    false    202            "	           0    0    t_plan_id_tplan_seq    SEQUENCE SET     A   SELECT pg_catalog.setval('public.t_plan_id_tplan_seq', 5, true);
            public       postgres    false    203            �          0    141865 	   t_polizas 
   TABLE DATA               �   COPY public.t_polizas (id_poliza, id_tpoliza, cobertura, suma, num_poliza, id_usuario, fecha_registro, ult_mod, id_plan, estatus) FROM stdin;
    public       postgres    false    176   ��       #	           0    0    t_polizas_id_poliza_seq    SEQUENCE SET     G   SELECT pg_catalog.setval('public.t_polizas_id_poliza_seq', 129, true);
            public       postgres    false    204            �          0    141950    t_roles 
   TABLE DATA               m   COPY public.t_roles (id_rol, rol, observacion, id_usuario, fecha_registro, ult_mod, estatus_rol) FROM stdin;
    public       postgres    false    205   ��       $	           0    0    t_roles_id_rol_seq    SEQUENCE SET     @   SELECT pg_catalog.setval('public.t_roles_id_rol_seq', 8, true);
            public       postgres    false    206            �          0    141956 	   t_semanas 
   TABLE DATA                  COPY public.t_semanas (id_semana, desde, hasta, estatus, id_usuario, fecha_registro, ult_mod, observaciones, nsem) FROM stdin;
    public       postgres    false    207   ��       %	           0    0    t_semanas_id_semana_seq    SEQUENCE SET     F   SELECT pg_catalog.setval('public.t_semanas_id_semana_seq', 60, true);
            public       postgres    false    208            �          0    141962    t_tomadores 
   TABLE DATA               �   COPY public.t_tomadores (id_tomador, identificacion, nombres, apellidos, telefono, id_coordinador, correo, fecha_registro, ult_mod, usuario, tedad) FROM stdin;
    public       postgres    false    209   ��       &	           0    0    t_tomadores_id_tomador_seq    SEQUENCE SET     I   SELECT pg_catalog.setval('public.t_tomadores_id_tomador_seq', 73, true);
            public       postgres    false    210            �          0    141968    t_tpago 
   TABLE DATA               `   COPY public.t_tpago (id_tpago, tpago, id_usuario, fecha_registro, ult_mod, estatus) FROM stdin;
    public       postgres    false    211   &�       '	           0    0    t_tpago_id_tpago_seq    SEQUENCE SET     C   SELECT pg_catalog.setval('public.t_tpago_id_tpago_seq', 11, true);
            public       postgres    false    212            �          0    141869 	   t_tpoliza 
   TABLE DATA               n   COPY public.t_tpoliza (id_tpoliza, tpoliza, id_usuario, fecha_registro, ult_mod, factor, estatus) FROM stdin;
    public       postgres    false    177   ��       (	           0    0    t_tpoliza_id_tpoliza_seq    SEQUENCE SET     G   SELECT pg_catalog.setval('public.t_tpoliza_id_tpoliza_seq', 13, true);
            public       postgres    false    213            �          0    141976 
   t_usuarios 
   TABLE DATA               �   COPY public.t_usuarios (id_user, username, clave, id_persona, id_rol, id_usuario, fecha_registro, ult_mod, estatus) FROM stdin;
    public       postgres    false    214   �       )	           0    0    t_usuarios_id_user_seq    SEQUENCE SET     E   SELECT pg_catalog.setval('public.t_usuarios_id_user_seq', 16, true);
            public       postgres    false    215            �          0    141982    t_vendedores 
   TABLE DATA               �   COPY public.t_vendedores (id_vendedor, identificacion, nombres, apellidos, telefono, id_coordinador, correo, fecha_registro, ult_mod, id_usuario, cod_vendedor, estatus) FROM stdin;
    public       postgres    false    216   v�       *	           0    0    t_vendedores_id_vendedor_seq    SEQUENCE SET     K   SELECT pg_catalog.setval('public.t_vendedores_id_vendedor_seq', 30, true);
            public       postgres    false    217            �          0    141988    t_ventas 
   TABLE DATA                 COPY public.t_ventas (id_venta, id_tomador, id_poliza, id_vendedor, id_comision, tipo_pago, referencia_pago, monto, cuotas_canceladas, extorno, fecha_extorno, id_usuario, fecha_registro, ult_mod, id_plan, id_tpoliza, tventa, solicitud, id_semana, estatus_venta) FROM stdin;
    public       postgres    false    218   �       +	           0    0    t_ventas_id_venta_seq    SEQUENCE SET     E   SELECT pg_catalog.setval('public.t_ventas_id_venta_seq', 150, true);
            public       postgres    false    219            '           2606    142023    pk_adicionales 
   CONSTRAINT     d   ALTER TABLE ONLY public.t_adicionales
    ADD CONSTRAINT pk_adicionales PRIMARY KEY (id_adicional);
 F   ALTER TABLE ONLY public.t_adicionales DROP CONSTRAINT pk_adicionales;
       public         postgres    false    179    179            +           2606    142025    pk_ccoordinador 
   CONSTRAINT     i   ALTER TABLE ONLY public.t_ccoordinador
    ADD CONSTRAINT pk_ccoordinador PRIMARY KEY (id_ccoordinador);
 H   ALTER TABLE ONLY public.t_ccoordinador DROP CONSTRAINT pk_ccoordinador;
       public         postgres    false    183    183            1           2606    142027 
   pk_extorno 
   CONSTRAINT     [   ALTER TABLE ONLY public.t_extornos
    ADD CONSTRAINT pk_extorno PRIMARY KEY (id_extorno);
 ?   ALTER TABLE ONLY public.t_extornos DROP CONSTRAINT pk_extorno;
       public         postgres    false    189    189            3           2606    142029    pk_fedad 
   CONSTRAINT     Z   ALTER TABLE ONLY public.t_factor_edad
    ADD CONSTRAINT pk_fedad PRIMARY KEY (id_fedad);
 @   ALTER TABLE ONLY public.t_factor_edad DROP CONSTRAINT pk_fedad;
       public         postgres    false    191    191            7           2606    142031    pk_menu 
   CONSTRAINT     Q   ALTER TABLE ONLY public.t_menu
    ADD CONSTRAINT pk_menu PRIMARY KEY (id_menu);
 8   ALTER TABLE ONLY public.t_menu DROP CONSTRAINT pk_menu;
       public         postgres    false    195    195            S           2606    142333 	   pk_motivo 
   CONSTRAINT     X   ALTER TABLE ONLY public.t_motivos
    ADD CONSTRAINT pk_motivo PRIMARY KEY (id_motivo);
 =   ALTER TABLE ONLY public.t_motivos DROP CONSTRAINT pk_motivo;
       public         postgres    false    222    222                       2606    142033    pk_mrol 
   CONSTRAINT     S   ALTER TABLE ONLY public.menu_rol
    ADD CONSTRAINT pk_mrol PRIMARY KEY (id_mrol);
 :   ALTER TABLE ONLY public.menu_rol DROP CONSTRAINT pk_mrol;
       public         postgres    false    173    173            ;           2606    142035 
   pk_persona 
   CONSTRAINT     [   ALTER TABLE ONLY public.t_personas
    ADD CONSTRAINT pk_persona PRIMARY KEY (id_persona);
 ?   ALTER TABLE ONLY public.t_personas DROP CONSTRAINT pk_persona;
       public         postgres    false    199    199            ?           2606    142037    pk_planc 
   CONSTRAINT     \   ALTER TABLE ONLY public.t_plan_comision
    ADD CONSTRAINT pk_planc PRIMARY KEY (id_planc);
 B   ALTER TABLE ONLY public.t_plan_comision DROP CONSTRAINT pk_planc;
       public         postgres    false    201    201            #           2606    142039 	   pk_poliza 
   CONSTRAINT     X   ALTER TABLE ONLY public.t_polizas
    ADD CONSTRAINT pk_poliza PRIMARY KEY (id_poliza);
 =   ALTER TABLE ONLY public.t_polizas DROP CONSTRAINT pk_poliza;
       public         postgres    false    176    176            A           2606    142041    pk_rol 
   CONSTRAINT     P   ALTER TABLE ONLY public.t_roles
    ADD CONSTRAINT pk_rol PRIMARY KEY (id_rol);
 8   ALTER TABLE ONLY public.t_roles DROP CONSTRAINT pk_rol;
       public         postgres    false    205    205            C           2606    142043 	   pk_semana 
   CONSTRAINT     X   ALTER TABLE ONLY public.t_semanas
    ADD CONSTRAINT pk_semana PRIMARY KEY (id_semana);
 =   ALTER TABLE ONLY public.t_semanas DROP CONSTRAINT pk_semana;
       public         postgres    false    207    207            5           2606    142084    pk_t_liquidacion 
   CONSTRAINT     h   ALTER TABLE ONLY public.t_liquidacion
    ADD CONSTRAINT pk_t_liquidacion PRIMARY KEY (id_liquidacion);
 H   ALTER TABLE ONLY public.t_liquidacion DROP CONSTRAINT pk_t_liquidacion;
       public         postgres    false    193    193            )           2606    142045    pk_tcalculo 
   CONSTRAINT     [   ALTER TABLE ONLY public.t_calculo
    ADD CONSTRAINT pk_tcalculo PRIMARY KEY (id_calculo);
 ?   ALTER TABLE ONLY public.t_calculo DROP CONSTRAINT pk_tcalculo;
       public         postgres    false    181    181            -           2606    142047    pk_tcomisiones 
   CONSTRAINT     b   ALTER TABLE ONLY public.t_comisiones
    ADD CONSTRAINT pk_tcomisiones PRIMARY KEY (id_comision);
 E   ALTER TABLE ONLY public.t_comisiones DROP CONSTRAINT pk_tcomisiones;
       public         postgres    false    185    185            /           2606    142049    pk_tconcepto 
   CONSTRAINT     ^   ALTER TABLE ONLY public.t_concepto
    ADD CONSTRAINT pk_tconcepto PRIMARY KEY (id_concepto);
 A   ALTER TABLE ONLY public.t_concepto DROP CONSTRAINT pk_tconcepto;
       public         postgres    false    187    187            E           2606    142051 
   pk_tomador 
   CONSTRAINT     \   ALTER TABLE ONLY public.t_tomadores
    ADD CONSTRAINT pk_tomador PRIMARY KEY (id_tomador);
 @   ALTER TABLE ONLY public.t_tomadores DROP CONSTRAINT pk_tomador;
       public         postgres    false    209    209            I           2606    142053    pk_tpago 
   CONSTRAINT     T   ALTER TABLE ONLY public.t_tpago
    ADD CONSTRAINT pk_tpago PRIMARY KEY (id_tpago);
 :   ALTER TABLE ONLY public.t_tpago DROP CONSTRAINT pk_tpago;
       public         postgres    false    211    211            9           2606    142055    pk_tparentesco 
   CONSTRAINT     d   ALTER TABLE ONLY public.t_parentesco
    ADD CONSTRAINT pk_tparentesco PRIMARY KEY (id_parentesco);
 E   ALTER TABLE ONLY public.t_parentesco DROP CONSTRAINT pk_tparentesco;
       public         postgres    false    197    197            !           2606    142057    pk_tplan 
   CONSTRAINT     S   ALTER TABLE ONLY public.t_plan
    ADD CONSTRAINT pk_tplan PRIMARY KEY (id_tplan);
 9   ALTER TABLE ONLY public.t_plan DROP CONSTRAINT pk_tplan;
       public         postgres    false    175    175            %           2606    142059 
   pk_tpoliza 
   CONSTRAINT     Z   ALTER TABLE ONLY public.t_tpoliza
    ADD CONSTRAINT pk_tpoliza PRIMARY KEY (id_tpoliza);
 >   ALTER TABLE ONLY public.t_tpoliza DROP CONSTRAINT pk_tpoliza;
       public         postgres    false    177    177            K           2606    142061    pk_user 
   CONSTRAINT     U   ALTER TABLE ONLY public.t_usuarios
    ADD CONSTRAINT pk_user PRIMARY KEY (id_user);
 <   ALTER TABLE ONLY public.t_usuarios DROP CONSTRAINT pk_user;
       public         postgres    false    214    214            M           2606    142063    pk_vendedor 
   CONSTRAINT     _   ALTER TABLE ONLY public.t_vendedores
    ADD CONSTRAINT pk_vendedor PRIMARY KEY (id_vendedor);
 B   ALTER TABLE ONLY public.t_vendedores DROP CONSTRAINT pk_vendedor;
       public         postgres    false    216    216            Q           2606    142065 	   pk_ventas 
   CONSTRAINT     V   ALTER TABLE ONLY public.t_ventas
    ADD CONSTRAINT pk_ventas PRIMARY KEY (id_venta);
 <   ALTER TABLE ONLY public.t_ventas DROP CONSTRAINT pk_ventas;
       public         postgres    false    218    218            =           2606    142067 	   unique_id 
   CONSTRAINT     Y   ALTER TABLE ONLY public.t_personas
    ADD CONSTRAINT unique_id UNIQUE (identificacion);
 >   ALTER TABLE ONLY public.t_personas DROP CONSTRAINT unique_id;
       public         postgres    false    199    199            G           2606    142069    unique_id_t 
   CONSTRAINT     \   ALTER TABLE ONLY public.t_tomadores
    ADD CONSTRAINT unique_id_t UNIQUE (identificacion);
 A   ALTER TABLE ONLY public.t_tomadores DROP CONSTRAINT unique_id_t;
       public         postgres    false    209    209            O           2606    142071    unique_id_v 
   CONSTRAINT     ]   ALTER TABLE ONLY public.t_vendedores
    ADD CONSTRAINT unique_id_v UNIQUE (identificacion);
 B   ALTER TABLE ONLY public.t_vendedores DROP CONSTRAINT unique_id_v;
       public         postgres    false    216    216            �   �   x��ɕ� �V0�h�H���c���� J�>���\��a@��Lp���:�U.]Q�w�f�M+��v�E�h�t��RGە#ڲThx#��v&�m-�;�&�U��&���T�T��Jͯ^��H�!u`A��"5��B�QVR���V��V�S�J;�K�Qi��e-S*��0�^3�epM�=�|f.9�'�3�ןw��P.i�y!�ր�X��[� ϳ��n-��������"ZH      �   r   x�31��5337047�tN,�M�SH,*J��!C3N#CK]C]T������9P����������!�0c3KsΔ���|�!��05�44�4D1È���t��Y1z\\\ !�.      �   ,   x�3�,�/JN�+)M��� .#�����|��̬|�h� u��      �      x�3�42������ !O      �   d   x���K
� D��]Z2�ޥ�?GM�ЍR��FI�8�	������y��2E���&��峄�M}�ރ
��۩l^�^B����B�	�x�8�OU} ��,L      �   P   x�3�,K�+ITHIU(��ɬJ�� .#΂Ԣ����b�Ĕ��L +'�!o̙�\R�Ҕ�yxsȌ�Ē|$%1z\\\ =      �   �   x�m�;� �gs
. ���r�� J��$���/��Tj,~��L��`��l�5a,���.�)(B�F~BE�q]���dz��"c>R�K���N{�i|U���hp0�o�x�ᐃ��H��&R�J�n�c���_\��-�:�      �   �  x���K�!�Ow���{	�`�g�[�C)f!�Џ"a�L�j%�|���߿�r�i��j2�3djd��̐��!V�S��AU�Fl.KC�&Kc�.K��!K��)Kö%K�-K�E�&^M5M�V����k
5�eP\�e�\-�e�\y\��2������i�I�Ľ�����i�>�i��i��i�����Ho�"M�a�;��k� a׼j��	a�4���ZW�Í l1���S��Q���X@�ul�}�3�0\7�a�϶*�ͮ8䂳����	��u�Y��i���}\W!BSp6/���%8[�ۂ���4���9�A�""8L|P�轟!���y8�l��#�[6�0r@6��r@6���@�~}l���@����g��,Ey����Ƕ�yG}�� ��N��Qj=�3��7�ا-��[����zj�M��q��E[�#�-�1���ǟ�*����,�aة瞪��E
vZA;�g}���Yd��}�	� �C��è�B
����\�O����\�NO�g�0��t�hݷ��ķi߷�7}˲�����g��vg�v�e��y���ػG������xd�,O��� ����V���[������Ω������q�zĨO��
L����m����������)���~w��柾�|����my}_���7s��B      �   a   x�����0�ްKhH����EQ���Bg�o��tA㢢��@}� �R�����abU ��W��\�&ҍY=�b�e�xN�C���M%�      �   >  x�}T͎�0>;O�g6�� gD�ж�S%��R�v�۾V�/�qBH��ޢ��3c�r�F�ׇ�R��c�^�{1�xpl�ޱ"Y0ξ�S��-�meds���ׇ���d+�5�8�cy���X���]��2OVD��#Zw���k�jT���`{�
�=��#�ɝ���2�B�$�5��hB�,��������E30�ƌ=k�'J}�P7�%��q#{0)\z~x�M�+���:r��'!��IYz�F	xEzG6s�������B�%��4���+�ek5%,*Ph�I>[{)�U,���o��h2��_������M�����`}��0"����\%"��j�M�q^t�-	�y��̐�Q�֪=�SF� lJ 5n"\�����y��9��Y���Hg�%OmV�����a�Um�s�fed����-��T�H]�T�"���DډZ�y�Z���*�ȱF5�������8��V�s?(�����Up��"���d�nv����Vi#h��fq�h��}�B/�q�P�j�z��1�d���: .|M�*\�z@����$I�1��      �   3   x�3��/*,MU(���".#���rNCN#CK]C Bfp��qqq ��      �   s   x�3��H-�M��/��".#΂��\T1cΒLTμ��T1SΌ̬�b������T)3�����L4��9�KSӋP-8�KЄ,9�JS�99�-u��i����� �J4�      �   J   x�32��52407254��N,�H-��K��I�J�M�D���:�d���%��rrZ���!3�b���� �lz      �   1   x�3���p�t��� .#Ng�`Og��1gp(H�B,F��� ���      �   D   x�3�trv��"NC.#N_WOdAs.c��� � O� ��\&�~�
�>�Ύ�21~\1z\\\ �
      �   �  x������0���S�9�H�%KG�����SO{1���x��>W�/VY�l�jf4!$��/�����N(ѿN�o��2�Ǐ?��2.����\��ƓP���&��BK��2�U~^9X���K����q��i�_�����x����O�����d:��s�U�0_�����4O�I�	�Ḧ&�;����WV˞��	O3�o�6a�aF��?J���aF���r��ЦѬ0x��dtb��DϷ
p2+�1�<%3��D,s�8���!�j�he\��
28��i��,�6U肂����f�A�u5�*��vй���&�<;�]hp6+�K^6۷G��\ŋ����8�7%��Ѭ%�pq
F���,~mv���D4�6�ѐh"�ٚ�&��T����;��+[�z����
W�r��
�mYp4R��w����俉���2��x��+Ͷ��z4�nWQ|��@�_%��<~�2�xŬW&A��l׀�uCj�rd��?ޔj@`C���DD�$�T��:$��.�C��8�!��U�fv�<��+�!�ג�W�C��xq�h\7$ܯ�`,��V�!���+�!�g�+�!�f�k@�!�?"��yǞ>���΄�������L�k�ϰ&��P�(sV�C>�������7�J�x����p���'      �   Z   x�3�tL����,.)JL�/���4�420��5 "Cd��1�s~~QJfH��K�BXj^Ib1~M@Myi��E�ə�7�TÑ!W� .�"       �   �   x���A
1E��)z����v�e�".�2��f�P��#B�ME�y!?��� �8tL� Üe�e�`L��t�j�T��kTS:��gt$ʾ�&�ڏ�~�+�PvV��������u_nO0� #��VlcZ_L��$�~���p� �%�M�      �   ~   x�37��5426153��t�K)J-��,K,�40142725�0��4�L,	:��&f��%��rZ���!3A<#.sc��PC-9�2�K�8=R���RR��&�� �M�&g�ĉ2ܘ+F��� �1,�      �   f   x�]�=
�0@�9=EN �����%��@[�ťo{_��r	톬�o�L��:�Z��B��L���&٪;�I����K1I�p#���r���T��q�=y�,�      �   j   x�3�q��4�420��5 "C�����04�4�2�	����X����JA��@U�ZSS=cSKd`�j�jl�G�����1�ی@n3��tqĩ� �$F��� �,      �   P   x�M�1
�0D�z�.+3�]lR����N���<�n�8(Ҟ� �ZÙ]���s.�����ޖFi�D��/i�ff�n�      �   �   x���=�0Dg翴�M���L��@���E�_O������l�.��vJYa��(`G�������L�xԱ?e��=�30��oS�O�!�V7{�މ��Ma5�4��� ~�_u<?��)>��r��]k�y\�,�      �   z   x���A
�@E�߻d�;�8������6�@h��B������_ hF#b�O��G�D�(h�)c�.���AU�:��	�/�DT[�����eW-{��ve~����?d�6i�#}�i�&"o�)/�     