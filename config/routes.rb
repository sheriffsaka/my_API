Rails.application.routes.draw do
  #get 'pages/home'
  root 'pages#home'
  resources :animals
  # get '/auth/:provider/callback' => 'sessions#omniauth'
  devise_for :users, controllers: {
    registrations: 'users/registrations',
    sessions: 'users/sessions', 
    omniauth_callbacks: 'users/omniauth_callbacks'
    
  }
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  namespace 'api' do
    namespace 'v1' do
      resources :animals
      resources :users
    end
  end
  # Defines the root path route ("/")
  # root "articles#index"
end
