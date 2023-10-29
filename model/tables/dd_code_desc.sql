/*
Data Derivation Code Description (file name = DERIV_CD).
Provides information on how the nutrient values were determined.

The file contains the derivation codes and their descriptions.

   Links to the Nutrient Data file by Deriv_Cd

Table 11.—Data Derivation Code Description File Format
    Field name   Type     Blank    Description
    Deriv_Cd     A 4*       N      Derivation Code.
    Deriv_Desc   A 120      N     Description of derivation code giving specific information on how the value was determined.
* Primary key for the Data Derivation Code file.

*/

CREATE TABLE IF NOT EXISTS dd_code_desc (
    deriv_cd     VARCHAR(4),
    deriv_desc   VARCHAR(120)
);

comment on column deriv_cd is 'Derivation Code.';
comment on column deriv_desc is 'Description of derivation code giving specific information on how the value was determined.';

comment on table data_derivation_code is 'dd_code_desc (Data Derivation Code Description) table provides information on how the nutrient values were determined.';
