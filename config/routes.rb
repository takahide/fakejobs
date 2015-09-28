Rails.application.routes.draw do
  resources :jobs
  resources :tickets
  get '/' => 'top#index'
  get '/t/:number' => 'top#ticket'
end
