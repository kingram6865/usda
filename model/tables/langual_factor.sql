/*
LanguaL Factor (File name = LANGUAL).

A support file to the Food Description file and contains the factors from the LanguaL Thesaurus used to code a particular food.

    Links to the Food Description file by the NDB_No field
    Links to LanguaL Factors Description file by the Factor_Code field

Field name      Type     Blank   Description
NDB_No          A 5*     N       5-digit Nutrient Databank number that uniquely identifies a food item. If this field is defined as numeric, the leading zero will be lost.
Factor_Code     A 5*     N       The LanguaL factor from the Thesaurus.
* Primary keys for the LanguaL Factor file.

*/

CREATE TABLE [IF NOT EXISTS] langual_factor (
  ndb_no          VARCHAR(5),
  factor_code     VARCHAR(5)
);

comment on column ndb_no is '5-digit Nutrient Databank number that uniquely identifies a food item. If this field is defined as numeric, the leading zero will be lost.';
comment on column factor_code is 'The LanguaL factor from the Thesaurus.';

comment on table langual_factor is 'A support file to food_description table and contains the factors from the LanguaL Thesaurus used to code a particular food.';
