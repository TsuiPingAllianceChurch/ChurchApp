import Vue from 'vue'
import Router from 'vue-router'
import Home from '@/components/Home'
import ManualAttend from '@/components/ManualAttend'
import AutoAttend from '@/components/AutoAttend'
import AttendanceListByGroup from '@/components/Attendance/AttendanceListByGroup'
import PhoneAttend from '@/components/PhoneAttend'

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
      name: 'AttendanceListByGroup',
      component: AttendanceListByGroup
    },
    {
      path: '/users',
      name: 'Users',
      component: Users
    },
    {
      path: '/phone_attend',
      name: 'PhoneAttend',
      component: PhoneAttend
    }
  ]
})
