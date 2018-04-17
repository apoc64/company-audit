require './lib/company'
require './test/test_helper'

class CompanyTest < Minitest::Test
  def test_instantiation
    company = Company.new
    assert_instance_of Company, company
  end
end
