<template>
    <form>
        <div class="row">
            <div class="col-3">
                <select class="form-control" v-model="worshiptype">
                    <option v-for="(worship, key) in getWorship" :value="worship.worship_id" :key="key">{{ worship.type }}</option>
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
import { decode } from '../../util/AESUtils'

export default {
  name: 'auto-input',
  data () {
    return {
      attendanceStr: '',
      worshiptype: ''
    }
  },
  computed: {
    ...mapGetters({
      getWorship: 'getWorship',
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
            worship_id: this.worshiptype,
            created_date: format(new Date(), 'YYYY-MM-DD HH:mm:ss')
          }
          this.postAttendance(data)
        } catch (e) {
          console.log(e)
        }
        this.attendanceStr = this.attendanceStr.replace(match[0], '')
      }
    },
    ...mapActions({
      postAttendance: 'postAttendance'
    })
  }
}
</script>
