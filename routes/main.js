const { Router } = require('express')
const food = require('../controllers/foods')
const router = Router()

router.get('/food/search/:term', food.getFoodByTerm)
router.get('/food/nutrients/aminos', food.getAllAminos)
router.get('/food/nutrients/aminos/essential', food.getAllEssentialAminos)
router.get('/food/nutrients', food.getAllNutrients)
/* Example: /food/nutrition/dairy?limit=25&page=1 */
router.get('/food/nutrition/:term', food.getFoodData)
router.get('/food/nutrients/id/:id', food.getNutrientById)
router.get('/food/nutrients/name/:term', food.getNutrientByName)
router.get('/food/category/:term', food.getFoodByCategory)
router.get('/food/categories/:id', food.foodCategoriesById)
router.get('/food/categories', food.foodCategories)
router.get('/food', food.sampleFood)
router.get('/food/:id', food.getFoodById)
router.get('/food/:id/nutrients', food.getNutritionForFoodById)

module.exports = router