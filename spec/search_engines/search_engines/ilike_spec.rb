# frozen_string_literal: true

require 'rails_helper'

RSpec.describe SearchEngines::Ilike do
  describe '#search' do
    let(:category) { create(:category, name: 'majoras mask') }
    let!(:product) do
      create(:product, name: 'Some cool name', description: 'New description', category_ids: [category.id])
    end

    it 'should find products where name partialy matches' do
      expect(described_class.search('Some')).to match([product])
    end

    it 'should find products where description matches' do
      expect(described_class.search('New')).to match([product])
    end

    it 'should find products by its categories' do
      expect(described_class.search('majoras')).to match([product])
    end
  end
end
