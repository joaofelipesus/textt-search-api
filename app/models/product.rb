# frozen_string_literal: true

class Product < ApplicationRecord
  validates :name, :price, :description, presence: true
  validates :name, uniqueness: true

  has_and_belongs_to_many :categories, join_table: 'categories_products'
end
