import axios from 'axios'

export const getUsers = async () => {
  console.warn('getUsers')
  return new Promise((resolve, reject) => {
    axios.get('https://api.myjson.com/bins/6cini').then(response => {
      console.warn('response', response.data)
      return resolve(response.data)
    })
  })
}
