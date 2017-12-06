module RailsAdmin::Config::Fields::Types
  class Map < RailsAdmin::Config::Fields::Base

    RailsAdmin::Config::Fields::Types::register(:files_tree, self)
    def allowed_methods
      [@name, file_path_field, tree_root_path]
    end

    register_instance_option(:partial) do
      :files_tree
    end

    register_instance_option(:tree_root_path) do
      nil
    end

    register_instance_option(:file_path_field) do
      :file_path
    end

    def file_path_input_name
      "#{bindings[:form].object_name}[#{file_path_field}]"
    end

    def file_path_dom_name
      @file_path_dom_name ||= "#{bindings[:form].object_name}_#{file_path_field}"
    end
    
  end
end
