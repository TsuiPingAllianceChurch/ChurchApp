<template>
    <form>
        <div class="row">
            <div class="col-6">
                <select class="form-control" v-model="worshipId">
                    <option value="">-- 請選擇 --</option>
                    <option v-for="(worship, key) in getWorships" :value="worship.worship_id" :key="key">{{ worship.type }}</option>
                </select>
            </div>
        </div>
        <div class="row">
            <div class="col">
                <div class="form-group">
                    <vue-qr-reader v-on:code-scanned="codeArrived" :stop-on-scanned="false" />
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
import VueQrReader from 'vue-qr-reader/dist/lib/vue-qr-reader.umd.js'

export default {
  name: 'phone-qr-input',
  mixins: [ValidateSubmit],
  components: {
    VueQrReader
  },
  data () {
    return {
      worshipId: '',
      qrcode: '',
      inprogress: false
    }
  },
  computed: {
    ...mapGetters({
      getWorships: 'getWorships',
      getCurrentWorship: 'getCurrentWorship'
    })
  },
  methods: {
    codeArrived (code) {
      const toast = this.$swal.mixin({
        toast: true,
        position: 'center',
        showConfirmButton: false,
        timer: 3000
      })

      var pat = /\[\w+\]/g
      var match

      if (!this.inprogress) {
        this.inprogress = true

        while ((match = pat.exec(code)) !== null) {
          // perform decode and submit to backend
          try {
            var search = decode(match[0].slice(1, -1))
            if (search !== this.qrcode) {
              console.log('search:' + search)
              const message = this.getSweetMessage(search, this.worshipId)
              if (message.status === 'success') {
                const data = {
                  user_id: search,
                  worship_id: this.worshipId,
                  created_date: format(new Date(), 'YYYY-MM-DD HH:mm:ss')
                }
                this.postAttendance(data)

                this.qrcode = search
              }
              toast({
                type: message.status,
                title: `${message.title} - ${message.desc}`
              })
            }
          } catch (e) {
            console.log(e)
            toast({
              type: 'error',
              title: '點名不成功 - 請輸入正確代碼'
            })
          }
        }
        this.inprogress = false
      }
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
    ...mapActions({
      postAttendance: 'postAttendance'
    })
  },
  watch: {
    getCurrentWorship (val) {
      this.selectedWorship = val
    }
  }
}
</script>
