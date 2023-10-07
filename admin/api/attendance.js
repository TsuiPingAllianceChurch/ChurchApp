import axios from 'axios'
import {APIHOST} from './constant'

// export const getAttendances = async (maxId) => {
//   return new Promise((resolve, reject) => {
//     axios.get(APIHOST + '/api.php/Attendance?order[]=attendance_id,desc&transform=1&filter=attendance_id,gt,' + maxId).then(response => {
//       //console.log('api getAttendances result', response.data)
//       return resolve(response.data)
//     })
//   })
// }

export const getAttendances = async (worshipId) => {
  return new Promise((resolve, reject) => {
    axios.get(APIHOST + '/api.php/AttendanceRecord?order[]=attendance_id,desc&transform=1&filter=worship_id,eq,' + worshipId).then(response => {
      //console.log('api getAttendances result', response.data)
      return resolve(response.data)
    })
  })
}

export const postAttendances = async (data) => {
  return new Promise((resolve, reject) => {
    axios.post(APIHOST + '/api.php/AttendanceRecord', data).then(response => {
      return resolve(response.data)
    })
  })
}

export const deleteAttendance = async (id) => {
  return new Promise((resolve, reject) => {
    axios.delete(APIHOST + '/api.php/AttendanceRecord/' + id).then(response => {
      //console.log('api deleteAttendance ' + id + ' : result', response.data)
      return resolve(response.data)
    })
  })
}
