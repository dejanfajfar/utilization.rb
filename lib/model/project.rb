module Model
class Project
  include MongoMapper::Document

  key :name, String
  key :active, Boolean

end
end