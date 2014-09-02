Rails.application.routes.draw do
  devise_for :users

  resources :orders
  resources :statics
  resources :products

  get '/cart/remove/:product_id/:size_id', :to => 'cart#remove_product', :as => :remove_from_cart
  get '/cart/add/:product_id/:size_id', :to => 'cart#add_product', :as => :add_to_cart
  get '/cart/update_size/:product_count/:product_id/:size_id', :to => 'cart#update_size', :as => :update_size
  get '/cart/empty', :to => 'cart#empty', :as => 'empty_cart', :as => :empty_cart
  get '/cart/:product_count/:product_id/:size_id', :to => 'cart#set_count', :as => :set_count
  get '/cart' => 'cart#my_cart', as: :my_cart
  get '/my_pizza' => 'cart#pizza_builder', as: :my_pizza
  # get 'my_pizza' => 'pizza_builder#pizza_builder', as: :my_pizza

  get '/menu/:link' => 'products#by_link'
  get '/:short_url' => 'statics#short_url'

  root 'welcome#index'

  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'

  # Example of named route that can be invoked with purchase_url(id: product.id)
  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase

  # Example resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Example resource route with options:
  #   resources :products do
  #     member do
  #       get 'short'
  #       post 'toggle'
  #     end
  #
  #     collection do
  #       get 'sold'
  #     end
  #   end

  # Example resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Example resource route with more complex sub-resources:
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', on: :collection
  #     end
  #   end

  # Example resource route with concerns:
  #   concern :toggleable do
  #     post 'toggle'
  #   end
  #   resources :posts, concerns: :toggleable
  #   resources :photos, concerns: :toggleable

  # Example resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end
end
