require './lib/audit'
require './test/test_helper'

class AuditTest < Minitest::Test
  def setup
    @audit = Audit.new
    @company = Company.new
    @company.load_employees('./data/employees.csv')
    @company.load_projects('./data/projects.csv')
    @company.load_timesheets('./data/timesheets.csv')
    # @audit.load_company(@company)
  end

  def test_instantiation
    assert_instance_of Audit, @audit
  end

  def test_load_company_returns_company
    assert_equal @company, @audit.load_company(@company)
  end
#
# To begin auditing the company, we will need to set up a Company object and add our CSV data. The final implementation is up to you, as long as you return data as expected.
#
# Parameters: Company object
# Returns: Company object
# This method will give all other audit methods access to the company's details. Since there are no audit methods which allow you to re-load company details, you will need to load all CSV data into the company before you call this method.
#
# audit.were_invalid_days_worked
# Parameters: None
# Returns: String
# This method will analyze all timesheets to determine if they are valid. You ARE ALLOWED to extract functionality into helper methods provided they are completely unit tested AND that you have an integration test for this method.
#
# Reasons a timesheet could be declared invalid:
#
# an employee_id is not valid
# a project_id is not valid
# an employee is attempting to bill time before or after the project start/end dates
# an employee was working on a weekend; we value our work-life balance, employees are not allowed to work weekends
# The exact format of the report will look like this:
#
# Invalid Days Worked:
# John Smith worked on Widgets on 2016-02-20, it was a weekend
# Use existing company methods to look up employee names and project names.
#
# If no invalid timesheets are found, your output should look like this instead:
#
# Invalid Days Worked:
# None
end
