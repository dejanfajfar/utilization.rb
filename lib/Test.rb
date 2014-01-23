require 'colorize'
require_relative 'ui/menu_manager'
require 'yaml'

menu_printer = MenuManager.new
menu_printer.display_menu "MainMenu"


# Create the developer
developer = Model::Developer.new(
    :name => 'Dejan',
    :surname => 'Fajfar',
    :short_name => 'DF',
    :department => 'IT'
)

developer.save!

# Add utilizations

utilization = Model::DeveloperUtilization.new(
    :date => Time.now,
    :effort => 3,
    :project => 'Project2',
    :developer => developer
)

utilization.save!

puts utilization.developer.active?