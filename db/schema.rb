ActiveRecord::Schema[7.0].define(version: 2023_03_03_121120) do
  create_table "categories", force: :cascade do |t|
    t.string "name"
    t.string "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "operations", force: :cascade do |t|
    t.decimal "amount", precision: 8, scale: 2
    t.datetime "odate"
    t.string "description"
    t.integer "category_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "type_operation"
    t.index ["category_id"], name: "index_operations_on_category_id"
  end

  add_foreign_key "operations", "categories"
end
