Rails.application.routes.draw do
	
  devise_for :users , controllers: { sessions: 'users/sessions' }

  root 'posts#index'

  resources :posts

  resources :comments

  get 'home'=>'posts#home'
end
