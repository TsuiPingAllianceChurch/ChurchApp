<template>
  <div>
    <table class="table">
    <thead>
        <tr>
        <th scope="col">#</th>
        <th scope="col">Name</th>
        <th scope="col">Group</th>
        <th scope="col">Date</th>
        </tr>
    </thead>
    <tbody>
      <tr v-for="(item, key) in attendanceList" :key="key">
        <th scope="row">{{ item.attendanceId }} </th>
        <td>{{ item.userName }}</td>
        <td>{{ item.groupName }}</td>
        <td>{{ item.date }}</td>
      </tr>
    </tbody>
    </table>
  </div>
</template>
<script>
import { mapGetters } from 'vuex'
import _get from 'lodash/get'
import _map from 'lodash/map'

export default {
  name: 'attendanceList',
  computed: {
    attendanceList () {
      let result = []
      _map(this.getAttendances, attendance => {
        result.push({
          attendanceId: attendance.attendance_id,
          userName: _get(this.getUser(attendance.user_id), 'name_zh-hk', ''),
          groupName: _get(this.getGroup(attendance.user_id), 'name_zh-hk', ''),
          date: attendance.created_date
        })
      })
      return result
    },
    ...mapGetters({
      getGroup: 'getGroup',
      getUser: 'getUser',
      getAttendances: 'getAttendances'
    })
  }
}
</script>
