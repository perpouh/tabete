Rails.application.routes.draw do
  mount_devise_token_auth_for 'User', at: 'auth'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :stores, defaults: { format: :json }
  resources :articles, defaults: { format: :json }
  resources :lists, defaults: { format: :json }
  namespace :admin do
    resources :stores, only: [:new, :create, :edit, :update, :destroy]
  end
  namespace :my do
    get 'timeline', to: 'timeline#index', defaults: { format: :json }
  end
end
