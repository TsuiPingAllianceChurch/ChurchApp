/* eslint-disable */
import { mapGetters, mapActions } from 'vuex'
import _get from 'lodash/get'
import _map from 'lodash/map'
import { format } from 'date-fns'
import { getMappings, getGroupUsers } from '../../api/user'

export default {
  computed: {
    ...mapGetters({
      getAttendance: 'getAttendance',
      getWorship: 'getWorship',
      getUser: 'getUser'
    })
  },
  methods: {
    fetchUserMappings () {
      getMappings().then((result) => {
        _map(result.User_Mapping, (item, key) => {
          this.userMappings.push(item)
        })
      })
    },
    fetchGroupUsers () {
      getGroupUsers().then((result) => {
        var target = {}; result.records.forEach(function(key) {
          var users = {}; key.User.forEach(function(item) {
            users[item['user_id']] = item['name_zh-hk']
          })
          target[key['name_zh-hk']] = users
        })
        this.groupUsers = target
      })
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
    submitUser: function (obj) {
      if (obj) {
        console.log(obj)

        const toast = this.$swal.mixin({
          toast: true,
          position: 'center',
          showConfirmButton: false,
          timer: 5000,
          padding: '1rem'
        })

        try {
          const message = this.getSweetMessage(obj.userid, this.worshipId)
          if (message.status === 'success') {
            const data = {
              user_id: obj.userid,
              worship_id: this.worshipId,
              created_date: format(new Date(), 'YYYY-MM-DD HH:mm:ss')
            }
            this.postAttendance(data)
          }
          toast.fire({
            icon: message.status,
            title: `${message.title} - ${message.desc}`,
            timer: 2000,
            showConfirmButton: false,
            timerProgressBar: true,
            allowEnterKey: false
          })
        } catch (e) {
          console.log(e)
          toast.fire({
            icon: 'error',
            title: '點名不成功 - 請輸入正確代碼',
            timer: 2000,
            showConfirmButton: false,
            timerProgressBar: true,
            allowEnterKey: false
          })
        }
      }
    },
    async handleMissingMapping (obj, groupUsers) {
      console.log(obj)
      console.log(groupUsers)
      const toast = this.$swal.mixin({
        toast: true,
        position: 'center',
        showConfirmButton: false,
        padding: '1rem'
      })
      const { value: userid } = await toast.fire({
        title: '找不到記錄',
        input: 'select',
        inputOptions: groupUsers,
        inputPlaceholder: '選擇會員',
        showCancelButton: true
      })

      if (userid) {
        obj.userid = parseInt(userid)
        const data = {
          user_id: obj.userid,
          mapping: obj.mappingstr
        }
        this.postMapping(data)

        obj.found = true
        this.submitUser(obj)
      }
    },
    ...mapActions({
      postAttendance: 'postAttendance',
      postMapping: 'postMapping'
    })
  }
}
