const express = require('express')
const cors = require('cors')
const logger = require('morgan')
const db = require('./db/connection')
const routes = require('./routes/main')
const PORT = process.env.PORT || 3019
const TIME = new Date()
// const SERVER = process.env.HOST || localhost
console.log(`API Server:  ${process.env.HOST}:${process.env.PORT} on ${TIME}`)

const app = express()
app.use(cors())
app.use(logger('dev'))
// app.use(express.urlencoded({extended: true}))
app.use(express.json())

app.use('/api', routes)

app.listen(PORT, () => console.log(`Listening on ${PORT}`))