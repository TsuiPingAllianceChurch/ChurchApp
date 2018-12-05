import axios from 'axios'

export const getGroups = async () => {
  return new Promise((resolve, reject) => {
    axios.get('https://tpac-api.homeip.net/api.php/Group?transform=1').then(response => {
      return resolve(response.data)
    })
  })
}
