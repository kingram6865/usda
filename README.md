# USDA

This project is the prototype for a full stack app which uses information from the USDA Nutrient database to retrieve and display nutritional data about foods in JSON format.

## Setup

Create a `.env` file with Postgres database parameters:

DBUSER=
DBPW=
DBHOST=
DBPORT=
DB=

## Backend - API

  The backend is a REST API using JavaScript and Express to develop the endpoints.

### Endpoints

#### Test endpoint, returns a preselected food id
/food

#### Retrieve all info about a particular food
/food/{id}/nutrition/

#### Retrieve food and nutrion data by search term
/food/nutrition/{term}

#### Retrieve nutrients info by string search
/food/nutrients/{term}

#### Retrieve a list of all nutrients
/food/nutrients

#### Retrieve info about a specific nutrient by id
/food/nutrients/{id}

#### Retrieve foods that contain any of the nine essential amino acids
/food/{id}/nutrients/aminos

#### Retrieve foods that contain the named amino in the minimum quantity
/food/nutrients/aminos/{term}/{quantity}

## Frontend - Web App


## Frontend - Mobile App (Android)