import Vue from 'vue'
import _get from 'lodash/get'
import _find from 'lodash/find'
import { format } from 'date-fns'

export default {
  state: {},
  actions: {
    updateCurrentWorship: ({commit, rootGetters}) => {
      let type = '早堂'
      if (format(new Date(), 'HH:mm:ss') > '09:45') {
        type = '午堂'
      }
      const worshipId = _get(_find(rootGetters.getWorships, {type}), 'worship_id')
      commit('setCurrentWorship', {key: 'currentWorshipId', item: worshipId})
    }
  },
  getters: {
    getCurrentWorship: (state) => {
      return _get(state, 'currentWorshipId', '')
    }
  },
  mutations: {
    setCurrentWorship: (state, {key, item}) => {
      Vue.set(state, key, item)
    }
  }
}
