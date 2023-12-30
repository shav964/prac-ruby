class CreateAnotherPokemons < ActiveRecord::Migration[7.1]
  def change
    create_table :another_pokemons do |t|

      t.timestamps
    end
  end
end
