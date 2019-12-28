
import axios from 'axios'
import { format } from 'date-fns'

export const getWorship = async () => {
  const currentDay = format(new Date(), 'YYYY-MM-DD')
  console.log('currentDay: ', currentDay)
  return new Promise((resolve, reject) => {
    axios.get(`https://tpac-api.homeip.net/api.php/Worship?transform=1&timestamp=${new Date().getTime()}`).then(response => {
      return resolve(response.data)
    })
  })
}

export const postWorship = async (data) => {
  return new Promise((resolve, reject) => {
    axios.post('https://tpac-api.homeip.net/api.php/Worship', data).then(response => {
      return resolve(response.data)
    })
  })
}
