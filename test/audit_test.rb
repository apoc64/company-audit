require './lib/audit'
require './test/test_helper'

class AuditTest < Minitest::Test
  def test_instantiation
    audit = Audit.new
    assert_instance_of Audit, audit
  end
end 
