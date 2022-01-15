# frozen_string_literal: true

class AddColorToCategory < ActiveRecord::Migration[7.0]
  def change
    add_column :categories, :badge_color, :string
  end
end
