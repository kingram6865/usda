COPY food_description (ndb_no,
        foodgroup_code,
        long_desc,
        short_desc,
        common_name,
        mfg_name,
        survey,
        ref_desc,
        refuse,
        sciname,
        n_factor,
        pro_factor,
        fat_factor,
        cho_factor) FROM '/home/kingram/PROJECTS/usda/data/v28/FOOD_DES.txt'
CSV
DELIMITER '^'
QUOTE '~'
ENCODING 'SQL_ASCII';

/*
COPY food_description (ndb_no,
        foodgroup_code,
        long_desc,
        short_desc,
        common_name,
        mfg_name,
        survey,
        ref_desc,
        refuse,
        sciname,
        n_factor,
        pro_factor,
        fat_factor,
        cho_factor) FROM '/home/kingram/PROJECTS/usda/data/v28/CONVERTED/food_des.txt'
CSV
DELIMITER '^'
QUOTE '~'
ENCODING 'SQL_ASCII';
*/