require 'rubygems'
module RailsAdminFilesTree
  class Engine < ::Rails::Engine
    isolate_namespace RailsAdmin

    initializer "RailsAdminFilesTree precompile hook" do |app|
      app.config.assets.precompile += ['rails_admin/rails_admin_files_tree.css', 'rails_admin/rails_admin_files_tree.js']
    end
  end
end
