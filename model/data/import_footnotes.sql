COPY footnotes (
  ndb_no,
  footnote_no,
  footnote_type,
  nutr_no,
  footnote_text) FROM '/home/kingram/PROJECTS/usda/data/v28/FOOTNOTE.txt'
CSV
DELIMITER '^'
QUOTE '~'
ENCODING 'SQL_ASCII'