const { Router } = require('express')
const food = require('../controllers/foods')
const router = Router()

router.get('/foods', food.sampleFood)
router.get('/food/search/:term', food.getFoodByTerm)
router.get('/food/id/:id', food.getFoodById)
router.get('/food/nutrition/:term', food.getFoodData)
router.get('/food/nutrients/:id', food.getAllNutrients)
router.get('/nutrients/:term', food.getNutrientByTerm)
router.get('/nutrients/:id', food.getNutrientById)

module.exports = router