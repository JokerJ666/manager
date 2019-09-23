<template>
  <div class="loginInfo">
    <span>{{userName}}</span>
    <span  @click="loginOut()">登出</span>
  </div>
</template>

<script>
  import {cookieStorage, localStorage, sessionStorage} from 'common/storage'

  export default{
    data(){
        return {
            userName: "",
        }
    },
    created(){
      this.userName = this.getUserName();
    },
    methods: {
        getUserName(){
          var userInfo = localStorage.get("loginInfo");
          return   userInfo.name;
        },
        loginOut() {
            var router = this.$router;
            var sessionId = cookieStorage.get("sessionId");
            this.$fetch.apiLogin.loginOut({sessionId: sessionId}).then(({data: result}) => {
              if(result.code === 1000){
                cookieStorage.remove("sessionId");
                //delCookie("sessionId");
                router.push('/login');
              }else {
                return router.push({path: '/404' });
              }
            })
      }
    }
  }
</script>
<style>
  .loginInfo {
    float: right;
    margin-top: 15px;
    margin-right: 240px;
    cursor: pointer;
    color: #28ccaa;
  }

</style>
