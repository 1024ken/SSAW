Rails.application.routes.draw do

  root 'seasons#index'

  resources :blogs, only: [:index, :new, :create, :edit, :update, :destroy] do
  end

  devise_for :users
  # resources :seasons, only: [:index, :new, :create, :edit, :update, :destroy] do
  #   collection do
  #     post :confirm
  #   end
  # end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
