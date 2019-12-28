<template>
    <form>
        <div class="form-group row">
            <label for="group_name" class="col-sm-2 col-form-label">崇拜</label>
            <div class="col-sm-4">
                <select class="form-control" v-model="worshipDate">
                    <option value="">-- 請選擇 --</option>
                    <option v-for="(date) in getWorshipDate" :value="date" :key="date">{{ date }}</option>
                </select>
            </div>
        </div>

        <div class="form-group row">
            <label for="group_name" class="col-sm-2 col-form-label">團契</label>
            <div class="col-sm-4">
                <select class="form-control" v-model="selectedGroup" @change="resetGroup">
                    <option value="">-- 請選擇 --</option>
                    <option v-for="(group, key) in getGroups" :value="group.group_id" :key="key">{{ group['name_zh-hk'] }}</option>
                </select>
            </div>
        </div>

        <div>
          <table class="table">
          <thead>
              <tr>
              <th scope="col">#</th>
              <th scope="col">Name</th>
              <th scope="col">中文名</th>
              <th scope="col">出席</th>
              </tr>
          </thead>
          <tbody>
            <tr v-for="(user, key) in getUsers" v-show="checkInGroup(user.user_id)"  :key="key">
              <td scope="row">{{ user.user_id }} </td>
              <td>{{ user.name_en }}</td>
              <td>{{ user['name_zh-hk'] }}</td>
              <td>{{ checkAttend(user.user_id) }}</td>
            </tr>
          </tbody>
          </table>
        </div>
    </form>
</template>
<script>
import { mapGetters } from 'vuex'
import _map from 'lodash/map'
import _find from 'lodash/find'
import _filter from 'lodash/filter'
import _uniq from 'lodash/uniq'
import _indexOf from 'lodash/indexOf'

export default {
  name: 'manual-input',
  data () {
    return {
      worshipDate: '',
      worshipId: '',
      selectedGroup: '',
      selectedUser: ''
    }
  },
  computed: {
    getWorshipDate () {
      return _uniq(_map(this.getWorships, 'date'))
    },
    ...mapGetters({
      getAttendances: 'getAttendances',
      getAttendance: 'getAttendance',
      getWorships: 'getWorships',
      getWorship: 'getWorship',
      getGroups: 'getGroups',
      getUsers: 'getUsers',
      getUser: 'getUser',
      getMembers: 'getMembers',
      getCurrentWorship: 'getCurrentWorship'
    })
  },
  methods: {
    checkInGroup (userId) {
      let userList = []
      _map(this.getMembers, member => {
        if (member.group_id === this.selectedGroup) {
          userList.push(member.user_id)
        }
      })
      return _indexOf(userList, userId) !== -1
    },
    checkAttend (userId) {
      let worship1 = _find(this.getWorships, {date: this.worshipDate, type: '早堂'})
      if (worship1) {
        if (_find(_filter(this.getAttendances, {worship_id: worship1.worship_id}), {user_id: userId})) {
          return '早堂'
        }
      }

      let worship2 = _find(this.getWorships, {date: this.worshipDate, type: '午堂'})
      if (worship2) {
        if (_find(_filter(this.getAttendances, {worship_id: worship2.worship_id}), {user_id: userId})) {
          return '午堂'
        }
      }
    },
    resetGroup () {
      this.selectedUser = 'default'
    }
  },
  watch: {
    getCurrentWorship (val) {
      this.selectedWorship = val
    }
  }
}
</script>
