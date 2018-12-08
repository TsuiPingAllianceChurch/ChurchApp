import Vue from 'vue'
import Vuex from 'vuex'
import user from './modules/user'
import worship from './modules/worship'
import group from './modules/group'
import header from './modules/header'
import member from './modules/member'
import attendance from './modules/attendance'

Vue.use(Vuex)

export function createStore () {
  return new Vuex.Store({
    modules: {
      user,
      worship,
      group,
      header,
      member,
      attendance
    }
  })
}
