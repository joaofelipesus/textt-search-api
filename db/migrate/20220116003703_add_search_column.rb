class AddSearchColumn < ActiveRecord::Migration[7.0]
  def change
    add_column :products, :search_index, :text, default: nil
    add_index :products, :search_index
  end
end
