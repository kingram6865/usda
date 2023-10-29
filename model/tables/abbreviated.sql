/*
Abbreviated (file name = ABBREV) 
Contains all the food items found in the relational database, but contains the information in one record per food item.

Field name    Type     Description
NDB_No.       A 5*     5-digit Nutrient Databank number that uniquely identifies a food item. If this field is defined as numeric, the leading zero will be lost.
Shrt_Desc     A 60     60-character abbreviated description of food item.†
Water         N 10.2   Water (g/100 g)
Energ_Kcal    N 10     Food energy (kcal/100 g)
Protein       N 10.2   Protein (g/100 g)
Lipid_Tot     N 10.2   Total lipid (fat) (g/100 g)
Ash           N 10.2   Ash (g/100 g)
Carbohydrt    N 10.2   Carbohydrate, by difference (g/100 g)
Fiber_TD      N 10.1   Total dietary fiber (g/100 g)
Sugar_Tot     N 10.2   Total sugars (g/100 g)
Calcium       N 10     Calcium (mg/100 g)
Iron          N 10.2   Iron (mg/100 g)
Magnesium     N 10     Magnesium (mg/100 g)
Phosphorus    N 10     Phosphorus (mg/100 g)
Potassium     N 10     Potassium (mg/100 g)
Sodium        N 10     Sodium (mg/100 g)
Zinc          N 10.2   Zinc (mg/100 g)
Copper        N 10.3   Copper (mg/100 g)
Manganese     N 10.3   Manganese (mg/100 g)
Selenium      N 10.1   Selenium (μg/100 g)
Vit_C         N 10.1   Vitamin C (mg/100 g)
Thiamin       N 10.3   Thiamin (mg/100 g)
Riboflavin    N 10.3   Riboflavin (mg/100 g)
Niacin        N 10.3   Niacin (mg/100 g)
Panto_acid    N 10.3   Pantothenic acid (mg/100 g)
Vit_B6        N 10.3   Vitamin B6 (mg/100 g)
Folate_Tot    N 10     Folate, total (μg/100 g)
Folic_acid    N 10     Folic acid (μg/100 g)
Food_Folate   N 10     Food folate (μg/100 g)
Folate_DFE    N 10     Folate (μg dietary folate equivalents/100 g)
Choline_Tot   N 10     Choline, total (mg/100 g)
Vit_B12       N 10.2   Vitamin B12 (μg/100 g)
Vit_A_IU      N 10     Vitamin A (IU/100 g)
Vit_A_RAE     N 10     Vitamin A (μg retinol activity equivalents/100g)
Retinol       N 10     Retinol (μg/100 g)
Alpha_Carot   N 10     Alpha-carotene (μg/100 g)
Beta_Carot    N 10     Beta-carotene (μg/100 g)
Beta_Crypt    N 10     Beta-cryptoxanthin (μg/100 g)
Lycopene      N 10     Lycopene (μg/100 g)
Lut+Zea       N 10     Lutein+zeazanthin (μg/100 g)
Vit_E         N 10.2   Vitamin E (alpha-tocopherol) (mg/100 g)
Vit_D_mcg     N 10.1   Vitamin D (μg/100 g)
Vit_D_IU      N 10     Vitamin D (IU/100 g)
Vit_K         N 10.1   Vitamin K (phylloquinone) (μg/100 g)
FA_Sat        N 10.3   Saturated fatty acid (g/100 g)
FA_Mono       N 10.3   Monounsaturated fatty acids (g/100 g)
FA_Poly       N 10.3   Polyunsaturated fatty acids (g/100 g)
Cholestrl     N 10.3   Cholesterol (mg/100 g)
GmWt_1        N 9.2    First household weight for this item from the Weight file.‡
GmWt_Desc1    A 120    Description of household weight number 1.
GmWt_2        N 9.2    Second household weight for this item from the Weight file.‡
GmWt_Desc2    A 120    Description of household weight number 2.
Refuse_Pct    N2       Percent refuse.§

*   Primary key for the Abbreviated file.
†   For a 200-character description and other descriptive information, link to the Food Description file.
‡   For the complete list and description of the measure, link to the Weight file.
§   For a description of refuse, link to the Food Description file.

*/

CREATE TABLE IF NOT EXISTS abbreviated (
  ndb_no VARCHAR(5),
  short_desc VARCHAR(60),
  water NUMERIC(10, 2),
  energy_kcal NUMERIC(10),
  protein NUMERIC(10, 2),
  lipid_total NUMERIC(10, 2),
  ash NUMERIC(10, 2),
  carbohydrate NUMERIC(10, 2),
  fiber_td NUMERIC(10, 1),
  sugar_total NUMERIC(10, 2),
  calcium NUMERIC(10),
  iron NUMERIC(10, 2),
  magnesium NUMERIC(10),
  phosphorus NUMERIC(10),
  potassium NUMERIC(10),
  sodium NUMERIC(10),
  zinc NUMERIC(10, 2),
  copper NUMERIC(10, 3),
  manganese NUMERIC(10, 3),
  selenium NUMERIC(10, 1),
  vit_c NUMERIC(10, 1),
  thiamin NUMERIC(10, 3),
  riboflavin NUMERIC(10, 3),
  niacin NUMERIC(10, 3),
  panto_acid NUMERIC(10, 3),
  vit_b6 NUMERIC(10, 3),
  folate_total NUMERIC(10),
  folic_acid NUMERIC(10),
  food_folate NUMERIC(10),
  folate_dfe NUMERIC(10),
  choline_total NUMERIC(),
  b12 NUMERIC(10, 2),
  a_iu NUMERIC(10),
  a_rae NUMERIC(10),
  retinol NUMERIC(10),
  alpha_carotene NUMERIC(10),
  beta_carotene NUMERIC(10),
  beta_crypt NUMERIC(10),
  lycopene NUMERIC(10),
  lutzea NUMERIC(10),
  e NUMERIC(10, 2),
  d_mcg NUMERIC(10, 1),
  d_iu NUMERIC(10),
  k NUMERIC(10, 1),
  fa_sat NUMERIC(10, 3),
  fa_mono NUMERIC(10, 3),
  fa_poly NUMERIC(10, 3),
  cholesterol NUMERIC(10, 3),
  bmwt1 NUMERIC(9, 2),
  gmwt_desc1 VARCHAR(120),
  gmwt2 NUMERIC(9, 2),
  gmwt_desc2 VARCHAR(120),
  refuse_pct NUMERIC(2)
);

