/*
LanguaL Factors Description (File name = LANGDESC).
A support file to the LanguaL Factor file and contains the descriptions for only those factors used in coding the selected food items codes in this release of SR.

    Links to the LanguaL Factor file by the Factor_Code field

Field name    Type    Blank  Description
Factor_Code   A 5*      N    The LanguaL factor from the Thesaurus. Only those codes used to factor the foods contained in the LanguaL Factor file are included in this file.
Description   A 140     N    The description of the LanguaL Factor Code from the thesaurus.

* Primary key for the LanguaL Factor Description file.

*/

CREATE TABLE IF NOT EXISTS langual_factor_description (
  factor_code   VARCHAR(5), 
  description   VARCHAR(140)
);

comment on column langual_factor_description.factor_code is 'The LanguaL factor from the Thesaurus. Only those codes used to factor the foods contained in the LanguaL Factor file are included in this file.';
comment on column langual_factor_description.description is 'The description of the LanguaL Factor Code from the thesaurus.';

comment on table langual_factor_description is 'A support file to the langual_factor table and contains the descriptions for only those factors used in coding the selected food items codes in this release of SR.';