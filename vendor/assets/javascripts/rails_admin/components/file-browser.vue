<template>
  <div>
    <button class="btn btn-info" type="button" @click="showInsertOverlay = !showInsertOverlay" name="button">Choisir fichier</button>
    <transition name="fade">
      <div class="files-tree__overlay" v-if="showInsertOverlay">
        <div class="header">
          <button type="button" @click="showInsertOverlay = false" class="btn files-tree__overlay-close" name="button">×</button>
        </div>
        <table class="table">
            <caption>{{ path }}</caption>
            <thead>
                <tr>
                    <th>Name</th>
                    <th class="text-right"><button type="button" class="btn btn-info btn-xs" @click="goBack()" v-if="path !== '/'">Go Back</button></th>
                </tr>
            </thead>
            <tbody>
                <tr v-for="file in sortedFiles">
                    <td>
                        <div @click="fileClick(file)" class="file" v-if="file.type === 'file'">
                            <i class="fa fa-file-o"></i>
                            {{ file.name }}
                        </div>
                        <div class="directory" v-if="file.type === 'dir'">
                            <i class="fa fa-folder-o"></i>
                            <a @click="changePath(file.path)">{{ file.name }}</a>
                        </div>
                    </td>
                    <td class="text-right">
                        <a :href="file.download_url" download v-if="file.type === 'file'">
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
        this.path = '/';
        this.getFiles();
      }
    },
    data: function(){
      return {
        showInsertOverlay: false,
        rootPath: 'https://api.github.com/repos/ixmedia/rails_admin_image_manager/contents',
        path: '/',
        files: []
      }
    },
    created: function() {
      this.getFiles();
    },
    computed: {
      sortedFiles: function() {
        return this.files.slice(0).sort(function(a, b) {
          if (a.type !== b.type) {
            if (a.type === 'dir') {
              return -1;
            } else {
              return 1;
            }
          } else {
            if (a.name < b.name) {
              return -1;
            } else {
              return 1;
            }
          }
        });
      }
    },
    methods: {
      fileClick: function(file) {
        console.log(file.path)
      },
      getFiles: function() {
        axios.get(this.rootPath + this.path).then(function(response){
          this.files = response.data;
        }.bind(this));
      },
      changePath: function(path) {
        this.path = '/' + path;
        this.getFiles();
      },
      goBack: function() {
        this.path = this.path.split('/').slice(0, -1).join('/');
        if (this.path === ''){
          this.path = '/';
        }
        this.getFiles();
      }
    }
  }
</script>

<style media="screen">
  .files-tree__overlay {
    box-shadow: 0 0 20px rgba(0, 0, 0, 0.2);
    position: fixed;
    top: 50%;
    left: 50%;
    transform: translate(-50%,-50%);
    width: 100%;
    max-width: 475px;
    z-index: 20;
    max-height: 100vh;
    overflow-y: auto;
    background-color: white;
    padding: 20px;
    border-radius: 4px;
    max-height: 80vh;
    overflow-y: auto;
  }

  .files-tree__overlay-close {
    float: right;
    font-size: 21px;
    font-weight: bold;
    line-height: 1;
    color: #000;
    text-shadow: 0 1px 0 #fff;
    opacity: 0.2;
  }

  .fade-enter-active, .fade-leave-active {
    transition: opacity .5s
  }
  .fade-enter, .fade-leave-to /* .fade-leave-active in <2.1.8 */ {
    opacity: 0
  }
</style>
