# frozen_string_literal: true

# Model representing a city.
class Cidade < ApplicationRecord
  belongs_to :estado

  validates :nome, presence: true, uniqueness: true
  validates :populacao, presence: true
  validates :estado_id, presence: true

  def self.search(state, name_part)
    if state.present? && name_part.present?
      where('estado_id = ? AND nome ILIKE ?', state, "%#{name_part}%")
    elsif state.present?
      where(estado_id: state)
    elsif name_part.present?
      where('nome ILIKE ?', "%#{name_part}%")
    else
      all
    end
  end
end
