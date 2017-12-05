import Vue from 'vue'
import FileBrowser from './components/file-browser.vue'


document.addEventListener("DOMContentLoaded", function() {
  if(document.getElementById('file-tree-input')) {
    new Vue({
      el: '#file-tree-input',
      components: { FileBrowser }
    })
  }
})
