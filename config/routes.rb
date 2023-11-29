Rails.application.routes.draw do
  devise_for :users
  resources :bookings, only: :index
  get '/on_duty', to: "users#on_duty", as: :on_duty
  get '/on_call', to: "users#on_call", as: :on_call
  get '/default', to: "users#default", as: :default

  root to: "pages#home"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  # root "posts#index"

  get '/rooting', to: "pages#rooting", as: :rooting

  get '/show', to: "contact#show", as: :contact

  get '/show', to: "map#show", as: :map

  resources :chatrooms, only: :show do
    resources :messages, only: :create
  end
end
