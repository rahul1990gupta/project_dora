Rails.application.routes.draw do
  resources :feeds, only: [:index, :show, :new, :create]

  resources :tags do 
  end

  resources :goals do 
    patch :update_status, on: :member
  end 
  
  resources :links, except: :index do
    resources :comments, only: [:create, :edit, :update, :destroy]
  end

  get '/comments' => 'comments#index'

  root "links#index"

  resources :sessions, only: [:new, :create] do
    delete :destroy, on: :collection
  end
  
  get '/logout', to: 'sessions#destroy', as: 'logout'


  resources :users, only: [:new, :create, :index]

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Render dynamic PWA files from app/views/pwa/* (remember to link manifest in application.html.erb)
  # get "manifest" => "rails/pwa#manifest", as: :pwa_manifest
  # get "service-worker" => "rails/pwa#service_worker", as: :pwa_service_worker

  # Defines the root path route ("/")
  # root "posts#index"
end
