class PokemonsController < ApplicationController
  before_action :set_pokemon, only: [:show, :update_wins_page, :update_wins]

  def index
    @pokemon = Pokemon.first
    puts @pokemon.inspect
    @pokemons = Pokemon.all
    render :index, locals: { pokemon: @pokemon, pokemons: @pokemons }
  end

  def show
  end

  def update_wins_page
    @pokemons = Pokemon.all
    @additional_wins = 0
    @pokemon = Pokemon.find_by(pokedex_number: params[:pokedex_number])
    logger.debug("DEBUG: @pokemon in update_wins = #{@pokemon.inspect}")

    if @pokemon.nil?
      # @pokemon が見つからなかった場合の処理（例: リダイレクト、エラーメッセージの表示など）
      # ここでは一時的に例外を発生させていますが、本番環境では適切なエラーハンドリングが必要です。
      raise ActiveRecord::RecordNotFound, "Pokemon not found with pokedex_number: #{params[:pokedex_number]}"
    end
  end

  def update_wins
    @pokemon = Pokemon.find_by(pokedex_number: pokemon_params[:pokedex_number])
    additional_wins = pokemon_params[:wins].to_i || 0

    if @pokemon.update(wins: @pokemon.wins + additional_wins)
      redirect_to update_wins_page_pokemon_path(@pokemon), notice: "#{additional_wins}勝利数が追加されました！"
    else
      flash.now[:alert] = "勝利数を更新できませんでした"
      render :update_wins_page
    end
  end

  private

  def pokemon_params
    params.require(:pokemon).permit(:pokedex_number, :wins)
  end

  def set_pokemon
    @pokemon = Pokemon.find_by(pokedex_number: params[:pokedex_number])
  end
end
