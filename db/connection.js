require('dotenv').config({ path: '../.env' })
const pg = require('pg-promise')()
const cn = `postgres://${process.env.DBUSER}:${process.env.DBPW}@${process.env.DBHOST}:${process.env.DBPORT}/${process.env.DB}`

const ssl = { rejectUnauthorized: false }
const config = {
  connectionString: `${cn}`,
}

const db = pg(config)

module.exports = db