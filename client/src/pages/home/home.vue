<template>
    <div><button @click="test" class="update-button">按钮</button></div>
</template>

<script>
    export default {
      data() {
        return {
          userId: 0,
        }
      },
      created() {
      },
      methods: {
        test: function () {
          var that = this;
          that.$fetch.apiHome.loginTest(
          ).then(({data:data})=>{
            alert(data);
          })
        },
      }

    }
</script>

<style scoped>

  .update-button {
    width:60px;
    height:24px;
    background:rgba(255,255,255,1);
    border:1px solid rgba(203, 203, 203, 1);
    border-radius:12px;
    cursor:pointer;
    color: #666666FF;
  }

</style>
