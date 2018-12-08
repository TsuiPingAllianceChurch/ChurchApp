<template>
    <form>
        <div class="form-group row">
            <label for="worship_type" class="col-sm-2 col-form-label">崇拜</label>
            <div class="col-sm-4">
                <select class="form-control" v-model="selectedWorship">
                    <option value="">-- 請選擇 --</option>
                    <option v-for="(worship, key) in getWorships" :value="worship.worship_id" :key="key">{{ worship.type }}</option>
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

        <div class="form-group row">
            <label for="user_name" class="col-sm-2 col-form-label">姓名</label>
            <div class="col-sm-4">
                <select class="form-control" v-model="selectedUser">
                    <option value="">-- 請選擇 --</option>
                    <option v-for="(user, key) in getUsers" v-show="checkInGroup(user.user_id)" :value="user.user_id" :key="key">{{ user['name_zh-hk'] }}</option>
                </select>
            </div>
        </div>

        <button type="button" class="btn btn-primary" @click="onSubmit" >Submit</button>
    </form>
</template>
<script>
import { mapGetters, mapActions } from 'vuex'
import _get from 'lodash/get'
import _map from 'lodash/map'
import _indexOf from 'lodash/indexOf'
import { format } from 'date-fns'

export default {
  name: 'manual-input',
  data () {
    return {
      selectedWorship: '',
      selectedGroup: '',
      selectedUser: ''
    }
  },
  computed: {
    ...mapGetters({
      getAttendances: 'getAttendances',
      getAttendance: 'getAttendance',
      getWorships: 'getWorships',
      getWorship: 'getWorship',
      getGroups: 'getGroups',
      getUsers: 'getUsers',
      getUser: 'getUser',
      getMembers: 'getMembers'
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
    resetGroup () {
      this.selectedUser = 'default'
    },
    onSubmit () {
      const message = this.getSweetMessage(this.selectedUser, this.selectedWorship)
      if (message.status === 'success') {
        const data = {
          user_id: this.selectedUser,
          worship_id: this.selectedWorship,
          created_date: format(new Date(), 'YYYY-MM-DD HH:mm:ss')
        }
        this.postAttendance(data)
      }
      this.$swal(message.title, message.desc, message.status)
    },
    getSweetMessage (userId, worshipId) {
      const validWorship = this.getWorship(worshipId)
      if (validWorship === undefined) {
        return this.errorMessage('請選擇崇拜')
      }
      const validUser = this.getUser(userId)
      if (validUser === undefined) {
        return this.errorMessage('請選擇姓名')
      }
      const isAttended = this.getAttendance(userId, worshipId)
      if (isAttended) {
        return this.warningMessage(`團友 ${_get(validUser, 'name_zh-hk')} 已點過名了`)
      }
      return {
        title: '成功點名',
        desc: `${_get(this.getUser(userId), 'name_zh-hk', '')}`,
        status: 'success'
      }
    },
    errorMessage (desc) {
      return {
        title: '點名不成功',
        desc,
        status: 'error'
      }
    },
    warningMessage (desc) {
      return {
        title: '注意',
        desc,
        status: 'warning'
      }
    },
    ...mapActions({
      postAttendance: 'postAttendance'
    })
  }
}
</script>
