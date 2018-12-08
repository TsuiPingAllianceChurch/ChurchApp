<template>
  <a :href="path" @click="onClick(page)" :class="{'active': isActive}">{{ text }}</a>
</template>

<script>
import { mapGetters, mapActions } from 'vuex'
export default {
  name: 'header-link',
  props: ['path', 'page', 'text'],
  data () {
    return {
      active: null
    }
  },
  computed: {
    isActive () {
      return this.page === this.getPage
    },
    ...mapGetters({
      getPage: 'getPage'
    })
  },
  methods: {
    onClick (page) {
      this.updatePage({page: this.page})
    },
    ...mapActions({
      updatePage: 'updatePage'
    })
  }
}
</script>

<style scoped>
a {
  color: #CBBDE8;
  text-decoration: none;
}
.active {
  color: #fff;
}
</style>
