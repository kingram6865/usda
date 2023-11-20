const color = require('./utilities/consoleColors')
const fs = require('fs')
const https = require('https')
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
app.use(express.static(__dirname + '/static', { dotfiles: 'allow' }))
app.use(express.json())
app.use('/api', routes)

let httpMessage = `Nutrition API Server Started -- Server: ${color.brightYellow}${SERVER}${color.Reset}, Port: ${color.brightYellow}${PORT}${color.Reset}, start time: (${color.brightGreen}${TIME.toLocaleString()}${color.Reset})`
app.listen(PORT, () => console.log(message))

// https
//   .createServer(
//     {
//       key: fs.readFileSync('/etc/letsencrypt/path/to/key.pem'),
//       cert: fs.readFileSync('/etc/letsencrypt/path/to/cert.pem'),
//       ca: fs.readFileSync('/etc/letsencrypt/path/to/chain.pem'),
//     },
//     app
//   )
//   .listen(443, () => {
//     console.log('Listening...')
//   })