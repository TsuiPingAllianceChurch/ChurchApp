import axios from 'axios'

export const getUsers = async () => {
  return new Promise((resolve, reject) => {
    axios.get('https://api.myjson.com/bins/16yuj2').then(response => {
      return resolve(response.data)
    })
  })
}
