# frozen_string_literal: true

FactoryBot.define do
  factory :product do
    name { Faker::Internet.unique.email }
    description { Faker::Lorem.paragraph }
    price { Faker::Number.decimal(l_digits: 2, r_digits: 2) }
    category_ids { [Category.all.take(1).first.id] }
  end
end
