# frozen_string_literal: true

json.id product.id
json.name product.name
json.description product.description
json.price product.price
json.categories do
  json.array! product.categories do |category|
    json.partial! 'categories/category', category: category
  end
end
