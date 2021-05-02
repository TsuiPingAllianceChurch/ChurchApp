<template>
  <div>
    <table class="table">
    <thead>
        <tr>
        <th scope="col">#</th>
        <th scope="col">Name</th>
        <th scope="col">Group</th>
        <th scope="col">Date</th>
        <th scope="col"></th>
        </tr>
    </thead>
    <tbody>
      <tr v-for="(item, key) in attendanceList" :key="key">
        <th scope="row">{{ item.attendanceId }} </th>
        <td>{{ item.userName }}</td>
        <td>{{ item.groupName }}</td>
        <td>{{ item.date }}</td>
        <td><button v-on:click="delAttendance( item.attendanceId )">del</button></td>
      </tr>
    </tbody>
    </table>
  </div>
</template>
<script>
import { mapGetters, mapActions } from 'vuex'
import _get from 'lodash/get'
import _map from 'lodash/map'
import _orderBy from 'lodash/orderBy'

export default {
  name: 'attendanceList',
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
  },
  methods: {
    delAttendance: function (id) {
      this.deleteAttendance(id)
    },
    ...mapActions({
      deleteAttendance: 'deleteAttendance'
    })
  }
}
</script>
