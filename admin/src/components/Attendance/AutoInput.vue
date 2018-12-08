<template>
    <form>
        <div class="row">
            <div class="col-3">
                <select class="form-control" v-model="worshipId">
                    <option value="">-- 請選擇 --</option>
                    <option v-for="(worship, key) in getWorships" :value="worship.worship_id" :key="key">{{ worship.type }}</option>
                </select>
            </div>
        </div>
        <div class="row">
            <div class="col">
                <div class="form-group">
                    <textarea
                        v-model="attendanceStr"
                        v-on:keyup="submitAttendance"
                        class="form-control"
                        id="autoAttendInput"
                        rows="10"></textarea>
                </div>
            </div>
        </div>
    </form>
</template>

<script>
import { mapGetters, mapActions } from 'vuex'
import { format } from 'date-fns'
import _get from 'lodash/get'
import _find from 'lodash/find'
import { decode } from '../../util/AESUtils'

export default {
  name: 'auto-input',
  data () {
    return {
      attendanceStr: '',
      worshipType: '早堂',
      worshipId: ''
    }
  },
  computed: {
    ...mapGetters({
      getWorships: 'getWorships',
      getGroups: 'getGroups',
      getUsers: 'getUsers',
      getMembers: 'getMembers'
    })
  },
  methods: {
    submitAttendance: function () {
      var pat = /\[\w+\]/g

      var match
      while ((match = pat.exec(this.attendanceStr)) !== null) {
        // perform decode and submit to backend
        try {
          var search = decode(match[0].slice(1, -1))
          console.log('search:' + search)
          const data = {
            user_id: search,
            worship_id: this.worshipId,
            created_date: format(new Date(), 'YYYY-MM-DD HH:mm:ss')
          }
          this.postAttendance(data)
        } catch (e) {
          console.log(e)
        }
        this.attendanceStr = this.attendanceStr.replace(match[0], '')
      }
    },
    getWorshipType () {
      console.log('refresh for worship type...')
      if (format(new Date(), 'HH:mm:ss') > '09:45') {
        this.worshipType = '午堂'
      }
      this.worshipId = _get(_find(this.getWorships, {type: this.worshipType}), 'worship_id')
    },
    ...mapActions({
      postAttendance: 'postAttendance'
    })
  },
  mounted () {
    const self = this
    setTimeout(() => {
      self.getWorshipType()
    }, 5000)
    setInterval(() => {
      self.getWorshipType()
    }, 900000) // 15 mins
  }
}
</script>
