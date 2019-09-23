<template>
  <div class="panel">
    <div class="panel-body">
      <el-tabs v-model="activeName" type="card" @tab-click="getData">
        <el-tab-pane label="用户管理" name="companyInfo">
          <panel-title title="商家信息"></panel-title>
          <el-form :inline="true">
            <el-form-item label="营业执照：">
              <viewer :images="images">
                <img :src="companyInfo.licenseUrl" :key="companyInfo.licenseUrl" width="300">
              </viewer>
            </el-form-item>
            <br>
            <el-form-item label="公司全称：">
              {{companyInfo.providerFullName}}
            </el-form-item>
            <br>
            <el-form-item label="统一社会信用代码：">
              {{companyInfo.socialCreditCode}}
            </el-form-item>
            <br>
            <el-form-item label="营业执照有效期：">
              {{companyInfo.licenseValidDate}}
            </el-form-item>
            <br>
            <el-form-item label="公司类型：">
              {{companyTypeMapping(companyInfo.companyTypeId)}}
            </el-form-item>
            <br>
            <el-form-item label="主营类目：">
              {{companyInfo.businessTypeName}}
            </el-form-item>
          </el-form>
          <panel-title title="法人信息"></panel-title>
          <el-form :inline="true">
            <el-form-item label="身份证：">
              <viewer :images="images">
                <img :src="companyInfo.idCardFrontUrl" :key="companyInfo.idCardFrontUrl" width="300">
                <img :src="companyInfo.idCardBackUrl" :key="companyInfo.idCardBackUrl" width="300">
              </viewer>
            </el-form-item>
            <br>
            <el-form-item label="姓名：">
              {{companyInfo.corporateName}}
            </el-form-item>
            <br>
            <el-form-item label="身份证号：">
              {{companyInfo.corporateIdCard}}
            </el-form-item>
            <br>
            <el-form-item label="有效期：">
              {{companyInfo.idCardValidStartDate}}至{{companyInfo.idCardValidEndDate}}
            </el-form-item>
            <br>
          </el-form>
          <panel-title title="收款账户">
          </panel-title>
          <el-form :inline="true">
            <el-form-item label="开户名：">
              {{companyInfo.paymentName}}
            </el-form-item>
            <br>
            <el-form-item label="开户账号：">
              {{companyInfo.paymentAccount}}
            </el-form-item>
            <br>
            <el-form-item label="收款账户委托协议：">
              <el-button v-if="companyInfo.paymentUrl!=''" type="text" @click="downloadByUrl(companyInfo.paymentUrl)">收款委托协议</el-button>
            </el-form-item>
            <br>
            <el-form-item label="收款人身份证：">
              <viewer :images="images">
                <img :src="companyInfo.payeeIdCardFrontUrl" :key="companyInfo.payeeIdCardFrontUrl" width="300">
                <img :src="companyInfo.payeeIdCardBackUrl" :key="companyInfo.payeeIdCardBackUrl" width="300">
              </viewer>
            </el-form-item>
            <br>
            <el-form-item label="收款人身份证号：">
              {{companyInfo.payeeIdCard}}
            </el-form-item>
            <br>
            <el-form-item label="有效期：">
              {{companyInfo.payeeIdCardValidStartDate}}至{{companyInfo.payeeIdCardValidEndDate}}
            </el-form-item>
            <br>
          </el-form>
          <panel-title title="联系人信息">
            <el-button type="text" @click="editPayWindow = !editPayWindow">编辑联系人信息</el-button>
          </panel-title>
          <el-form :inline="true">
            <el-form-item label="联系人：">
              {{companyInfo.contactName}}
            </el-form-item>
            <br>
            <el-form-item label="联系人电话：">
              {{companyInfo.contactPhone}}
            </el-form-item>
            <br>
            <el-form-item label="联系人邮箱：">
              {{companyInfo.contactEmail}}
            </el-form-item>
            <br>
          </el-form>
          <panel-title title="其他信息">
            <el-button type="text" @click="editOthersWindow = !editOthersWindow">编辑其他信息</el-button>
          </panel-title>
          <el-form :inline="true">
            <el-form-item label="签约公司：">
              {{signCompanyMapping(companyInfo.signCompany)}}
            </el-form-item>
            <br>
            <el-form-item label="是否开具发票：">
              {{invoceMapping(companyInfo.ifInvoice)}}
            </el-form-item>
            <br>
            <el-form-item label="归属BD：">
              {{companyInfo.bdName}}
            </el-form-item>
            <br>
            <el-form-item label="BD联系方式：">
              {{companyInfo.bdPhone}}
            </el-form-item>
            <br>
            <el-form-item label="归属运营：">
              {{companyInfo.operatorName}}
            </el-form-item>
            <br>
          </el-form>
        </el-tab-pane>

        <el-tab-pane label="品牌信息" name="brandInfo">
          <panel-title v-if="brands.length==0" title="无品牌信息"></panel-title>
          <panel-title v-if="brands.length>0" title="品牌信息"></panel-title>
          <div v-for="brand in brands">
          <el-form :inline="true">
            <el-form-item label="品牌名称：">
              {{brand.brandName}}
            </el-form-item>
            <br>
            <el-form-item label="品牌logo：">
              <viewer :images="brandImages">
                <img :src="brand.brandLogoUrl" :key="brand.brandLogoUrl" width="300">
              </viewer>
            </el-form-item>
            <br>
            <el-form-item label="品牌描述：">
              {{brand.brandDescribe}}
            </el-form-item>
            <br>
            <el-form-item label="品牌主营类目：">
              {{brand.businessType}}
            </el-form-item>
            <br>
            <el-form-item label="授权类型：">
              {{authTypeMapping(brand.authTypeId)}}
            </el-form-item>
            <br>
            <el-form-item label="商标注册证：">
              <el-button v-if="brand.markPaperUrl!=''" type="text" @click="downloadByUrl(brand.markPaperUrl)">商标注册证</el-button>
            </el-form-item>
            <br>
            <el-form-item label="品牌授权书：">
              <el-button v-if="brand.authPaperUrl!=''" type="text" @click="downloadByUrl(brand.authPaperUrl)">品牌授权书</el-button>
            </el-form-item>
            <br>
            <el-form-item label="类目特殊资质：">
              <el-button v-if="brand.qualificationUrl!=''" type="text" @click="downloadByUrl(brand.qualificationUrl)">类目特殊资质</el-button>
            </el-form-item>
          </el-form>
            <div class="partition"></div>
          </div>
        </el-tab-pane>

        <el-tab-pane label="审核意见" name="auditSuggestion">
          <el-form :inline="true">
            <el-form-item label="审核状态：" v-if="companyInfo.auditStatus == 1">
              <el-radio v-model="formdata.auditStatus" label="1">通过</el-radio>
              <el-radio v-model="formdata.auditStatus" label="0">不通过</el-radio>
            </el-form-item>
            <br>
            <el-form-item label="结果备注：" v-if="companyInfo.auditStatus == 1">
              <el-input
                type="textarea"
                autosize
                placeholder="请输入审核结果"
                v-model="formdata.remark">
              </el-input>
            </el-form-item>
            <br>
            <el-form-item label="" v-if="companyInfo.auditStatus == 1">
              <el-button style="margin-left: 300px" @click="audit">提交</el-button>
            </el-form-item>
          </el-form>
          <panel-title title="操作历史"></panel-title>
          <div class="table">
            <el-table
              ref="multipleTable"
              :data="tableData"
              style="width: 100%">
              <el-table-column
                fixed
                prop="auditType"
                label="操作类型"
                min-width="120">
                <template slot-scope="scope">
                  {{auditTypeMapping(scope.row.auditType)}}
                </template>
              </el-table-column>
              <el-table-column
                fixed
                prop="auditInfo"
                label="内容"
                min-width="120">
              </el-table-column>
              <el-table-column
                fixed
                prop="date"
                label="操作时间"
                min-width="120">
              </el-table-column>
              <el-table-column
                fixed
                prop="auditUser"
                label="操作人"
                min-width="120">
              </el-table-column>
            </el-table>
          </div>
        </el-tab-pane>
      </el-tabs>
    </div>
    <el-dialog
      title="修改联系人信息"
      :visible.sync="editPayWindow"
      width="30%">
      <el-form :inline="true" class="demo-form-inline">
        <el-form-item label="联系人：">
          <el-input v-model="contact.contactName" placeholder=""></el-input>
        </el-form-item>
        <br>
        <el-form-item label="联系人电话：">
          <el-input v-model="contact.contactPhone" placeholder=""></el-input>
        </el-form-item>
        <el-form-item label="联系人邮箱：">
          <el-input v-model="contact.contactEmail" placeholder=""></el-input>
        </el-form-item>
      </el-form>
      <span slot="footer" class="dialog-footer">
      <el-button @click="editPayWindow = false">取 消</el-button>
      <el-button type="primary" @click="editContact">新 增</el-button>
      </span>
    </el-dialog>
    <el-dialog
      title="修改其他信息"
      :visible.sync="editOthersWindow"
      width="30%">
      <el-form :inline="true" class="demo-form-inline">
        <el-form-item label="签约公司：">
          <el-select v-model="others.signCompany" filterable clearable>
            <el-option
              v-for="item in signCompanyOptions"
              :key="item.value"
              :label="item.label"
              :value="item.value">
            </el-option>
          </el-select>
        </el-form-item>
        <br>
        <el-form-item label="有无发票：">
          <el-select v-model="others.ifInvoice" filterable clearable>
            <el-option
              v-for="item in invoiceOptions"
              :key="item.value"
              :label="item.label"
              :value="item.value">
            </el-option>
          </el-select>
        </el-form-item>
        <br>
        <el-form-item label="归属BD：">
          <el-select v-model="others.bdId" filterable clearable @change="setBdPhone">
            <el-option
              v-for="item in userOptions"
              :key="item.magUserId"
              :label="item.userName"
              :value="item.magUserId">
            </el-option>
          </el-select>
        </el-form-item>
        <br>
        <el-form-item label="bd电话号码：">
          <el-input v-model="others.bdPhone" placeholder="bd电话号码"></el-input>
        </el-form-item>
        <el-form-item label="归属运营：">
          <el-select v-model="others.operatorId" filterable clearable>
            <el-option
              v-for="item in userOptions"
              :key="item.magUserId"
              :label="item.userName"
              :value="item.magUserId">
            </el-option>
          </el-select>
        </el-form-item>
      </el-form>
      <span slot="footer" class="dialog-footer">
      <el-button @click="editOthersWindow = false">取 消</el-button>
      <el-button type="primary" @click="editOthers">新 增</el-button>
      </span>
    </el-dialog>
  </div>


