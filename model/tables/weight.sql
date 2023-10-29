/*
Weight (file name = WEIGHT). 
Contains the weight in grams of a number of common measures for each food item.

   Links to Food Description file by NDB_No
   Links to Nutrient Data file by NDB_No

Field name         Type    Blank    Description
NDB_No             A 5*       N     5-digit Nutrient Databank number that uniquely identifies a food item. If this field is defined as numeric, the leading zero will be lost.
Seq                A 2*       N     Sequence number.
Amount             N 5.3      N     Unit modifier (for example, 1 in “1 cup”).
Msre_Desc          A 84       N     Description (for example, cup, diced, and 1-inch pieces).
Gm_Wgt             N 7.1      N     Gram weight.
Num_Data_Pts       N3         Y     Number of data points.
Std_Dev            N 7.3      Y     Standard deviation.

* Primary keys for the Weight file.
*/

CREATE TABLE [IF NOT EXISTS] weight (
  ndb_no VARCHAR(5),
  seq VARCHAR(2),
  amount NUMBER(5,3),
  msre_desc VARCHAR(84),
  gm_wgt NUMBER(7,1),
  num_data_pts NUMBER(3),
  std_dev NUMBER(7,3)
);

comment on column ndb_no is '5-digit Nutrient Databank number that uniquely identifies a food item. If this field is defined as numeric, the leading zero will be lost.';
comment on column seq is 'Sequence number.';
comment on column amount is 'Unit modifier (for example, 1 in “1 cup”).';
comment on column msre_desc is 'Description (for example, cup, diced, and 1-inch pieces).';
comment on column gm_wgt is 'Gram weight.';
comment on column num_data_pts is 'Number of data points.';
comment on column std_dev is 'Standard deviation.';

comment on table weight is 'Contains the weight in grams of a number of common measures for each food item.';