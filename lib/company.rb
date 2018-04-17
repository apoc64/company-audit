require 'csv'
require 'pry'

class Company
  attr_reader :employees,
              :projects,
              :timesheets

  def initialize
    @employees = []
    @projects = []
    @timesheets = []
  end

  def load_employees(filename)
    records = CSV.read(filename)
    records.each do |record|
      id = record[0]
      name = record[1]
      role = record[2]
      start_date = record[3]
      end_date = record[4]
      employee = Employee.new(id, name, role, start_date, end_date)
      @employees << employee
    end
    {success: true, error: nil}
  end
end
