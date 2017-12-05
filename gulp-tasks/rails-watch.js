var gulp          = require("gulp");
gulp.task('watch', function(){
  gulp.watch('./vendor/assets/stylesheets/rails_admin/**/*.+(sass|scss)', ['app-styles']);
  gulp.watch('./vendor/assets/javascripts/rails_admin/**/*.+(js|vue)', ["webpack:build-dev"]);
})
