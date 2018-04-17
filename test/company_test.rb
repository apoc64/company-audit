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

  def test_it_will_not_load_bad_data
      company = Company.new
      actual = company.load_employees('./data/bad_employees.csv')
      expected = {success: false, error: 'bad data'}
      assert_equal expected, actual
      assert_equal [], company.employees
  end
end
