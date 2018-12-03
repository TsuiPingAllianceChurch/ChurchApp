<template>
    <div class="container-fluid">
        <div class="row">
            <!--Main Content-->
            <div class="col-lg-6 col-lg-push-6 d-none d-lg-block">
                <attendance-manual></attendance-manual>
            </div>

            <!--Sidebar-->
            <div class="col-lg-6 col-lg-pull-6">
                <attendance-output></attendance-output>
            </div>
        </div>
    </div>
</template>

<script>
export default {
  name: 'ManualAttend',
  components: {
    'attendance-manual': () => import(/* webpackChunkName: "Attendance" */ './Attendance/ManualInput'),
    'attendance-output': () => import(/* webpackChunkName: "Attendance" */ './Attendance/Output')
  }
}
</script>
