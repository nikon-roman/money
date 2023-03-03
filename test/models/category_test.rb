require "test_helper"

class CategoryTest < ActiveSupport::TestCase

  test "shoud be a name of category" do
    category = Category.new
    assert_not category.save, 'Did NOT saved category without name or discription'
  end

  test 'deleting category should delete its operations' do
    category = Category.create(name:"Cat", description:"example")
    operation = category.operations.create(type_operation:"Купівля", description:"example", amount:100, odate:Time.now, category_id:1)
    operation_id = operation.id
    category.destroy

    assert_raises (ActiveRecord::RecordNotFound) {Operation.find(operation_id)}
  end

  test "categories count" do
    assert_equal(Category.all.count, 15)
  end
end
