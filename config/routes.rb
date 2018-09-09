Rails.application.routes.draw do
  # TODO remove unused resources routes

  resources :profiles do
    resources :products do
      member do
        patch :update_info
        put :update_info
      end
    end
  end

  root :to => "profiles#index"

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
