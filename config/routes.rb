Rails.application.routes.draw do
  get 'react_examples/component', to: 'react_examples#component', as: :component
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :bank_accounts
  resources :statement_parsers
  devise_for :users, :controllers => { registrations: 'registrations' }

  root 'application#hello'

  match "/404", :to => "errors#not_found", :via => :all
  match "/422", :to => "errors#unprocessable_entity", :via => :all
  match "/500", :to => "errors#internal_server_error", :via => :all

  match "/test-react", :to => "react#index", :via => :all

end
