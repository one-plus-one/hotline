Rails.application.routes.draw do
  get 'catalogs/new'

  get 'dashboard/home'

  get 'oncall/:tel' => 'dashboard#oncall'

  get 'answer/:tel' => 'dashboard#answer'

  devise_for :users
  resources :users

  root to: "dashboard#home"

  resources :work_orders do
    get :export, :on => :collection
    get :export_index, :on => :collection
  end

  resources :repositories
  resources :catalogs, only: [:new,:create,:index,:destroy]

  # get 'workorder/index/:id' => 'workorder#index',as: 'workorder_index_id'
  # post 'workorder/:id' => 'workorder#update',as: 'update_workorder'
  #root 'users#index'

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
