# frozen_string_literal: true

# Adds the 'regiao' column to the 'estados' table
class AddRegiaoToEstados < ActiveRecord::Migration[5.2]
  def change
    add_column :estados, :regiao, :string
  end
end
