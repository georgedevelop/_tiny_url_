Rails.application.routes.draw do
  root to: "links#new"
  resources :links, only: [:new, :create]
  get ":slug/info", to: "links#info", as: "info"
  get ":slug", to: "links#show", as: "link"

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
