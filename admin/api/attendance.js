import axios from 'axios'
import {APIHOST} from './constant'

export const getAttendances = async (maxId) => {
  return new Promise((resolve, reject) => {
    axios.get(APIHOST + '/api.php/Attendance?order[]=attendance_id,desc&transform=1&filter=attendance_id,gt,' + maxId).then(response => {
      //console.log('api getAttendances result', response.data)
      return resolve(response.data)
    })
  })
}

export const postAttendances = async (data) => {
  return new Promise((resolve, reject) => {
    axios.post(APIHOST + '/api.php/Attendance', data).then(response => {
      return resolve(response.data)
    })
  })
}

export const deleteAttendance = async (id) => {
  return new Promise((resolve, reject) => {
    axios.delete(APIHOST + '/api.php/Attendance/' + id).then(response => {
      console.log('api deleteAttendance ' + id + ' : result', response.data)
      return resolve(response.data)
    })
  })
}
