<template>
  <div id="app">
    <img src="./assets/logo.png">
    {{ info }}
    <router-view/>
  </div>
</template>

<script>
import { getUsers } from '../api/user'
export default {
  name: 'App',
  data () {
    return {
      info: null
    }
  },
  mounted () {
    const users = getUsers().then((result) => {
      console.warn('result', result)
      this.info = result
    })
    console.warn('users', users)
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
