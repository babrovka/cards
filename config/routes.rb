Cards::Application.routes.draw do
  resources :variants
  match '/delete_cards' => 'cards#destroy_all', as: :delete_cards
  root :to => 'variants#index'
end
