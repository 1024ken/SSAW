Rails.application.routes.draw do

  root 'seasons#index'

  resources :seasons, only: [:index]

  resources :warmspring, only: [:index, :show, :new, :create, :edit, :update, :destroy] do
    resources :warmspring_comments
    collection do
      post :confirm
      get :ranking
    end
  end

  resources :summer, only: [:index, :show, :new, :create, :edit, :update, :destroy] do
    resources :summer_comments
    collection do
      post :confirm
      get :ranking
    end
  end

  resources :autumn, only: [:index, :show, :new, :create, :edit, :update, :destroy] do
    resources :autumn_comments
    collection do
      post :confirm
      get :ranking
    end
  end

  resources :winter, only: [:index, :show, :new, :create, :edit, :update, :destroy] do
    resources :winter_comments
    collection do
      post :confirm
      get :ranking
    end
  end

  resources :all_ranking, only: [:index] do
  end

  post '/like/:season_id' => 'likes#like', as: 'like'
  delete '/like/:season_id' => 'likes#unlike', as: 'unlike'

  resources :relationships, only: [:create, :destroy]

  if Rails.env.development?
    mount LetterOpenerWeb::Engine, at: "/letter_opener"
  end

  devise_for :users, controllers: {
    registrations: "users/registrations",
    omniauth_callbacks: "users/omniauth_callbacks"
  }

  resources :users, only: [:index] do
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
