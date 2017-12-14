# coding: UTF-8

Gem::Specification.new do |s|
  s.add_runtime_dependency 'rails', '>= 4.0'
  s.add_runtime_dependency 'rails_admin', '>= 0.6'

  s.name              = "rails_admin_tree_browser"
  s.version           = "0.1.0"
  s.platform          = Gem::Platform::RUBY
  s.authors           = ["Louis-Philippe Dumas", "Sébastien Asselin"]
  s.email             = ["louis.philippe.dumas@gmail.com", "sebastien@ixmedia.com"]
  s.homepage          = "http://github.com/ixmedia/rails_admin_tree_browser"
  s.license           = "MIT"
  s.summary           = "Add a tree browser selection input in rails_admin"

  s.files             = Dir["{lib,app,vendor,config}/**/*"] + ["README.md"]
  s.require_path      = 'lib'
  s.license           = 'MIT'

end