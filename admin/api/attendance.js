import axios from 'axios'

export const getAttendances = async (maxId) => {
  return new Promise((resolve, reject) => {
    axios.get('https://tpac-api.homeip.net/api.php/Attendance?order[]=attendance_id,desc&transform=1&filter=attendance_id,gt,' + maxId).then(response => {
      return resolve(response.data)
    })
  })
}

export const postAttendances = async (data) => {
  return new Promise((resolve, reject) => {
    axios.post('https://tpac-api.homeip.net/api.php/Attendance', data).then(response => {
      return resolve(response.data)
    })
  })
}
