Rails.application.routes.draw do
  root 'static_pages#home'

  # ['help', 'about', 'contact'].each do |action|
  #   get "static_pages/#{action}", as: "#{action}"
  # end

  get '/signup', to: 'users#new'
  get '/login', to: 'session#new'
  post '/login', to: 'session#create'
  delete '/logout', to: 'session#destroy'
  get '/admin', to: 'static_pages#admin'
  post '/images', to: 'images#create'

  resources :users

  resources :articles
  resources :carousels

  resources :pages
  get 'jianshu/handle_image'

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
