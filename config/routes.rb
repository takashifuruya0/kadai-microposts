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

# Follow
	resources :users, only: [:index, :show, :new, :create] do
		member do
			get :followings
			get :followers
		end
	end
	resources :microposts, only: [:create, :destroy]
	resources :relationships, only: [:create, :destroy]

# Like
	resources :users, only: [:index, :show, :new, :create] do
		member do
			get :likings
		end
	end
	resources :favarites, only: [:create, :destroy]
end
