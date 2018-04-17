require './test/test_helper'
require './lib/employee'

class EmployeeTest < Minitest::Test
  def setup
    employee_id = '5'
    name = 'Sally Jackson'
    role = 'Engineer'
    start_date = '2015-01-01'
    end_date = '2018-01-01'
    @employee = Employee.new(employee_id, name, role, start_date, end_date)
  end
  def test_instantiation
    assert_instance_of Employee, @employee
  end

  def test_attributes
    # skip
  # make sure to convert all ID values to integers
  assert_instance_of Integer, @employee.id
  # => Integer
  assert_equal "Sally Jackson", @employee.name
  # => "Sally Jackson"
  assert_equal "Engineer", @employee.role
  # => "Engineer"
  assert_instance_of Date, @employee.start_date
  # => #<Date: 2015-01-01 ((2457024j,0s,0n),+0s,2299161j)>
  assert_instance_of Date, @employee.end_date
  # => #<Date: 2018-01-01 ((2458120j,0s,0n),+0s,2299161j)>
  end
end
