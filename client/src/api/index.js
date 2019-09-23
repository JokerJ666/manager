// import * as apiClient from './client'
import * as apiLogin from  './login'
import * as apiManager from './operateManager'
import * as apiSku from './sku'
import * as apiSpu from './spu'
import * as apiPacket from './packet'
import * as apiMessage from './message'
import * as apiHome from './home'


const apiObj = {
  apiManager,
  apiLogin,
  apiSku,
  apiSpu,
  apiPacket,
  apiMessage,
  apiHome
}
const install = function (Vue) {
  if (install.installed) return
  install.installed = true
  Object.defineProperties(Vue.prototype, {
    $fetch: {
      get() {
        return apiObj
      }
    }
  })
}
export default {
  install
}
