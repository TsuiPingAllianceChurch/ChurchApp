
import axios from 'axios'
import { format } from 'date-fns'
import {APIHOST} from './constant'

export const getWorship = async () => {
  const currentDay = format(new Date(), 'YYYY-MM-DD')
  console.log('currentDay: ', currentDay)
  return new Promise((resolve, reject) => {
    axios.get(APIHOST + `/api.php/Worship?transform=1&timestamp=${new Date().getTime()}`).then(response => {
      return resolve(response.data)
    })
  })
}

export const postWorship = async (data) => {
  return new Promise((resolve, reject) => {
    axios.post(APIHOST + '/api.php/Worship', data).then(response => {
      return resolve(response.data)
    })
  })
}
