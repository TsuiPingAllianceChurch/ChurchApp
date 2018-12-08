<template>
  <div class="navbar">
    <ul>
      <li v-for="(link, key) in links" :key="key">
        <header-link :path='link.path' :page="link.page" :text="link.text"></header-link>
      </li>
    </ul>
  </div>
</template>

<script>
export default {
  name: 'navbar',
  components: {
    'header-link': () => import(/* webpackChunkName: "Header" */ './Link')
  },
  data () {
    return {
      active: null,
      links: [{
        path: '/#/',
        page: 'Home',
        text: '主頁'
      }, {
        path: '/#/auto_attend',
        page: 'AutoAttend',
        text: '自動點名'
      }, {
        path: '/#/manual_attend',
        page: 'ManualAttend',
        text: '手動點名'
      }, {
        path: '/#/attendance',
        page: 'Attendance',
        text: '點名表'
      }]
    }
  }
}
</script>

<!-- Add "scoped" attribute to limit CSS to this component only -->
<style scoped>
.navbar {
  height: 40px;
  background-color: #1c2129;
  margin-bottom: 30px;
}
.navbar ul {
  list-style: none;
  display: flex;
  margin-bottom: 0;
}
.navbar ul li + li {
  margin-left: 20px;
}
</style>
