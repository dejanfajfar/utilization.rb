module Model

  require 'mongo_mapper'
  require_relative 'developer_utilization'

class Developer
  include MongoMapper::Document

  key :name, String, :required => true
  key :surname, String, :required => true
  key :short_name, String, :required => true
  key :active, Boolean, :default => true
  key :department, String, :required => true

  many :developer_utilization, :class_name => 'Model::DeveloperUtilization'

end
end