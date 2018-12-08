import Vue from 'vue'
import _map from 'lodash/map'
import _find from 'lodash/find'
import { getWorship } from '../../api/worship'

export default {
  state: {},
  actions: {
    fetchWorship: ({commit}) => {
      return new Promise((resolve, reject) => {
        return getWorship().then((result) => {
          _map(result.Worship, (item, key) => {
            commit('setWorship', {key, item})
          })
          return resolve(result)
        }).catch((err) => {
          return reject(err)
        })
      })
    }
  },
  getters: {
    getWorships: (state) => {
      return state
    },
    getWorship: (state) => (worshipId) => {
      return _find(state, {worship_id: worshipId})
    }
  },
  mutations: {
    setWorship: (state, {key, item}) => {
      Vue.set(state, key, item)
    }
  }
}
