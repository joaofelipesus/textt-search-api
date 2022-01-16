# frozen_string_literal: true

module SearchEngines
  # This class uses a column with concatented values of name, description and category names normalized, this
  #   approach aims to change ILIKE and OR to a single LIKE statement increasing performace.
  class BySearchIndex < SearchEngines::Base
    def search
      Product.where('search_index like ?', search_term)
    end

    private

    def search_term
      "%#{search_by.parameterize.gsub('-', ' ')}%"
    end
  end
end
