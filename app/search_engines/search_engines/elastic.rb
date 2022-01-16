# frozen_string_literal: true

module SearchEngines
  # Uses elastic search to match full words
  class Elastic < SearchEngines::Base

    def search
      return [] unless product_ids_found

      Product.find(product_ids_found)
    end

    private

    MAX_RETURNED_RESULTS = 100

    def product_ids_found
      Product.search(search_by, size: MAX_RETURNED_RESULTS).results.map(&:_id)
    end
  end
end
