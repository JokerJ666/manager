<template>
  <div>
    <template v-for="list in this.menuList" >
      <el-submenu
        v-if="list.child != undefined"
        :key="list.path"
        :index="list.path"
      >
        <template slot="title">
          <i :class="list.icon"></i>
          <span v-text="list.title" class="text"></span>
        </template>
        <mymenu :menuList="list.child"></mymenu>
      </el-submenu>
      <el-menu-item
        v-else
        :index="list.path"
        :key="list.path"
        class="menu-list">
        <i :class="list.icon"></i>
        <span v-text="list.title" class="text"></span>
      </el-menu-item>
    </template>
  </div>
</template>
<script type="text/javascript">
  export default {
    name: 'mymenu',
    data() {
      return {
      }
    },
   props:['menuList']
  }
</script>

<style>
</style>


