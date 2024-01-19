# frozen_string_literal: true

# Controller responsável por gerenciar operações relacionadas aos estados.
class EstadosController < ApplicationController
  before_action :set_estado, only: %i[show edit update destroy]

  # Exibe todos os estados.
  def index
    @estados = Estado.all

    respond_to do |format|
      format.html # Renderiza a view HTML
      format.json { render json: @estados } # Renderiza JSON
    end
  end

  # Exibe os detalhes de um estado específico.
  def show
    respond_to do |format|
      format.html # Renderiza a view HTML
      format.json { render json: @estado, include: :cidades } # Renderiza JSON
    end
  end

  # Inicializa uma nova instância de estado.
  def new
    @estado = Estado.new
  end

  # Cria um novo estado com base nos parâmetros fornecidos.
  def create
    @estado = Estado.new(estado_params)

    respond_to do |format|
      save_state(format)
    end
  end

  # Exibe o formulário de edição para um estado específico.
  def edit
    @estado = Estado.find(params[:id])
  end

  # Atualiza os atributos de um estado com base nos parâmetros fornecidos.
  def update
    respond_to do |format|
      if @estado.update(estado_params)
        format.html { redirect_to estados_path, notice: 'Estado atualizado com sucesso.' }
        format.json { render json: @estado, status: :ok, location: @estado }
      else
        format.html { render :edit }
        format.json { render json: @estado.errors, status: :unprocessable_entity }
      end
    end
  end

  # Exclui um estado específico.
  def destroy
    # Antes de destruir o estado, destrua todas as cidades associadas
    @estado.cidades.destroy_all
    @estado.destroy
    respond_to do |format|
      format.html { redirect_to estados_url, notice: 'Estado excluído com sucesso.' }
      format.json { head :no_content }
    end
  end


  private

  # Define a instância de estado com base no parâmetro :id.
  def set_estado
    @estado = Estado.find(params[:id])
  end

  # Define os parâmetros permitidos para criação/atualização de um estado.
  def estado_params
    params.require(:estado).permit(:nome, :sigla, :regiao)
  end

  # Salva o estado e responde ao formato adequado.
  def save_state(format)
    if @estado.save
      format.html { redirect_to estados_path, notice: 'Estado criado com sucesso.' }
      format.json { render json: @estado, status: :created, location: @estado }
    else
      format.html { render :new }
      format.json { render json: @estado.errors, status: :unprocessable_entity }
    end
  end
end
