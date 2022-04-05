<template>
  <div id="qr-code-full-region">
  </div>
</template>

<script>
import {Html5QrcodeScanner} from 'html5-qrcode'

export default {
  name: 'qrcode-scanner',
  props: {
    qrbox: {
      type: Number,
      default: 250
    },
    fps: {
      type: Number,
      default: 10
    }
  },
  mounted () {
    const config = {
      fps: this.fps,
      qrbox: this.qrbox,
      rememberLastUsedCamera: true
    }
    const scanner = new Html5QrcodeScanner('qr-code-full-region', config)
    scanner.render(this.onScanSuccess)
  },
  methods: {
    onScanSuccess (decodedText, decodedResult) {
      this.$emit('result', decodedText, decodedResult)
    }
  }
}
</script>
