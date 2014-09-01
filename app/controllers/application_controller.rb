class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_filter :find_cart, :except => :destroy

  private

  def find_cart
    session[:cart] ||= Cart.new
    @cart = session[:cart]
  end

end
