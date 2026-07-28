CREATE TABLE `microbe` (
  `id` INTEGER,
  `food_id` INTEGER,
  `method` VARCHAR(32),
  `microbe_code` VARCHAR(32),
  `min_value` INTEGER,
  `max_value` TEXT,
  `uom` VARCHAR(16)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
