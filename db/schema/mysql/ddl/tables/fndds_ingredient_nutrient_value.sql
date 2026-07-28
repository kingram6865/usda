CREATE TABLE `fndds_ingredient_nutrient_value` (
  `ingredient_code` INTEGER,
  `ingredient_description` VARCHAR(255),
  `nutrient_code` INTEGER,
  `nutrient_value` DECIMAL(10, 3),
  `nutrient_value_source` VARCHAR(64),
  `fdc_id` INTEGER,
  `derivation_code` VARCHAR(16),
  `sr_add_mod_year` INTEGER,
  `foundation_year_acquired` INTEGER,
  `start_date` DATE,
  `end_date` DATE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
