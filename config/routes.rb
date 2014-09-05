Rails.application.routes.draw do
  devise_for :users

  resources :statics

  resources :orders do
    collection do
      get 'closed', as: :closed
    end
  end

  resources :products do
    collection do
      get 'builder', as: :builder
    end
  end

  get '/cart/remove/:product_id/:size_id', :to => 'cart#remove_product', :as => :remove_from_cart
  get '/cart/add/:product_id/:size_id', :to => 'cart#add_product', :as => :add_to_cart
  get '/cart/update_size/:product_count/:product_id/:size_id', :to => 'cart#update_size', :as => :update_size
  get '/cart/empty', :to => 'cart#empty', :as => 'empty_cart', :as => :empty_cart
  get '/cart/:product_count/:product_id/:size_id', :to => 'cart#set_count', :as => :set_count
  get '/cart' => 'cart#my_cart', as: :my_cart

  get '/my_pizza' => 'cart#pizza_builder', as: :my_pizza

  get '/menu/:link' => 'products#by_link'

  get '/:short_url' => 'statics#short_url', as: :static_by_short_url

  root 'welcome#index'

end
