CREATE TABLE `food_portion` (
  `id` INTEGER,
  `fdc_id` INTEGER,
  `seq_num` INTEGER,
  `amount` DECIMAL(5, 2),
  `measure_unit_id` INTEGER,
  `portion_description` VARCHAR(128),
  `modifier` VARCHAR(128),
  `gram_weight` DECIMAL(6, 2),
  `data_points` INTEGER,
  `footnote` TEXT,
  `min_year_acquired` INTEGER
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
