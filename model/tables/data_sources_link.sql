/*
Sources of Data Link (file name = DATSRCLN). 
Used to link the Nutrient Data file with the Sources of Data table. It is needed to resolve the many-to-many relationship between the two tables.

    Links to the Nutrient Data file by NDB No. and Nutr_No
    Links to the Nutrient Definition file by Nutr_No
    Links to the Sources of Data file by DataSrc_ID

Field name     Type     Blank    Description
NDB_No         A 5*     N        5-digit Nutrient Databank number that uniquely identifies a food item. If this field is defined as numeric, the leading zero will be lost.
Nutr_No        A 3*     N        Unique 3-digit identifier code for a nutrient.
DataSrc_ID     A 6*     N        Unique ID identifying the reference/source.

* Primary key for the Sources of Data Link file.
*/

CREATE TABLE IF NOT EXISTS data_sources_link (
  ndb_no VARCHAR(5),
  nutr_no VARCHAR(3),
  datasrc_id VARCHAR(6)
);

comment on column ndb_no is '5-digit Nutrient Databank number that uniquely identifies a food item. If this field is defined as numeric, the leading zero will be lost.';
comment on column nutr_no is 'Unique 3-digit identifier code for a nutrient.';
comment on column datasrc_id is 'Unique ID identifying the reference/source.';

comment on table data_sources_link is 'Used to link the Nutrient Data file with the Sources of Data table. It is needed to resolve the many-to-many relationship between the two tables.';