<template>
  <div class="row">
    <div class="col-sm-2" v-for="(item, key) in attendanceList" :key="key">
    <div class="card">
      <img class="card-img-top rounded-circle" :src=item.avator alt="Avator">
      <div class="card-body">
        <h5 class="card-title">{{ item.userName }}</h5>
        <p class="card-text">{{ item.groupName }}</p>
        <small class="text-muted">#{{ item.attendanceId }} : {{ displayDate(item.date) }}</small>
      </div>
    </div>
    </div>
  </div>
</template>

<script>
import { mapGetters } from 'vuex'
import { distanceInWordsToNow } from 'date-fns'
import _get from 'lodash/get'
import _map from 'lodash/map'
import _orderBy from 'lodash/orderBy'

const zhLocale = require('date-fns/locale/zh_tw')

export default {
  name: 'attendanceCards',
  data () {
    return {
      distanceInWordsToNow
    }
  },
  methods: {
    displayDate (ddate) {
      return this.distanceInWordsToNow(ddate, {locale: zhLocale})
    }
  },
  computed: {
    attendanceList () {
      let result = []
      _map(this.getAttendances, attendance => {
        const user = this.getUser(attendance.user_id)
        const member = this.getMember(attendance.user_id)
        const group = this.getGroup(_get(member, 'group_id'))
        result.push({
          attendanceId: attendance.attendance_id,
          userName: _get(user, 'name_zh-hk', ''),
          groupName: _get(group, 'name_zh-hk', ''),
          avator: _get(this.getUser(attendance.user_id), 'avator', ''),
          date: attendance.created_date
        })
      })
      return _orderBy(result, ['date'], ['desc'])
    },
    ...mapGetters({
      getGroup: 'getGroup',
      getUser: 'getUser',
      getMember: 'getMember',
      getAttendances: 'getAttendances'
    })
  }
}
</script>

<style>
  .card {
    margin: 10px
  }
  .card-img-top {
    width: 60%;
    display: block;
    margin-left: auto;
    margin-right: auto;
    margin-top: 10px;
  }
</style>
