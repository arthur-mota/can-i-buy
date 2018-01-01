Rails.application.routes.draw do
  resources :profiles do
    resources :products
  end

  root :to => "profiles#index"

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
