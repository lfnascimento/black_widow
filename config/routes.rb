Rails.application.routes.draw do
  mount Rswag::Ui::Engine => '/'
  mount Rswag::Api::Engine => '/'
  namespace :v1 do
    post 'user_token' => 'user_token#create'

    resources :users, only: [:show]
    resources :accounts, only: [:show] do
      member do
        post :transfer
        get :balance
      end
    end
  end
end
