# frozen_string_literal: true

class AddProductIndex < ActiveRecord::Migration[7.0]
  def change
    add_index :products, :search_index, using: :gist, opclass: { search_index: :gist_trgm_ops }
  end
  # def change
  # end

  # An index can be created concurrently only outside of a transaction.
  # disable_ddl_transaction!

  # def up
  #   execute('CREATE INDEX CONCURRENTLY producs USING gin(name description gin_trgm_ops);')
  # end

  # def down
  #   execute('DROP INDEX producs;')
  # end
end
