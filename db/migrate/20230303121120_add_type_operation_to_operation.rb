class AddTypeOperationToOperation < ActiveRecord::Migration[7.0]
  def change
    add_column :operations, :type_operation, :string
  end
end
