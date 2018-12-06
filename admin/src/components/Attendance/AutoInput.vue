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
import { mapGetters } from 'vuex'
export default {
  name: 'auto-input',
  data () {
    return {
      attendanceStr: '',
      worshiptype: ''
    }
  },
  methods: {
    submitAttendance: function () {
      var pat = /\[\w+\]/g

      var match
      while ((match = pat.exec(this.attendanceStr)) !== null) {
        // perform decode and submit to backend
        var search = match[0].slice(1, -1)
        console.log('submit ' + search + ' for ' + this.worshiptype)
        this.attendanceStr = this.attendanceStr.replace(match[0], '')
      }
    }
  },
  computed: {
    ...mapGetters({
      getWorship: 'getWorship'
    })
  }
}
</script>
