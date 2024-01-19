# frozen_string_literal: true

require 'rails_helper'
require_relative '../../app/controllers/cidades_controller'

RSpec.describe CidadesController, type: :controller do
  let(:estado) { create(:estado, nome: 'Bahia', sigla: 'BA', regiao: 'Nordeste') }
  let(:cidade) { create(:cidade, nome: 'Cidade Exemplo', populacao: 100_000, estado: estado) }

  describe 'GET new' do
    it 'renders the new template' do
      get :new
      expect(response).to render_template(:new)
      puts "Response status: #{response.status}"
      puts "Response body: #{response.body}"
    end
  end

  describe 'POST create' do
    it 'creates a new city' do
      post :create, params: { cidade: { nome: 'Cidade Exemplo', populacao: 100_000, estado_id: estado.id } }
      expect(response).to redirect_to(cidades_path)
      puts "Response status: #{response.status}"
      puts "Response body: #{response.body}"
    end
  end

  describe 'GET edit' do
    it 'renders the edit template' do
      get :edit, params: { id: cidade.id }
      expect(response).to render_template(:edit)
      puts "Response status: #{response.status}"
      puts "Response body: #{response.body}"
    end
  end

  describe 'PATCH update' do
    it 'updates the city' do
      patch :update, params: { id: cidade.id, cidade: { nome: 'Novo Nome', populacao: 150_000, estado_id: estado.id } }
      expect(response).to redirect_to(cidades_path)
      puts "Response status: #{response.status}"
      puts "Response body: #{response.body}"
    end
  end

  describe 'DELETE destroy' do
    it 'deletes the city' do
      delete :destroy, params: { id: cidade.id }
      expect(response).to redirect_to(cidades_path)
      puts "Response status: #{response.status}"
      puts "Response body: #{response.body}"
    end
  end
end
