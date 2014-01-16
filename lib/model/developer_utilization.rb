include 'MongoMapper'

module Model
class DeveloperUtilization
  include MongoMapper::Document

  key :is_vacation, Boolean
  key :is_missing, Boolean
  key :date, Date, :required => true
  key :effort, Integer, :numeric => true
  key :comment, String

  belongs_to :developer, :required => true
  belongs_to :project

  validate :validate_utilization

  def validate_utilization
    if effort <= 0
      errors.add :effort, "The effort can not be zero or negative"
    end


  end
end
end