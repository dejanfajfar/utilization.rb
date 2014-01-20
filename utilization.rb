require_relative "lib/model/developer"
require_relative 'lib/model/developer_utilization'
require_relative 'lib/model/project'
require 'mongo_mapper'
require 'mongo'

MongoMapper.connection = Mongo::Connection.new('localhost', '27017')
MongoMapper.database = 'utilization'

#Create all needed projects
project1 = Model::Project.new(:name => "Project01")
project2 = Model::Project.new(:name => "Project02")
project3 = Model::Project.new(:name => "Project03")

project1.save!
project2.save!
project3.save!

# Create the developer
developer = Model::Developer.new(
    :name => 'Dejan',
    :surname => 'Fajfar',
    :short_name => 'DF',
    :department => 'IT',
)

developer.save!

# Add utilizations

utilization = Model::DeveloperUtilization.new(
    :date => Time.now,
    :effort => 3,
    :project => project2,
    :developer => developer
)

utilization.save!

puts utilization.developer.name