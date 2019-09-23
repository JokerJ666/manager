<template>
  <div class="main-content ofh">
    <h-section></h-section>
    <div class="wrapper">
      <div class="pageContent">
            <slot></slot>
      </div>
    </div>
    <v-footer></v-footer>
  </div>
</template>
<script type="text/javascript">
  import hSection from './headerSection'
  import vFooter from './footer'

  export default{
    name: 'content',
    components: {
      hSection,
      vFooter
    }
  }
</script>
