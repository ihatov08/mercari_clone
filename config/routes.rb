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
  end

  mount LetterOpenerWeb::Engine, at: "/letter_opener" if Rails.env.development?
end
