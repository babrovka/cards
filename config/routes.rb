Cards::Application.routes.draw do
  devise_for :users, :skip => :registrations
  
  resources :cards, :only => [:index]
  resources :variants, :only => [:index, :create, :destroy]
  resources :questions, :only => [:create, :destroy]
  match '/delete_cards' => 'cards#destroy_all', as: :delete_cards
  match '/conjoint' => 'cards#conjoint', as: :conjoint
  match '/select_card/:id' => 'cards#select', as: :select_card
  root :to => 'cards#conjoint'
end
