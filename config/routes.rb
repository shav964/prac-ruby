Rails.application.routes.draw do
  resources :pokemons, param: :pokedex_number, only: [:index, :show, :update] do
    member do
      get 'update_wins_page'
      patch 'update_wins', action: :update_wins
    end
  end
  root 'pokemons#index'
end