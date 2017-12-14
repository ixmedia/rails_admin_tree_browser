require 'rubygems'
module RailsAdminFilesTree
  class Engine < ::Rails::Engine
    isolate_namespace RailsAdmin

    initializer "RailsAdminTreeBrowser precompile hook" do |app|
      app.config.assets.precompile += ['rails_admin/rails_admin_tree_browser.css', 'rails_admin/rails_admin_tree_browser.js']
    end
  end
end
