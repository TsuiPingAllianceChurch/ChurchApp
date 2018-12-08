import Vue from 'vue'
import _get from 'lodash/get'

export default {
  state: {
    page: 'Home'
  },
  actions: {
    updatePage: ({commit}, {page}) => {
      commit('setPage', {page})
    }
  },
  getters: {
    getPage: (state) => {
      return _get(state, 'page', 'Home')
    }
  },
  mutations: {
    setPage: (state, {page}) => {
      Vue.set(state, 'page', page)
    }
  }
}
