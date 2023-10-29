/*

Food Group Description (file name = FD_GROUP).

A support file to the Food Description file and contains a list of food groups used in SR28 and their descriptions.



Field name    Type      Blank   Description
fdgrp_cd      A 4*      N       4-digit code identifying a food group. Only the first 2 digits are currently assigned. In the future, the last 2 digits may be used. Codes may not be consecutive.
fdgrp_desc    A 60      N       Name of food group.
* Primary key for the Food Group Description file.



*/

CREATE TABLE [IF NOT EXISTS] food_description (
  fdgrp_cd      VARCHAR(4),
  fdgrp_desc    VARCHAR(60)
);

comment on column fdgrp_cd is '4-digit code identifying a food group. Only the first 2 digits are currently assigned. In the future, the last 2 digits may be used. Codes may not be consecutive.';
comment on column fdgrp_desc is 'Name of food group.';

comment on table food_description is 'A support file to the food_description table and contains a list of food groups used in SR28 and their descriptions.';
