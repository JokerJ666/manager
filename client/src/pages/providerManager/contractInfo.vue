<template>
  <div class="panel">
    <div class="panel-body">
          <panel-title title="合同信息"></panel-title>
          <div class="table">
            <el-table
              ref="multipleTable"
              :data="tableData"
              style="width: 100%">
              <el-table-column
                fixed
                prop="contractNo"
                label="合同号"
                min-width="120">
              </el-table-column>
              <el-table-column
                fixed
                prop="contractType"
                label="合同类型"
                min-width="120">
                <template slot-scope="scope">
                  {{contractTypeMapping(scope.row.contractType)}}
                </template>
              </el-table-column>
              <el-table-column
                fixed
                prop="auditStatus"
                label="审核状态"
                min-width="120">
                <template slot-scope="scope">
                  {{auditStatusMapping(scope.row.auditStatus)}}
                </template>
              </el-table-column>
              <el-table-column
                fixed
                prop="createdTime"
                label="提交时间"
                min-width="120">
              </el-table-column>
              <el-table-column
                fixed
                prop="auditBy"
                label="操作"
                min-width="120">
                <template slot-scope="scope">
                  <el-button type="text">
                    <el-button type="text" @click="downloadContract(scope.row.contractUrl)">下载</el-button>
                  </el-button>
                </template>
              </el-table-column>
            </el-table>
          </div>
    </div>

  </div>
</template>

<script>
  import {panelTitle} from 'components'

  export default {
    data() {
      return {
        tableData: [],
        providerId: null,
      }
    },
    components: {
      panelTitle
    },
    created() {
      this.setProviderId();
      this.getContractInfo();
    },
    methods: {
      setProviderId:function (){
        if(this.$route.params.providerId!=null && this.$route.params.providerId!=undefined) {
          window.sessionStorage.setItem("providerId", this.$route.params.providerId);
        }
        this.providerId = window.sessionStorage.providerId;
      },

      getContractInfo : function () {
        var that = this;
        console.log(that.providerId);
        that.$fetch.apiManager.getContractInfo({providerId:that.providerId}).then(({data:data})=>{
          if(data.code == 1000) {
            that.tableData = data.content;
          }else {
            that.$message.error("获取表格数据失败！"+data.message);
          }
        })
      },


      auditStatusMapping: function(status) {
        switch (status) {
          case 1:
            return "待审核";
          case 2:
            return "已初审";
          case 3:
            return "已复审";
          case 4:
            return "已驳回";
        }
      },

      contractTypeMapping: function(status) {
        switch (status) {
          case 1:
            return "电子合同";
          case 2:
            return "纸质合同";
        }
      },

      downloadContract: function (url) {
        window.open(url);
      }
    },
    watch: {
    }
  }
</script>

<style scoped>

</style>
