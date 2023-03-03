require "test_helper"

class OperationTest < ActiveSupport::TestCase

  test "shoud be a name of operation" do
    operation = Operation.new
    assert_not operation.save, 'Did NOT saved operation without name'
  end

  test "shoud be amount greater than 0" do
    operation = Operation.new(type_operation: 'sdghsdh', amount: -100, odate: Time.now, description: 'wkjbtkbk', category_id: 1)
    assert_not operation.amount > 0 
  end
end
