import axios from 'axios'

export const getMembers = async () => {
  return new Promise((resolve, reject) => {
    axios.get('https://tpac-api.homeip.net/api.php/Group_Member?transform=1').then(response => {
      return resolve(response.data)
    })
  })
}
