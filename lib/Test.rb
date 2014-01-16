require 'colorize'
require_relative 'ui/menu_manager'
require 'yaml'

menu_printer = Ui::MenuManager.new
menu_printer.display_menu "MainMenu"