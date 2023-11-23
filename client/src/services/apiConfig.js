import axios from 'axios';

let apiUrl

const apiUrls = {
  production: 'https://archimedes.sdlapps.net/api',
  development: 'http://apollo:3019/api'
}


if (window.location.hostname === 'apollo') {
  apiUrl = apiUrls.development
} else {
  apiUrl = apiUrls.production
}

const api = axios.create({
  baseURL: apiUrl
});