module Ui

require 'colorize'
require 'yaml'

class MenuManager

  $menu_store = "../config/menus/"

  def initialize
    @loaded_menus = {}
  end

  def display_menu menu
    begin
      options = load_config menu

      options.each do |key, option|
        puts "( " + key.dup.green + " ) " + option
      end

    rescue LoadError => e
      puts e.message
    end
  end

  def read_menu_selection options = {:silent => false, :required => true}
    puts "=> " if not options[:silent]
    selection = gets
    selection
  end

  private

  def load_config menu_name
    menu_config = "#{$menu_store}#{menu_name}.yaml"

    raise LoadError, "#{menu_config} file not found" if not File.exists? menu_config

    @loaded_menus.merge!( { menu_name.to_sym => YAML.load(File.open(menu_config))} )
    puts @loaded_menus[menu_name.to_sym]
    @loaded_menus[menu_name.to_sym]
  end
end
end