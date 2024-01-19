# frozen_string_literal: true

# Model representing a state.
class Estado < ApplicationRecord
  has_many :cidades, dependent: :destroy

  attribute :regiao, :string

  validates :nome, presence: true, uniqueness: true
  validates :sigla, presence: true, uniqueness: true
end
