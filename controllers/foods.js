const { db } = require('../db/connection')

async function sampleFood (req, res) {  
  try {
    SQL=`SELECT * FROM food WHERE fdc_id = '1111496'`
    const rows = await db.any(SQL)
    console.log(rows)
    res.json(rows)
  } catch (error) {
    res.status(500).json({ error: error.message })
  }
}

const getFoodByTerm = async (req, res) => {
  let rows
  try {
    const SQL = `SELECT * FROM food WHERE LOWER(description) LIKE '%${req.params.term}%' and data_type NOT LIKE 'branded_food'`
    rows = await db.any(SQL)
    rows = [{"totalRecords": rows.length}, ...rows]
    res.json(rows)
  } catch (error) {
    res.status(500).json({ error: error.message })
  }
}

const getFoodById = async (req, res) => {
  let rows
  try {
    SQL=`SELECT * FROM food WHERE fdc_id = '${req.params.id}'`
    rows = await db.any(SQL)
    res.json(rows)
  } catch (error) {
    res.status(500).json({ error: error.message })
  }
}

const getAllNutrients = async (req, res) => {
  let rows
  try {
    SQL=`SELECT * FROM food_nutrients WHERE fdc_id = ${req.params.id}`
    rows = await db.any(SQL)
  } catch (error) {
    console.log(error)
  }
}

const getNutrientByTerm = async (req, res) => {
  let rows = {result: 'In progress'}
  try {
    SQL=``
    rows = await db.any(SQL)
  } catch (error) {
    console.log(error)
  }
}

const getNutrientById = async (req, res) => {
  let rows = {result: 'In progress'}
  try {
    SQL=``
    rows = await db.any(SQL)
  } catch (error) {
    console.log(error)
  }
}

const getFoodData = async (req, res) => {
  let rows
  try {
    SQL=`  SELECT 
    a.fdc_id, 
    a.description, 
    a.food_category_id, 
    b.nutrient_id, 
    c.name,
    b.amount,
    c.unit_name
  FROM food a 
  LEFT JOIN food_nutrient b on a.fdc_id = b.fdc_id 
  LEFT JOIN nutrient c on b.nutrient_id = c.id
  WHERE 
    LOWER(description) LIKE '%${req.params.term}%' 
  AND 
    food_category_id IS NOT NULL 
  ORDER by a.fdc_id`
    rows = await db.any(SQL)
    res.json(rows)
  } catch (error) {
    res.status(500).json({ error: error.message })   
  }
}

// async function execute() {
//   // const SQL = `SELECT * FROM food WHERE description LIKE '%${term}%'`
//   // const rows = await connect.any(SQL)
//   const output = await getFoodByTerm('garlic')
//   console.log(output.length)
// }

// async function execute() {
//   const result = await sampleFood()
//   console.log(result)
// }

// execute()

module.exports = {
  sampleFood,
  getFoodByTerm,
  getFoodById,
  getAllNutrients,
  getNutrientByTerm,
  getNutrientById,
  getFoodData
}