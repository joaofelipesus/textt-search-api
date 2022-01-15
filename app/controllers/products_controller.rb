# frozen_string_literal: true

class ProductsController < ApplicationController
  def index
    products = Product.all
    render('products/index', formats: :json, locals: { products: })
  end
end
