import Vue from 'vue'
import TreeBrowser from './components/tree-browser.vue'


document.addEventListener("DOMContentLoaded", function() {
  if(document.getElementById('tree-browser-input')) {
    new Vue({
      el: '#tree-browser-input',
      components: { TreeBrowser }
    })
  }
})
