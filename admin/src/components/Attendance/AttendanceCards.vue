<template>
  <div class="card-columns" >
    <div class="card" v-for="(item, key) in attendanceList" :key="key">
      <img class="card-img-top" :src=item.avator alt="Avator">
      <div class="card-body">
        <h5 class="card-title">{{ item.userName }}</h5>
        <p class="card-text">{{ item.groupName }}</p>
      </div>
      <div class="card-footer">
        <small class="text-muted">#{{ item.attendanceId }} : {{ item.date | moment("from") }}</small>
      </div>
    </div>
  </div>
</template>

<script>
import { mapGetters } from 'vuex'
import _get from 'lodash/get'
import _map from 'lodash/map'

export default {
  name: 'attendanceCards',
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
      return result
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
