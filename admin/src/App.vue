<template>
  <div id="app">
    <navbar></navbar>
    <router-view/>
  </div>
</template>

<script>
import { mapGetters, mapActions } from 'vuex'
export default {
  name: 'App',
  components: {
    'navbar': () => import(/* webpackChunkName: "Header" */ './components/Header/Navbar')
  },
  computed: {
    ...mapGetters({
      getCurrentWorship: 'getCurrentWorship'
    })
  },
  methods: {
    IsPostWorship () {
      if (!this.getCurrentWorship) {
        console.log('need to post worship')
        this.postWorships()
      }
    },
    ...mapActions({
      fetchUsers: 'fetchUsers',
      fetchWorship: 'fetchWorship',
      fetchGroups: 'fetchGroups',
      fetchMembers: 'fetchMembers',
      fetchAttendances: 'fetchAttendances',
      updateCurrentWorship: 'updateCurrentWorship',
      postWorships: 'postWorships'
    })
  },
  mounted () {
    this.fetchUsers()
    this.fetchWorship()
    this.fetchGroups()
    this.fetchMembers()
    const self = this
    setInterval(() => {
      // fetchAttendances will only retrieve new data
      self.fetchAttendances()
    }, 5000)
    setTimeout(() => {
      self.updateCurrentWorship()
    }, 5000)
    setTimeout(() => {
      self.IsPostWorship()
    }, 10000)
    setInterval(() => {
      self.updateCurrentWorship()
      self.IsPostWorship()
    }, 900000) // 15 mins
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
