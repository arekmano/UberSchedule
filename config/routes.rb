Rails.application.routes.draw do
  get 'schedule/search'

  get 'schedule/index'
  get 'sequence_maker/index'

  devise_for :users, :controllers => { registrations: 'registrations' }
  #devise_for :users
  get 'sessions/new'

  get 'course/index'

  get 'course/show'
  get 'profile' => 'profile#profile', :as => 'profile'
  get 'schedule/schedule'

  post 'updatedSequence' => 'sequence_generator#updateDoneCourses', :as => 'update_sequence'
  get 'sequence' => 'sequence_generator#Sequence', :as => 'sequence'
  get 'sequence/:option' => 'sequence_generator#Sequence'
  post 'mysequence' => 'sequence_generator#personalizedSequence', :as => 'personalized_sequence'

  get 'schedule_generator' => 'schedule_generator#schedule_generator', :as => 'schedule_generator'

  get 'sequence_build' => 'sequence_builder#sequence_builder', as: 'sequence_builder'
  root 'login#index'
  match ':controller(/:action(/:id))', :via => [:get, :post]

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
