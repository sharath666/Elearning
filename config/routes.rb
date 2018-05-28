Rails.application.routes.draw do
  resources :permissions
  devise_for :users


  devise_scope :user do
    get '/users/sign_out' => 'devise/sessions#destroy'
    
  end
  resources :viewerships
  root 'courses#index'
  resources :instructors
  get '/users/user_count' => 'users/user_count'

  put '/users/user_update' => 'users/user_update'

  put '/users/user_unblock' => 'users/user_unblock'
resources :courses do 
	resources :chapters do
	resources :lectures do 
  resources :comments 
  end  
	end	
end
  resources :categories
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
