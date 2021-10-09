<template>
    <div class="container-fluid">
        <div class="row">
            <!--Main Content-->
            <div class="col-lg-12 col-lg-push-12">
                <form>
                  <div class="row">
                      <div class="col">

                          <div class="form-group row">
                              <label for="worship_type" class="col-sm-2 col-form-label">QR code</label>
                              <div class="col-sm-4">
                                  <input class="form-control" type=text v-model="qrcode">
                              </div>
                          </div>

                          <div class="form-group row">
                              <label for="worship_type" class="col-sm-2 col-form-label">ID</label>
                              <div class="col-sm-4">
                                  <input class="form-control" type=text v-model="userid">
                              </div>
                          </div>

                          <div class="form-group row">
                              <label for="worship_type" class="col-sm-2 col-form-label">姓名</label>
                              <div class="col-sm-4">
                                  <input class="form-control" type=text v-model="name">
                              </div>
                          </div>

                          <div class="form-group row">
                              <label for="group_name" class="col-sm-2 col-form-label">團契</label>
                              <div class="col-sm-4">
                                  <select class="form-control" v-model="selectedGroup">
                                      <option value="">-- 請選擇 --</option>
                                      <option v-for="(group, key) in getGroups" :value="group.group_id" :key="key">{{ group['name_zh-hk'] }}</option>
                                  </select>
                              </div>
                          </div>

                          <button type="button" class="btn btn-primary" @click="onSubmit" >Submit</button>
                      </div>
                  </div>
              </form>
            </div>
        </div>
    </div>
</template>

<script>
import { mapGetters } from 'vuex'
import { decode } from '../util/AESUtils'
import VueQrReader from 'vue-qr-reader/dist/lib/vue-qr-reader.umd.js'
import { postUser } from '../../api/user'
import { postMember, deleteMember } from '../../api/member'

export default {
  name: 'QRCheck',
  components: {
    VueQrReader
  },
  data () {
    return {
      worshipId: '',
      qrcode: '',
      userid: '',
      inprogress: false,
      user: {},
      name: '',
      selectedGroup: '',
      foundGroups: []
    }
  },
  computed: {
    ...mapGetters({
      getGroups: 'getGroups',
      getUsers: 'getUsers',
      getUser: 'getUser',
      getMembers: 'getMembers'
    })
  },
  watch: {
    qrcode (val) {
      this.userid = this.convert(val)
      if (this.userid) {
        this.user = this.checkUser(this.userid)
      }
    }
  },
  methods: {
    convert (code) {
      var pat = /\[\w+\]/g
      var match
      while ((match = pat.exec(code)) !== null) {
        // perform decode and submit to backend
        try {
          var search = decode(match[0].slice(1, -1))
          console.log('search:' + search)
          return search
        } catch (e) {
          console.log(e)
        }
      }
    },
    checkUser (userid) {
      for (const property in this.getUsers) {
        if (this.getUsers[property].user_id === userid) {
          this.foundGroups = []

          console.log(userid + ' : found')
          console.log(this.getMembers)
          this.name = this.getUsers[property]['name_zh-hk']
          for (const item in this.getMembers) {
            if (this.getMembers[item].user_id === userid) {
              console.log(this.getMembers[item])
              this.selectedGroup = this.getMembers[item].group_id
              this.foundGroups.push(this.getMembers[item].id)
            }
          }
          return this.getUsers[property]
        }
      }
      return null
    },
    onSubmit () {
      const toast = this.$swal.mixin({
        toast: true,
        position: 'center',
        showConfirmButton: false,
        timer: 3000
      })

      console.log(this.user)
      console.log(this.name)
      console.log(this.selectedGroup)

      const newUser = {
        user_id: this.userid,
        'name_zh-hk': this.name
      }
      const newGroupMember = {
        group_id: this.selectedGroup,
        user_id: this.userid,
        group_seq_num: 0
      }
      postUser(newUser).then((result) => {
        if (result >= 0) {
          for (const idx in this.foundGroups) {
            console.log(this.foundGroups[idx])
            deleteMember(this.foundGroups[idx])
          }
          postMember(newGroupMember).then((result) => {
            console.log(result)
            toast({
              type: 'success',
              title: `${this.name} - saved`
            })
          })
        }
        return false
      }).catch((err) => {
        console.log(err)
        toast({
          type: 'error',
          title: `${this.name} - failed`
        })
      })
    }
  }
}
</script>
