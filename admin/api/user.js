import axios from 'axios'
import {APIHOST} from './constant'

export const getUsers = async () => {
  return new Promise((resolve, reject) => {
    axios.get(APIHOST + '/api.php/User?transform=1').then(response => {
      return resolve(response.data)
    })
  })
}

export const postUser = async (data) => {
  return new Promise((resolve, reject) => {
    axios.post(APIHOST + '/api.php/User', data).then(response => {
      return resolve(response.data)
    })
  })
}

export const updateUser = async (data) => {
  return new Promise((resolve, reject) => {
    axios.put(APIHOST + '/api.php/User/' + data.user_id, data).then(response => {
      return resolve(response.data)
    })
  })
}

export const getMappings = async () => {
  return new Promise((resolve, reject) => {
    axios.get(APIHOST + '/api.php/User_Mapping?transform=1').then(response => {
      return resolve(response.data)
    })
  })
}

export const postMapping = async (data) => {
  return new Promise((resolve, reject) => {
    axios.post(APIHOST + '/api.php/User_Mapping', data).then(response => {
      return resolve(response.data)
    })
  })
}

export const getGroupUsers = async () => {
  return new Promise((resolve, reject) => {
    axios.get(APIHOST + '/attendance/api_v2.php/records/Group?join=User').then(response => {
      return resolve(response.data)
    })
  })
}
