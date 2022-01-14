# frozen_string_literal: true

class ProductsController < ApplicationController

  # TODO: add pagination
  def index
    products = Product.all
    render('products/index', formats: :json, locals: { products: products })
  end
end
