import Vue from 'vue'
import _map from 'lodash/map'
import { getGroups } from '../../api/group'

export default {
  state: {},
  actions: {
    fetchGroups: ({commit}) => {
      return new Promise((resolve, reject) => {
        return getGroups().then((result) => {
          _map(result, (item, key) => {
            commit('setGroup', {key, item})
          })
          return resolve(result)
        }).catch((err) => {
          return reject(err)
        })
      })
    }
  },
  getters: {
    getGroups: (state) => {
      return state
    }
  },
  mutations: {
    setGroup: (state, {key, item}) => {
      Vue.set(state, key, item)
    }
  }
}
