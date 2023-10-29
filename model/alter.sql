-- These executed 2021 08 14 1700
--alter table food_nutrient alter column id type integer USING id::bigint;
--alter table food_nutrient alter column fdc_id type integer USING fdc_id::integer;
--alter table food_nutrient alter column nutrient_id type integer USING nutrient_id::integer;
--alter table food_nutrient alter column amount type decimal USING amount::decimal;

-- alter table food_nutrient alter column derivation_id type bigint USING derivation_id::bigint;
-- update food_nutrient set data_points = '0' where data_points = '';
-- alter table food_nutrient alter column data_points type integer USING data_points::integer;
-- update food_nutrient set data_points = NULL  where data_points = 0;
-- alter table branded_food alter column fdc_id type bigint USING fdc_id::bigint;

alter table food alter column fdc_id type bigint USING fdc_id::bigint;
update food set food_category_id = '0' where food_category_id = '';
update food set food_category_id = NULL  where data_points = 0;
