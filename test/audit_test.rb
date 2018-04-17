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

  # def test_it_checks_invalid_days
  #   skip
  #   actual = @audit.were_invalid_days_worked
  #   #must check validity for all possible invalid scenarios
  #
  #   #sample invalid message:
  #   expected = "John Smith worked on Widgets on 2016-02-20, it was a weekend"
  #   assert_equal expected, actual
  #
  #   #sample valid message
  #   expected = "None"
  #   assert_equal expected, actual
  # end
end
