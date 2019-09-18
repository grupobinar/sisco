CREATE TABLE t_personas
(
  id_persona bigserial NOT NULL,
  identificacion character varying(20),
  nombres character varying(100),
  apellidos character varying(100),
  telefono character varying(30),
  correo character varying(30),
  id_usuario integer,
  fecha_registro date,
  ult_mod date,
  CONSTRAINT pk_persona PRIMARY KEY (id_persona),
  CONSTRAINT unique_id UNIQUE (identificacion)
)
WITH (
  OIDS=FALSE
);
ALTER TABLE t_personas
  OWNER TO postgres;

CREATE TABLE t_usuarios
(
  id_user bigserial NOT NULL,
  identificacion character varying(20),
  username character varying(20),
  clave character varying(300),
  id_persona integer,
  id_rol integer,
  id_usuario integer,
  fecha_registro date,
  ult_mod date,
  CONSTRAINT pk_user PRIMARY KEY (id_user)
)
WITH (
  OIDS=FALSE
);
ALTER TABLE t_usuarios
  OWNER TO postgres;

CREATE TABLE t_roles
(
  id_rol bigserial NOT NULL,
  rol character varying(20),
  observacion character varying(300),
  id_usuario integer,
  fecha_registro date,
  ult_mod date,
  CONSTRAINT pk_rol PRIMARY KEY (id_rol)
)
WITH (
  OIDS=FALSE
);
ALTER TABLE t_roles
  OWNER TO postgres;

  CREATE TABLE t_ventas
(
  id_venta bigserial NOT NULL,
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
  CONSTRAINT pk_ventas PRIMARY KEY (id_venta)
)
WITH (
  OIDS=FALSE
);
ALTER TABLE t_ventas
  OWNER TO postgres;


  CREATE TABLE t_polizas
(
  id_poliza bigserial NOT NULL,
  id_tpoliza integer,
  plan character varying(100),
  cobertura character varying(100),
  suma double precision,
  num_poliza character varying(20),
  extorno integer,
  fecha_extorno date,
  id_usuario integer,
  fecha_registro date,
  ult_mod date,
  CONSTRAINT pk_poliza PRIMARY KEY (id_poliza)
)
WITH (
  OIDS=FALSE
);
ALTER TABLE t_polizas
  OWNER TO postgres;

 # -------------------------------------------------

 CREATE TABLE t_tpersonas
(
  id_tpersona bigserial NOT NULL,
  tpersona character varying(20),
  id_usuario integer,
  fecha_registro date,
  ult_mod date,
  CONSTRAINT pk_tpersona PRIMARY KEY (id_tpersona)
)
WITH (
  OIDS=FALSE
);
ALTER TABLE t_tpersonas
  OWNER TO postgres;

  CREATE TABLE t_tpago
(
  id_tpago bigserial NOT NULL,
  tpago character varying(20),
  id_usuario integer,
  fecha_registro date,
  ult_mod date,
  CONSTRAINT pk_tpago PRIMARY KEY (id_tpago)
)
WITH (
  OIDS=FALSE
);
ALTER TABLE t_tpago
  OWNER TO postgres;

  CREATE TABLE t_tpoliza
(
  id_tpoliza bigserial NOT NULL,
  tpoliza character varying(20),
  id_usuario integer,
  fecha_registro date,
  ult_mod date,
  CONSTRAINT pk_tpoliza PRIMARY KEY (id_tpoliza)
)
WITH (
  OIDS=FALSE
);
ALTER TABLE t_tpoliza
  OWNER TO postgres;

