require "faker"

cat = ["Продукти", "Транспорт", "Ліки", "Побутова хімія", "Гігієна", "Громадське харчування", "Розваги", "Перукарня", "Хімчистка", "Ремонт", "Авто"]

cat.each do |i|
    Category.create(
    name: i,
    description: Faker::Alphanumeric.alpha(number: 15)
    )
end

(1..11).each do |y|
    (1..20).each do |id|
        Operation.create(
        type_operation: "Розхід",
        amount: Faker::Number.decimal(l_digits: 2),
        odate: Faker::Date.between(from: 90.days.ago, to: Date.today),
        description: Faker::Alphanumeric.alpha(number: 15),
        category_id: y
        )
    end
end