const { Router } = require('express')
const food = require('../controllers/foods')
const router = Router()

router.get('/food', food.sampleFood)
router.get('/food/search/:term', food.getFoodByTerm)
router.get('/food/:id', food.getFoodById)
router.get('/food/:id/nutrients', food.getNutritionForFoodById)
// router.get('/food/nutrients/:id', food.getNutritionForFoodById)
router.get('/food/nutrition/:term', food.getFoodData)
router.get('/food/nutrientlist', food.getAllNutrients)
router.get('/food/nutrients/:id', food.getNutrientById)
router.get('/food/nutrients/:term', food.getNutrientByTerm)
router.get('/food/categories', food.foodCategories)
router.get('/food/categories/:id', food.foodCategoriesById)
// router.get('/nutrients/:id', food.getNutrientById)

module.exports = router