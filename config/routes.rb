Rails.application.routes.draw do
  devise_for :users
  unauthenticated :user do
    root to: "pages#index"
  end

  authenticated :user do
    root to: "categories#index", as: :authenticated_root
  end 

  resources :categories, only: [:index, :new, :create] do
    resources :expenses, only: [:index, :new, :create]
  end
end
