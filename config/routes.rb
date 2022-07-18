Rails.application.routes.draw do
  devise_for :users, controllers: {
    confirmations: 'users/confirmations',
    passwords: 'users/passwords',
    sessions: 'users/sessions',
    registrations: 'users/registrations',
    unlocks: 'users/unlocks'
  }
  root to: "home#index"

  resource :user_information
  resource :user_mobile_phone, only: %i[new create]

  mount LetterOpenerWeb::Engine, at: "/letter_opener" if Rails.env.development?
end
