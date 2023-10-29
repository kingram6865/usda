/*
Nutrient Data
Contains the nutrient values and information about the values, including expanded statistical information.

    Links to the Food Description file by NDB_No
    Links to the Food Description file by Ref_NDB_No
    Links to the Weight file by NDB_No
    Links to the Footnote file by NDB_No and when applicable, Nutr_No
    Links to the Sources of Data Link file by NDB_No and Nutr_No
    Links to the Nutrient Definition file by Nutr_No
    Links to the Source Code file by Src_Cd
    Links to the Data Derivation Code Description file by Deriv_Cd

Field name      Type     Blank Description
NDB_No          A 5*      N    5-digit Nutrient Databank number that uniquely identifies a food item. If this field is defined as numeric, the leading zero will be lost.
Nutr_No         A 3*      N    Unique 3-digit identifier code for a nutrient.
Nutr_Val        N 10.3    N    Amount in 100 grams, edible portion †.
Num_Data_Pts    N 5.0     N    Number of data points is the number of analyses used to calculate the nutrient value. If the number of data points is 0, the value was calculated or imputed.
Std_Error       N 8.3     Y    Standard error of the mean. Null if cannot be calculated. The standard error is also not given if the number of data points is less than three.
Src_Cd          A2        N    Code indicating type of data.
Deriv_Cd        A4        Y    Data  Derivation Code  giving specific information on how the value is determined. This field is populated only for items added or updated starting with SR14. This field may not be populated if older records were used in the calculation of the mean value.
Ref_NDB_No      A5        Y    NDB number of the item used to calculate a missing value. Populated only for items added or updated starting with SR14.
Add_Nutr_Mark   A 1       Y    Indicates a vitamin or mineral added for fortification or enrichment. This field is populated for ready-to-eat breakfast cereals and many brand-name hot cereals in food group 08.
Num_Studies     N2        Y    Number of studies.
Min             N 10.3    Y    Minimum value.
Max             N 10.3    Y    Maximum value.
DF              N4        Y    Degrees of freedom.
Low_EB          N 10.3    Y    Lower 95% error bound.
Up_EB           N 10.3    Y    Upper 95% error bound.
Stat_cmt        A 10      Y    Statistical comments. See definitions below.
AddMod_Date     A10       Y    Indicates when a value was either added to the database or last modified.
CC              A1        Y    Confidence Code indicating data quality, based on evaluation of sample plan, sample handling, analytical method, analytical quality control, and number of samples analyzed. Not included in this release, but is planned for future releases.

* Primary keys for the Nutrient Data file.
† Nutrient values have been rounded to a specified number of decimal places for each nutrient. Number of decimal places is listed in the Nutrient Definition file.

*/

CREATE TABLE [IF NOT EXISTS] nutrient_data (
  ndb_no VARCHAR(5),
  nutr_no VARCHAR(3),
  nutr_val NUMBER(10,3),
  num_data_pts NUMBER(5,0),
  std_error NUMBER(8,3),
  src_cd VARCHAR(2),
  deriv_cd VARCHAR(4),
  ref_ndb_no VARCHAR(5),
  add_nutr_mark VARCHAR(1),
  num_studies NUMBER(2),
  min NUMBER(10,3),
  max NUMBER(10,3),
  df NUMBER(4),
  low_eb NUMBER(10,3),
  up_eb NUMBER(10,3),
  stat_cmt VARCHAR(10),
  addmod_date VARCHAR(10),
  cc VARCHAR(1)
);


comment on column ndb_no is '5-digit Nutrient Databank number that uniquely identifies a food item. If this field is defined as numeric, the leading zero will be lost.';
comment on column nutr_no is 'Unique 3-digit identifier code for a nutrient.';
comment on column nutr_val is 'Amount in 100 grams, edible portion †.';
comment on column num_data_pts is 'Number of data points is the number of analyses used to calculate the nutrient value. If the number of data points is 0, the value was calculated or imputed.';
comment on column std_error is 'Standard error of the mean. Null if cannot be calculated. The standard error is also not given if the number of data points is less than three.';
comment on column src_cd is 'Code indicating type of data.';
comment on column deriv_cd is 'Data  Derivation Code  giving specific information on how the value is determined. This field is populated only for items added or updated starting with SR14. This field may not be populated if older records were used in the calculation of the mean value.';
comment on column ref_ndb_no is 'NDB number of the item used to calculate a missing value. Populated only for items added or updated starting with SR14.';
comment on column add_nutr_mark is 'Indicates a vitamin or mineral added for fortification or enrichment. This field is populated for ready-to-eat breakfast cereals and many brand-name hot cereals in food group 08.';
comment on column num_studies is 'Number of studies.';
comment on column min is 'Minimum value.';
comment on column max is 'Maximum value.';
comment on column df is 'Degrees of freedom.';
comment on column low_eb is 'Lower 95% error bound.';
comment on column up_eb is 'Upper 95% error bound.';
comment on column stat_cmt is 'Statistical comments. See definitions below.';
comment on column addmod_date is 'Indicates when a value was either added to the database or last modified.';
comment on column cc is 'Confidence Code indicating data quality, based on evaluation of sample plan, sample handling, analytical method, analytical quality control, and number of samples analyzed. Not included in this release, but is planned for future releases.';

comment on table nutrient_data is 'Contains the nutrient values and information about the values, including expanded statistical information.';

create index on nutrient_data(ndb_no);

















