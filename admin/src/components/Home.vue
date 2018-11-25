<template>
  <div class="hello">
    <h1>{{ msg }}</h1>
    <div v-for="(worship, key) in getWorship" :key="key">
      <input type="radio" :id="worship.worship_id" :value="worship.worship_id" v-model="picked">
      <label :for="worship.worship_id">{{ worship.date }} - {{ worship.type }}</label>
    </div>
    <span>Picked: {{ picked }}</span>
    <user-table></user-table>
  </div>
</template>

<script>
import { mapGetters, mapActions } from 'vuex'
import _map from 'lodash/map'
export default {
  name: 'Home',
  data () {
    return {
      msg: 'Church Admin App',
      picked: 0
    }
  },
  components: {
    'user-table': () => import(/* webpackChunkName: "User" */ './User/Table')
  },
  computed: {
    ...mapGetters({
      getWorship: 'getWorship'
    })
  },
  methods: {
    ...mapActions({
      fetchWorship: 'fetchWorship'
    })
  },
  mounted () {
    this.fetchWorship()
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
</style>
