# coding: UTF-8

Gem::Specification.new do |s|
  s.add_runtime_dependency 'rails', '>= 4.0'
  s.add_runtime_dependency 'rails_admin', '>= 0.6'

  s.name              = "rails_admin_files_tree"
  s.version           = "0.0.1"
  s.platform          = Gem::Platform::RUBY
  s.authors           = ["Louis-Philippe Dumas"]
  s.email             = ["louis.philippe.dumas@gmail.com"]
  s.homepage          = "http://github.com/lpdumas/"
  s.license           = "MIT"
  s.summary           = "Add a file tree selection input in rails_admin"

  s.files             = Dir["{lib,app,vendor}/**/*"] + ["README.md"]
  s.require_path      = 'lib'
  s.license           = 'MIT'
end
