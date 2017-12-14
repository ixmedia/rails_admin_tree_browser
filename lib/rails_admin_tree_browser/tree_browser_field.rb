module RailsAdmin::Config::Fields::Types
  class TreeBrowserField < RailsAdmin::Config::Fields::Base

    RailsAdmin::Config::Fields::Types::register(:tree_browser, self)

    def allowed_methods
      [@name, button_label, download_link, tree_root_url]
    end

    register_instance_option(:partial) do
      :tree_browser
    end

    register_instance_option(:tree_root_url) do
      nil
    end

    register_instance_option(:button_label) do
      I18n.t('rails_admin_tree_browser.choose_button') || :button_label
    end

    register_instance_option(:download_link) do
      false || :download_link
    end

    register_instance_option(:node_type_name) do
      'node' || :node_type_name
    end

    register_instance_option(:element_type_name) do
      'element' || :element_type_name
    end

    def input_name
      "#{bindings[:form].object_name}[#{@name}]"
    end

    def dom_name
      @dom_name ||= "#{bindings[:form].object_name}_#{@name}"
    end

  end
end
