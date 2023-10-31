COPY data_sources_link (
  ndb_no,
  nutr_no,
  datasrc_id) FROM '/home/kingram/PROJECTS/usda/data/v28/DATSRCLN.txt'
CSV
DELIMITER '^'
QUOTE '~'
ENCODING 'SQL_ASCII'