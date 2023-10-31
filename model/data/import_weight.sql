COPY weight (
  ndb_no,
  seq,
  amount,
  measure,
  gm_wgt,
  num_data_pts,
  std_dev) FROM '/home/kingram/PROJECTS/usda/data/v28/WEIGHT.txt'
CSV
DELIMITER '^'
QUOTE '~'
ENCODING 'SQL_ASCII'