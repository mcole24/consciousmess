Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'ripples#index'
  
  get 'ripples/newest' => 'ripples#newest', :as => :newest
  get 'ripples/oldest' => 'ripples#oldest', :as => :oldest
  get 'ripples/next10' => 'ripples#next10', :as => :next10
  get 'ripples/previous10' => 'ripples#previous10', :as => :previous10
  
  resources :ripples, except: [:edit, :destroy]
  
end
