Rails.application.routes.draw do
  get 'bookings/index'
  devise_for :users
  resources :bookings, only: %i[update edit new create destroy]
  get '/planning', to: "bookings#planning", as: :planning
  get '/on_duty', to: "users#on_duty", as: :on_duty
  get '/on_call', to: "users#on_call", as: :on_call
  get '/default', to: "users#default", as: :default
  get '/get_doctors/:date', to: "users#get_doctors", as: :get_doctors
  patch '/users/:id', to: "users#update", as: :deplacement_update
  get 'uncalled_to_called/:id', to: "users#uncalled_to_called", as: :uncalled_to_called
  # post '/post_booking', to: "bookings#create", as: :post_booking
  root to: "pages#home"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  # root "posts#index"

  get '/rooting', to: "pages#rooting", as: :rooting

  get '/show', to: "contacts#show", as: :contact

  get '/itinerary', to: "maps#show", as: :map

  resources :chatrooms, only: %i[show index] do
    resources :messages, only: :create
  end
end
