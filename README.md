# USDA

This project is the prototype for a full stack app which uses information from the USDA Nutrient database to retrieve and display nutritional data about foods in JSON format.

## Backend - API

  The backend is a REST API using JavaScript and Express to develop the endpoints.

### Endpoints

#### Retrieve all info about a particular food
/food/nutrition/:id

#### Retrieve food and nutrion data by search term
/food/nutrition/:term

#### Retrieve nutrients info by string search
/food/nutrients/:term

#### Retrieve a list of all nutrients
/food/nutrients

#### Retrieve specific nutrient info by id
/food/nutrients/:id

#### Retrieve foods that contain any of the nine essential amino acids
/food/nutrients/aminos

#### Retrieve foods that contain the named amino in the minimum quantity
/food/nutrients/aminos/:term/quantity

## Frontend - Web App


## Frontend - Mobile App (Android)