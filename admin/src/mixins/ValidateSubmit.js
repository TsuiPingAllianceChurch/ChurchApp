import { mapGetters } from 'vuex'
import _get from 'lodash/get'
export default {
  computed: {
    ...mapGetters({
      getAttendance: 'getAttendance',
      getWorship: 'getWorship',
      getUser: 'getUser'
    })
  },
  methods: {
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
    }
  }
}
