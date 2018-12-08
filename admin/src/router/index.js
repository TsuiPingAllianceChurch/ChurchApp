import Vue from 'vue'
import Router from 'vue-router'
import Home from '@/components/Home'
import ManualAttend from '@/components/ManualAttend'
import AutoAttend from '@/components/AutoAttend'
import AttendanceCards from '@/components/Attendance/AttendanceCards'

import Users from '@/components/Users'

Vue.use(Router)

export default new Router({
  routes: [
    {
      path: '/',
      name: 'Home',
      component: Home
    },
    {
      path: '/manual_attend',
      name: 'ManualAttend',
      component: ManualAttend
    },
    {
      path: '/auto_attend',
      name: 'AutoAttend',
      component: AutoAttend
    },
    {
      path: '/attendance',
      name: 'AttendanceCards',
      component: AttendanceCards
    },
    {
      path: '/users',
      name: 'Users',
      component: Users
    }
  ]
})
