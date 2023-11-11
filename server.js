const color = require('./utilities/consoleColors')
const express = require('express')
const cors = require('cors')
const logger = require('morgan')
const routes = require('./routes/main')
const PORT = process.env.PORT || 3019
const SERVER = process.env.HOST || localhost
const TIME = new Date()

const app = express()
app.use(cors())

/* dev, combined or common */
app.use(logger('common'))
app.use(express.json())
app.use('/api', routes)

let message = `Nutrition API Server Started -- Server: ${color.brightYellow}${SERVER}${color.Reset}, Port: ${color.brightYellow}${PORT}${color.Reset}, start time: (${color.brightGreen}${TIME.toLocaleString()}${color.Reset})`
app.listen(PORT, () => console.log(message))
