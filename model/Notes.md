# Dev Notes
The best way to import CSV files is to use the [pgcsv](https://github.com/pudo/pgcsv) utility.

Template
```bash
pgcsv --db 'postgresql://{server}/db?user={user}&password={pw}' {table name} sample.csv
```

E.g.

```bash
pgcsv --db 'postgresql://localhost/textbooks?user=exampleuser&password=12345' books booklist.csv
```

# Data source

https://data.nal.usda.gov/search/field_resources%253Afield_format/zip-237/type/dataset?query=np107

Dataset: Composition of Foods Raw, Processed, Prepared USDA National Nutrient Database for Standard Reference
Last release number (2023) - Release 28
Archive File: sr28asc.zip [CSV - ASCII files delimited with commas and quotes]

Files:

sr28_doc.pdf - READ ME - Documentation and User Guide - Composition of Foods Raw, Processed, Prepared - 
                        USDA National Nutrient Database for Standard Reference, Release 28
DATA_SRC.txt - (Sources of Data) 
DATSRCLN.txt - (Sources of Data Link) relationship between the Sources of Data file and the Nutrient Data file.
DERIV_CD.txt - (Data Derivation Code Description)
FD_GROUP.txt - (Food Group Description)
FOOD_DES.txt - (Food Description)
FOOTNOTE.txt - (Footnote)
LANGDESC.txt - (LanguaL Factors Description)
LANGUAL.txt  - (LanguaL Factor) 
NUT_DATA.txt - (Nutrient Data)
NUTR_DEF.txt - (Nutrient Definition)
SRC_CD.txt   - (Source Code)
WEIGHT.txt   - (Gram Weight) contains the gram weights and measure descriptions for each food item

## Tables

### Table: food
Food has 9 distinct data types:
```
agricultural_acquisition
branded_food
experimental_food
foundation_food
market_acquistion
sample_food
sr_legacy_food
sub_sample_food
survey_fndds_food
```


|  Column      |  Type   | Collation | Nullable | 
| --------------- | ------- | --------- | -------- |
| fdc_id           | bigint  |           |          | 
| data_type        | text    |           |          | 
| description      | text    |           |          | 
| food_category_id | integer |           |          | 
| publication_date | date    |           |          | 

### Table: food_category
| Column    |  Type   | Collation | Nullable |
| --------- | ------- | --------- | -------- |
| id          | integer |           |          | 
| code        | integer |           |          | 
| description | text    |           |          | 

### Table: food_nutrient
| Column       |  Type   | Collation | Nullable |
| ------------ | ------- | --------- | -------- |
| id                | integer |           |          | 
| fdc_id            | integer |           |          | 
| nutrient_id       | integer |           |          | 
| amount            | numeric |           |          | 
| data_points       | integer |           |          | 
| derivation_id     | bigint  |           |          | 
| min               | text    |           |          | 
| max               | text    |           |          | 
| median            | text    |           |          | 
| footnote          | text    |           |          | 
| min_year_acquired | integer |           |          | 

### Table: nutrient
| Column    |  Type  | Collation | Nullable | 
|-------------|--------|-----------|----------|
| id           | bigint |           |          | 
| name         | text   |           |          | 
| unit_name    | text   |           |          | 
| nutrient_nbr | text   |           |          | 
| rank         | text   |           |          | 

## Indexes

create index idx_foodnutrient on food_nutrient(fdc_id, nutrient_id);
create index idx_nutrient on nutrient(id)
idx_food_category
idx_food_id
idx_food_name

## SQL

### Retrieve info on a food
Lists foods from all categories of data type


  ```
SELECT 
    fdc_id,
    data_type,
    description, 
    food_category_id
  FROM food
  WHERE 
    LOWER(description) LIKE '%garlic%' 
  ORDER by data_type, description;
  ```

### Retrieve a specific food item by string value
  ```
  SELECT 
    a.fdc_id, 
    a.description, 
    a.food_category_id, 
    b.nutrient_id, 
    b.amount 
  FROM food a 
  LEFT JOIN food_nutrient b on a.fdc_id = b.fdc_id 
  WHERE 
    LOWER(description) LIKE '%garlic%' 
  AND 
    food_category_id IS NOT NULL 
  ORDER by a.fdc_id;
  ```
### Retrieve a specific food by string, including nutrient info.

  ```
  SELECT 
    a.fdc_id, 
    a.description, 
    a.food_category_id, 
    b.nutrient_id, 
    c.name,
    b.amount,
    c.unit_name
  FROM food a 
  LEFT JOIN food_nutrient b on a.fdc_id = b.fdc_id 
  LEFT JOIN nutrient c on b.nutrient_id = c.id
  WHERE 
    LOWER(description) LIKE '%garlic%' 
  AND 
    food_category_id IS NOT NULL 
  ORDER by a.fdc_id;
```