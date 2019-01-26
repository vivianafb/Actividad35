Rails.application.routes.draw do
  get 'orders/create'
  root 'products#index'
  resources :products do  
    resources :orders
  end
  devise_for :users, controllers: {
    sessions: 'users/sessions'
  } 
  resources :orders, only: :index

   # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
