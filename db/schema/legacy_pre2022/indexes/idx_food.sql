CREATE INDEX idx_food_id ON food USING hash (fdc_id);
CREATE INDEX idx_food_name ON food USING btree (description);
CREATE INDEX idx_food_category ON food USING hash (food_category_id);