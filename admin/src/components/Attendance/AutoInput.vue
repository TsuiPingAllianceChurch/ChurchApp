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
                        v-model.lazy="attendanceStr"
                        class="form-control"
                        id="autoAttendInput"
                        rows="10"></textarea>
                </div>
            </div>
        </div>
    </form>
</template>

<script>
/* eslint-disable */
import { mapGetters } from 'vuex'
import _map from 'lodash/map'
import { convert } from '../../util/QRConvert'
import ValidateSubmit from '../../mixins/ValidateSubmit'
import { getMappings, getGroupUsers } from '../../../api/user'

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
    this.fetchGroupUsers()
  },
  created: function () {
    window.addEventListener('keydown', this.appendChar)
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
      }, 1000)
    },
    fetchUserMappings: function () {
      getMappings().then((result) => {
        _map(result.User_Mapping, (item, key) => {
          this.userMappings.push(item)
        })
      })
    },
    fetchGroupUsers: function () {
      getGroupUsers().then((result) => {
        var target = {}; result.records.forEach(function(key) {
          var users = {}; key.User.forEach(function(item) {
            users[item['user_id']] = item['name_zh-hk']
          })
          target[key['name_zh-hk']] = users
        })
        console.log(target)
        this.groupUsers = target
      })
    },
    focusInput: function () {
      // document.getElementById('autoAttendInput').focus()
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

      // matching first type of pattern [1123123132]
      // if (/\[\w+\]/.test(val)) {
      //   this.submitAttendance()
      // }
      // // matching second type of pattern XXXXXXXX=
      // if (/HKSARG|VAC\w+=/.test(val)) {
      //   this.submitVaccineRecord()
      // }
    }
  }
}
</script>

<style>

.swal2-header {
  font-size: 2rem;
}

</style>
