COPY langual_factor_description (
  factor_code,
  description) FROM '/home/kingram/PROJECTS/usda/data/v28/LANGDESC.txt'
CSV
DELIMITER '^'
QUOTE '~'
ENCODING 'SQL_ASCII'