Rails.application.routes.draw do

  devise_scope :user do
    authenticated :user do
      root 'main#welcome', as: :welcome
    end

    unauthenticated do
      root "main#index", as: :unauthenticated_root
    end
  end

  devise_for :users,
  controllers: {
    omniauth_callbacks: "users/omniauth_callbacks"
  }
  resources :account, as: :users, only: [:show, :update]

  resources :requisitions do
    resources :personalreferences, only: [:new, :create, :edit, :update, :destroy]
  end

end
