Rails.application.routes.draw do
  resources :zombies do
    resources :brains
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
