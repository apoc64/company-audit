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
    assert_equal expected, message
    assert_equal 2, company.employees.count
    assert_instance_of Employee, company.employees[0]
    # Parameters: String
    # Returns: Hash
    # Read all data from filename in CSV format. Only add its contents to company.employees if ALL data in the file is valid. If any data is invalid, you should immediately return an error INSTEAD of saving the data. A test file for bad employee data has been provided.
    #
    # This method should return a hash. A success key in the hash will contain a boolean letting us know if the whole file imported correctly or not. An error key, if success is false, will tell us why the import failed.
    #
    # Return value examples:
    #
    # {success: true, error: nil}
    # {success: false, error: 'bad data'}
  end
end
