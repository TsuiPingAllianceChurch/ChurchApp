// The Vue build version to load with the `import` command
// (runtime-only or standalone) has been set in webpack.base.conf with an alias.
import Vue from 'vue'
import VueSweetalert from 'vue-sweetalert2'
import App from './App'
import router from './router'

import { createStore } from '../store/index'

const store = createStore()

Vue.config.productionTip = false
Vue.use(VueSweetalert)

/* eslint-disable no-new */
new Vue({
  el: '#app',
  router,
  store,
  components: { App },
  template: '<App/>'
})
