const { Router } = require('express')
const food = require('../controllers/foods')
const nutrients = require('../controllers/food_nutrients')

const router = Router()

router.get('/foods', food.getFoods)
router.get('/foods/:id', food,getFood)
router.get('/nutrients', nutrients.getNutrients)
router.get('/nutrients/:id', nutrients.getNutrient)

module.exports = router