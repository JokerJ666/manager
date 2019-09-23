<template>
  <div class="panel">
    <div class="panel-body">
      <panel-title title="操作记录"></panel-title>
      <div class="table">
        <el-table
          ref="multipleTable"
          :data="tableData"
          style="width: 100%"
          >
          <el-table-column
            fixed
            prop="edition"
            label="内容"
            min-width="120">
          </el-table-column>
          <el-table-column
            fixed
            prop="editTime"
            label="操作时间"
            min-width="120">
          </el-table-column>
          <el-table-column
            fixed
            prop="editUser"
            label="操作人"
            min-width="120">
          </el-table-column>
        </el-table>
      </div>
    </div>

  </div>
</template>

<script>
  import {panelTitle} from 'components'
  import {cookieStorage, localStorage, sessionStorage} from 'common/storage'

  export default {
    data() {
      return {
        userId: null,
        userOptions: [],
        providerId: this.$route.params.providerId,
        tableData: [],
      }
    },
    components: {
      panelTitle
    },
    created() {
      this.getUserId();
      this.setProviderId();
      this.getUserList();
      // this.getOperateRecord();
    },
    methods: {
      getUserId :function () {
        this.userId = localStorage.get("loginInfo").uid;
      },

      setProviderId:function (){
        if(this.$route.params.providerId!=null && this.$route.params.providerId!=undefined) {
          window.sessionStorage.setItem("providerId", this.$route.params.providerId);
        }
        this.providerId = window.sessionStorage.providerId;
      },

      getUserList: function() {
        let that = this;
        that.$fetch.apiManager.getUserList({userId:that.userId}).then(({data:data})=>{
          that.userOptions = data;
          that.getOperateRecord();
        })
      },

      getOperateRecord: function () {
        var that = this;
        that.$fetch.apiManager.getOperateRecord({providerId:that.providerId}).then(({data:data})=>{
          if(data.code == 1000) {
            that.tableData = data.content;
            that.tableData.forEach(function (row) {
              that.userOptions.forEach(function (userOption) {
                if(userOption.uid == row.editBy){
                  row["editUser"] = userOption.userName;
                }
              })
            })
          }else {
            that.$message.error("获取表格数据失败！"+data.message);
          }
        })
      },

    },
    watch: {
    }
  }
</script>

<style scoped>

</style>
