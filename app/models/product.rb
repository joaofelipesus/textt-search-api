# frozen_string_literal: true

class Product < ApplicationRecord
  include Elasticsearch::Model

  validates :name, :price, :description, presence: true
  validates :name, uniqueness: true

  has_and_belongs_to_many :categories, join_table: 'categories_products'

  settings index: { number_of_shards: 1 } do
    mappings do
      indexes :name
      indexes :description
      indexes :categories do
        indexes :name, type: :text
      end
    end
  end

  def as_indexed_json(_options = {})
    as_json(include: { categories: { only: :name } })
  end
end
