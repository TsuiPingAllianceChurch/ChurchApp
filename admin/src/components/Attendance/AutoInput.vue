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
import { decode } from '../../util/AESUtils'
import ValidateSubmit from '../../mixins/ValidateSubmit'

export default {
  name: 'auto-input',
  mixins: [ValidateSubmit],
  data () {
    return {
      attendanceStr: '',
      worshipId: ''
    }
  },
  computed: {
    ...mapGetters({
      getWorships: 'getWorships',
      getGroups: 'getGroups',
      getUsers: 'getUsers',
      getMembers: 'getMembers',
      getCurrentWorship: 'getCurrentWorship'
    })
  },
  methods: {
    submitAttendance: function () {
      const toast = this.$swal.mixin({
        toast: true,
        position: 'top-end',
        showConfirmButton: false,
        timer: 3000
      })
      var pat = /\[\w+\]/g
      var match
      while ((match = pat.exec(this.attendanceStr)) !== null) {
        // perform decode and submit to backend
        try {
          var search = decode(match[0].slice(1, -1))
          console.log('search:' + search)
          const message = this.getSweetMessage(search, this.worshipId)
          if (message.status === 'success') {
            const data = {
              user_id: search,
              worship_id: this.worshipId,
              created_date: format(new Date(), 'YYYY-MM-DD HH:mm:ss')
            }
            this.postAttendance(data)
          }
          toast({
            type: message.status,
            title: `${message.title} - ${message.desc}`
          })
        } catch (e) {
          console.log(e)
          toast({
            type: 'error',
            title: '點名不成功 - 請輸入正確代碼'
          })
        }
        this.attendanceStr = this.attendanceStr.replace(match[0], '')
      }
    },
    ...mapActions({
      postAttendance: 'postAttendance'
    })
  },
  watch: {
    getCurrentWorship (val) {
      this.worshipId = val
    }
  }
}
</script>
