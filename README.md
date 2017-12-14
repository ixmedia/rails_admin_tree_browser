
# Rails Admin tree browser field

A simple gem to work with [rails_admin](https://github.com/sferik/rails_admin) that allow you to choose element in a tree.

## Usage


```ruby
gem "rails_admin_browser_tree"
```

Then, add in your rails admin model initializer<br/>
``` config/initializers/rails_admin/modelName.rb ```

```ruby
RailsAdmin.config do |config|
  config.model MyAwesomeModel do
    edit do
      field :db_path_field, :tree_browser
    end
  end
end
```

## Config

- `tree_root_url` - The root url from where we show the files tree
- `button_label` - Overwrite the label name
- `download_link` - true/false Show icon with link to download (Optional)
- `node_type_name` - overwrite de node type name, default: node (Optional)
- `element_type_name` - overwrite de element type name, default: element (Optional)

example:

```ruby
RailsAdmin.config do |config|
  config.model MyAwesomeModel do
    edit do
      field :path, :tree_browser do
        tree_root_url 'https://url_to_api_return_json.com'
        button_label 'Choose a file please'
        download_link true
        node_type_name 'dir'
        element_type_name 'file'
      end
    end
  end
end
```
## Need format JSON of API URL

example for https://url_to_api_return_json.com/node

```json
[{
name: "element",
path: "node/element",
type: "element"
},
{
name: "sub_node",
path: "node/sub_node",
type: "node"
}]
```

