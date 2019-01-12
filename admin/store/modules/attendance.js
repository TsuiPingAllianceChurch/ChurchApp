import Vue from 'vue'
import _map from 'lodash/map'
import _find from 'lodash/find'
import _max from 'lodash/max'
import { getAttendances, postAttendances, deleteAttendance } from '../../api/attendance'

export default {
  state: {},
  actions: {
    fetchAttendances: ({commit, getters}) => {
      const maxAttendenceId = getters.getMaxAttendanceId
      //console.warn('current max attendence id', maxAttendenceId)
      return new Promise((resolve, reject) => {
        return getAttendances(maxAttendenceId).then((result) => {
          _map(result.Attendance, (item, key) => {
            commit('setAttendances', {key: (key + maxAttendenceId), item})
          })
          return resolve(result)
        }).catch((err) => {
          return reject(err)
        })
      })
    },
    postAttendance: ({commit}, data) => {
      //console.log('postAttendance', data)
      return new Promise((resolve, reject) => {
        return postAttendances(data).then((result) => {
          if (result >= 0) {
            return resolve(true)
          }
          return false
        }).catch((err) => {
          return reject(err)
        })
      })
    },
    deleteAttendance: ({commit}, id) => {
      //console.log('deleteAttendance', id)
      return new Promise((resolve, reject) => {
        return deleteAttendance(id).then((result) => {
          if (result == 1) {
            commit('removeAttendance', id)
            return resolve(true)
          }
          return false
        }).catch((err) => {
          return reject(err)
        })
      })
    }
  },
  getters: {
    getAttendances: (state) => {
      return state
    },
    getAttendance: (state) => (userId, worshipId) => {
      return _find(state, {user_id: userId, worship_id: worshipId})
    },
    getMaxAttendanceId: (state) => {
      let list = []
      _map(state, item => { list.push(item.attendance_id) })
      return _max(list) || 0
    }
  },
  mutations: {
    setAttendances: (state, {key, item}) => {
      //console.log('setAttendances', key, item)
      Vue.set(state, key, item)
    },
    removeAttendance: (state, id) => {
      //console.log('removeAttendance', id)
      for (var index in state) {
        if (state.hasOwnProperty(index)) {
          if (state[index].attendance_id == id) {
            Vue.delete(state, index)
          }
        }
      }
    }
  }
}
