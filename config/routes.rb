Rails.application.routes.draw do
  mount Rswag::Ui::Engine => '/'
  mount Rswag::Api::Engine => '/'
  namespace :v1 do
    post 'user_token' => 'user_token#create'

    resources :users, only: [:show]
    resources :accounts, only: [:show, :index] do
      member do
        post :transfer
      end
    end
  end
end
