<template>
    <div class="container-fluid">
        <div class="row">
            <!--Main Content-->
            <div class="col-lg-6 col-lg-push-6">
                <attendance-phone></attendance-phone>
            </div>

            <!--Sidebar-->
            <div class="col-lg-6 col-lg-pull-6">
                <attendance-list></attendance-list>
            </div>
        </div>
    </div>
</template>

<script>
export default {
  name: 'PhoneAttend',
  components: {
    'attendance-phone': () => import(/* webpackChunkName: "PhoneAttend" */ './Attendance/PhoneQRInput'),
    'attendance-list': () => import(/* webpackChunkName: "Attendance" */ './Attendance/AttendanceList')
  }
}
</script>
