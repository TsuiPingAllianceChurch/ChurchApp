import Vue from 'vue'
import _map from 'lodash/map'
import { getMembers } from '../../api/member'

export default {
  state: {},
  actions: {
    fetchMembers: ({commit}) => {
      return new Promise((resolve, reject) => {
        return getMembers().then((result) => {
          _map(result, (item, key) => {
            commit('setMember', {key, item})
          })
          return resolve(result)
        }).catch((err) => {
          return reject(err)
        })
      })
    }
  },
  getters: {
    getMembers: (state) => {
      return state
    }
  },
  mutations: {
    setMember: (state, {key, item}) => {
      Vue.set(state, key, item)
    }
  }
}
