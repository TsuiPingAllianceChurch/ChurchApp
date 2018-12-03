
import axios from 'axios'

export const getWorship = async () => {
  return new Promise((resolve, reject) => {
    axios.get('https://api.myjson.com/bins/1cbqz2').then(response => {
      return resolve(response.data)
    })
  })
}
