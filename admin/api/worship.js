
import axios from 'axios'
// import { format } from 'date-fns'

export const getWorship = async () => {
  // const currentDay = format(new Date(), 'YYYY-MM-DD')
  const currentDay = '2018-12-02' // TODO: Create a new worship if that day does not exist, now hard code one first
  return new Promise((resolve, reject) => {
    axios.get(`https://tpac-api.homeip.net/api.php/Worship?transform=1&filter=date,eq,${currentDay}`).then(response => {
      return resolve(response.data)
    })
  })
}
