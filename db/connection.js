const path = require('path')
require('dotenv').config({ 
  path: path.resolve('.env')
})

const pg = require('pg-promise')()
const cn = `postgres://${process.env.DBUSER}:${process.env.DBPW}@${process.env.DBHOST}:${process.env.DBPORT}/${process.env.DB}`

const ssl = { rejectUnauthorized: false }
const config = {
  connectionString: `${cn}`,
  ssl: ssl
}

function disconnect() {
  pg.end();
}

const db = pg(config)

module.exports = {
  db,
  disconnect
}