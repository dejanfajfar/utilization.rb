require 'colorize'
require_relative 'menu_manager'
require 'yaml'

menu_printer = MenuManager.new
menu_printer.display_menu "MainMenu"