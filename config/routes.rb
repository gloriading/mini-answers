Rails.application.routes.draw do
  get '/', to: "welcome#index", as: :home
  resources :questions
  
end
