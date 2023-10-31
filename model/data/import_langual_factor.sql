COPY langual_factor (
  ndb_no,
  factor_code) FROM '/home/kingram/PROJECTS/usda/data/v28/LANGUAL.txt'
CSV
DELIMITER '^'
QUOTE '~'
ENCODING 'SQL_ASCII'