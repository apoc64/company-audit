require './lib/company'
require './test/test_helper'

class CompanyTest < Minitest::Test
  def test_instantiation
    company = Company.new
    assert_instance_of Company, company
  end

  def test_it_starts_with_empty_arrays
    company = Company.new
    assert_equal [], company.employees
    assert_equal [], company.projects
    assert_equal [], company.timesheets
  end

  def test_it_loads_employees
    company = Company.new
    actual = company.load_employees('./data/employees.csv')
    expected = {success: true, error: nil}
    assert_equal expected, actual
    assert_equal 2, company.employees.count
    assert_instance_of Employee, company.employees[0]
  end

  def test_it_will_not_load_bad_employee_data
      company = Company.new
      actual = company.load_employees('./data/bad_employees.csv')
      expected = {success: false, error: 'bad data'}
      assert_equal expected, actual
      assert_equal [], company.employees
  end

  def test_it_loads_projects
    company = Company.new
    actual = company.load_projects('./data/projects.csv')
    expected = {success: true, error: nil}
    assert_equal expected, actual
    assert_equal 3, company.projects.count
    assert_instance_of Project, company.projects[0]
  end

  def test_it_will_not_load_bad_project_data
      company = Company.new
      actual = company.load_projects('./data/bad_projects.csv')
      expected = {success: false, error: 'bad data'}
      assert_equal expected, actual
      assert_equal [], company.projects
  end

  def test_it_loads_timesheets
    company = Company.new
    actual = company.load_timesheets('./data/timesheets.csv')
    expected = {success: true, error: nil}
    assert_equal expected, actual
    assert_equal 25, company.timesheets.count
    assert_instance_of Timesheet, company.timesheets[0]
  end

  def test_it_will_not_load_bad_timesheet_data
      company = Company.new
      actual = company.load_timesheets('./data/bad_timesheets.csv')
      expected = {success: false, error: 'bad data'}
      assert_equal expected, actual
      assert_equal [], company.timesheets
  end

  def test_it_checks_validity
    company = Company.new
    good = [[1,2,3],[1,2,3]]
    bad = [[1,2,3],[1,2],[1,2,3]]
    assert company.check_validity(good, 3)
    refute company.check_validity(bad, 3)
  end

  def test_it_can_return_failure
    company = Company.new
    expected = {success: false, error: 'bad data'}
    assert_equal expected, company.failure
  end

  def test_it_can_return_employee_from_id
    company = Company.new
    actual = company.load_employees('./data/employees.csv')
    emp1 = company.find_employee_by_id(1)
    assert_instance_of Employee, emp1
    assert_equal "Susan Smith", emp1.name

    emp2 = company.find_employee_by_id(2)
    assert_instance_of Employee, emp2
    assert_equal "John Smith", emp2.name

    emp2 = company.find_employee_by_id(3)
    assert_nil emp2
  end

  def test_it_can_return_project_from_id
    company = Company.new
    actual = company.load_projects('./data/projects.csv')
    proj1 = company.find_project_by_id(1)
    assert_instance_of Project, proj1
    assert_equal "Widgets", proj1.name

    proj2 = company.find_project_by_id(2)
    assert_instance_of Project, proj2
    assert_equal "More Widgets", proj2.name

    proj3 = company.find_project_by_id(4)
    assert_nil proj3
  end
end
