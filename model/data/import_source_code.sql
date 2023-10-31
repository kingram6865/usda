COPY source_code (
  src_cd
  srccd_desc) FROM '/home/kingram/PROJECTS/usda/data/v28/SRC_CD.txt'
CSV
DELIMITER '^'
QUOTE '~'
ENCODING 'SQL_ASCII'