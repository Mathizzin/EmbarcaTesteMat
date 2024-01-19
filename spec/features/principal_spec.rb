# frozen_string_literal: true

require 'rails_helper'

RSpec.describe PrincipalController, type: :controller do
  let(:estado) { create(:estado, nome: 'Pernambuco', sigla: 'PE', regiao: 'Nordeste') }
  let(:cidade) { create(:cidade, nome: 'Cidade Exemplo', populacao: 100_000, estado: estado) }

  describe 'GET principal' do
    it 'renders the principal template' do
      get :principal
      expect(response).to render_template(:principal)
    end

    it 'assigns @estados' do
      get :principal
      expect(assigns(:estados)).to eq(Estado.all)
    end

    it 'assigns @cidades' do
      get :principal
      expect(assigns(:cidades)).to eq(Cidade.all)
    end

    it 'assigns @name_part and @state' do
      get :principal, params: { name_part: 'some_name', state: 'some_state' }
      expect(assigns(:name_part)).to eq('some_name')
      expect(assigns(:state)).to eq('some_state')
    end
  end

  describe 'GET buscar_cidade' do
    it 'renders the buscar_cidade template' do
      get :buscar_cidade
      expect(response).to render_template(:buscar_cidade)
    end

    it 'assigns @cidades when searching by state and city name' do
      state = create(:estado, nome: 'São Paulo', sigla: 'SP', regiao: 'Sudeste')
      city = create(:cidade, nome: 'São Paulo City', populacao: 150_000, estado: state)

      get :buscar_cidade, params: { state: state.id, name_part: 'Paulo' }

      # Comentário: Teste para verificar se os resultados da busca são atribuídos corretamente
      expect(assigns(:state)).to eq(state.id.to_s)
      expect(assigns(:name_part)).to eq('Paulo')
      expect(assigns(:cidades)).to eq([city])

      # Adicionando puts para imprimir a URL
      puts "URL: #{request.original_url}"
      puts "Status code: #{response.status}"
      sleep 5 # Pausa por 5 segundos
    end

    it 'assigns @cidades when searching only by city name' do
      city = create(:cidade, nome: 'Rio de Janeiro', populacao: 200_000)

      get :buscar_cidade, params: { name_part: 'Rio' }

      # Comentário: Teste para verificar se os resultados da busca são atribuídos corretamente
      expect(assigns(:state)).to be_nil
      expect(assigns(:name_part)).to eq('Rio')
      expect(assigns(:cidades)).to eq([city])


      # Adicionando puts para imprimir a URL
      puts "URL: #{request.original_url}"
      puts "Status code: #{response.status}"
      sleep 5 # Pausa por 5 segundos
    end

    it 'assigns @cidades when searching only by state' do
      # Criar um estado usando FactoryBot antes do bloco do teste
      estado = create(:estado)

      # Criar cidades associadas a esse estado
      cities_in_pernambuco = create_list(:cidade, 3, estado: estado)

      # Executar a ação do controlador
      get :buscar_cidade, params: { state: estado.id }

      # Verificar se os resultados da busca são atribuídos corretamente
      expect(assigns(:state)).to eq(estado.id.to_s)
      expect(assigns(:cidades)).to eq(cities_in_pernambuco)

      # Adicionar puts para imprimir a URL
      puts "URL: #{request.original_url}"
      puts "Status code: #{response.status}"
      sleep 5 # Pausa por 5 segundos
    end
  end
end
