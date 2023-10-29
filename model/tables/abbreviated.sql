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

CREATE TABLE [IF NOT EXISTS] abbreviated (
  ndb_no VARCHAR(5),
  short_desc VARCHAR(60),
  water NUMBER(10, 2),
  energy_kcal NUMBER(10),
  protein NUMBER(10, 2),
  lipid_total NUMBER(10, 2),
  ash NUMBER(10, 2),
  carbohydrate NUMBER(10, 2),
  fiber_td NUMBER(10, 1),
  sugar_total NUMBER(10, 2),
  calcium NUMBER(10),
  iron NUMBER(10, 2),
  magnesium NUMBER(10),
  phosphorus NUMBER(10),
  potassium NUMBER(10),
  sodium NUMBER(10),
  zinc NUMBER(10, 2),
  copper NUMBER(10, 3),
  manganese NUMBER(10, 3),
  selenium NUMBER(10, 1),
  vit_c NUMBER(10, 1),
  thiamin NUMBER(10, 3),
  riboflavin NUMBER(10, 3),
  niacin NUMBER(10, 3),
  panto_acid NUMBER(10, 3),
  vit_b6 NUMBER(10, 3),
  folate_total NUMBER(10),
  folic_acid NUMBER(10),
  food_folate NUMBER(10),
  folate_dfe NUMBER(10),
  choline_total NUMBER(),
  b12 NUMBER(10, 2),
  a_iu NUMBER(10),
  a_rae NUMBER(10),
  retinol NUMBER(10),
  alpha_carotene NUMBER(10),
  beta_carotene NUMBER(10),
  beta_crypt NUMBER(10),
  lycopene NUMBER(10),
  lutzea NUMBER(10),
  e NUMBER(10, 2),
  d_mcg NUMBER(10, 1),
  d_iu NUMBER(10),
  k NUMBER(10, 1),
  fa_sat NUMBER(10, 3),
  fa_mono NUMBER(10, 3),
  fa_poly NUMBER(10, 3),
  cholesterol NUMBER(10, 3),
  bmwt1 NUMBER(9, 2),
  gmwt_desc1 VARCHAR(120),
  gmwt2 NUMBER(9, 2),
  gmwt_desc2 VARCHAR(120),
  refuse_pct NUMBER(2)
);

comment on column ndb_no is '5-digit Nutrient Databank number that uniquely identifies a food item. If this field is defined as numeric, the leading zero will be lost.';
comment on column short_desc is '60-character abbreviated description of food item.†';
comment on column water is 'Water (g/100 g)';
comment on column energy_kcal is 'Food energy (kcal/100 g)';
comment on column protein is 'Protein (g/100 g)';
comment on column lipid_total is 'Total lipid (fat) (g/100 g)';
comment on column ash is 'Ash (g/100 g)';
comment on column carbohydrate is 'Carbohydrate, by difference (g/100 g)';
comment on column fiber_td is 'Total dietary fiber (g/100 g)';
comment on column sugar_total is 'Total sugars (g/100 g)';
comment on column calcium is 'Calcium (mg/100 g)';
comment on column iron is 'Iron (mg/100 g)';
comment on column magnesium is 'Magnesium (mg/100 g)';
comment on column phosphorus is 'Phosphorus (mg/100 g)';
comment on column potassium is 'Potassium (mg/100 g)';
comment on column sodium is 'Sodium (mg/100 g)';
comment on column zinc is 'Zinc (mg/100 g)';
comment on column copper is 'Copper (mg/100 g)';
comment on column manganese is 'Manganese (mg/100 g)';
comment on column selenium is 'Selenium (μg/100 g)';
comment on column vit_c is 'Vitamin C (mg/100 g)';
comment on column thiamin is 'Thiamin (mg/100 g)';
comment on column riboflavin is 'Riboflavin (mg/100 g)';
comment on column niacin is 'Niacin (mg/100 g)';
comment on column panto_acid is 'Pantothenic acid (mg/100 g)';
comment on column vit_b6 is 'Vitamin B6 (mg/100 g)';
comment on column folate_total is 'Folate, total (μg/100 g)';
comment on column folic_acid is 'Folic acid (μg/100 g)';
comment on column food_folate is 'Food folate (μg/100 g)';
comment on column folate_dfe is 'Folate (μg dietary folate equivalents/100 g)';
comment on column choline_total is 'Choline, total (mg/100 g)';
comment on column b12 is 'Vitamin B12 (μg/100 g)';
comment on column a_iu is 'Vitamin A (IU/100 g)';
comment on column a_rae is 'Vitamin A (μg retinol activity equivalents/100g)';
comment on column retinol is 'Retinol (μg/100 g)';
comment on column alpha_carotene is 'Alpha-carotene (μg/100 g)';
comment on column beta_carotene is 'Beta-carotene (μg/100 g)';
comment on column beta_crypt is 'Beta-cryptoxanthin (μg/100 g)';
comment on column lycopene is 'Lycopene (μg/100 g)';
comment on column lutzea is 'Lutein+zeazanthin (μg/100 g)';
comment on column e is 'Vitamin E (alpha-tocopherol) (mg/100 g)';
comment on column d_mcg is 'Vitamin D (μg/100 g)';
comment on column d_iu is 'Vitamin D (IU/100 g)';
comment on column k is 'Vitamin K (phylloquinone) (μg/100 g)';
comment on column fa_sat is 'Saturated fatty acid (g/100 g)';
comment on column fa_mono is 'Monounsaturated fatty acids (g/100 g)';
comment on column fa_poly is 'Polyunsaturated fatty acids (g/100 g)';
comment on column cholesterol is 'Cholesterol (mg/100 g)';
comment on column bmwt1 is 'First household weight for this item from the Weight file.‡';
comment on column gmwt_desc1 is 'Description of household weight number 1.';
comment on column gmwt2 is 'Second household weight for this item from the Weight file.‡';
comment on column gmwt_desc2 is 'Description of household weight number 2.';
comment on column refuse_pct is 'Percent refuse.§';

comment on table abbreviated is 'Contains all the food items found in the relational database, but contains the information in one record per food item.';
