import Vue from 'vue'
import _map from 'lodash/map'
import _find from 'lodash/find'
import _filter from 'lodash/filter'
import { format } from 'date-fns'
import { getWorship, postWorship } from '../../api/worship'

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
    },
    postWorships: ({dispatch}) => {
      const date = new Date()
      const arr = [{
        type: '早堂',
        created_date: format(date, 'YYYY-MM-DD HH:mm:ss'),
        date: format(date, 'YYYY-MM-DD')
      }, {
        type: '午堂',
        created_date: format(date, 'YYYY-MM-DD HH:mm:ss'),
        date: format(date, 'YYYY-MM-DD')
      }]
      console.log('postWorships', arr)
      _map(arr, item => {
        dispatch('postWorship', item)
      })
    },
    postWorship: ({commit}, data) => {
      console.log('postWorship', data)
      return new Promise((resolve, reject) => {
        return postWorship(data).then((result) => {
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
    getWorships: (state) => {
      return state
    },
    getWorship: (state) => (worshipId) => {
      return _find(state, {worship_id: worshipId})
    },
    getTodayWorship: (state) => {
      const currentDay = format(new Date(), 'YYYY-MM-DD')
      return _filter(state, {date: currentDay})
    }
  },
  mutations: {
    setWorship: (state, {key, item}) => {
      Vue.set(state, key, item)
    }
  }
}
