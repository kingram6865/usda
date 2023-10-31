COPY food_group_description (
  fdgrp_cd,
  fdgrp_desc) FROM '/home/kingram/PROJECTS/usda/data/v28/FD_GROUP.txt'
CSV
DELIMITER '^'
QUOTE '~'
ENCODING 'SQL_ASCII'