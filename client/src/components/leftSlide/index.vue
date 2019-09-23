<template>
  <div class="left-side">
    <div class="left-side-inner">
      <router-link to="/" class="logo block">
        <h2>管理后台</h2>
      </router-link>
      <el-menu
        class="menu-box"
        router
        :default-active="$route.path">
        <mymenu :menuList="nav_menu_data"></mymenu>
      </el-menu>
    </div>
  </div>
</template>
<script type="text/javascript">
  import {cookieStorage, localStorage, sessionStorage} from 'common/storage'
  import mymenu from './mymenu'
  export default {
    name: 'slide',
    data: function () {
      return {
        nav_menu_data:[]
          //[{"updateDate":"2019-05-30 07:36:16","parentIds":"0,1,","icon":"fa-folder-o","permission":"sn_supplier_dev","isNewRecord":false,"sort":119,"title":"商家运营后台测试","parentId":"1","target":"","isShow":"1","path":"/seller","appkey":"sn_supplier_dev","id":"e77312abc7d14804810a2ad9f64964eb","remarks":"","createDate":"2019-05-30 07:36:16","child":[{"updateDate":"2019-05-30 08:33:06","parentIds":"0,1,e77312abc7d14804810a2ad9f64964eb,","icon":"fa-folder-o","permission":"sn_supplier_dev","isNewRecord":false,"sort":30,"title":"商家信息","parentId":"e77312abc7d14804810a2ad9f64964eb","target":"","isShow":"1","path":"/providerManager/info","appkey":"sn_supplier_dev","id":"8924be4e1aa44a7e8afa0476062772b2","remarks":"","createDate":"2019-05-30 08:31:00"},{"updateDate":"2019-05-30 08:32:43","parentIds":"0,1,e77312abc7d14804810a2ad9f64964eb,","icon":"fa-folder-o","permission":"sn_supplier_dev","isNewRecord":false,"sort":60,"title":"产品管理","parentId":"e77312abc7d14804810a2ad9f64964eb","target":"","isShow":"1","path":"/shennong/spu","appkey":"sn_supplier_dev","id":"04e3eb87168c41ce83967a1c9282e277","remarks":"","createDate":"2019-05-30 08:32:43"},{"updateDate":"2019-05-30 08:53:16","parentIds":"0,1,e77312abc7d14804810a2ad9f64964eb,","icon":"fa-folder-o","permission":"sn_supplier_dev","isNewRecord":false,"sort":90,"title":"产品规格管理","parentId":"e77312abc7d14804810a2ad9f64964eb","target":"","isShow":"1","path":"/shennong/sku","appkey":"sn_supplier_dev","id":"fac91648f107417b91a6716226096af7","remarks":"","createDate":"2019-05-30 08:53:16"},{"updateDate":"2019-05-30 08:56:11","parentIds":"0,1,e77312abc7d14804810a2ad9f64964eb,","icon":"fa-folder-o","permission":"sn_supplier_dev","isNewRecord":false,"sort":120,"title":"运营后台菜单测试","parentId":"e77312abc7d14804810a2ad9f64964eb","target":"","isShow":"1","path":"/home","appkey":"sn_supplier_dev","id":"90434a26b9574803b51385f16d433722","remarks":"","createDate":"2019-05-30 08:56:11","child":[{"updateDate":"2019-05-30 08:56:51","parentIds":"0,1,e77312abc7d14804810a2ad9f64964eb,90434a26b9574803b51385f16d433722,","icon":"icon-camera","permission":"","isNewRecord":false,"sort":30,"title":"运营后台三级菜单测试","parentId":"90434a26b9574803b51385f16d433722","target":"","isShow":"1","path":"","appkey":"sn_supplier_dev","id":"4f96f1ec65bb4b0699f06af791cbe02e","remarks":"","createDate":"2019-05-30 08:56:51"}]}]}]
        /*[
          {
            title: "商家管理（新）",
            path: "/providerManager",
            icon: "fa-folder-o",
            child: [
              {
                title: "商家信息",
                path: "/providerManager/info",
                icon: "fa-folder-o"
              },{
                title: "产品管理",
                path: "/shennong/spu",
                icon: "fa-folder-o"
              },
              {
                title: "产品规格管理",
                path: "/shennong/sku",
                icon: "fa-folder-o"
              }
            ]
          }]*/
      }
    },
    created(){
       this.getMenu();
    },
    methods: {
      getMenu(){
        var userInfo = localStorage.get("loginInfo");
        this.nav_menu_data = JSON.parse(userInfo.menu);
      }
    },
    components: {
      mymenu
    }
  }
</script>

<style>
  h2 {
    color: #65cea7;
  }
</style>


