Rails.application.routes.draw do
  devise_for :users, controllers: {
    confirmations: 'users/confirmations',
    passwords: 'users/passwords',
    sessions: 'users/sessions',
    registrations: 'users/registrations',
    unlocks: 'users/unlocks'
  }
  root to: "home#index"

  devise_scope :user do
    get "users/registrations/complete" => "users/registrations#complete"
  end

  resource :user_information
  resource :user_mobile_phone, only: %i[new create] do
    collection do
      get :verification
      post :verification
    end
  end

  resources :items do
    resources :favorites, only: %i[create]
    delete "favorites", to: "favorites#destroy", as: :favorite
    resources :comments, only: %i[create destroy], shallow: true do
      resources :reports, only: %i[new create]
    end
    resources :stripe_payments, only: %i[index new destroy]
    get "stripe_payments/create" => "stripe_payments#create", as: :get_create_stripe_payments
    resource :current_stripe_payment, only: %i[update]
    resources :shipping_addresses
    resource :current_shipping_address, only: %i[update]
    resources :orders, only: %i[new create show], shallow: true do
      resources :messages, only: %i[create]
      member do
        post :ship
      end
      resource :payer_evaluation, only: %i[create]
      resource :seller_evaluation, only: %i[create]
    end
  end

  resources :users, only: %i[show] do
    resources :evaluations, only: %i[index]
  end

  get "mypage" => "mypage#index"
  namespace :mypage do
    resources :favorites, only: %i[index destroy]
    resources :items, only: %i[index]
    namespace :items do
      get "in_progress" => "in_progress#index", as: :in_progress
      get "completed" => "completed#index", as: :completed
    end
  end

  mount LetterOpenerWeb::Engine, at: "/letter_opener" if Rails.env.development?
end
