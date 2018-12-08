<template>
  <div class="user-table">
    <div class="card" style="width: 18rem;" v-for="(item, key) in getUsers" :key="key" >
      <div class="card-wrapper">
        <qrcode-vue :value="item.qrcode" :size="200" level="H" class="card-img-top"></qrcode-vue>
        <div class="card-body">
          <h5 class="card-title">{{ item['name_zh-hk'] }}</h5>
          <p class="card-text">{{ item['user_id'] }}</p>
        </div>
      </div>
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
      info: null
    }
  },
  computed: {
    ...mapGetters({
      getUsers: 'getUsers'
    })
  },
  components: {
    QrcodeVue
  }
}
</script>

<!-- Add "scoped" attribute to limit CSS to this component only -->
<style scoped>
.user-table {
  cursor: pointer;
  border-radius: 10px;
  margin: 0 auto;
  width: 100%;
  display: flex;
  flex-wrap: wrap;
}
.user-table .card .card-wrapper {
  margin: 20px;
}
</style>
