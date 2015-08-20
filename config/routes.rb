Rails.application.routes.draw do
  devise_for :users
  resources :contacts # Shorthand way of generating a bunch of url definitions - just check with "bundle exec rake routes"
  #1. Web Server (WEbrick in this case catches Http req and notifies routes.rb)
  #2. routes.rb tells Contacts_Controller.rb to run the 'new' action
  #3. Contacts_Controller.rb checks Views folder for HTML file with same 'new' name
  #4. Contacts_Controller.rb' 'new' action sets a variable called @contact for use in the New.html.erb view file
  #5. Contacts_Controller.rb sends all gathered HTML back to Webrick
  #6. Webrick sends back HTTP response containing all necessary HTML for the browser to render the page
  get '/about' => 'pages#about' #this one is manually defined
  root 'pages#home' #and this one too
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
