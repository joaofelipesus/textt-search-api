class AddSearchColumn < ActiveRecord::Migration[7.0]
  def change
    add_column :products, :search_index, :text, default: nil
  end
end
