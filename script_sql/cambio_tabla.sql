ALTER TABLE public.t_plan_comision 
    ADD COLUMN ventas_min integer;

UPDATE public.t_plan_comision SET
ventas_min = '1'::integer WHERE
id_planc = '1';

UPDATE public.t_plan_comision SET
ventas_min = '7'::integer WHERE
id_planc = '2';

UPDATE public.t_plan_comision SET
ventas_min = '13'::integer WHERE
id_planc = '3';