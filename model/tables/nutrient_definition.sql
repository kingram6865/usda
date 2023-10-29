/*
Nutrient Definition
A support file to the Nutrient Data file. It provides the 3-digit nutrient code, unit of measure, INFOODS tagname, and description.

    Links to the Nutrient Data file by Nutr_No

Field name    Type     Blank    Description
Nutr_No       A 3*        N     Unique 3-digit identifier code for a nutrient.
Units         A7          N     Units of measure (mg, g, μg, and so on).
Tagname       A 20        Y     International Network of Food Data Systems (INFOODS) Tagnames.† A unique abbreviation for a nutrient/food component developed by INFOODS to  aid in the interchange of data.
NutrDesc      A 60        N     Name of nutrient/food component.
Num_Dec       A1          N     Number of decimal places to which a nutrient value is rounded.
SR_Order      N6          N     Used to sort nutrient records in the same order as various reports produced from SR.

* Primary key for the Nutrient Definition file.
† INFOODS, 2014.

*/

CREATE TABLE [IF NOT EXISTS] nutrient_definition (
  nutr_no VARCHAR(3),
  units VARCHAR(7),
  tagname VARCHAR(20),
  nutrdesc VARCHAR(60),
  num_dec VARCHAR(1),
  sr_order NUMBER(6)
);

comment on column nutr_no is 'Unique 3-digit identifier code for a nutrient.';
comment on column units is 'Units of measure (mg, g, μg, and so on).';
comment on column tagname is 'International Network of Food Data Systems (INFOODS) Tagnames.† A unique abbreviation for a nutrient/food component developed by INFOODS to aid in the interchange of data.';
comment on column nutrdesc is 'Name of nutrient/food component.';
comment on column num_dec is 'Number of decimal places to which a nutrient value is rounded.';
comment on column sr_order is 'Used to sort nutrient records in the same order as various reports produced from SR.';

comment on table nutrient_definition is 'A support file to the nutrient_data table. It provides the 3-digit nutrient code, unit of measure, INFOODS tagname, and description.';
