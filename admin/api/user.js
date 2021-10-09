import axios from 'axios'

export const getUsers = async () => {
  return new Promise((resolve, reject) => {
    axios.get('https://tpac-api.homeip.net/api.php/User?transform=1').then(response => {
      return resolve(response.data)
    })
  })
}

export const postUser = async (data) => {
  return new Promise((resolve, reject) => {
    axios.post('https://tpac-api.homeip.net/api.php/User', data).then(response => {
      return resolve(response.data)
    })
  })
}

export const updateUser = async (data) => {
  return new Promise((resolve, reject) => {
    axios.put('https://tpac-api.homeip.net/api.php/User/' + data.user_id, data).then(response => {
      return resolve(response.data)
    })
  })
}