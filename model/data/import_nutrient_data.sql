COPY nutrient_data (
  ndb_no,
  nutr_no,
  nutr_val,
  num_data_pts,
  std_error,
  src_cd,
  deriv_cd,
  ref_ndb_no,
  add_nutr_mark,
  num_studies,
  min,
  max,
  df,
  low_eb,
  up_eb,
  stat_cmt,
  addmod_date,
  cc) FROM '/home/kingram/PROJECTS/usda/data/v28/NUT_DATA.txt'
CSV
DELIMITER '^'
QUOTE '~'
ENCODING 'SQL_ASCII'