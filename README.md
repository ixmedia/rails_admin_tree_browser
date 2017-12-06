
# Rails Admin files tree field

A simple gem to work with [rails_admin](https://github.com/sferik/rails_admin) that allow you to choose a file path form a directorie
files tree.

## Usage


```ruby
source 'http://gems.ixmedia.com:9292/'

gem "rails_admin_files_tree"
```

Then, add in your rails admin model initializer<br/>
``` config/initializers/rails_admin/modelName.rb ```

```ruby
RailsAdmin.config do |config|
  config.model MyAwesomeModel do
    edit do
      field :db_path_field, :files_tree
    end
  end
end
```

## Config

- `file_path_field` - name of the db column where you want to save the path
- `tree_root_path` - The root path from where we show the files tree

example:

```ruby
RailsAdmin.config do |config|
  config.model MyAwesomeModel do
    edit do
      field :coordinates, :map do
        file_path_field :file_path
        tree_root_path '/var/path/to/files/you/want'
      end
    end
  end
end
```
