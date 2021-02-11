Rails.application.routes.draw do
  
  get 'welcome/index'
  get "how-it-works", to: "pages#how_it_works"
  get "before-after", to: "pages#before_after"
  get "got-clients", to: "pages#got_clients"
  get "pricing", to: "pages#pricing"
  get "support", to: "pages#support"

  devise_for :users

  devise_scope :user do
    authenticated :user do
      root 'users#show', as: :authenticated_root
    end

    unauthenticated do
      root 'devise/sessions#new', as: :unauthenticated_root
    end
  end

  resources :users, except: [:edit, :update] do
    member do
      post "makeAdmin"
      post "removeAdmin"
    end
  end
  resources :projects

  resources :discussions

  resources :projects do
    member do
      post "add_upload"
      post "destroy_upload"
      post "add_user"
    end

    resources :invitations, except: [:show, :edit, :update]
  end

  resources :chatrooms, only: [:index, :show]
  resources :chatmessages, only: [:create, :update, :delete, :edit]
  
  mount ActionCable.server, at: "/cable"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end