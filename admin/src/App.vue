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
    this.fetchAttendances()
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
