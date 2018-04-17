require './lib/project'
require './test/test_helper'
# require './lib/employee'

class EmployeeTest < Minitest::Test
  def setup
    project_id = '123'
    name = 'Widget Maker'
    start_date = '2015-01-01'
    end_date = '2018-01-01'
    @project = Project.new('123', 'Widget Maker', '2015-01-01', '2018-01-01')
  end

  def test_instantiation
    assert_instance_of Project, @project
  end

  def test_attributes
    assert_instance_of Integer, @project.id
    assert_equal 123, @project.id
    assert_equal "Widget Maker", @project.name
    assert_instance_of Date, @project.start_date
    assert_instance_of Date, @project.end_date
  end
end
