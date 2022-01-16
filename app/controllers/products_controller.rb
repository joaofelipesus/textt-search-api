# frozen_string_literal: true

class ProductsController < ApplicationController
  def index
    products = search
    render('products/index', formats: :json, locals: { products: })
  end

  private

  def search
    return Product.all unless params[:engine]

    engine.search(params[:search_by])
  end

  def engine
    case params[:engine]
    when 'ilike'
      SearchEngines::Ilike
    when 'index'
      SearchEngines::BySearchIndex
    when 'elastic'
      SearchEngines::Elastic
    end
  end
end
