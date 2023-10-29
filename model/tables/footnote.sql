/*
Footnote (file name = FOOTNOTE). 
Contains additional information about the food item, household weight, and nutrient value.

    Links to the Food Description file by NDB_No
    Links to the Nutrient Data file by NDB_No and when applicable, Nutr_No
    Links to the Nutrient Definition file by Nutr_No, when applicable

Table 13.—Footnote File Format
 Field name     Type Blank Description
    NDB_No          A5          N    5-digit Nutrient Databank number that uniquely identifies a food item. If this field is defined as numeric, the leading zero will be lost.
    Footnt_No       A4          N    Sequence number. If a given footnote applies to more than one nutrient number, the same footnote number is used. As a result, this file cannot be indexed and there is no primary key.
    Footnt_Typ      A1          N    Type of footnote:
                                     D = footnote adding information to the food description;
                                     M = footnote adding information to measure description;
                                     N = footnote providing additional information on a nutrient value. 
                                     If the Footnt_typ = N, the Nutr_No will also be filled in.
    Nutr_No         A3          Y    Unique 3-digit identifier code for a nutrient to which footnote applies.
    Footnt_Txt      A 200       N    Footnote text.
*/

CREATE TABLE IF NOT EXISTS footnotes (
  ndb_no          VARCHAR(5),
  footnote_no     VARCHAR(4),
  footnote_type   VARCHAR(1),
  nutr_no         VARCHAR(3),
  footnote_text   VARCHAR(200)
);


comment on column ndb_no is '5-digit Nutrient Databank number that uniquely identifies a food item. If this field is defined as numeric, the leading zero will be lost.';
comment on column footnote_no is 'Sequence number. If a given footnote applies to more than one nutrient number, the same footnote number is used. As a result, this file cannot be indexed and there is no primary key.';
comment on column footnote_type is 'Type of footnote: D = footnote adding information to the food description; M = footnote adding information to measure description; N = footnote providing additional information on a nutrient value. If the Footnt_typ = N, the Nutr_No will also be filled in.';
comment on column nutr_no is 'Unique 3-digit identifier code for a nutrient to which footnote applies.';
comment on column footnote_text is 'Footnote text.';

comment on table footnotes is 'Contains additional information about the food item, household weight, and nutrient value.';

