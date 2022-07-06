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

async function getAllAminos (req, res) { 
  // Resource: http://www.cryst.bbk.ac.uk/education/AminoAcid/the_twenty.html
  // Resource: http://www.kyowahakko-bio.co.jp/english/rd/aminoscope/function/
  const page = (req.query.page) ? parseInt(req.query.page) : 1
  const limit = (req.query.limit) ? (parseInt(req.query.limit) > 10) ? 10 : parseInt(req.query.limit) : 10
  const startIndex = (page - 1) * limit
  const endIndex = page * limit
  const aminos = "('alanine', 'arginine', 'asparagine', 'aspartic acid', 'cysteine', 'glutamine', 'glutamic acid', 'glycine', 'histidine', 'isoleucine', 'leucine', 'lysine', 'methionine', 'phenylalanine', 'proline', 'serine', 'threonine', 'tryptophan', 'tyrosine', 'valine')"

  console.log(startIndex, endIndex)

  try {
    SQL=`SELECT * FROM nutrient WHERE lower(name) IN ${aminos} order by name`
    const rows = await db.any(SQL)

    const data = {
      "total Number of Amino Acids": rows.length,
      "Additional Info": [
        'http://www.cryst.bbk.ac.uk/education/AminoAcid/the_twenty.html',
        'http://www.kyowahakko-bio.co.jp/english/rd/aminoscope/function/'
      ],
      "Notes": [],
      previous: "",
      next: "",
      "results": rows.slice(startIndex, endIndex)
    }

    if (endIndex < rows.length) {
      data.next = `${req.protocol}://${req.get('Host')}${req.baseUrl}${req.path}?page=${page + 1}&limit=${limit}`
    }

    if (startIndex > 0) {
      data.previous = `${req.protocol}://${req.get('Host')}${req.baseUrl}${req.path}?page=${page - 1}&limit=${limit}`
    }

    res.json(data)
  } catch (error) {
    res.status(500).json({ error: error.message })
  }
}

async function getAllEssentialAminos (req, res) {  
  const aminos = "('histidine', 'isoleucine', 'leucine', 'lysine', 'methionine', 'phenylalanine', 'threonine', 'tryptophan', 'valine')"

  try {
    SQL=`SELECT * FROM nutrient WHERE lower(name) IN ${aminos} order by name`
    const rows = await db.any(SQL)

    const data = {
      "total Number of Essential Amino Acids": rows.length,
      "total Records retrieved": rows.length,
      "Additional Info": [
        'http://www.cryst.bbk.ac.uk/education/AminoAcid/the_twenty.html',
        'http://www.kyowahakko-bio.co.jp/english/rd/aminoscope/function/'
      ],
      "Notes": ['All Aminos'],
      "results": rows.slice(0, 9)
    }

    res.json(data)
  } catch (error) {
    res.status(500).json({ error: error.message })
  }
}

async function foodCategories (req, res) {  
  try {
    SQL=`SELECT * FROM food_category`
    const rows = await db.any(SQL)
    console.log(rows)
    res.json(rows)
  } catch (error) {
    res.status(500).json({ error: error.message })
  }
}

async function getFoodByCategory (req, res) {  
  try {
    SQL=`SELECT * FROM food WHERE `
    const rows = await db.any(SQL)
    console.log(rows)
    res.json(rows)
  } catch (error) {
    res.status(500).json({ error: error.message })
  }
}

async function foodCategoriesById (req, res) {  
  try {
    SQL=`SELECT * FROM food_category WHERE code = '${req.params.id}'`
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
    // const SQL = `SELECT * FROM food WHERE LOWER(description) LIKE '%${req.params.term}%' and data_type NOT LIKE 'branded_food'`
    const SQL = `SELECT * FROM food WHERE LOWER(description) LIKE lower('%${req.params.term.replace(/\s+/g,'\%')}%')`
    rows = await db.any(SQL)
    rows = [{"totalRecords": rows.length}, ...rows]
    res.json(rows)
  } catch (error) {
    res.status(500).json({ error: error.message })
  }
}

