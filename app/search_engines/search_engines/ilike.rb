# frozen_string_literal: true

module SearchEngines
  # Search a product looking on name, description and categories for received term, this is the easiest to
  # implement BUT the worse in performance.
  class Ilike
    def initialize(search_by)
      @search_by = search_by
    end

    def self.search(search_by)
      new(search_by).search
    end

    def search
      search_by_category
        .or(search_by_description)
        .or(search_by_name)
    end

    private

    attr_reader :search_by

    def search_term
      "%#{search_by}%"
    end

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
