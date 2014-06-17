Cards::Application.routes.draw do
  resources :variants
  root :to => 'variants#index'
end
