import Vue from 'vue'
import VueRouter from 'vue-router'
import store from 'store'
import NProgress from 'nprogress'
import 'nprogress/nprogress.css'
import { Loading } from 'element-ui';

import {cookieStorage, localStorage, sessionStorage} from 'common/storage'
import {toolsVerify} from 'common/tools'
/*import {sso_url, appKey} from 'common/config';*/
//import components
//view page warp component
import viewPageComponent from 'pages/App.vue'

import loginComponent from 'pages/login'
//home
//404
import noPageComponent from 'pages/error/404'

import unauthorizedPageComponent from 'pages/error/unauthorized'

//神农运营平台
import auditComponent from 'pages/providerManager/audit'
import providerInfoComponent from 'pages/providerManager/info'
import contractInfoComponent from 'pages/providerManager/contractInfo'
import operateRecordComponent from 'pages/providerManager/operateRecord'

//测试后台连接
import loginTestComponent from 'pages/home/home'



Vue.use(VueRouter)

const routes = [{
    path: '/404',
    name: 'notPage',
    component: noPageComponent
  },
  {
    path: '/unauthorized',
    name: 'unauthorizedPage',
    component: unauthorizedPageComponent
  },{
    path: '*',
    redirect: '/404'
  },
  {
    path: '/login/:token',
    name: 'login',
    component: loginComponent,
    beforeEnter: (to, from, next) =>{
      var token = to.params.token;
      let loadingInstance1 = Loading.service({ fullscreen: true });
      router.app.$fetch.apiLogin.getUserInfo({token: token}).then(({data: result}) => {
        console.log(result)
        loadingInstance1.close();
        if(result.code === 1000){
          let expireDays = 1000 * 60 * 60 * 24;
          cookieStorage.set("sessionId", result.content.sessionId, {expires: expireDays});
          localStorage.set("loginInfo", result.content);
          return router.push({path: '/' });

        }else {
          return router.push({name: 'unauthorizedPage', params: {desc: result.message}});
        }

      })
      //setTimeout(next(), 5000);
    }
  },
  {
      path: '/checkLogin',
      name: 'checkLogin',
      //redirect: 'https://sso-t.yaochufa.com/sso/login'
      //component: loginComponent
  },
  {
  path: '/',
  redirect: '/home/home',
  component: viewPageComponent,
  children: [
    {
      path: '/home/home',
      name: 'homeInfo',
      component: loginTestComponent,
      meta: {
        title: '后台连接',
        auth: true
      }
    },{
    path: '/providerManager/info',
    name: 'providerInfo',
    component: providerInfoComponent,
    meta: {
      title: '产品规格管理',
      auth: true
    }
  },{
    path: '/providerManager/audit',
    name: 'audit',
    component: auditComponent,
    meta: {
      title: "审核",
      auth: true
    }
  },{
    path: '/providerManager/contractInfo',
    name: 'contractInfo',
    component: contractInfoComponent,
    meta: {
      title: "合同信息",
      auth: true
    }
  },{
    path: '/providerManager/operateRecord',
    name: 'operateRecord',
    component: operateRecordComponent,
    meta: {
      title: "操作记录",
      auth: true
    }
  }]
  }]
const router = new VueRouter({
  routes,
  mode: 'hash', //default: hash ,history
  scrollBehavior (to, from, savedPosition) {
    if (savedPosition) {
      return savedPosition
    } else {
      return {x: 0, y: 0}
    }
  }
})
router.beforeEach((to, from, next) =>{
  var checkLoginNoFlag = function(){
    var userInfo = localStorage.get("loginInfo");
    return toolsVerify.isEmptyObject(cookieStorage.get('sessionId')) || toolsVerify.isEmptyObject(userInfo);
  };
 // 开发调试用暂时注释
/* if(to.name == 'spuDetails' || to.name == 'spuPacket'){
 }else if(to.name != 'login'){
    if(checkLoginNoFlag() && to.name != "unauthorizedPage"){
      //重定向到sso登录页面
      var sso_url = process.env.sso_url;
      var appKey = process.env.appKey;
      window.location.href = sso_url+"/login?loginType="+appKey+"&redirectUrl=sn_supplier_test";
    }
  }*/
    next();
});
//路由完成之后的操作
router.afterEach(() => {
  router.app.$store.dispatch('clearIntervals')
  router.app.$store.dispatch('clearTimeout')
})
export default router
