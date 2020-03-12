-- Cambios tabla poliza

ALTER TABLE t_polizas ADD COLUMN id_sem_i integer;
ALTER TABLE t_polizas ADD COLUMN id_sem_f integer;
ALTER TABLE t_polizas ADD COLUMN id_rel integer;

-- Cambios tabla comisiones

ALTER TABLE t_comisiones ADD COLUMN id_sem_i integer;
ALTER TABLE t_comisiones ADD COLUMN id_sem_f integer;
ALTER TABLE t_comisiones ADD COLUMN id_rel integer;

-- Creacion tabla fraccion domiciliadas

CREATE TABLE public.t_fdomiciliadas
(
    id_fdom bigserial NOT NULL,
    dom_i double precision,
    dom_f double precision,
    id_sem_i integer,
    id_sem_f integer,
    id_rel integer,
    id_usuario integer,
    fecha_registro timestamp without time zone,
    ult_mod timestamp without time zone,
    estatus integer DEFAULT 0,
    CONSTRAINT pk_fdom PRIMARY KEY (id_fdom)
)
WITH (
    OIDS = FALSE
)
TABLESPACE pg_default;

ALTER TABLE public.t_fdomiciliadas
    OWNER to postgres;

-- Agregar primer registro tabla fraccionamiento domiciliada

INSERT INTO t_fdomiciliadas (dom_i, dom_f) values ('0.5','0.5');

-- Eliminar tabla comision coordinador

DROP TABLE public.t_ccoordinador;

-- Crear tabla comision coordinador con nueva estructura

CREATE TABLE public.t_ccoordinador
(
    id_ccoordinador bigserial NOT NULL,
    comision_c double precision,
    id_sem_i integer,
    id_sem_f integer,
    id_rel integer,
    id_usuario integer,
    fecha_registro timestamp without time zone,
    ult_mod timestamp without time zone,
    estatus integer DEFAULT 0,
    CONSTRAINT pk_cc PRIMARY KEY (id_ccoordinador)
)
WITH (
    OIDS = FALSE
)
TABLESPACE pg_default;

ALTER TABLE public.t_ccoordinador
    OWNER to postgres;

-- Agregar primer registro tabla t_ccoordinador

INSERT INTO t_ccoordinador (comision_c) values ('20');