<template>
  <form>
    <div class="row">
      <div class="col-6">
        <select class="form-control" v-model="worshipId">
          <option value="">-- 請選擇 --</option>
          <option v-for="(worship, key) in getTodayWorship" :value="worship.worship_id" :key="key">{{ worship.type }}</option>
        </select>
      </div>
    </div>
    <div class="row">
      <div class="col">
        <div class="form-group">
          <qrcode-scanner
            :qrbox="250"
            :fps="10"
            @result="onScan"
          />
        </div>
      </div>
    </div>
  </form>

</template>

<script>
import { mapGetters } from 'vuex'
import _map from 'lodash/map'
import { convert } from '../../util/QRConvert'
import ValidateSubmit from '../../mixins/ValidateSubmit'
import { getMappings } from '../../../api/user'
import QRScanner from '../QRScanner.vue'

export default {
  name: 'phone-qr-input',
  components: {
    'qrcode-scanner': QRScanner
  },
  mixins: [ValidateSubmit],
  data () {
    return {
      worshipId: '',
      userMappings: [],
      history: [],
      groupUsers: {}
    }
  },
  computed: {
    ...mapGetters({
      getTodayWorship: 'getTodayWorship',
      getCurrentWorship: 'getCurrentWorship'
    })
  },
  mounted: function () {
    this.worshipId = this.getCurrentWorship
    this.fetchUserMappings()
    this.fetchGroupUsers()
  },
  methods: {
    fetchUserMappings: function () {
      getMappings().then((result) => {
        _map(result.User_Mapping, (item, key) => {
          this.userMappings.push(item)
        })
      })
    },
    onScan (decodedText, decodedResult) {
      // handle the message here :)
      if (this.history.indexOf(decodedText) < 0) {
        var obj = convert(decodedText, this.userMappings)
        console.log(obj)
        if (obj) {
          if (obj.type === 'vaccine_qr' && !obj.found) {
            console.log('handleMissingMapping')
            obj.userid = this.handleMissingMapping(obj, this.groupUsers)
          } else {
            this.submitUser(obj)
          }
        }
        this.history.push(decodedText)
      }
    }
  },
  watch: {
    getCurrentWorship (val) {
      this.worshipId = val
    }
  }
}
</script>

<style>
#qr-code-full-region__dashboard_section_swaplink {
  display: none;
}
</style>
