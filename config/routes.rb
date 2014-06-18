Cards::Application.routes.draw do
  devise_for :users, :skip => :registrations

  resources :variants
  match '/delete_cards' => 'cards#destroy_all', as: :delete_cards
  match '/conjoint' => 'cards#conjoint', as: :conjoint
  match '/select_card/:id' => 'cards#select', as: :select_card
  root :to => 'variants#index'
end
