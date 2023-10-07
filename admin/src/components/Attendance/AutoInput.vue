<template>
    <form>
        <div class="row">
            <div class="col-3">
                <select class="form-control" v-model="worshipId" v-on:change="focusInput()">
                    <option value="">-- 請選擇 --</option>
                    <option v-for="(worship, key) in getTodayWorship" :value="worship.worship_id" :key="key">{{ worship.type }}</option>
                </select>
            </div>
        </div>
        <div class="row">
            <div class="col">
                <div class="form-group" >
                    <textarea
                        v-model="attendanceStr"
                        class="form-control"
                        id="autoAttendInput"
                        rows="2"></textarea>
                </div>
            </div>
        </div>
    </form>
</template>

<script>
import { mapGetters } from 'vuex'
import { convert } from '../../util/QRConvert'
import ValidateSubmit from '../../mixins/ValidateSubmit'

export default {
  name: 'auto-input',
  mixins: [ValidateSubmit],
  data () {
    return {
      attendanceStr: '',
      oldAttendanceStr: '',
      worshipId: '',
      userMappings: [],
      groupUsers: {}
    }
  },
  computed: {
    ...mapGetters({
      getTodayWorship: 'getTodayWorship',
      getGroups: 'getGroups',
      getUsers: 'getUsers',
      getMembers: 'getMembers',
      getCurrentWorship: 'getCurrentWorship'
    })
  },
  mounted: function () {
    this.worshipId = this.getCurrentWorship
    this.focusInput()
    this.clearInvalidInput()
    this.fetchUserMappings()
    // this.fetchGroupUsers()
  },
  created: function () {
    // window.addEventListener('keydown', this.appendChar)
  },
  methods: {
    appendChar (e) {
      if (e.key.length === 1) {
        this.attendanceStr += e.key
      }
    },
    clearInvalidInput: function () {
      var self = this
      setInterval(function () {
        if (self.attendanceStr === self.oldAttendanceStr) {
          self.attendanceStr = ''
          self.oldAttendanceStr = ''
        } else {
          self.oldAttendanceStr = self.attendanceStr
        }
        self.focusInput()
      }, 1000)
    },
    focusInput: function () {
      document.getElementById('autoAttendInput').focus()
    }
  },
  watch: {
    getCurrentWorship (val) {
      this.worshipId = val
    },
    attendanceStr: function (val) {
      var obj = convert(val, this.userMappings)
      if (obj) {
        if (obj.type === 'vaccine_qr' && !obj.found) {
          console.log('handleMissingMapping')
          obj.userid = this.handleMissingMapping(obj, this.groupUsers)
        } else {
          this.submitUser(obj)
        }
      }
    }
  }
}
</script>

<style>

.swal2-header {
  font-size: 1.3rem;
}

</style>
