<template>
  <div class="user-table">
    <div class="form-group row" style="width: 100%;">
        <label for="group_name" class="col-sm-2 col-form-label">團契</label>
        <div class="col-sm-4">
            <select class="form-control" v-model="selectedGroup">
                <option value="">-- 請選擇 --</option>
                <option v-for="(group, key) in getGroups" :value="group.group_id" :key="key">{{ group['name_zh-hk'] }}</option>
            </select>
        </div>
    </div>
    <br/>

    <div class="card" style="width: 12.5rem;" v-for="(item, key) in getUsers" :key="key" v-show="checkInGroup(item.user_id)" >
      <div class="card-wrapper">
        <qrcode-vue :value="item.qrcode" :size="160" level="H" class="card-img-top"></qrcode-vue>
        <div class="card-body">
          <h5 class="card-title">{{ item['name_zh-hk'] }}</h5>
          <!-- <p class="card-text">{{ item['user_id'] }}</p> -->
        </div>
      </div>
    </div>
  </div>
</template>

<script>
import QrcodeVue from 'qrcode.vue'
import { mapGetters } from 'vuex'
import _map from 'lodash/map'
import _indexOf from 'lodash/indexOf'

export default {
  name: 'Home',
  data () {
    return {
      info: null,
      selectedGroup: ''
    }
  },
  computed: {
    ...mapGetters({
      getGroups: 'getGroups',
      getUsers: 'getUsers',
      getMembers: 'getMembers'
    })
  },
  components: {
    QrcodeVue
  },
  methods: {
    checkInGroup (userId) {
      let userList = []
      _map(this.getMembers, member => {
        if (member.group_id === this.selectedGroup) {
          userList.push(member.user_id)
        }
      })
      return _indexOf(userList, userId) !== -1
    }
  }
}
</script>

<!-- Add "scoped" attribute to limit CSS to this component only -->
<style scoped>
.user-table {
  cursor: pointer;
  border-radius: 10px;
  margin: 0 auto;
  width: 100%;
  display: flex;
  flex-wrap: wrap;
}
.user-table .card .card-wrapper {
  margin: 20px;
}
</style>
