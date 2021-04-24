<template>
  <div id="profile">
    <qrcode-vue :value="item.qrcode" :size="160" level="H" class="card-img-top"></qrcode-vue>
    <div class="card-body">
      <h5 class="card-title">{{ item['name_zh-hk'] }}</h5>
    </div>
  </div>
</template>

<script>
import QrcodeVue from 'qrcode.vue'
import { mapGetters } from 'vuex'

export default {
  name: 'Home',
  data () {
    return {
      item: null
    }
  },
  computed: {
    ...mapGetters({
      getUser: 'getUser'
    })
  },
  components: {
    QrcodeVue
  },
  mounted: function () {
    setTimeout(() => {
      this.item = this.getUser(parseInt(this.$route.params.id))
    }, 1000)
  }
}
</script>

<!-- Add "scoped" attribute to limit CSS to this component only -->
<style scoped>
#profile {
  margin: 20px;
}
</style>
