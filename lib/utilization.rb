require_relative "model/developer"
require_relative 'model/developer_utilization'
require_relative 'bl/configuration'
require 'mongo_mapper'
require 'mongo'

config = Configuration.new

MongoMapper.connection = Mongo::Connection.new(config.db.host, config.db.port)
MongoMapper.database = config.db.database
puts config.db.host

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