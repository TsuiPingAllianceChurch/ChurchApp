import axios from 'axios'

export const getUsers = async () => {
  return new Promise((resolve, reject) => {
    axios.get('https://tpac-api.homeip.net/api.php/User?transform=1').then(response => {
      return resolve(response.data)
    })
  })
}
