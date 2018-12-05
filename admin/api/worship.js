
import axios from 'axios'

export const getWorship = async () => {
  return new Promise((resolve, reject) => {
    axios.get('https://tpac-api.homeip.net/api.php/Worship?transform=1').then(response => {
      return resolve(response.data)
    })
  })
}
