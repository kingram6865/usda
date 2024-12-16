# Nutrional Info API

This project is the prototype for a full stack app which uses information from the USDA Nutrient database to retrieve and display nutritional data for most foods. (The ones provided in the USDA database)

## Background

This API is built with Node.js and Express, with a PostgeSQL database and is a Read Only service.
Create, Update and Delete is not necessary since the data is managed on the database side.

This project originated from an idea I had for a spreadsheet I could use to manage my dietary needs in bodybuilding.
I wanted to maximize Amino Acid intake and to focus on foods that delivered the biggest delivery of required 
nutrients.

Due to my fascination with databases, I was able to find the USDA nutrition database on the internet.

Due to the USDA food value database being so comprehensive and detailed, the project grew. THe scope and possibilities 
increased.

When I learned how to properly develop and deploy a custom API, the project grew further and also developed more 
refinement.

At this time (November 5, 2023), it is intended to be a Full Stack Web Application.
At some point I would like to include AI to assist with analysis.

Also, in time it will be extended to a Mobile app (iOS and Android).

2023 11 01
- The API is built and functioning on several endpoints. More endpoints to follow

## Requirements

- Node.js (I recommend installing node using [NVM](https://github.com/nvm-sh/nvm))
- PostgreSQL
- React

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

- <span style="color:Yellow">/food/categories</span> - <span style="color:LightBlue">All Food categories (Food Groups)</span>
  
- <span style="color:Yellow">/food/category/byid/{id}</span> - <span style="color:LightBlue">Specific Food category (Food Groups)</span>

- <span style="color:Yellow">/food/`{id}`/nutrients/</span> - <span style="color:LightBlue">Retrieve all info about a particular food</span>

- <span style="color:Yellow">/food/nutrition/`{term}`?page=number&limit=n</span> - <span style="color:LightBlue">Retrieve food and nutrition data by search term (`The search term is a string within the food long description. number = 'page number', n = 'items per page'`)</span>

- <span style="color:Yellow">/food/nutrients</span> - <span style="color:LightBlue">Retrieve list of all nutrients</span>

- <span style="color:Yellow">/food/nutrients/`{term}`</span> - <span style="color:LightBlue">Retrieve nutrient info, search by nutrient name</span>

- <span style="color:Yellow">/food/nutrients/`{id}`</span> - <span style="color:LightBlue">Retrieve info about a specific nutrient by id</span>

- <span style="color:Yellow">/food/nutrients/aminos</span> - <span style="color:LightBlue">Retrieve a list of all Amino Acids</span>

- <span style="color:Yellow">/food/nutrients/aminos/essential</span> - <span style="color:LightBlue">Retrieve a list of all Essential Amino Acids</span>

### Endpoints Not yet implemented

- <span style="color:Red">/food/`{id}`/nutrients/aminos</span> - <span style="color:LightBlue">Retrieve foods that contain any of the nine essential amino acids in a quantity > 0</span>

- <span style="color:Red">/food/nutrients/aminos/`{food search term}`/`{quantity}`</span> - <span style="color:LightBlue">Retrieve foods that contain the named amino in the minimum quantity</span>

## Frontend - Web App


## Frontend - Mobile App (Android)