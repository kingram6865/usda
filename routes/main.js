const { Router } = require('express')
const controller = require('../controllers/foods')
const router = Router()

router.get('/foods', controller.sampleFood)
// router.get('/foods/:term', food.getFoodByTerm)
// router.get('/foods/:id', food.getFoodById)
// router.get('/food/nutrients/:id', food.getAllNutrients)
// router.get('/nutrients/:term', food.getNutrientByTerm)
// router.get('/nutrients/:id', food.getNutrientById)

module.exports = router