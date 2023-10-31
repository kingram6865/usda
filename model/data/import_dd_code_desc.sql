COPY dd_code_desc (
  deriv_cd,
  deriv_desc) FROM '/home/kingram/PROJECTS/usda/data/v28/DERIV_CD.txt'
CSV
DELIMITER '^'
QUOTE '~'
ENCODING 'SQL_ASCII'