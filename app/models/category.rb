# frozen_string_literal: true

class Category < ApplicationRecord
  validates :name, :badge_color, presence: true
  validates :name, :badge_color, uniqueness: true

  has_and_belongs_to_many :products, join_table: 'categories_products'
end
