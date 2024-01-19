# frozen_string_literal: true

# criando tabela cidade com nome -> e adicionando fk de estado
class CreateCidades < ActiveRecord::Migration[5.2]
  def change
    create_table :cidades do |t|
      t.string :nome
      t.references :estado, foreign_key: true
    end
  end
end
