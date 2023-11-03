const { db } = require('../db/connection')

async function executeSql(sql) {
  let result
  
  try {
    result = await db.any(sql)
  } catch (err) {
    console.log(err)
  } finally {
    return result
  }
}

async function getTableInfo(req, res) {
  let result
  SQL = ""
  try {
    result = await executeSql(SQL)
  } catch(err) {
    res.status(500).json({ error: error.message })
  }
}

async function sampleFood (req, res) {  
  try {
    SQL=`SELECT * FROM food_description WHERE  ndb_no = '01047'`
    const rows = await db.any(SQL)
    // console.log(rows)
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

  try {
    SQL=`SELECT * FROM nutrient_definition WHERE lower(nutrdesc) IN ${aminos} ORDER BY nutrdesc`
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
    SQL=`SELECT * FROM nutrient_definition WHERE lower(nutrdesc) IN ${aminos} ORDER BY nutrdesc`
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
  let output
  try {
    SQL=`SELECT fdgrp_cd AS "group code", fdgrp_desc AS description FROM food_group_description`
    const rows = await db.any(SQL)
    // console.log(rows)
    console.log(output)
    output = {itemCount: rows.length, items: rows}
    res.json(output)
  } catch (error) {
    res.status(500).json({ error: error.message })
  }
}

async function getFoodByCategory (req, res) {  
  let output
  let term = `%${req.params.term}%`
  console.log(term)
  try {
    SQL=`select * from food_description WHERE foodgroup_code IN (SELECT fdgrp_cd FROM food_group_description WHERE fdgrp_desc ILIKE '${term}')`
    const rows = await db.any(SQL)
    output = {result_count: rows.length ,search_category: req.params.term, results: rows}
    res.json(output)
  } catch (error) {
    res.status(500).json({ error: error.message })
  }
}

async function foodCategoriesById (req, res) {
  let output
  try {
    SQL=`SELECT * FROM food_description WHERE foodgroup_code = '${req.params.id}'`
    const rows = await db.any(SQL)
    output = {number_of_items_in_category: rows.length, items: rows}
    res.json(output)
  } catch (error) {
    res.status(500).json({ error: error.message })
  }
}

const getFoodByTerm = async (req, res) => {
  let rows
  try {
    // const SQL = `SELECT * FROM food WHERE LOWER(description) LIKE '%${req.params.term}%' and data_type NOT LIKE 'branded_food'`
    const SQL = `SELECT * FROM food_description WHERE LOWER(long_desc) LIKE lower('%${req.params.term.replace(/\s+/g,'\%')}%')`
    rows = await db.any(SQL)
    rows = {"totalRecords": rows.length, items: rows}
    res.json(rows)
  } catch (error) {
    res.status(500).json({ error: error.message })
  }
}

const getNutritionForFoodById = async (req, res) => {
  let rows, food
  try {
    // const SQL = `select food_nutrient.id, food_nutrient. ndb_no, food_nutrient.nutrient_id, nutrient.name, food_nutrient.amount, nutrient.unit_name from food_nutrient RIGHT JOIN nutrient on food_nutrient.nutrient_id = nutrient.id WHERE food_nutrient. ndb_no = ${req.params.id}`
    // const SQL = `SELECT nutrient_data.*, nutrient_definition.* FROM nutrient_data RIGHT JOIN nutrient_definition on nutrient_data.nutr_no = nutrient_definition.nutr_no WHERE food_description.ndb_no = ${req.params.id} AND nutrient_data.nutr_val > 0`
    const SQL = `SELECT * FROM nutrient_data RIGHT JOIN nutrient_definition ON nutrient_definition.nutr_no = nutrient_data.nutr_no WHERE nutrient_data.ndb_no = '${req.params.id}' AND nutrient_data.nutr_val > 0`
    const SQL2 = `SELECT * FROM food_description WHERE ndb_no = '${req.params.id}'`
    rows = await db.any(SQL)
    food = await db.any(SQL2)
    
    rows = {food: food[0], nutrients: {count: rows.length, nutrientList: rows}}
    res.json(rows)
  } catch (error) {
    res.status(500).json({ error: `getNutritionForFoodById() ${error}` })
  }
}


const getFoodById = async (req, res) => {
  let rows
  try {
    SQL=`SELECT * FROM food_description WHERE  ndb_no = '${req.params.id}'`
    rows = await db.any(SQL)
    res.json(rows)
  } catch (error) {
    res.status(500).json({ error: error.message })
  }
}

const getAllNutrients = async (req, res) => {
  let rows
  let pageMax = 10
  const page = (req.query.page) ? parseInt(req.query.page) : 1
  const limit = (req.query.limit) ? (parseInt(req.query.limit) > pageMax) ? pageMax : parseInt(req.query.limit) : 10
  const startIndex = (page - 1) * limit
  const endIndex = page * limit
  // console.log(`${req.protocol}://${req.get('Host')}${req.baseUrl} ${req.originalUrl.split('?')[0]}`)
  // console.log(`${req.protocol}://${req.get('Host')}${req.baseUrl}${req.path}`)

  try {
    SQL=`SELECT * FROM nutrient_definition`
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

const getNutrientByName = async (req, res) => {
  let rows
  try {
    SQL=`SELECT * FROM nutrient_definition WHERE lower(nutrdesc) LIKE lower('%${req.params.term}%')`
    rows = await db.any(SQL)
    res.json(rows)
  } catch (error) {
    console.log(error)
  }
}

const getNutrientById = async (req, res) => {
  let rows = {result: 'In progress'}
  try {
    SQL=`SELECT * from nutrient_definition WHERE nutr_no = '${req.params.id}'`
    rows = await db.any(SQL)
    res.json(rows)
  } catch (error) {
    console.log(error)
  }
}

const getFoodData = async (req, res) => {
  // /food/nutrition/dairy?limit=25&page=1
  let rows, results
  const pageMax = 10
  const page = (req.query.page) ? parseInt(req.query.page) : 1
  const limit = (req.query.limit > pageMax) ? pageMax : parseInt(req.query.limit)

  console.log(`getFoodData() Line 249: limit = ${limit} and it should be ${pageMax}.`)
  const startIndex = (page - 1) * limit
  const endIndex = page * limit

  function aggregate(final, current, counter) {
    let output = []
    // console.log(counter, final, current)
    // console.log(counter, JSON.stringify(final, null, 2))

    if (counter === 1) {
      output = [
        {
          ndb_no: final.ndb_no,
          long_desc: final.long_desc,
          foodgroup_code: final.foodgroup_code,
          nutrients: [{nutr_no: final.nutr_no, nutrdesc: final.nutrdesc, nutr_val: final.nutr_val, units: final.units}, {nutr_no: current.nutr_no, nutrdesc: current.nutrdesc, nutr_val: current.nutr_val, units: current.units}]
        }
      ]
    } else {
      if (final.find(x => x.ndb_no === current.ndb_no)) {
        let foundIndex = final.findIndex(x => x.ndb_no === current.ndb_no)
        final[foundIndex].nutrients.push({nutr_no: current.nutr_no, nutrdesc: current.nutrdesc, nutr_val: current.nutr_val, units: current.units})
        output = [...final]
      } else {
        output = [...final, {
          ndb_no: current.ndb_no,
          long_desc: current.long_desc,
          foodgroup_code: current.foodgroup_code,
          nutrients: [{nutr_no: current.nutr_no, nutrdesc: current.nutrdesc, nutr_val: current.nutr_val, units: current.units}]          
        }]
      }
    }
      return output
  }

  try {
    SQL=`SELECT 
      a.ndb_no, 
      a.long_desc, 
      a.foodgroup_code,
      b.nutr_no, 
      c.nutrdesc,
      b.nutr_val,
      c.units
    FROM food_description a 
    LEFT JOIN nutrient_data b on a.ndb_no = b.ndb_no 
    LEFT JOIN nutrient_definition c on b.nutr_no = c.nutr_no
    WHERE 
      LOWER(a.long_desc) LIKE '%${req.params.term}%' 
    AND 
      a.foodgroup_code IS NOT NULL 
    ORDER by a.ndb_no, b.nutr_no`

    rows = await db.any(SQL)
    console.log("================\n Rows provided: ", rows.length, "\n", rows[0])
    
    results = rows.reduce(aggregate)
    // console.log("================", results)
    // // results.unshift({"itemsRetrieved": results.length})    
    // results.forEach(element => console.log('\x1b[36m', element.ndb_no, '\x1b[0m',  '\x1b[32m', element.long_desc, '\x1b[0m'))

    // console.log(results)
    // console.log(results.slice(startIndex, endIndex))

    let data = {
      "Total Results": results.length,
      "Results per page": `${limit} - Max ${pageMax} results per page`,
      next: "",
      previous: "",
      pages: Math.ceil(results.length/limit),
      // results: (limit) ? results.slice(0, limit) : results
      results: results.slice(startIndex, endIndex)
    }

    if (endIndex < rows.length) {
      data.next = `${req.protocol}://${req.get('Host')}${req.baseUrl}${req.path}?page=${page + 1}&limit=${limit}`
    }

    if (startIndex > 0) {
      data.previous = `${req.protocol}://${req.get('Host')}${req.baseUrl}${req.path}?page=${page - 1}&limit=${limit}`
    }
    // if (endIndex < results.length) {
    //   data.next = {
    //     page: page + 1,
    //     limit: limit
    //   }
    // }

    // if (startIndex > 0) {
    //   data.previous = {
    //     page: page - 1,
    //     limit: limit
    //   }
    // }

    res.json(data)
  } catch (error) {
    res.status(500).json({ error: error.message })   
    console.log(error)
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
  getNutrientByName,
  getNutrientById,
  getFoodData,
  foodCategories,
  foodCategoriesById,
  getNutritionForFoodById,
  getAllAminos,
  getAllEssentialAminos,
  getFoodByCategory
}