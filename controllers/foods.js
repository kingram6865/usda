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
  function aggregate(final, current, counter) {
    let output = []

    let firstItem = {
      fdc_id: final.fdc_id,
      description: final.description,
      food_category_id: final.food_category_id,
      nutrients: [
        {
          foodId: final.fdc_id, 
          nutrientId: final.nutrient_id,
          nutrientName: final.name,
          amount: final.amount,
          units: final.unit_name
        },
      ]    
    }
    
    let intermediate = (Array.isArray(final)) ? final.find(x => x.fdc_id === current.fdc_id) : firstItem

      if (intermediate) {
        intermediate.nutrients.push({
          foodId: current.fdc_id, 
          nutrientId: current.nutrient_id,
          nutrientName: current.name,
          amount: current.amount,
          units: current.unit_name
        })
    
        if (Array.isArray(final)) {
          output = [...final]
        } else {
          output = [intermediate]
        }
      } else {    
        output = (Array.isArray(final)) ? [...final] : Array()
        output.push({
          fdc_id: current.fdc_id,
          description: current.description,
          food_category_id: current.food_category_id,
          nutrients: [
            {
              foodId: current.fdc_id, 
              nutrientId: current.nutrient_id,
              nutrientName: current.name,
              amount: current.amount,
              units: current.unit_name
            }
          ]
        })
      }
      return output
  }

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
    let results = rows.reduce(aggregate)
    // results.unshift({"itemsRetrieved": results.length})    
    results.forEach(element => console.log('\x1b[36m', element.fdc_id, '\x1b[0m',  '\x1b[32m', element.description, '\x1b[0m'))

    let data = {
      "itemsRetrieved": results.length,
      items: results
    }

    res.json(data)
  } catch (error) {
    res.status(500).json({ error: error.message })   
  }

}

// Retrieve all foods which contain any of the essential amino acids
const getAminoFoods = async (req, res) => {
  let rows
  try {
    SQL=`
    
    `
    rows = await db.any(SQL)
  } catch (error) {
    console.log(error)
  }
}

module.exports = {
  sampleFood,
  getFoodByTerm,
  getFoodById,
  getAllNutrients,
  getNutrientByTerm,
  getNutrientById,
  getFoodData
}