Cards::Application.routes.draw do
  devise_for :users, :skip => :registrations
  resources :quizzes
  resources :cards, :only => [:index]
  resources :variants, :only => [:create, :destroy]
  resources :questions, :only => [:create, :destroy]
  match '/delete_cards' => 'cards#destroy_all', as: :delete_cards
  match '/select_card/:id' => 'cards#select', as: :select_card
  root :to => 'quizzes#home'
end
