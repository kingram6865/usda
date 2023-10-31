COPY data_sources (
  datasrc_id,
  authors,
  title,
  year,
  journal,
  vol_city,
  issue_state,
  start_page,
  end_page) FROM '/home/kingram/PROJECTS/usda/data/v28/DATA_SRC.txt'
CSV
DELIMITER '^'
QUOTE '~'
ENCODING 'SQL_ASCII'