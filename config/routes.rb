Rails.application.routes.draw do
  root to: 'secret_codes#index'
  devise_for :users, :controllers => { registrations: 'registrations'}
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :secret_codes, only: %i[index create]
end
