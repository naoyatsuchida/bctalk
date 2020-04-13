Rails.application.routes.draw do
  devise_for :users, controllers: {
    registrations: 'users/registrations'
  }
  devise_scope :user do
    get 'user/search', to: 'users/registrations#search'
  end
  root  'posts#index'
end