const getNutritionForFoodById = async (req, res) => {
  let rows, food
  try {
    // const SQL = `select food_nutrient.id, food_nutrient.fdc_id, food_nutrient.nutrient_id, nutrient.name, food_nutrient.amount, nutrient.unit_name from food_nutrient RIGHT JOIN nutrient on food_nutrient.nutrient_id = nutrient.id WHERE food_nutrient.fdc_id = ${req.params.id}`
    const SQL = `select food_nutrient.*, nutrient.* from food_nutrient RIGHT JOIN nutrient on food_nutrient.nutrient_id = nutrient.id WHERE food_nutrient.fdc_id = ${req.params.id} AND food_nutrient.amount > 0`
    const SQL2 = `SELECT * FROM food WHERE fdc_id = ${req.params.id}`
    rows = await db.any(SQL)
    food = await db.any(SQL2)
    console.log(rows)
    rows = [{"#ofNutrients": rows.length}, ...food, ...rows]
    res.json(rows)
  } catch (error) {
    res.status(500).json({ error: `getNutritionForFoodById() ${error}` })
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
  const page = (req.query.page) ? parseInt(req.query.page) : 1
  const limit = (req.query.limit) ? (parseInt(req.query.limit) > 10) ? 10 : parseInt(req.query.limit) : 10
  const startIndex = (page - 1) * limit
  const endIndex = page * limit
  // console.log(`${req.protocol}://${req.get('Host')}${req.baseUrl} ${req.originalUrl.split('?')[0]}`)
  // console.log(`${req.protocol}://${req.get('Host')}${req.baseUrl}${req.path}`)

  try {
    SQL=`SELECT * FROM nutrient`
    rows = await db.any(SQL)

    const data = {
      "totalNutrients": rows.length,
      "Results per page": limit,
      "next": "",
      "previous": "",
      pages: Math.ceil(rows.length/limit),
      "results": rows.slice(startIndex, endIndex)
      // "results": rows
    }

    if (endIndex < rows.length) {
      data.next = `${req.protocol}://${req.get('Host')}${req.baseUrl}${req.path}?page=${page + 1}&limit=${limit}`
    }

    if (startIndex > 0) {
      data.previous = `${req.protocol}://${req.get('Host')}${req.baseUrl}${req.path}?page=${page - 1}&limit=${limit}`
    }

    res.json(data)
  } catch (error) {
    console.log(error)
    res.status(500).json({ error: error })
  }
}

const getNutrientByTerm = async (req, res) => {
  let rows
  try {
    SQL=`SELECT * FROM nutrient WHERE name LIKE '%${req.params.id}%'`
    rows = await db.any(SQL)
    res.json(rows)
  } catch (error) {
    console.log(error)
  }
}

const getNutrientById = async (req, res) => {
  let rows = {result: 'In progress'}
  try {
    SQL=`SELECT * from nutrient WHERE id = ${req.params.id}`
    rows = await db.any(SQL)
    res.json(rows)
  } catch (error) {
    console.log(error)
  }
}

const getFoodData = async (req, res) => {
  let rows
  const page = parseInt(req.query.page) 
  const limit = (req.query.limit > 10) ? 10 : parseInt(req.query.limit)
  const startIndex = (page - 1) * limit
  const endIndex = page * limit

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
      "Total Results": results.length,
      "Results per page": `${limit} - Max 10 results per page`,
      pages: Math.ceil(results.length/limit),
      next: "",
      previous: "",
      // results: (limit) ? results.slice(0, limit) : results
      results: results.slice(startIndex, endIndex)
    }

    if (endIndex < results.length) {
      data.next = {
        page: page + 1,
        limit: limit
      }
    }

    if (startIndex > 0) {
      data.previous = {
        page: page - 1,
        limit: limit
      }
    }

    res.json(data)
  } catch (error) {
    res.status(500).json({ error: error.message })   
  }

}

// Retrieve all foods which contain an essential amino acid in the given minimum amount
const getAminoFoods = async (req, res) => {
  let rows
  const amount = parseFloat(req.query.amount)
  try {
    SQL=`SELECT
    
    `
    rows = await db.any(SQL)
  } catch (error) {
    console.log(error)
  }
}

function paginatedResults(model) {
  
}

module.exports = {
  sampleFood,
  getFoodByTerm,
  getFoodById,
  getAllNutrients,
  getNutrientByTerm,
  getNutrientById,
  getFoodData,
  foodCategories,
  foodCategoriesById,
  getNutritionForFoodById,
  getAllAminos,
  getAllEssentialAminos
}