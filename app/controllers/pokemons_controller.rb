class PokemonsController < ApplicationController
  before_action :set_pokemon, only: [:show, :update]

  def index
    @pokemons = Pokemon.all
  end

  def show
  end

  def update
    # 特定のポケモンを取得します。IDはURLパラメータから取得されます。
    @pokemon = Pokemon.find(params[:id])
  
    # increment! メソッドを使用して、ポケモンの勝利数を1増やします。
    @pokemon.increment!(:wins)
  
    # リダイレクトと成功のメッセージを設定してポケモン一覧ページにリダイレクトします。
    redirect_to pokemons_path, notice: '勝利数が更新されました！'
  end

  private

  def set_pokemon
    @pokemon = Pokemon.find(params[:id])
  end
end

