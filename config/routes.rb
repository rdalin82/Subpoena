Rails.application.routes.draw do
  devise_for :users, controllers: {
    sessions: 'users/sessions'
  }
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".
  resources :attorneys, :providers

  # You can have the root of your site routed with "root"
  # root 'welcome#index'
  root 'mains#index'
  get '/' => 'mains#index', as: 'mains'
  get '/new' => 'mains#new'
  post '/create' => 'mains#create'
  get '/download' => 'mains#download'
  #dropbox
  get '/dropbox_authorize' => 'dashboards#authorize', as: 'dropbox_authorize'
  get '/dropbox_unauthorize' => 'dashboards#unauthorize', as: 'dropbox_unauthorize'
  get '/dropbox_path_change' => 'dashboards#dropbox_path_change', as: 'dropbox_path_change'
  get '/dropbox_callback' => 'dashboards#dropbox_callback', as: 'dropbox_callback'
  get '/dropbox_download' => 'dashboards#dropbox_download', as: 'dropbox_download'
  post '/dropbox_upload' => 'dashboards#upload', as: 'upload'
  post '/dropbox_search' => 'dashboards#search', as: 'search'

  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'
  #get '/attorneys' => 'attorneys#index'
  #get '/attorneys/new' => 'attorneys#new'
  #get '/attorneys/:id' => 'attorneys#show'
  
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
