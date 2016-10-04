Rails.application.routes.draw do
  root to: 'farmars#index'
  get 'farmars/index' => 'farmars#index', as: "index"

  get 'vendors/index'

  get 'vendors/new'

  get 'vendors/create'

  get 'vendors/show'

  get 'vendors/edit'

  get 'vendors/update'

  get 'vendors/destroy'

  get 'markets/index'

  get 'markets/new'

  get 'markets/create'

  get 'markets/show'

  get 'markets/edit'

  get 'markets/update'

  get 'markets/destroy'

  get 'vendor/index'

  get 'vendor/new'

  get 'vendor/create'

  get 'vendor/edit'

  get 'vendor/update'

  get 'vendor/destroy'

  get 'vendor/show'

  get 'market/index'

  get 'market/new'

  get 'market/create'

  get 'market/edit'

  get 'market/update'

  get 'market/destroy'

  get 'market/show'

  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  # root 'welcome#index'

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
