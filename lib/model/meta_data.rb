module Model
  require 'mongo_mapper'
class MetaData
  include MongoMapper::EmbeddedDocument
end
end