# frozen_string_literal: true

require "thor"
require "active_support/core_ext/string/inflections"

# Generates component adding them to the necessary files.
#
# Usage:
#
# bundle exec thor component_generator my_component_name
# bundle exec thor component_generator my_component_name -js=some-npm-package
class ComponentGenerator < Thor::Group
  include Thor::Actions

  # Define arguments and options
  argument :name
  class_option :js, default: nil, desc: "Name of the package to import for this component."
  class_option :inline, type: :boolean, desc: "Use this option to create a #call method instead of generating an ERB template for the component."

  def self.source_root
    File.dirname(__FILE__)
  end

  def create_controller
    template("templates/component.tt", "app/components/primer/#{underscore_name}.rb")
  end

  def create_template
    template("templates/component.html.tt", "app/components/primer/#{underscore_name}.html.erb") unless inline?
  end

  def create_test
    template("templates/test.tt", "test/components/#{underscore_name}_test.rb")
  end

  def create_system_test
    template("templates/system_test.rb.tt", "test/system/#{underscore_name}_test.rb") if js_package_name
    template("templates/system_test_preview.rb.tt", "test/components/previews/primer/#{underscore_name}_preview.rb") if js_package_name
  end

  def create_stories
    template("templates/stories.tt", "stories/primer/#{underscore_name}_stories.rb")
  end

  def add_to_rakefile
    insert_into_file("Rakefile", "      Primer::#{class_name},\n", after: "    components = [\n")
    insert_into_file("Rakefile", "      Primer::#{class_name},\n", after: "js_components = [\n", force: true) if js_package_name
  end

  def add_to_component_test
    insert_into_file("test/components/component_test.rb", "    [Primer::#{class_name}, {}],\n", after: "COMPONENTS_WITH_ARGS = [\n")
  end

  def add_to_nav
    append_to_file("docs/src/@primer/gatsby-theme-doctocat/nav.yml") do
      <<-HEREDOC
    - title: #{class_name} - Fix my order in docs/src/@primer/gatsby-theme-doctocat/nav.yml
      url: /components/#{short_name}
      HEREDOC
    end
  end

  def create_ts_file
    template("templates/component.ts.tt", "app/components/primer/#{underscore_name}.ts") if js_package_name
  end

  def import_in_primer_ts
    append_to_file("app/components/primer/primer.ts", "import './#{underscore_name}'") if js_package_name
  end

  def install_js_package
    run "yarn add #{js_package_name}" if js_package_name
  end

  private

  def class_name
    name.camelize
  end

  def underscore_name
    name.underscore
  end

  def custom_element_name
    underscore_name.tr("_", "-")
  end

  def short_name
    class_name.gsub("Component", "").downcase
  end

  def js_package_name
    options[:js]
  end

  def inline?
    options[:inline]
  end
end
