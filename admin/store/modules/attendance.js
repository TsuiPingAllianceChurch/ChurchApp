import Vue from 'vue'
import _map from 'lodash/map'
import { getAttendances, postAttendances } from '../../api/attendance'

export default {
  state: { maxId: 0 },
  actions: {
    fetchAttendances: ({commit}) => {
      return new Promise((resolve, reject) => {
        return getAttendances(this.a.state.maxId).then((result) => {
          _map(result.Attendance, (item, key) => {
            commit('setAttendances', {key, item})
          })
          return resolve(result)
        }).catch((err) => {
          return reject(err)
        })
      })
    },
    postAttendance: ({commit}, data) => {
      return new Promise((resolve, reject) => {
        return postAttendances(data).then((result) => {
          if (result === 0) {
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
    }
  },
  mutations: {
    setAttendances: (state, {key, item}) => {
      Vue.set(state, key, item)
      if (state.maxId < item.attendance_id) {
        Vue.set(state, 'maxId', item.attendance_id)
      }
    }
  }
}
