# frozen_string_literal: true

class AddRelationBitweenProductAndCategories < ActiveRecord::Migration[7.0]
  def change
    # create_table :categories_products, id: :uuid do |t|
    #   t.belongs_to :category
    #   t.belongs_to :product
    # end
    create_join_table :categories, :products, column_options: { type: :uuid }
  end
end
