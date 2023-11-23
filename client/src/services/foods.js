import api from './apiConfig';

export const getFood = async (searchTerm) => {
  try {
    const res = await api.get(`/food/search/${searchTerm}`)
    return res.data
  } catch (err) {
    throw err;
  }
}

export const getNutrients = async () => {
  try {
    const res = await api.get('/food/nutrients')
    return res.data
  } catch (err) {
    throw err;
  }
}

export const getAminos = async () => {
  try {
    const res = await api.get('/food/nutrients/aminos')
    return res.data
  } catch (err) {
    throw err;
  }
}

export const getEssentialAminos = async () => {
  try {
    const res = await api.get('/food/nutrients/aminos/essential')
    return res.data
  } catch (err) {
    throw err;
  }
}

export const getFoodNutrients = async (searchTermBruh) => {
  try {
    const res = await api.get(`/food/nutrition/${searchTerm}?limit=10&page=1`)
    return res.data
  } catch (err) {
    throw err;
  }
}

export const getNutrients = async () => {
  try {
    const res = await api.get('/food/nutrients')
    return res.data
  } catch (err) {
    throw err;
  }
}

export const getNutrients = async () => {
  try {
    const res = await api.get('/food/nutrients')
    return res.data
  } catch (err) {
    throw err;
  }
}

