Rails.application.routes.draw do
  devise_for :buyers, controllers: { registrations: "registrations" }
  get 'static_pages/team'
  get 'static_pages/contact'
  root :to => "static_pages#home"
  get "/fetch_offers" => 'offers#from_category', as: 'fetch_offers'
  resources :offers, only: [:index] do
    resources :transactions
  end
  resources :buyers, only: [:show, :edit, :update]
  resource :messages do
    collection do
      post 'start'
      post 'confirm'
    end
  end
  resources :carts, only: [:show, :create, :edit]

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
