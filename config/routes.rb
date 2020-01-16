Rails.application.routes.draw do
  devise_for :users
  namespace :acme do
    resources :sales_report, only: [:create, :index]
  end

  root to: 'acme/sales_report#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
