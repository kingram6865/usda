const express = require('express')
const cors = require('cors')
const logger = require('morgan')
const routes = require('./routes/main')
const db = require('./db/connection')
const PORT = process.env.PORT || 3020
console.log(`API Server set for PORT ${process.env.PORT} on ${process.env.HOST}`)

const app = express()
app.use(cors())
app.use(express.urlencoded({extended: true}))
app.use(express.json())

app.use(logger('dev'))
// app.use('/api', 'routes')

// db.on('error', console.error.bind(console, 'Database connection error'))

app.listen(PORT, () => console.log(`Listening on port: ${PORT}`))