CREATE TABLE `food_nutrient` (
  `id` INTEGER,
  `fdc_id` INTEGER,
  `nutrient_id` INTEGER,
  `amount` DOUBLE,
  `data_points` INTEGER,
  `derivation_id` INTEGER,
  `min` DOUBLE,
  `max` DOUBLE,
  `median` DOUBLE,
  `loq` DOUBLE,
  `footnote` TEXT,
  `min_year_acquired` INTEGER,
  `percent_daily_value` DECIMAL(23, 18)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
