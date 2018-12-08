<template>
  <div class="hello">
    <h1>{{ msg }}</h1>
    <users></users>
  </div>
</template>

<script>
import { mapGetters } from 'vuex'
export default {
  name: 'Home',
  data () {
    return {
      msg: 'Church Admin App',
      picked: 0
    }
  },
  components: {
    'users': () => import(/* webpackChunkName: "User" */ './Users')
  },
  computed: {
    ...mapGetters({
      getWorship: 'getWorship'
    })
  }
}
</script>

<!-- Add "scoped" attribute to limit CSS to this component only -->
<style scoped>
</style>
