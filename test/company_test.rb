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
end
