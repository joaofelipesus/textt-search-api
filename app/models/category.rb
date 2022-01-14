# frozen_string_literal: true

class Category < ApplicationRecord
  validates :name, presence: true
  validates :name, uniqueness: true

  has_and_belongs_to_many :products, join_table: 'categories_products'
end
