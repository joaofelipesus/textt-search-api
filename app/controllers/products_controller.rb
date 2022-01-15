# frozen_string_literal: true

class ProductsController < ApplicationController
  def index
    products = search
    render('products/index', formats: :json, locals: { products: })
  end

  private

  def search
    search_engine = params[:engine]
    return Product.all unless search_engine

    SearchEngines::Ilike.search(params[:search_by]) if search_engine == 'ilike'
  end
end
