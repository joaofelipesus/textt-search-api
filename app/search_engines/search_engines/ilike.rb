# frozen_string_literal: true

module SearchEngines
  # Search a product looking on name, description and categories for received term, this is the easiest to
  # implement BUT the worse in performance.
  class Ilike < SearchEngines::Base
    def search
      search_by_category
        .or(search_by_description)
        .or(search_by_name)
    end

    private

    def search_by_name
      Product.where('products.name ILIKE ?', search_term)
    end

    def search_by_description
      Product.where('description ILIKE ?', search_term)
    end

    def search_by_category
      Product.joins(:categories).where('categories.name ILIKE ?', search_term)
    end
  end
end
