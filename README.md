# USDA

This project is the prototype for a full stack app which uses information from the USDA Nutrient database to retrieve and display nutritional data about foods in JSON format.

## Setup

Create a `.env` file with Postgres database parameters and HOST parameter for server:
```
HOST=<FDQN or IP>
DBUSER=<postgres user>
DBPW=<postgres user password>
DBHOST=<postgres server>
DBPORT=<postgres port>
DB=<postgres database>
```

Postgres connect string as JavaScript interpolated string:

```js
postgres://${process.env.DBUSER}:${process.env.DBPW}@${process.env.DBHOST}:${process.env.DBPORT}/${process.env.DB}
```

## Backend - API

  The backend is a REST API using JavaScript and Express to develop the endpoints.

### Endpoints

#### Test endpoint, returns a preselected food id
/food

#### Food categories (Food Groups)
/food/categories/:id

#### Retrieve all info about a particular food
/food/{id}/nutrition/

#### Retrieve food and nutrition data by search term
/food/nutrition/{term}

#### Retrieve list of all nutrients
/food/nutrients

#### Retrieve nutrient info, search by name
/food/nutrients/{term}

#### Retrieve a list of all nutrients
/food/nutrients

#### Retrieve a list of all Amino Acids
/food/nutrients/aminos

#### Retrieve a list of all Essential Amino Acids
/food/nutrients/aminos/essential

#### Retrieve info about a specific nutrient by id
/food/nutrients/{id}

### Endpoints (Not yet implemented)

#### Retrieve foods that contain any of the nine essential amino acids
/food/{id}/nutrients/aminos

#### Retrieve foods that contain the named amino in the minimum quantity
/food/nutrients/aminos/{term}/{quantity}

## Frontend - Web App


## Frontend - Mobile App (Android)