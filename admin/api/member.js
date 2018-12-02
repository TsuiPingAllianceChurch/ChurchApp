import axios from 'axios'

export const getMembers = async () => {
  return new Promise((resolve, reject) => {
    axios.get('https://api.myjson.com/bins/1g9t8y').then(response => {
      return resolve(response.data)
    })
  })
}
