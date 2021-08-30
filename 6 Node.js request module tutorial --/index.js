const express = require('express')
const rp = require('request-promise')
const exphbs = require('express-handlebars')
const path = require('path');

const app = express()

app.engine('.hbs', exphbs({
  defaultLayout: 'main',
  extname: '.hbs',
  layoutsDir: path.join(__dirname, 'views/layouts')
}))
app.set('view engine', '.hbs')
app.set('views', path.join(__dirname, 'views'))

app.get('/:city', (req, res) => {
  rp({
    uri: 'http://dataservice.accuweather.com/locations/v1/cities/search',
    qs: {
      q: req.params.city,
      apiKey: 'iZnkpGKePsO7b9vslIf3pmSLAR7w05IL'
         // Use your accuweather API key here
    },
    json: true
  })
    .then((data) => {
      console.log(data)
      res.render('index', data)
    })
    .catch((err) => {
      console.log(err)
      res.render('error')
    })
})

app.listen(3000)
