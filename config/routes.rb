Rails.application.routes.draw do
  get 'users/account'
  get 'users/profile'
  get 'users/profile/edit' => 'users#edit'
  post 'users/profile/update' => 'users#update'

  get 'rooms/myroom' => 'rooms#myroom'

  devise_for :users
  root to: "home#top"

  resources :rooms

  resources :reservations, only: [:index, :create] do
    collection do
      post :confirm
    end
  end
end
