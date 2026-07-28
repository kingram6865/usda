CREATE TABLE `food_attribute` (
  `id` INTEGER,
  `fdc_id` INTEGER,
  `seq_num` INTEGER,
  `food_attribute_type_id` INTEGER,
  `name` VARCHAR(128),
  `value` TEXT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
