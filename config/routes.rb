Rails.application.routes.draw do
  devise_for :buyers
  get 'static_pages/team'
  get 'static_pages/contact'
  root :to => "static_pages#home"
  resources :offers, only: [:index] do
    resources :transactions
  end
  resources :buyers, only: [:show, :edit, :update]
  get "/fetch_offers" => 'offers#from_category', as: 'fetch_offers'

  resource :messages do
    collection do
      post 'start'
    end
  end
  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
