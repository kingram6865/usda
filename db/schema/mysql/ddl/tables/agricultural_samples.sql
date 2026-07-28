CREATE TABLE `agricultural_samples` (
  `fdc_id` INTEGER,
  `acquisition_date` DATE,
  `market_class` VARCHAR(16),
  `treatment` VARCHAR(16),
  `state` VARCHAR(16)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
