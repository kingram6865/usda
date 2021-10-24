const express = require('express')
const cors = require('cors')
const logger = require('morgan')
const routes = require('./routes/main')
const db = require('./db/connection')
const PORT = process.env.PORT || 3019
const SERVER = process.env.HOST || localhost
console.log(`API Server set for PORT ${process.env.PORT} on ${process.env.HOST}`)

const app = express()
app.use(cors())
app.use(logger('dev'))
// app.use(express.urlencoded({extended: true}))
app.use(express.json())

app.use('/api', routes)

app.listen(PORT, SERVER, () => console.log(`Listening on ${SERVER}:${PORT}`))