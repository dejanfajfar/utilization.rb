require 'colorize'
require 'yaml'

class MenuManager

  $menu_store = "../../config/menus/"

  def initialize
    @loaded_menus = Hash.new
    @active_menu = nil
  end

  def display_menu menu
    begin
      options = load_config menu
      @loaded_menus[menu] = options
      @active_menu = menu

      options.each do |key, option|
        puts "[ " + key.to_s.dup.green + " ] " + option
      end

    rescue LoadError => e
      puts e.message
    end
  end

  def read_menu_selection options = {:silent => false, :required => true, :limit_selection => true}
    return nil if @active_menu.nil?

    print "=> " if not options[:silent]
    selection = $stdin.readchar

    selection.delete("\n") # remove newline character that is added by "get". This can cause problems latter on
  end

  def valid_selection? selection, menu = @active_menu
    @loaded_menus.key?(menu) && @loaded_menus[menu].key?(selection)
  end

  def set_active_menu menu
    @active_menu = menu
  end

  private

  def load_config menu_name
    menu_config = File.join __dir__, $menu_store, "#{menu_name}.yaml"

    raise LoadError, "#{menu_config} file not found" if not File.exists? menu_config

    @loaded_menus[menu_name] = YAML.load(File.open(menu_config))
    puts @loaded_menus
    @loaded_menus[menu_name]
  end


end