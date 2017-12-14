<template>
  <div>
    <span class="tree-browser__preview" v-if="selectedNode"><i class="fa fa-file-o"></i>{{selectedNode}}</span>
    <input type="hidden" :name="fieldName" v-model="selectedNode">
    <button class="btn btn-info" type="button" @click="showInsertOverlay = !showInsertOverlay" name="button">{{buttonLabel}}</button>
    <button v-if="selectedNode" class="btn btn-default" type="button" @click="selectedNode = ''" name="button"><i class="icon-remove"></i> {{ removeButtonLabel }}</button>
    <transition name="fade">
      <div class="tree-browser__overlay" v-if="showInsertOverlay">
        <div class="header">
          <button type="button" @click="showInsertOverlay = false" class="btn tree-browser__overlay-close" name="button">×</button>
        </div>
        <table class="table">
            <caption>{{ node }}</caption>
            <thead>
                <tr>
                    <th>{{ listTitleLabel }}</th>
                    <th class="text-right"><button type="button" class="btn btn-info btn-xs" @click="goBack()" v-if="node !== '/'">{{ backButtonLabel }}</button></th>
                </tr>
            </thead>
            <tbody>
                <tr v-for="element in elements">
                    <td>
                        <div @click="nodeClick(element)" class="element" v-if="element.type === elementTypeName">
                            <i class="fa fa-file-o"></i>
                            {{ element.name }}
                        </div>
                        <div class="node" v-if="element.type === nodeTypeName">
                            <i class="fa fa-folder-o"></i>
                            <a @click="changeNode(element.path)">{{ element.name }}</a>
                        </div>
                    </td>
                    <td class="text-right" v-show="downloadLink">
                        <a :href="downloadLinkPath(element)" download v-if="element.type === elementTypeName">
                            <i class="fa fa-cloud-download"></i>
                        </a>
                    </td>
                </tr>
            </tbody>
        </table>
      </div>
    </transition>
  </div>
</template>

<script>
  import axios from 'axios'

  export default {
    watch: {
      repo: function(newVal, oldVal) {
        this.node = '/';
        this.getElements();
      }
    },
    props: {
      fieldName: {
        type: String,
        required: true
      },
      fieldValue: {
        type: String,
        required: true
      },
      rootNode: {
        type: String,
        required: true
      },
      downloadLink: {
        type: Boolean,
        required: false
      },
      nodeTypeName: {
        type: String,
        defaut: 'node',
        required: false
      },
      elementTypeName: {
        type: String,
        defaut: 'element',
        required: false
      },
      buttonLabel: {
        type: String,
        required: true
      },
      backButtonLabel: {
        type: String,
        required: true
      },
      removeButtonLabel: {
        type: String,
        required: true
      },
      listTitleLabel: {
        type: String,
        required: true
      }
    },
    data: function(){
      return {
        showInsertOverlay: false,
        node: '/',
        selectedNode: '',
        elements: []
      }
    },
    created: function() {
      this.getElements();
    },
    mounted() {
      //do something after mounting vue instance
      if (this.fieldValue) {
        this.selectedNode = this.fieldValue;
      }
    },
    methods: {
      downloadLinkPath: function(element) {
        return this.rootNode + '/' + element.path
      },
      nodeClick: function(node) {
        this.selectedNode = node.path;
        this.showInsertOverlay = false;
      },
      getElements: function() {
        axios.get(this.rootNode + this.node).then(function(response){
          this.elements = response.data;
        }.bind(this));
      },
      changeNode: function(node) {
        this.node = '/' + node;
        this.getElements();
      },
      goBack: function() {
        this.node = this.node.split('/').slice(0, -1).join('/');
        if (this.node === ''){
          this.node = '/';
        }
        this.getElements();
      }
    }
  }
</script>

<style media="screen">
  .tree-browser__overlay {
    box-shadow: 0 0 20px rgba(0, 0, 0, 0.2);
    position: fixed;
    top: 100px;
    left: 50%;
    transform: translate(-50%,0);
    width: 100%;
    max-width: 475px;
    z-index: 20;
    max-height: 100vh;
    overflow-y: auto;
    background-color: white;
    padding: 20px;
    border-radius: 4px;
    max-height: 80vh;
    overflow-y: auto; }

    .tree-browser__overlay .node,
    .tree-browser__overlay .element{
      cursor: pointer;
    }

  .tree-browser__overlay-close {
    float: right;
    font-size: 21px;
    font-weight: bold;
    line-height: 1;
    color: #000;
    text-shadow: 0 1px 0 #fff;
    opacity: 0.2;
  }

  .tree-browser__preview {
    display: block;
    color: #b5b5b5;
    font-size: 14px;
    margin-bottom: 5px;
  }
  .tree-browser__preview i{
    margin-right: 5px;
  }

  .fade-enter-active, .fade-leave-active {
    transition: opacity .5s
  }
  .fade-enter, .fade-leave-to /* .fade-leave-active in <2.1.8 */ {
    opacity: 0
  }
</style>
