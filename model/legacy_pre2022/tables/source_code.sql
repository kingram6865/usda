/*
Source Code (file name = SRC_CD). Contains codes indicating the type of data (analytical, calculated, assumed zero, and so on) in the Nutrient Data file. 

To improve the usability of the database and to provide values for the FNDDS, NDL
staff imputed nutrient values for a number of proximate components, total dietary fiber, total sugar, and vitamin and mineral values.

   Links to the Nutrient Data file by Src_Cd

Table 10.—Source Code File Format
    Field name    Type     Blank   Description
    Src_Cd        A 2*       N     A 2-digit code indicating type of data.
    SrcCd_Desc    A 60       N     Description of source code that identifies the type of nutrient data.

* Primary key for the Source Code file.
*/

CREATE TABLE IF NOT EXISTS source_code (
  src_cd        VARCHAR(2),
  srccd_desc    VARCHAR(60)
);

comment on column source_code.src_cd is 'A 2-digit code indicating type of data.';
comment on column source_code.srccd_desc is 'Description of source code that identifies the type of nutrient data.';

comment on table source_code is 'Contains codes indicating the type of data (analytical, calculated, assumed zero, and so on) in nutrient_data.';