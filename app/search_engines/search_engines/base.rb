# frozen_string_literal: true

module SearchEngines
  class Base
    def initialize(search_by)
      @search_by = search_by
    end

    def self.search(search_by)
      new(search_by).search
    end

    # this method must be subscribed
    def search(search_by); end

    private

    attr_reader :search_by

    def search_term
      "%#{search_by}%"
    end
  end
end
