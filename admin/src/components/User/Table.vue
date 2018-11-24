<template>
  <div class="user-table">
    <div class="user-row user-row_head">
      <div class="user-column">User Id</div>
      <div class="user-column">Name</div>
    </div>
    <div v-for="(item, key) in getUsers" :key="key" class="user-row">
      <div class="user-column">{{ item['user_id'] }}</div>
      <div class="user-column">{{ item['name_zh-hk'] }}</div>
    </div>
  </div>
</template>

<script>
import { mapGetters, mapActions } from 'vuex'
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
  methods: {
    ...mapActions({
      fetchUsers: 'fetchUsers'
    })
  },
  mounted () {
    this.fetchUsers()
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
