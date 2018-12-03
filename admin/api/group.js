import axios from 'axios'

export const getGroups = async () => {
  return new Promise((resolve, reject) => {
    axios.get('https://api.myjson.com/bins/10qecy').then(response => {
      return resolve(response.data)
    })
  })
}
