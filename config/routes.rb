Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :bank_accounts
  devise_for :users, :controllers => { registrations: 'registrations' }

  root 'application#hello'

end
