Rails.application.routes.draw do
# Toppages
	root to: "toppages#index"

# Sessions
	get "login", to: "sessions#new"
	post "login",to: "sessions#create"
	delete "logout", to: "sessions#destroy"

# Users
	get "signup", to: "users#new"
	resources :users, only: [:index, :show, :new, :create]

# Microposts
	resources  :microposts, only: [:create, :destroy]
end