</template>
<script>
  import {panelTitle} from 'components'
  import {userUtil} from 'common/tools'
  import {cookieStorage, localStorage, sessionStorage} from 'common/storage'

  export default {
    data() {
      return {
        providerId: null,
        contractNo: null,
        editPayWindow: false,
        editOthersWindow: false,
        companyInfo:{},
        editBy: null,
        ifCanPushAudit: true,
        userId: "",
        loginName: "",
        officeName:"",
        bdPhone: "",
        mobile: null,
        contact:{
          contactName : "",
          contactPhone : "",
          contactEmail: "",
        },
        signCompanyOptions: [
          {"value":1,"label":"广州酷旅"},
          {"value":2,"label":"杭州云客赞"},
        ],
        invoiceOptions: [
          {"value":0,"label":"无发票"},
          {"value":1,"label":"有发票"},
        ],
        userOptions: [],
        others: {
          ifInvoice : null,
          bdId : null,
          operatorId : null,
          bdName : null,
          operatorName : null,
          signCompany: 1,
          bdPhone: null
        },
        activeName: "companyInfo",
        formdata :{
          auditStatus: null,
          remark:""
        },
        tableData : [],
        brands:[],
        ifInvoice: '0',
        images: [],
        brandImages: [],
      }
    },
    components: {
      panelTitle
    },
    created() {
      this.getUserId();
      this.getUserList();
      this.setProviderId();
      this.getData();
      // this.getCompanyInfo();
      // this.getBrands();
      // this.getAuditInfo();
    },
    methods: {
      getData: function (){
        var that = this;
        if(that.activeName == "companyInfo"){
          that.getCompanyInfo();
        }else if(that.activeName == "brandInfo"){
          that.getBrands()
        }else if(that.activeName == "auditSuggestion"){
          that.getAuditInfo()
        }
      },

      getUserId :function () {
        this.userId = localStorage.get("loginInfo").uid;
        this.loginName = localStorage.get("loginInfo").loginName;
        this.name = localStorage.get("loginInfo").name;
        this.officeName = localStorage.get("loginInfo").officeName;
        // this.officeName = "爬虫搜索组";
        this.mobile = localStorage.get("loginInfo").mobile;
        if(this.$route.params.providerId!=null && this.$route.params.providerId!=undefined) {
          window.sessionStorage.setItem("providerId", this.$route.params.providerId);
          window.sessionStorage.setItem("contractNo", this.$route.params.contractNo);
        }
      },

      setProviderId:function (){
        this.providerId = window.sessionStorage.providerId;
        this.contractNo = window.sessionStorage.contractNo;
      },

      getCompanyInfo:function () {
        var that = this;
        this.$fetch.apiManager.getCompanyInfo({providerId:this.providerId}).then(({data:data})=>{
          if(data.code == 1000) {
            that.companyInfo = data.content;
            that.contact.contactName = data.content.contactName;
            that.contact.contactPhone = data.content.contactPhone;
            that.contact.contactEmail = data.content.contactEmail;
            that.others.signCompany = data.content.signCompany;
            that.others.ifInvoice = data.content.ifInvoice;
            that.others.bdId = data.content.bdId;
            that.others.bdPhone = data.content.bdPhone;
            that.others.operatorId = data.content.operatorId;
            that.images.push(data.content.licenseUrl);
            that.images.push(data.content.idCardFrontUrl);
            that.images.push(data.content.idCardBackUrl);
            that.images.push(data.content.payeeIdCardFrontUrl);
            that.images.push(data.content.payeeIdCardBackUrl);
          }else {
            that.$message.error("获取企业数据失败！"+data.message);
          }
        })
      },

      getBrands:function () {
        var that = this;
        this.$fetch.apiManager.getBrandInfo({providerId:this.providerId}).then(({data:data})=>{
          if(data.code == 1000) {
            that.brands = data.content;
            data.content.forEach(function (brand) {
              that.brandImages.push(brand.authPaperUrl);
              that.brandImages.push(brand.brandLogoUrl);
              that.brandImages.push(brand.markPaperUrl);
              that.brandImages.push(brand.qualificationUrl);
            })
          }else {
            that.$message.error("获取品牌数据失败！"+data.message);
          }
        })
      },

      getAuditInfo:function () {
        var that = this;
        this.$fetch.apiManager.getAuditInfo({providerId:that.providerId}).then(({data:data})=>{
          if(data.code == 1000) {
            that.tableData = data.content;
            that.tableData.forEach(function (row) {
              that.userOptions.forEach(function (userOption) {
                if(userOption.uid == row.auditBy){
                  row["auditUser"] = userOption.userName;
                }
              })
            })
          }else {
            that.$message.error("获取审核历史数据失败！"+data.message);
          }
        })
      },

      editContact: function () {
        let that = this;
        //生成操作记录
        let record = "";
        if(that.contact.contactName!=that.companyInfo.contactName){
          record += "将联系人姓名由 ";
          record += that.companyInfo.contactName!=null?that.companyInfo.contactName:"";
          record += " 修改为 " ;
          record += that.contact.contactName!=null?that.contact.contactName:"";
          record +=";";
        }
        if(that.contact.contactPhone!=that.companyInfo.contactPhone){
          record += "将联系人电话由 ";
          record += that.companyInfo.contactPhone!=null?that.companyInfo.contactPhone:"";
          record += " 修改为 ";
          record += that.contact.contactPhone!=null?that.contact.contactPhone:"";
          record+";";
        }
        if(that.contact.contactEmail!=that.companyInfo.contactEmail){
          record += "将联系人邮箱由 ";
          record += that.companyInfo.contactEmail!=null?that.companyInfo.contactEmail:"";
          record += " 修改为 ";
          record += that.contact.contactEmail!=null?that.contact.contactEmail:"";
          record +=";";
        }
        //保存联系人信息
        this.$fetch.apiManager.editContact({
          contactName : that.contact.contactName,
          contactPhone : that.contact.contactPhone,
          contactEmail: that.contact.contactEmail,
          editBy: that.userId,
          providerId: that.providerId,
          record: record
        }).then(({data:data})=>{
          if(data.code == 1000) {
            that.$message.success("修改联系人成功");
          }else {
            that.$message.error(data.message);
          }
        })
        that.editPayWindow = false;
        this.getAuditInfo();
      },

      getUserList: function() {
        let that = this;
        that.$fetch.apiManager.getUserList({userId:that.userId}).then(({data:data})=>{
            that.userOptions = data;
        })
      },

      editOthers: function () {
        let that = this;
        if(that.others.bdId==null||that.others.operatorId==null){
          that.$message.error("请确保已经给商家分配bd和运营");
          return
        }
        if(that.others.bdPhone==null||that.others.bdPhone==""){
          that.$message.error("请将bd的电话补录完整，如果电话自动添加失败，请手动输入bd的电话");
          return
        }
        //生成操作记录
        let record = "";
        that.userOptions.forEach(function (userOption) {
          if(userOption.magUserId == that.others.bdId){
            that.others.bdName = userOption.userName;
            // that.others.bdPhone = userOption.telephone;
          }
          if(userOption.magUserId == that.others.operatorId){
            that.others.operatorName = userOption.userName;
          }
        })
        if(that.others.signCompany!=that.companyInfo.signCompany){
          record += "将签约公司由 "
          record += that.companyInfo.signCompany==0?"广州酷旅":"杭州云客赞"
          record += " 修改为 "
          record +=that.others.signCompany==0?"广州酷旅":"杭州云客赞";
          record +=";";
        }
        if(that.others.bdPhone!=that.companyInfo.bdPhone) {
          record += "将归属BD电话由 "
          record +=that.companyInfo.bdPhone!=null?that.companyInfo.bdPhone:"  "
          record += " 修改为 "
          record += that.others.bdPhone!=null?that.others.bdPhone:"  "
          record += ";";
        }
        if(that.others.bdName!=that.companyInfo.bdName){
          record += "将归属BD由 "
          record +=that.companyInfo.bdName!=null?that.companyInfo.bdName:"  "
          record += " 修改为 "
          record += that.others.bdName!=null?that.others.bdName:"  "
          record += ";";
        }
        if(that.others.operatorName!=that.companyInfo.operatorName){
          record += "将归属运营由 "
          record += that.companyInfo.operatorName!=null?that.companyInfo.operatorName:"  "
          record += " 修改为 "
          record += that.others.operatorName!=null?that.others.operatorName:"  "
          record +=";";
        }
        if(that.others.ifInvoice!=that.companyInfo.ifInvoice){
          record += "将发票规则由 "
          record += that.companyInfo.ifInvoice==0?"不需要":"需要"
          record += " 修改为 ";
          record += that.others.ifInvoice==0?"不需要":"需要";
          record +=";";
        }
        record.replace("undefined"," ");
        this.$fetch.apiManager.editOthers({
          signCompany: that.others.signCompany,
          ifInvoice : that.others.ifInvoice,
          bdId : that.others.bdId,
          operatorId : that.others.operatorId,
          bdName : that.others.bdName,
          operatorName : that.others.operatorName,
          editBy: that.userId,
          providerId: that.providerId,
          record: record,
          bdPhone: that.others.bdPhone
        }).then(({data:data})=>{
          if(data.code == 1000) {
            that.$message.success("修改成功");
          }else {
            that.$message.error(data.message);
          }
        })
        that.editOthersWindow = false;
        that.getAuditInfo();
      },

      audit:function () {
        let that = this;
        if(that.ifCanPushAudit == true){
          that.ifCanPushAudit = false;
          that.pushAudit();
          setTimeout(function () {
            that.ifCanPushAudit = true;
          },5000)
        }else {
          that.$message.error("请勿重复点击审核按钮！");
        }
      },

      pushAudit:function () {
        let that = this;
        if(that.others.bdId==null||that.others.operatorId==null||that.others.bdPhone==null||that.others.bdPhone==""){
          that.$message.error("请补录完整商家的其他信息后再进行提交审核操作！");
          return;
        }
        if(that.officeName==null||that.officeName==""){
          that.$message.error("无法获取当前账户的所属权限名称，无法提交审核！");
          return;
        }
        let record = "运营审核结果为" + that.formdata.auditStatus == 0 ? "通过" : "不通过";
        this.$fetch.apiManager.pushAudit({
          status: that.formdata.auditStatus,
          remark: that.formdata.remark,
          auditBy: that.userId,
          contractNo: that.contractNo,
          record: record,
          providerId: that.providerId,
          loginName: that.loginName,
          name: that.name,
          officeName: that.officeName
        }).then(({data: data}) => {
          if (data.code == 1000) {
            that.$message.success("审核成功");
            location.reload();
          } else {
            that.$message.error(data.message);
          }
        })
      },

      auditTypeMapping: function(status) {
        switch (status) {
          case 1:
            return "运营审核通过";
          case 2:
            return "运营审核不通过";
          case 3:
            return "oa审核通过";
          case 4:
            return "oa审核不通过";
        }
      },

      downloadByUrl: function (url) {
        window.open(url);
      },

      setBdPhone: function() {
        let that = this;
        console.log(that.others.bdId)
        that.userOptions.forEach(function (userOption) {
          if(userOption.magUserId == that.others.bdId){
            that.others.bdPhone = userOption.telephone;
          }
        })
      },

      signCompanyMapping: function (id) {
        switch (id) {
          case 1:
            return "广州酷旅";
          case 2:
            return "杭州云客赞";
        }
      },

      companyTypeMapping: function (id) {
        switch (id) {
          case 1:
            return "个体工商户";
          case 2:
            return "有限公司";
        }
      },

      invoceMapping: function (id) {
        if(id==null){
          return "";
        }
        switch (id) {
          case 1:
            return "需要发票";
          case 0:
            return "不需要发票";
        }
      },

      authTypeMapping: function (id) {
        switch (id) {
          case 1:
            return "品牌方";
          case 2:
            return "一级代理商";
          case 3:
            return "二级代理商";
          case 4:
            return "三级及以上代理商";
          case 5:
            return "生产商";
        }
      },

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

  .partition {
    border-bottom:1px solid #eff0f4;
    height:1px;
    width:100%;
  }

  .el-pagination {
    float: right;
  }

  .createSpu {
    color: red;
  }

  .el-textarea__inner {
    margin-left: 23px;
  }

  .brandTitle {
    margin-right: 1400px;
  }

</style>
