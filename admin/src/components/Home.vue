<template>
  <div class="hello">
    <h1>{{ msg }}</h1>
    <user-table></user-table>
  </div>
</template>

<script>
export default {
  name: 'Home',
  data () {
    return {
      msg: 'Church Admin App'
    }
  },
  components: {
    'user-table': () => import(/* webpackChunkName: "User" */ './User/Table')
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
