const db = require('../db/connection')

const sampleFood = async (req, res) => {
  let rows
  try {
    SQL=`SELECT * FROM food WHERE fdc_id = '1111496'`
    rows = await db.any(SQL)
    console.log(rows)
    res.json(rows)
  } catch (error) {
    res.status(500).json({ error: error.message })
  }
}

// const getFoodByTerm = async (req, res) => {
//   let rows
//   try {
//     // const SQL = `SELECT * FROM food WHERE description LIKE '%${req.params.term}%'`
//     const SQL = `SELECT * FROM food WHERE LOWER(description) LIKE '%${req.params.term}%' and data_type NOT LIKE 'branded_food'`
//     rows = await db.any(SQL)
//     res.json(rows)
//   } catch (error) {
//     res.status(500).json({ error: error.message })
//     console.log(error)
//   }
// }

// const getFoodById = async (req, res) => {
//   let rows
//   try {
//     SQL=`SELECT * FROM food WHERE fdc_id = '${req.params.id}'`
//     rows = await db.any(SQL)
//     res.json(rows)
//   } catch (error) {
//     res.status(500).json({ error: error.message })
//   }
// }

// const getAllNutrients = async (req, res) => {
//   let rows
//   try {
//     SQL=`SELECT * FROM food_nutrients WHERE fdc_id = ${req.params.id}`
//     rows = await db.any(SQL)
//   } catch (error) {
//     console.log(error)
//   }
// }

// const getNutrientByTerm = async (req, res) => {
//   let rows = {result: 'In progress'}
//   try {
//     SQL=``
//     rows = await db.any(SQL)
//   } catch (error) {
//     console.log(error)
//   }
// }

// const getNutrientById = async (req, res) => {
//   let rows = {result: 'In progress'}
//   try {
//     SQL=``
//     rows = await db.any(SQL)
//   } catch (error) {
//     console.log(error)
//   }
// }

async function execute() {
  // const SQL = `SELECT * FROM food WHERE description LIKE '%${term}%'`
  // const rows = await connect.any(SQL)
  const output = await getFoodByTerm('garlic')
  console.log(output.length)
}

module.exports = {
  sampleFood
  // getFoodByTerm,
  // getFoodById,
  // getAllNutrients,
  // getNutrientByTerm,
  // getNutrientById,
}