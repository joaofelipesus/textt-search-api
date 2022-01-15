# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Product, type: :model do
  it { should validate_presence_of(:name) }
  it { should validate_presence_of(:price) }
  it { should validate_presence_of(:description) }

  it { should validate_uniqueness_of(:name) }

  it do
    product = create(:product, category_ids: [])
    expect(product.as_indexed_json).to match(
      {
        'id' => product.id,
        'name' => product.name,
        'description' => product.description,
        'price' => product.price,
        'created_at' => product.created_at,
        'updated_at' => product.updated_at,
        'categories' => []
      }
    )
  end
end
