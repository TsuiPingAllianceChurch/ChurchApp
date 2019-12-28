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
      getCurrentWorship: 'getCurrentWorship',
      getTodayWorship: 'getTodayWorship'
    })
  },
  methods: {
    fetchAndUpdateCurrentWorship () {
      this.fetchWorship().then((result) => {
        if (this.getTodayWorship.length === 0) {
          this.postWorships().then(() => {
            console.log('postWorships done')
            setTimeout(() => {
              this.fetchAndUpdateCurrentWorship()
            }, 5000)
          })
        } else {
          this.updateCurrentWorship()
        }
      })
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
    this.fetchAndUpdateCurrentWorship()
    this.fetchGroups()
    this.fetchMembers()
    const self = this
    setInterval(() => {
      // fetchAttendances will only retrieve new data
      self.fetchAttendances()
    }, 5000)
    setInterval(() => {
      self.fetchAndUpdateCurrentWorship()
    }, 900000) // 15 mins 900000
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
