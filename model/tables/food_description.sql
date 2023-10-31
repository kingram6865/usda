/*
Food Description File (file name = FOOD_DES).

Contains long and short descriptions and food group designators for all food items, along with common
names, manufacturer name, scientific name, percentage and description of refuse, and factors used for 
calculating protein and kilocalories, if applicable. Items used in the FNDDS are also identified by 
value of “Y” in the Survey field.


Food Description File Format
============================
  Field name   Type     Blank    Description
  NDB_No        A 5*       N     5-digit Nutrient Databank number that uniquely identifies a food item. If this field is defined as numeric, the leading zero will be lost.
  FdGrp_Cd      A 4        N     4-digit code indicating food group to which a food item belongs.
  Long_Desc     A 200      N     200-character description of food item.
  Shrt_Desc     A 60       N     60-character abbreviated description of food item. Generated from the 200-character description using abbreviations in Appendix A. If short description is longer than 60 characters, additional abbreviations are made.
  ComName       A 100      Y     Other names commonly used to describe a food, including local or regional names for various foods, for example, “soda” or “pop” for “carbonated beverages.”
  ManufacName   A 65       Y     Indicates the company that manufactured the product, when appropriate.
  Survey        A 1        Y     Indicates if the food item is used in the USDA Food and Nutrient Database for Dietary Studies (FNDDS) and thus has a complete nutrient profile for the 65 FNDDS nutrients.
  Ref_desc      A 135      Y     Description of inedible parts of a food item (refuse), such as seeds or bone.
  Refuse        N 2        Y     Percentage of refuse.
  SciName       A 65       Y     Scientific name of the food item. Given for the least processed form of the food (usually raw), if applicable.
  N_Factor      N 4.2      Y     Factor for converting nitrogen to protein (see p. 12).
  Pro_Factor    N 4.2      Y     Factor for calculating calories from protein (see p. 14).
  Fat_Factor    N 4.2      Y     Factor for calculating calories from fat (see p. 14).
  CHO_Factor    N 4.2      Y     Factor for calculating calories from carbohydrate (see p. 14).
*/

CREATE TABLE IF NOT EXISTS food_description (
  ndb_no VARCHAR(5),
  foodgroup_code VARCHAR(4),
  long_desc VARCHAR(200),
  short_desc VARCHAR(60),
  common_name VARCHAR(100),
  mfg_name VARCHAR(65),
  survey VARCHAR(1),
  ref_desc VARCHAR(135),
  pefuse NUMERIC(2),
  sciname VARCHAR(65),
  n_factor NUMERIC(4,2),
  pro_factor NUMERIC(4,2),
  fat_factor NUMERIC(4,2),
  cho_factor NUMERIC(4,2),
);

comment on column food_description.ndb_no is '5-digit Nutrient Databank number that uniquely identifies a food item. If this field is defined as numeric, the leading zero will be lost.';
comment on column food_description.foodgroup_code is '4-digit code indicating food group to which a food item belongs.';
comment on column food_description.long_desc is '200-character description of food item.';
comment on column food_description.short_desc is '60-character abbreviated description of food item. Generated from the 200-character description using abbreviations in Appendix A. If short description is longer than 60 characters, additional abbreviations are made.';
comment on column food_description.common_name is 'Other names commonly used to describe a food, including local or regional names for various foods, for example, “soda” or “pop” for “carbonated beverages.”';
comment on column food_description.mfg_name is 'Indicates the company that manufactured the product, when appropriate.';
comment on column food_description.survey is 'Indicates if the food item is used in the USDA Food and Nutrient Database for Dietary Studies (FNDDS) and thus has a complete nutrient profile for the 65 FNDDS nutrients.';
comment on column food_description.ref_desc is 'Description of inedible parts of a food item (refuse), such as seeds or bone.';
comment on column food_description.pefuse is 'Percentage of refuse.';
comment on column food_description.sciname is 'Scientific name of the food item. Given for the least processed form of the food (usually raw), if applicable.';
comment on column food_description.n_factor is 'Factor for converting nitrogen to protein (see p. 12).';
comment on column food_description.pro_factor is 'Factor for calculating calories from protein (see p. 14).';
comment on column food_description.fat_factor is 'Factor for calculating calories from fat (see p. 14).';
comment on column food_description.cho_factor is 'Factor for calculating calories from carbohydrate (see p. 14).';

comment on table food_description is 'Contains long and short descriptions and food group designators for all food items, along with common names, manufacturer name, scientific name, percentage and description of refuse, and factors used for calculating protein and kilocalories, if applicable. Items used in the FNDDS are also identified by value of “Y” in the Survey field.';

create index on food_description(ndb_no);




