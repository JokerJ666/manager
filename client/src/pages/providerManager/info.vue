<template>
  <div class="panel">
    <panel-title title="商家信息"></panel-title>
    <div class="panel-body">
      <el-form :inline="true">
        <!--<el-form-item label="公众号">-->
          <!--<el-select clearable v-model="formData.openAccountId">-->
            <!--<el-option-->
              <!--v-for="item in openAccounts"-->
              <!--:key="item.weChatId"-->
              <!--:label="item.nickName"-->
              <!--:value="item.weChatId">-->
            <!--</el-option>-->
          <!--</el-select>-->
        <!--</el-form-item>-->
        <el-form-item label="商家名称">
          <el-input v-model="formData.providerName"></el-input>
        </el-form-item>
        <el-form-item label="主营类目">
          <el-select v-model="formData.businessTypeId" filterable clearable>
            <el-option
              v-for="item in businessTypeOptions"
              :key="item.typeId"
              :label="item.typeName"
              :value="item.typeId">
            </el-option>
          </el-select>
        </el-form-item>
        <el-form-item label="审核状态">
          <el-select v-model="formData.auditStatus" filterable clearable>
            <el-option
              v-for="item in auditStatusOptions"
              :key="item.value"
              :label="item.label"
              :value="item.value">
            </el-option>
          </el-select>
        </el-form-item>

        <div class="button">
          <el-button type="success" @click="getTableData">查询</el-button>
          <el-button type="" @click="reset">重置</el-button>
        </div>
      </el-form>

      <div class="table">
        <el-table
          ref="multipleTable"
          :data="tableData"
          style="width: 100%">
          <el-table-column
            fixed
            prop="providerName"
            label="商家名称"
            min-width="120">
          </el-table-column>
          <el-table-column
          fixed
          prop="businessTypeName"
          label="主营类目"
          min-width="120">
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
            prop="contractStatus"
            label="合同状态"
            min-width="120">
            <template slot-scope="scope">
              {{contractStatusMapping(scope.row.contractStatus)}}
            </template>
          </el-table-column>
          <el-table-column
            fixed
            prop="createTime"
            label="申请时间"
            min-width="120">
          </el-table-column>
          <el-table-column
            fixed
            label="操作"
            min-width="160">
            <template slot-scope="scope">
              <el-button type="text">
                <el-button v-if="scope.row.auditStatusId = 1" type="text" @click="showDetails(scope.row.providerId,scope.row.contractNo)">审核</el-button>
                <el-button v-if="scope.row.auditStatusId != 1" type="text" @click="showDetails(scope.row.providerId)">详情</el-button>
                <el-button type="text" @click="showContract(scope.row.providerId)">查看合同</el-button>
                <el-button type="text" @click="showRecord(scope.row.providerId)">操作记录</el-button>
              </el-button>
            </template>
          </el-table-column>

        </el-table>
        <el-pagination
          @current-change="getTableData"
          :current-page.sync="formData.pageNum"
          :page-size="10"
          layout="total, prev, pager, next"
          :total="dataCount">
        </el-pagination>
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
        userId: 0,
        formData: {
          userId: 1,
          pageNum: 1,
          pageSize: 10,
          openAccountId: null,
          providerName: "",
          businessTypeId: null,
          auditStatus: null,
        },
        businessTypeOptions: [
        ],
        auditStatusOptions: [
          {"value":1,"label":"待审核"},
          {"value":2,"label":"已初审"},
          {"value":3,"label":"已复审"},
          {"value":4,"label":"已驳回"}
        ],
        openAccounts: [],
        tableData: [],
        dataCount:0,
      }
    },
    components: {
      panelTitle
    },
    created() {
      this.getUserId();
      this.getTableData();
      // this.getOpenAccounts();
      this.getBussinessTypeOptions();
    },
    methods: {
      showDetails: function (id,no) {
        this.$router.push({name: 'audit',params:{providerId:id,contractNo:no}});
      },

      getUserId :function () {
        this.userId = localStorage.get("loginInfo").uid;
      },

      showContract: function (id) {
        this.$router.push({name: 'contractInfo',params:{providerId:id}});
      },

      showRecord: function (id) {
        this.$router.push({name: 'operateRecord',params:{providerId:id}});
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

      contractStatusMapping: function(status) {
        switch (status) {
          case 1:
            return "待商家确认";
          case 2:
            return "待平台确认";
          case 3:
            return "生效中";
          case 4:
            return "作废";
        }
      },

      getTableData: function () {
        var that = this;
        that.$fetch.apiManager.getProviders(
          that.formData
        ).then(({data:data})=>{
          if(data.code == 1000) {
            that.tableData = data.content.data;
            that.dataCount = data.content.total;
          }else {
            that.$message.error("获取表格数据失败！"+data.message);
          }
        })
      },

      getOpenAccounts: function () {
        let that = this;
        that.$fetch.apiManager.getOpenAccounts({userId:that.userId}).then(({data:data})=>{
          if(data.code == 1000) {
            that.openAccounts = data.content;
          }else {
            that.$message.error("获取公众号数据失败！"+data.message);
          }
        })
      },
      
      getBussinessTypeOptions:function () {
        let that = this;
        that.$fetch.apiManager.getBusinessTypeOptions().then(({data:data})=>{
          if(data.code == 1000) {
            that.businessTypeOptions = data.content;
          }else {
            that.$message.error("获取主营类目数据失败！"+data.message);
          }
        })
      },

      reset: function () {
        let that = this;
        that.formData.openAccountId = null;
        that.formData.providerName = "";
        that.formData.businessTypeId = null;
        that.formData.auditStatus = null;
      }
    },
    watch: {
    }
  }
</script>
<style>
  .button {
    float:right;
    margin-right: 40px;
  }
  .el-form-item {
    margin-left: 20px;
  }

  th .cell{
    text-align: center;
  }

  tr .cell{
    text-align: center;
  }

  .table {
    margin-top:20px;
    min-height: 600px;
  }

  .el-button el-button--primary is-circle {
    height: 20px;
    width: 20px;
  }

  .el-dialog__body input{
    margin-left: 24px;
    width: 210px;
  }

  /*.el-input__icon{*/
    /*display: none;*/
  /*}*/

  .el-dialog__body .el-form--inline .el-form-item__label {
    width: 100px;
  }

  .el-pagination {
    float: right;
  }
</style>
