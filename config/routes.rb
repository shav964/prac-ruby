Rails.application.routes.draw do
  resources :pokemons, param: :pokedex_number, only: [:index, :show, :update] do
    member do
      get 'update_wins_page'
      patch 'update_wins'
      patch 'reset_wins'  # コントローラ名を指定しない
    end
  end

  root 'pokemons#index'
end
