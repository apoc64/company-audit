require 'csv'

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
    return failure if !check_validity(records, 5)
    records.each do |rec|
      employee = Employee.new(rec[0], rec[1], rec[2], rec[3], rec[4])
      @employees << employee
    end
    {success: true, error: nil}
  end

  def load_projects(filename)
    records = CSV.read(filename)
    return failure if !check_validity(records, 4)
    records.each do |rec|
      project = Project.new(rec[0], rec[1], rec[2], rec[3])
      @projects << project
    end
    {success: true, error: nil}
  end

  def load_timesheets(filename)
    records = CSV.read(filename)
    return failure if !check_validity(records, 4)
    records.each do |rec|
      timesheet = Timesheet.new(rec[0], rec[1], rec[2], rec[3])
      @timesheets << timesheet
    end
    {success: true, error: nil}
  end

  def check_validity(records, count)
    records.all? do |record|
      record.length == count
    end
  end

  def failure
    {success: false, error: 'bad data'}
  end

  def find_employee_by_id(id)
    @employees.find do |employee|
      employee.id == id
    end
  end

  def find_project_by_id(id)
    @projects.find do |project|
      project.id == id
    end
  end
end
