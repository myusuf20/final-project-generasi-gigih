Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  # get 'menu_items/index'
  # get 'menu_items/show'
  # get 'menu_items/new'
  # get 'menu_items/edit'
  # get 'menu_items/create'
  # get 'menu_items/update'
  # get 'menu_items/destroy'

  resources :menu_items
end
