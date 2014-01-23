require_relative "model/developer"
require_relative 'model/developer_utilization'
require_relative 'bl/configuration'
require_relative 'ui/menu_manager'
require 'mongo_mapper'
require 'mongo'

config = Configuration.new
menu_manager = MenuManager.new

MongoMapper.connection = Mongo::Connection.new(config.db.host, config.db.port)
MongoMapper.database = config.db.database
puts config.db.host

menu_manager.display_menu 'MainMenu'
selection = menu_manager.read_menu_selection

puts menu_manager.valid_selection? selection
