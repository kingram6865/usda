CREATE TABLE `market_acquisition` (
  `fdc_id` INTEGER,
  `brand_description` VARCHAR(64),
  `expiration_date` DATE,
  `label_weight` VARCHAR(64),
  `location` VARCHAR(16),
  `acquisition_date` DATE,
  `sales_type` VARCHAR(32),
  `sample_lot_nbr` VARCHAR(255),
  `sell_by_date` DATE,
  `store_city` VARCHAR(64),
  `store_name` VARCHAR(64),
  `store_state` VARCHAR(16),
  `upc_code` VARCHAR(32),
  `acquisition_number` VARCHAR(16)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
