Rails.application.routes.draw do
  resources :reviews
  resources :companies
  post '/search', to: "companies#search"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
