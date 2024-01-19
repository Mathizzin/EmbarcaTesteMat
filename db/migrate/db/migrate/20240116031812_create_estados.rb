# frozen_string_literal: true

# criando tabela estados com nome e sigla
class CreateEstados < ActiveRecord::Migration[5.2]
  def change
    create_table :estados do |t|
      t.string :nome
      t.string :sigla
    end
  end
end
