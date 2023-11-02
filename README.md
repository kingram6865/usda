# USDA

This project is the prototype for a full stack app which uses information from the USDA Nutrient database to retrieve and display nutritional data for most foods.

## Setup

Create a `.env` file with Postgres database parameters and HOST parameter for server:
```
HOST=<FQDN or IP>
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

- <span style="color:Yellow">/food</span> - <span style="color:LightBlue">Test endpoint, returns a preselected food id</span>

- <span style="color:Yellow">/food/categories/{id}</span> - <span style="color:LightBlue">Food categories (Food Groups)</span>

- <span style="color:Yellow">/food/{id}/nutrients/</span> - <span style="color:LightBlue">Retrieve all info about a particular food</span>

- <span style="color:Yellow">/food/nutrition/{term}?page=number&limit=n</span> - <span style="color:LightBlue">Retrieve food and nutrition data by search term (`The search term is a string within the food long description. number = 'page number', n = 'items per page'`)</span>

- <span style="color:Yellow">/food/nutrients</span> - <span style="color:LightBlue">Retrieve list of all nutrients</span>

- <span style="color:Yellow">/food/nutrients/{term}</span> - <span style="color:LightBlue">Retrieve nutrient info, search by nutrient name</span>

- <span style="color:Yellow">/food/nutrients/{id}</span> - <span style="color:LightBlue">Retrieve info about a specific nutrient by id</span>

- <span style="color:Yellow">/food/nutrients/aminos</span> - <span style="color:LightBlue">Retrieve a list of all Amino Acids</span>

- <span style="color:Yellow">/food/nutrients/aminos/essential</span> - <span style="color:LightBlue">Retrieve a list of all Essential Amino Acids</span>

### Endpoints Not yet implemented

- <span style="color:Red">/food/{id}/nutrients/aminos</span> - <span style="color:LightBlue">Retrieve foods that contain any of the nine essential amino acids</span>

- <span style="color:Red">/food/nutrients/aminos/{term}/{quantity}</span> - <span style="color:LightBlue">Retrieve foods that contain the named amino in the minimum quantity</span>

## Frontend - Web App


## Frontend - Mobile App (Android)