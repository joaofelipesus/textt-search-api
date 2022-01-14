# frozen_string_literal: true

json.array! products do |product|
  json.partial! 'products/product', product: product
end
