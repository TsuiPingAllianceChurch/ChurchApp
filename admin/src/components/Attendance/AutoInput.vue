<template>
    <form>
        <div class="row">
            <div class="col-3">
                <select class="form-control">
                    <option v-for="(worship, key) in getWorship" :value="worship.worship_id" :key="key">{{ worship.type }}</option>
                </select>
            </div>
        </div>
        <div class="row">
            <div class="col">
                <div class="form-group">
                    <textarea class="form-control" id="autoAttendInput" rows="10"></textarea>
                </div>
            </div>
        </div>
    </form>
</template>
<script>
import { mapGetters } from 'vuex'
export default {
  name: 'auto-input',
  computed: {
    ...mapGetters({
      getWorship: 'getWorship'
    })
  }
}
</script>
