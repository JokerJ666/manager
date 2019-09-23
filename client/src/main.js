import 'normalize.css'
import 'font-awesome/scss/font-awesome.scss'
import 'element-ui/lib/theme-chalk/index.css'
import Vue from 'vue'
import '../theme/index.css'
import ElementUI from 'element-ui'
import router from './router'
import store from 'store'
import api from './api'
import lang from './lang'
import Viewer from 'v-viewer'
import 'viewerjs/dist/viewer.css'
import App from './App'
import VueCodeMirror from 'vue-codemirror'
// 引入echarts
import echarts from 'echarts'
import clipboard from 'clipboard';


Vue.prototype.clipboard = clipboard;

Vue.prototype.$echarts = echarts

Vue.use(Viewer);

Vue.use(ElementUI)

Vue.use(api)

Vue.use(lang)

Vue.use(VueCodeMirror)

Vue.config.productionTip = false

Vue.config.devtools = process.env.NODE_ENV === 'development'


function getCookie(name) {
  var arr, reg = new RegExp("(^| )" + name + "=([^;]*)(;|$)");
  if (arr = document.cookie.match(reg))
    return (arr[2]);
  else
    return null;
}
Vue.prototype.getCookie = getCookie;


new Vue({
  router,
  store,
  ...App,
  watch:{
    "$route" : 'checkLogin'
  },
  created() {
    this.checkLogin();
  },
  methods: {
    checkLogin(to){
      //console.log(to);
      // 检查是否存在session
      // if(toolsVerify.isEmptyObject(cookieStorage.get('sessionId')) && to != undefined && to.name != "unauthorizedPage"){
      //   //重定向到sso登录页面
      //   window.location.href = sso_url+"/login?loginType="+appKey+"&redirectUrl=xxx";
      //   //this.$router.push('/login');
      // }
    }
  }
}).$mount('mainbody')
