#encoding: utf-8
class WelcomeController < ApplicationController
  def index
    @pizzas = Product.pizza
  end
end
