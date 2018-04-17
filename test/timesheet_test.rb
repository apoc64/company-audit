require './lib/timesheet'
require './test/test_helper'

class TimesheetTest < Minitest::Test
  def setup
    employee_id = '5'
    project_id = '7'
    date = '2015-01-01'
    minutes = '120'
    @timesheet = Timesheet.new(employee_id, project_id, date, minutes)
  end

  def test_instantiation
    assert_instance_of Timesheet, @timesheet
  end

  def test_attributes
    assert_instance_of Integer, @timesheet.employee_id
    assert_equal 5, @timesheet.employee_id
    assert_instance_of Integer, @timesheet.project_id
    assert_equal 7, @timesheet.project_id
    assert_instance_of Date, @timesheet.date
    assert_instance_of Integer, @timesheet.minutes
    assert_equal 120, @timesheet.minutes
  end
end
