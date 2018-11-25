
import axios from 'axios'

export const getWorship = async () => {
  console.warn('getWorship')
  return new Promise((resolve, reject) => {
    axios.get('https://api.myjson.com/bins/1cbqz2').then(response => {
      console.warn('response', response.data)
      return resolve(response.data)
    })
  })
}
