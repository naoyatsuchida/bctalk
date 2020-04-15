Rails.application.routes.draw do
  devise_for :users, controllers: {
    registrations: 'users/registrations'
  }
  devise_scope :user do
    get 'user/searchin', to: 'users/registrations#searchin'
    get 'user/searchoc', to: 'users/registrations#searchoc'
  end
  
  get   '/users/sign_up' => 'users/registrations#new',as: :signup
  
  root  'posts#index'
  resources :posts
end
