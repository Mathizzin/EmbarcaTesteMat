# frozen_string_literal: true

# Adicionando coluna populacao na tabela cidade
class AddColumnsToCidades < ActiveRecord::Migration[5.2]
  def change
    add_column :cidades, :populacao, :float
  end
end
