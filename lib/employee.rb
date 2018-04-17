require_relative '../modules/date_handler'

class Employee
  include DateHandler #directions didn't say we can't, rake works without this, not individual test file
  attr_reader :id,
              :name,
              :role,
              :start_date,
              :end_date

  def initialize(id, name, role, start_date, end_date)
    @id = id.to_i
    @name = name
    @role = role
    @start_date = DateHandler.string_to_date(start_date)
    @end_date = DateHandler.string_to_date(end_date)
  end
end
