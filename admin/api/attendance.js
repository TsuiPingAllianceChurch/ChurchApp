import axios from 'axios'

export const getAttendances = async () => {
  return new Promise((resolve, reject) => {
    axios.get('https://api.myjson.com/bins/13pkdu').then(response => {
      return resolve(response.data)
    })
  })
}
