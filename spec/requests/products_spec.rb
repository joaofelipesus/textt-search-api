# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Products', type: :request do
  describe 'GET api/products' do
    let!(:category) { create(:category, name: 'First category') }
    let!(:product) do
      create(
        :product,
        name: 'Some cool product',
        price: 99.9,
        category_ids: [category.id],
        description: 'Some description'
      )
    end
    let(:expected_response) do
      [
        {
          'id' => product.id,
          'name' => 'Some cool product',
          'description' => 'Some description',
          'price' => '99.9',
          'categories' => [{ 'id' => category.id, 'name' => 'First category' }]
        }
      ]
    end

    it 'returns a products list' do
      get('/api/products')
      expect(JSON.parse(response.body)).to match expected_response
    end
  end
end
