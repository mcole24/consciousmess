Rails.application.routes.draw do
  resources :ripples
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'ripples#index'
  
  get 'ripples/newest' => 'ripples#newest'
  get 'ripples/oldest' => 'ripples#oldest'
  get 'ripples/next10' => 'ripples#next10'
  get 'ripples/previous10' => 'ripples#previous10'
  
  resources :ripples
  
end
