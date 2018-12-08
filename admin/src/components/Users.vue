<template>
    <div class="container-fluid">
        <div class="row">
            <!--Main Content-->
            <div class="col-lg-12">
                <user-table></user-table>
            </div>
        </div>
    </div>
</template>

<script>
export default {
  name: 'Users',
  components: {
    'user-table': () => import(/* webpackChunkName: "User" */ './User/Table')
  }
}
</script>
