import axios from 'axios'
import {APIHOST} from './constant'

export const getMembers = async () => {
  return new Promise((resolve, reject) => {
    axios.get(APIHOST + '/api.php/Group_Member?transform=1').then(response => {
      return resolve(response.data)
    })
  })
}

export const postMember = async (data) => {
  return new Promise((resolve, reject) => {
    axios.post(APIHOST + '/api.php/Group_Member', data).then(response => {
      return resolve(response.data)
    })
  })
}

export const deleteMember = async (id) => {
  return new Promise((resolve, reject) => {
    axios.delete(APIHOST + '/api.php/Group_Member/' + id).then(response => {
      console.log('api deleteMember ' + id + ' : result', response.data)
      return resolve(response.data)
    })
  })
}
