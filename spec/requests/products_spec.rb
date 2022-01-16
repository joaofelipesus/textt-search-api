# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Products', type: :request do
  describe 'GET api/products' do
    let(:search_engine) { double(:search_engine) }

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
          'categories' => [
            { 'id' => category.id, 'name' => 'First category', 'badge_color' => category.badge_color }
          ]
        }
      ]
    end

    it 'returns a products list' do
      get('/api/products')
      expect(JSON.parse(response.body)).to match expected_response
    end

    context 'when search using ilike' do
      it 'calls ilike search engine' do
        allow(SearchEngines::Ilike).to receive(:new).with('some cool term').and_return(search_engine)
        allow(search_engine).to receive(:search).and_return([])
        expect(SearchEngines::Ilike).to receive(:search).at_least(:once)

        get('/api/products?engine=ilike&search_by=some+cool+term')
      end
    end

    context 'when search using index' do
      it 'calls ilike search engine' do
        allow(SearchEngines::BySearchIndex).to receive(:new).with('some cool term').and_return(search_engine)
        allow(search_engine).to receive(:search).and_return([])
        expect(SearchEngines::BySearchIndex).to receive(:search).at_least(:once)

        get('/api/products?engine=index&search_by=some+cool+term')
      end
    end

    context 'when search using elastic' do
      it 'calls ilike search engine' do
        allow(SearchEngines::Elastic).to receive(:new).with('some cool term').and_return(search_engine)
        allow(search_engine).to receive(:search).and_return([])
        expect(SearchEngines::Elastic).to receive(:search).at_least(:once)

        get('/api/products?engine=elastic&search_by=some+cool+term')
      end
    end
  end
end
