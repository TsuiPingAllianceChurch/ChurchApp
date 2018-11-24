import Vue from 'vue'
import _map from 'lodash/map'
import { getUsers } from '../../api/user'

export default {
  state: {},
  actions: {
    fetchUsers: ({commit}) => {
      return new Promise((resolve, reject) => {
        return getUsers().then((result) => {
          _map(result, (item, key) => {
            commit('setUser', {key, item})
          })
        }).catch((err) => {
          return reject(err)
        })
      })
    }
  },
  getters: {
    getUsers: (state) => {
      return state
    }
  },
  mutations: {
    setUser: (state, {key, item}) => {
      Vue.set(state, key, item)
    }
  }
}
