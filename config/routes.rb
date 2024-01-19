# config/routes.rb
# frozen_string_literal: true

Rails.application.routes.draw do
  resources :estados do
    resources :cidades
  end

  root 'principal#principal'
  get '/principal', to: 'principal#principal', as: 'principal'
  get '/principal/buscar_cidade(/:state)(/:name_part)', to: 'principal#buscar_cidade', as: 'buscar_cidade'
  resources :cidades, only: %i[index new create edit update destroy]
end
