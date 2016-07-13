Rails.application.routes.draw do
  
  get 'cover_types/new'
  get 'cover_types/create'
  get 'cover_types/edit'
  get 'cover_types/update'
  get 'cover_types/index'
  get 'cover_types/show'
  get 'cover_types/destroy'

  get 'book_statuses/new'
  get 'book_statuses/create'
  get 'book_statuses/edit'
  get 'book_statuses/update'
  get 'book_statuses/index'
  get 'book_statuses/show'
  get 'book_statuses/destroy'

  get 'book_categories/new'
  get 'book_categories/create'
  get 'book_categories/edit'
  get 'book_categories/update'
  get 'book_categories/index'
  get 'book_categories/show'
  get 'book_categories/destroy'

  get 'book_languages/new'
  get 'book_languages/create'
  get 'book_languages/edit'
  get 'book_languages/update'
  get 'book_languages/index'
  get 'book_languages/show'
  get 'book_languages/destroy'

  get 'sessions/new'
  get 'sessions/create'
  get 'sessions/destroy'

  get 'users/new'
  get 'users/create'
  get 'users/edit'
  get 'users/update'
  get 'users/index'
  get 'users/show'
  get 'users/destroy'

  get 'roles/new'
  get 'roles/create'
  get 'roles/edit'
  get 'roles/update'
  get 'roles/index'
  get 'roles/show'
  get 'roles/destroy'

  get 'dashboard/index'
  get 'dashboard/show'

  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  root 'sessions#new'
  

  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'
  get 'dang-nhap' => 'sessions#new', :as => 'dang-nhap'
  get 'dashboard' => 'dashboard#index', :as =>'dashboard-main'

  # Example of named route that can be invoked with purchase_url(id: product.id)
  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase

  # Example resource route (maps HTTP verbs to controller actions automatically):
  resources :dashboard, :roles, :users, :sessions, :book_languages, 
            :book_categories, :book_statuses, :cover_types

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
