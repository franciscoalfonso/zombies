Rails.application.routes.draw do
  devise_for :admins
  devise_for :users, controllers: {
      sessions: 'users/sessions'
      }
  resources :zombies do
      resources :brains
  end
    
get "users/list", to: "zombies#user", as: "list_user"
    root to: 'zombies#index'
    
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

