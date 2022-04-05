<template>
    <div class="container-fluid">
        <div class="row">
            <!--Main Content-->
            <div class="col-lg-6 col-lg-push-6">
                <attendance-auto></attendance-auto>
            </div>
        </div>
        <div class="row">

            <!--Sidebar-->
            <div class="col-lg-9 col-lg-pull-9">
                <attendance-list></attendance-list>
            </div>
        </div>
    </div>
</template>

<script>
export default {
  name: 'ManualAttend',
  components: {
    'attendance-auto': () => import(/* webpackChunkName: "Attendance" */ './Attendance/AutoInput'),
    'attendance-list': () => import(/* webpackChunkName: "Attendance" */ './Attendance/AttendanceList')
  }
}
</script>
