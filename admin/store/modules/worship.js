import Vue from 'vue'
import _map from 'lodash/map'
import { getWorship } from '../../api/worship'

export default {
  state: {},
  actions: {
    fetchWorship: ({commit}) => {
      return new Promise((resolve, reject) => {
        return getWorship().then((result) => {
          _map(result, (item, key) => {
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
    getWorship: (state) => {
      return state
    }
  },
  mutations: {
    setWorship: (state, {key, item}) => {
      Vue.set(state, key, item)
    }
  }
}
