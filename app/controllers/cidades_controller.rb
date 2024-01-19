# frozen_string_literal: true

# Controlador para gerenciar operações relacionadas a Cidades
class CidadesController < ApplicationController
  before_action :set_cidade, only: %i[show edit update destroy]

  # Exibe todas as cidades
  def index
    @cidades = Cidade.all
  end

  # Inicializa uma nova cidade e obtém a lista de estados para o formulário
  def new
    @cidade = Cidade.new
    @estados = Estado.all
  end

  # Cria uma nova cidade com base nos parâmetros fornecidos
  def create
    @cidade = Cidade.new(cidade_params)

    respond_to do |format|
      save_city(format)
    end
  end

  # Obtém a cidade específica para edição
  def edit
    # A variável de instância @cidade já está sendo definida no before_action.
  end

  # Atualiza a cidade com base nos parâmetros fornecidos
  def update
    respond_to do |format|
      if @cidade.update(cidade_params)
        format.html { redirect_to cidades_path, notice: 'Cidade atualizada com sucesso.' }
        format.json { render json: @cidade, status: :ok, location: @cidade }
      else
        @estados = Estado.all
        format.html { render :edit }
        format.json { render json: @cidade.errors, status: :unprocessable_entity }
      end
    end
  end

  # Exclui a cidade
  def destroy
    @cidade.destroy
    respond_to do |format|
      format.html { redirect_to cidades_url, notice: 'Cidade excluída com sucesso.' }
      format.json { head :no_content }
    end
  end

  private

  # Configura a variável de instância @cidade com base no ID fornecido
  def set_cidade
    @cidade = Cidade.find(params[:id])
  end

  # Define os parâmetros permitidos para criação/atualização de cidades
  def cidade_params
    params.require(:cidade).permit(:nome, :populacao, :estado_id)
  end

  # Método privado para salvar a cidade e tratar as respostas do formato
  def save_city(format)
    if @cidade.save
      format.html { redirect_to cidades_path, notice: 'Cidade criada com sucesso.' }
      format.json { render json: @cidade, status: :created, location: @cidade }
    else
      @estados = Estado.all
      format.html { render :new }
      format.json { render json: @cidade.errors, status: :unprocessable_entity }
    end
  end
end
