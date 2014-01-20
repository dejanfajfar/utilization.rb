require 'mongo_mapper'

module Model
class DeveloperUtilization
  include MongoMapper::Document

  key :is_vacation, Boolean, :default => false
  key :is_missing, Boolean, :default => false
  key :date, Date, :required => true
  key :effort, Integer, :numeric => true
  key :comment, String

  belongs_to :developer, :required => true, :class_name => 'Model::Developer'
  belongs_to :project, :required => true, :class_name => 'Model::Project'

  validate :validate_utilization

  def validate_utilization
    if effort <= 0
      errors.add :effort, "The effort can not be zero or negative"
    end


  end
end
end