comment on column abbreviated.ndb_no is '5-digit Nutrient Databank number that uniquely identifies a food item. If this field is defined as numeric, the leading zero will be lost.';
comment on column abbreviated.short_desc is '60-character abbreviated description of food item.†';
comment on column abbreviated.water is 'Water (g/100 g)';
comment on column abbreviated.energy_kcal is 'Food energy (kcal/100 g)';
comment on column abbreviated.protein is 'Protein (g/100 g)';
comment on column abbreviated.lipid_total is 'Total lipid (fat) (g/100 g)';
comment on column abbreviated.ash is 'Ash (g/100 g)';
comment on column abbreviated.carbohydrate is 'Carbohydrate, by difference (g/100 g)';
comment on column abbreviated.fiber_td is 'Total dietary fiber (g/100 g)';
comment on column abbreviated.sugar_total is 'Total sugars (g/100 g)';
comment on column abbreviated.calcium is 'Calcium (mg/100 g)';
comment on column abbreviated.iron is 'Iron (mg/100 g)';
comment on column abbreviated.magnesium is 'Magnesium (mg/100 g)';
comment on column abbreviated.phosphorus is 'Phosphorus (mg/100 g)';
comment on column abbreviated.potassium is 'Potassium (mg/100 g)';
comment on column abbreviated.sodium is 'Sodium (mg/100 g)';
comment on column abbreviated.zinc is 'Zinc (mg/100 g)';
comment on column abbreviated.copper is 'Copper (mg/100 g)';
comment on column abbreviated.manganese is 'Manganese (mg/100 g)';
comment on column abbreviated.selenium is 'Selenium (μg/100 g)';
comment on column abbreviated.vit_c is 'Vitamin C (mg/100 g)';
comment on column abbreviated.thiamin is 'Thiamin (mg/100 g)';
comment on column abbreviated.riboflavin is 'Riboflavin (mg/100 g)';
comment on column abbreviated.niacin is 'Niacin (mg/100 g)';
comment on column abbreviated.panto_acid is 'Pantothenic acid (mg/100 g)';
comment on column abbreviated.vit_b6 is 'Vitamin B6 (mg/100 g)';
comment on column abbreviated.folate_total is 'Folate, total (μg/100 g)';
comment on column abbreviated.folic_acid is 'Folic acid (μg/100 g)';
comment on column abbreviated.food_folate is 'Food folate (μg/100 g)';
comment on column abbreviated.folate_dfe is 'Folate (μg dietary folate equivalents/100 g)';
comment on column abbreviated.choline_total is 'Choline, total (mg/100 g)';
comment on column abbreviated.b12 is 'Vitamin B12 (μg/100 g)';
comment on column abbreviated.a_iu is 'Vitamin A (IU/100 g)';
comment on column abbreviated.a_rae is 'Vitamin A (μg retinol activity equivalents/100g)';
comment on column abbreviated.retinol is 'Retinol (μg/100 g)';
comment on column abbreviated.alpha_carotene is 'Alpha-carotene (μg/100 g)';
comment on column abbreviated.beta_carotene is 'Beta-carotene (μg/100 g)';
comment on column abbreviated.beta_crypt is 'Beta-cryptoxanthin (μg/100 g)';
comment on column abbreviated.lycopene is 'Lycopene (μg/100 g)';
comment on column abbreviated.lutzea is 'Lutein+zeazanthin (μg/100 g)';
comment on column abbreviated.e is 'Vitamin E (alpha-tocopherol) (mg/100 g)';
comment on column abbreviated.d_mcg is 'Vitamin D (μg/100 g)';
comment on column abbreviated.d_iu is 'Vitamin D (IU/100 g)';
comment on column abbreviated.k is 'Vitamin K (phylloquinone) (μg/100 g)';
comment on column abbreviated.fa_sat is 'Saturated fatty acid (g/100 g)';
comment on column abbreviated.fa_mono is 'Monounsaturated fatty acids (g/100 g)';
comment on column abbreviated.fa_poly is 'Polyunsaturated fatty acids (g/100 g)';
comment on column abbreviated.cholesterol is 'Cholesterol (mg/100 g)';
comment on column abbreviated.bmwt1 is 'First household weight for this item from the Weight file.‡';
comment on column abbreviated.gmwt_desc1 is 'Description of household weight number 1.';
comment on column abbreviated.gmwt2 is 'Second household weight for this item from the Weight file.‡';
comment on column abbreviated.gmwt_desc2 is 'Description of household weight number 2.';
comment on column abbreviated.refuse_pct is 'Percent refuse.§';

comment on table aabbreviated.bbreviated is 'Contains all the food items found in the relational database, but contains the information in one record per food item.';
