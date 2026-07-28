CREATE TABLE `food_component` (
  `id` INTEGER,
  `fdc_id` INTEGER,
  `name` VARCHAR(32),
  `pct_weight` DECIMAL(4, 1),
  `is_refuse` VARCHAR(16),
  `gram_weight` DECIMAL(5, 1),
  `data_points` INTEGER,
  `min_year_acquired` INTEGER
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
