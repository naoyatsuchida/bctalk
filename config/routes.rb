Rails.application.routes.draw do
  devise_for :users, controllers: {
    registrations: 'users/registrations'
  }
  devise_scope :user do
    get 'user/searchin', to: 'users/registrations#searchin'
    get 'user/searchoc', to: 'users/registrations#searchoc'
  end
  get   '/users/sign_up' => 'users/registrations#new',as: :signup #ログインしてなかったらこのページに飛ぶ
  
  root  'posts#index' 
  resources :user, only:[:show,:edit]
  resources :posts do
    resources :likes, only: [:create, :destroy]
    resources :comments, only: [:create,:destroy]
    collection do
      get 'search'
    end
    member do
      get 'industrycategory'
      get 'occupationcategory'
    end

  end
  
  resources :groups

  resources :relationships, only: [:create, :destroy] do 
    member do
    get :following
    get :follower
  end
end
end
