<template>
    <form>
        <div class="row">
            <div class="col">
                <div class="form-group">
                    <vue-qr-reader ref="qr"
                      v-on:code-scanned="codeArrived"
                      :stop-on-scanned="false"
                      :use-back-camera="true"
                      :draw-on-found="true"
                      :video-height="480"
                      :video-width="640"
                      :responsive="true">
                    </vue-qr-reader>
                </div>
            </div>
        </div>
    </form>
</template>

<script>
import { decode } from '../util/AESUtils'
import VueQrReader from 'vue-qr-reader/dist/lib/vue-qr-reader.umd.js'

export default {
  name: 'QRCheck',
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
  methods: {
    codeArrived (code) {
      console.log(code)
      const toast = this.$swal.mixin({
        toast: true,
        position: 'center',
        showConfirmButton: false,
        timer: 3000
      })
      var pat = /\[\w+\]/g
      var match

      if (this.qrcode !== code) {
        this.qrcode = code
        while ((match = pat.exec(code)) !== null) {
          // perform decode and submit to backend
          try {
            var search = decode(match[0].slice(1, -1))
            console.log('search:' + search)
            toast({
              type: 'success',
              title: `ID - ${search}`
            })
          } catch (e) {
            console.log(e)
            toast({
              type: 'error',
              title: `ID - ${search}`
            })
          }
        }
      }
    }
  }
}
</script>
