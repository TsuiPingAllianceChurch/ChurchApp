<template>
  <div id="app">
    <router-view/>
  </div>
</template>

<script>
import { mapActions } from 'vuex'
export default {
  name: 'App',
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
    }, 5000)
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
  margin-top: 60px;
}
</style>
