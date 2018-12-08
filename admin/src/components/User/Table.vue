<template>
  <div class="user-table">

<div class="card" style="width: 18rem;" v-for="(item, key) in getUsers" :key="key" >
  <qrcode-vue :value=item.qrcode :size="200" level="H" class="card-img-top"></qrcode-vue>
  <div class="card-body">
    <h5 class="card-title">{{ item['name_zh-hk'] }}</h5>
    <p class="card-text">{{ item['user_id'] }}</p>
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
h1, h2 {
  font-weight: normal;
}
ul {
  list-style-type: none;
  padding: 0;
}
li {
  display: inline-block;
  margin: 0 10px;
}
a {
  color: #42b983;
}
.user-table {
  cursor: pointer;
  border-radius: 10px;
  margin: 0 auto;
  width: 100%;
}
.user-row {
  display: flex;
  color: #808080;
  background-color: #fff;
}
.user-column {
  flex: 1;
  height: 60px;
  line-height: 60px;
}
.user-row_head .user-column {
  color: #fff;
  background-color: #36304a;
}
.user-row:nth-child(even) {
  background-color: #f5f5f5;
}
.user-row:hover {
  background-color:#f5f5f5;
}
</style>
