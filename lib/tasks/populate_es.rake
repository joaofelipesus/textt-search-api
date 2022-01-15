# frozen_string_literal: true

namespace 'products' do
  desc 'populate products on elastic search'
  task populate: :environment do
    Product.__elasticsearch__.create_index!(force: true)
    Product.__elasticsearch__.refresh_index!
    Product.includes(:categories).import(batch_size: 1000)
  end
end
