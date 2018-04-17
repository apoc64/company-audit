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
    failure = {success: false, error: 'bad data'}
    records = CSV.read(filename)
    records.each do |rec|
      return failure if rec.length != 5
      employee = Employee.new(rec[0], rec[1], rec[2], rec[3], rec[4])
      @employees << employee
    end
    {success: true, error: nil}
  end
end
