# frozen_string_literal: true

# spec/factories/cidades.rb
FactoryBot.define do
  factory :cidade do
    sequence(:nome) { |n| "Cidade#{n} Exemplo" }
    populacao { 100_000 }
    estado
  end
end
