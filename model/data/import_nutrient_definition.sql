COPY nutrient_definition (
  nutr_no
  units
  tagname
  nutrdesc
  num_dec
  sr_order) FROM '/home/kingram/PROJECTS/usda/data/v28/NUTR_DEF.txt'
CSV
DELIMITER '^'
QUOTE '~'
ENCODING 'SQL_ASCII'