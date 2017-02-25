Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :bank_accounts
  devise_for :users, :controllers => { registrations: 'registrations' }

  root 'application#hello'

  match "/404", :to => "errors#not_found", :via => :all
  match "/422", :to => "errors#unprocessable_entity", :via => :all
  match "/500", :to => "errors#internal_server_error", :via => :all

end
