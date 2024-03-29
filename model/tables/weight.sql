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

CREATE TABLE IF NOT EXISTS weight (
  ndb_no VARCHAR(5),
  seq VARCHAR(2),
  amount NUMERIC(6,3),
  measure VARCHAR(84),
  gm_wgt NUMERIC(8,1),
  num_data_pts NUMERIC(4),
  std_dev NUMERIC(8,3)
);

comment on column weight.ndb_no is '5-digit Nutrient Databank number that uniquely identifies a food item. If this field is defined as numeric, the leading zero will be lost.';
comment on column weight.seq is 'Sequence number.';
comment on column weight.amount is 'Unit modifier (for example, 1 in “1 cup”).';
comment on column weight.measure is 'Description (for example, cup, diced, and 1-inch pieces).';
comment on column weight.gm_wgt is 'Gram weight.';
comment on column weight.num_data_pts is 'Number of data points.';
comment on column weight.std_dev is 'Standard deviation.';

comment on table weight is 'Contains the weight in grams of a number of common measures for each food item.';