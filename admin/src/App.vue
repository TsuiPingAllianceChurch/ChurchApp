<template>
  <div id="app">
    <navbar></navbar>
    <router-view/>
  </div>
</template>

<script>
import { mapActions } from 'vuex'
export default {
  name: 'App',
  components: {
    'navbar': () => import(/* webpackChunkName: "Header" */ './components/Header/Navbar')
  },
  methods: {
    ...mapActions({
      fetchUsers: 'fetchUsers',
      fetchWorship: 'fetchWorship',
      fetchGroups: 'fetchGroups',
      fetchMembers: 'fetchMembers',
      fetchAttendances: 'fetchAttendances'
    })
  },
  mounted () {
    this.fetchUsers()
    this.fetchWorship()
    this.fetchGroups()
    this.fetchMembers()
    const self = this
    setInterval(() => {
      console.log('refresh for attendances list...')
      self.fetchAttendances()
    }, 20000)
  }
}
</script>

<style>
#app {
  font-family: 'Avenir', Helvetica, Arial, sans-serif;
  -webkit-font-smoothing: antialiased;
  -moz-osx-font-smoothing: grayscale;
  text-align: center;
  color: #2c3e50;
}
</style>
