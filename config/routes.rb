Rails.application.routes.draw do


  get '/', to: "welcome#index", as: :home
  resources :questions do
    resources :answers
  end
  resources :users
  resource :session, only: [:new, :create, :destroy]

end
