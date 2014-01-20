require 'mongo_mapper'

module Model
class Project
  include MongoMapper::Document

  key :name, String
  key :active, Boolean, :default => true

end
end