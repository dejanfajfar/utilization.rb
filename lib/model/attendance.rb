module Model
  require 'mongo_mapper'
  require 'developer'

class Attendance
  include MongoMapper::Document

  key :late, Boolean, :required => true
  key :payed, Boolean, :default => false
  key :date, Date, :required => true
end
end