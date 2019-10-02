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