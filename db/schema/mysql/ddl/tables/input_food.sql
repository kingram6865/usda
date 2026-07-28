CREATE TABLE `input_food` (
  `id` INTEGER,
  `fdc_id` INTEGER,
  `fdc_id_of_input_food` TEXT,
  `seq_num` INTEGER,
  `amount` DECIMAL(8, 4),
  `sr_code` INTEGER,
  `sr_description` VARCHAR(255),
  `unit` VARCHAR(16),
  `portion_code` INTEGER,
  `portion_description` VARCHAR(64),
  `gram_weight` DECIMAL(7, 3),
  `retention_code` INTEGER
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
