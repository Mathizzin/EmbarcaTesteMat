# frozen_string_literal: true

# app/controllers/principal_controller.rb
# Recebe as informações dentro da barra de pesquisa e procura as informações de Estado e Cidade
class PrincipalController < ApplicationController
  def principal
    @estados = Estado.all
    @name_part = params[:name_part]
    @state = params[:state]
    @cidades = Cidade.search(@state, @name_part)
  end

  def buscar_cidade
    @name_part = params[:name_part]
    @state = params[:state]

    @cidades = if @name_part.present?
                 # Se :name_part está presente, realizar a busca usando :state e :name_part
                 Cidade.search(@state, @name_part)
               else
                 # Se :name_part não está presente, buscar todas as cidades para o estado especificado
                 Cidade.where(estado_id: @state)
               end

    render 'principal/buscar_cidade'
  end
end
