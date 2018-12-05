import Vue from 'vue'
import _map from 'lodash/map'
import _find from 'lodash/find'
import { getUsers } from '../../api/user'

export default {
  state: {},
  actions: {
    fetchUsers: ({commit}) => {
      return new Promise((resolve, reject) => {
        return getUsers().then((result) => {
          _map(result.User, (item, key) => {
            commit('setUser', {key, item})
          })
          return resolve(result)
        }).catch((err) => {
          return reject(err)
        })
      })
    }
  },
  getters: {
    getUsers: (state) => {
      return state
    },
    getUser: (state) => (userId) => {
      return _find(state, {user_id: userId})
    }
  },
  mutations: {
    setUser: (state, {key, item}) => {
      Vue.set(state, key, item)
    }
  }
}
