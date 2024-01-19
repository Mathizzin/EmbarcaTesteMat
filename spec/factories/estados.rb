# frozen_string_literal: true

# spec/factories/estados.rb

FactoryBot.define do
  factory :estado do
    nome { 'Bahia' }
    sigla { 'BA' }
    regiao { 'Nordeste' }
  end
end
