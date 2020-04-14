Rails.application.routes.draw do
  devise_for :users, controllers: {
    registrations: 'users/registrations'
  }
  devise_scope :user do
    get 'user/searchin', to: 'users/registrations#searchin'
    get 'user/searchoc', to: 'users/registrations#searchoc'
  end
  constraints ->  request { request.session[:user_id].present? } do

    root  "posts#home"
  end

  root  'posts#index'
  resources :posts
end
