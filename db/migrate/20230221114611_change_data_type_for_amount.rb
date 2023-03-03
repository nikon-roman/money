class ChangeDataTypeForAmount < ActiveRecord::Migration[7.0]
  def self.up
    change_table :operations do |t|
      t.change :amount, :decimal, :precision => 8, :scale => 2
    end
  end
  def self.down
    change_table :operations do |t|
      t.change :amount, :decimal
    end
  end
end
