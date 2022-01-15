# frozen_string_literal: true

class Product < ApplicationRecord
  include Elasticsearch::Model

  validates :name, :price, :description, presence: true
  validates :name, uniqueness: true

  has_and_belongs_to_many :categories, join_table: 'categories_products'

  settings index: { number_of_shards: 1 } do
    mappings dynamic: 'false' do
      indexes :name
      indexes :description
    end
  end
end
