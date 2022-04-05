import Vue from 'vue'
import _map from 'lodash/map'
import _find from 'lodash/find'
import { getMappings, postMapping } from '../../api/user'

export default {
  state: {},
  actions: {
    fetchMappings: ({commit}) => {
      return new Promise((resolve, reject) => {
        return getMappings().then((result) => {
          _map(result.User_Mapping, (item, key) => {
            commit('setMapping', {key, item})
          })
          return resolve(result)
        }).catch((err) => {
          return reject(err)
        })
      })
    },
    postMapping: ({commit}, data) => {
      //console.log('postAttendance', data)
      return new Promise((resolve, reject) => {
        return postMapping(data).then((result) => {
          if (result >= 0) {
            return resolve(true)
          }
          return false
        }).catch((err) => {
          return reject(err)
        })
      })
    },
  },
  getters: {
    getMappings: (state) => {
      return state
    },
    getMapping: (state) => (mapping) => {
      return _find(state, {mapping: mapping})
    }
  },
  mutations: {
    setMapping: (state, {key, item}) => {
      Vue.set(state, key, item)
    }
  }
}
