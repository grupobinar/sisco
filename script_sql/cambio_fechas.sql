ALTER TABLE t_plan ALTER COLUMN fecha_registro SET DATA TYPE timestamp;
ALTER TABLE t_polizas ALTER COLUMN fecha_registro SET DATA TYPE timestamp;
ALTER TABLE t_tpoliza ALTER COLUMN fecha_registro SET DATA TYPE timestamp;
ALTER TABLE t_calculo ALTER COLUMN fecha_registro SET DATA TYPE timestamp;
--ALTER TABLE t_ccoordinador ALTER COLUMN fecha_registro SET DATA TYPE timestamp;
ALTER TABLE t_concepto ALTER COLUMN fecha_registro SET DATA TYPE timestamp;
ALTER TABLE t_factor_edad ALTER COLUMN fecha_registro SET DATA TYPE timestamp;
ALTER TABLE t_tomadores ALTER COLUMN fecha_registro SET DATA TYPE timestamp;
--ALTER TABLE t_menu ALTER COLUMN fecha_registro SET DATA TYPE timestamp;
ALTER TABLE t_usuarios ALTER COLUMN fecha_registro SET DATA TYPE timestamp;
ALTER TABLE t_plan_comision ALTER COLUMN fecha_registro SET DATA TYPE timestamp;
ALTER TABLE t_roles ALTER COLUMN fecha_registro SET DATA TYPE timestamp;
ALTER TABLE t_semanas ALTER COLUMN fecha_registro SET DATA TYPE timestamp;
ALTER TABLE t_tpago ALTER COLUMN fecha_registro SET DATA TYPE timestamp;
ALTER TABLE t_personas ALTER COLUMN fecha_registro SET DATA TYPE timestamp;
ALTER TABLE t_ventas ALTER COLUMN fecha_registro SET DATA TYPE timestamp;
ALTER TABLE t_motivos ALTER COLUMN fecha_registro SET DATA TYPE timestamp;
ALTER TABLE t_parentesco ALTER COLUMN fecha_registro SET DATA TYPE timestamp;
ALTER TABLE t_vendedores ALTER COLUMN fecha_registro SET DATA TYPE timestamp;
ALTER TABLE t_liquidacion ALTER COLUMN fecha_registro SET DATA TYPE timestamp;
ALTER TABLE t_extornos ALTER COLUMN fecha_registro SET DATA TYPE timestamp;
ALTER TABLE t_adicionales ALTER COLUMN fecha_registro SET DATA TYPE timestamp;
ALTER TABLE t_comisiones ALTER COLUMN fecha_registro SET DATA TYPE timestamp;

ALTER TABLE t_plan ALTER COLUMN ult_mod SET DATA TYPE timestamp;
ALTER TABLE t_polizas ALTER COLUMN ult_mod SET DATA TYPE timestamp;
ALTER TABLE t_tpoliza ALTER COLUMN ult_mod SET DATA TYPE timestamp;
ALTER TABLE t_calculo ALTER COLUMN ult_mod SET DATA TYPE timestamp;
--ALTER TABLE t_ccoordinador ALTER COLUMN ult_mod SET DATA TYPE timestamp;
ALTER TABLE t_concepto ALTER COLUMN ult_mod SET DATA TYPE timestamp;
ALTER TABLE t_factor_edad ALTER COLUMN ult_mod SET DATA TYPE timestamp;
ALTER TABLE t_tomadores ALTER COLUMN ult_mod SET DATA TYPE timestamp;
--ALTER TABLE t_menu ALTER COLUMN ult_mod SET DATA TYPE timestamp;
ALTER TABLE t_usuarios ALTER COLUMN ult_mod SET DATA TYPE timestamp;
ALTER TABLE t_plan_comision ALTER COLUMN ult_mod SET DATA TYPE timestamp;
ALTER TABLE t_roles ALTER COLUMN ult_mod SET DATA TYPE timestamp;
ALTER TABLE t_semanas ALTER COLUMN ult_mod SET DATA TYPE timestamp;
ALTER TABLE t_tpago ALTER COLUMN ult_mod SET DATA TYPE timestamp;
ALTER TABLE t_personas ALTER COLUMN ult_mod SET DATA TYPE timestamp;
ALTER TABLE t_ventas ALTER COLUMN ult_mod SET DATA TYPE timestamp;
ALTER TABLE t_motivos ALTER COLUMN ult_mod SET DATA TYPE timestamp;
ALTER TABLE t_parentesco ALTER COLUMN ult_mod SET DATA TYPE timestamp;
ALTER TABLE t_vendedores ALTER COLUMN ult_mod SET DATA TYPE timestamp;
ALTER TABLE t_liquidacion ALTER COLUMN ult_mod SET DATA TYPE timestamp;
ALTER TABLE t_extornos ALTER COLUMN ult_mod SET DATA TYPE timestamp;
ALTER TABLE t_adicionales ALTER COLUMN ult_mod SET DATA TYPE timestamp;
ALTER TABLE t_comisiones ALTER COLUMN ult_mod SET DATA TYPE timestamp;

UPDATE t_menu SET id_padre=0, item='Aprobar ventas domiciliadas', icono='fa fa-credit-card' where id_menu=26;
UPDATE t_menu SET ruta='index.php/login/welcome' where id_menu=5;
SET datestyle = "ISO, DMY";