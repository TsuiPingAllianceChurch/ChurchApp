import axios from 'axios'
import {APIHOST} from './constant'

export const getGroups = async () => {
  return new Promise((resolve, reject) => {
    axios.get(APIHOST + '/api.php/Group?transform=1').then(response => {
      return resolve(response.data)
    })
  })
}
