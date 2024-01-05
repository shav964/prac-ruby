class Pokemon < ApplicationRecord
  def total_wins
    # ポケモンごとの勝利数を返す
    wins
  end
end