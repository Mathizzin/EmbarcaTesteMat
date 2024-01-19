# frozen_string_literal: true

RSpec.feature 'Estados', type: :feature do
  scenario 'Criar, editar e excluir estado' do
    # Criar estado
    visit new_estado_path
    fill_in 'Nome', with: 'bahia'
    fill_in 'Sigla', with: 'BA'
    fill_in 'estado_regiao', with: 'Nordeste'
    click_button 'Criar Estado'

    expect(page).to have_content('Estado criado com sucesso.')

    # Editar estado
    within('.card', text: 'bahia') do
      click_link 'Editar', match: :first
    end

    fill_in 'Nome', with: 'Novo Nome'
    fill_in 'Sigla', with: 'Nova Sigla'
    fill_in 'estado_regiao', with: 'Nova Região'
    click_button 'Atualizar Estado'

    expect(page).to have_content('Estado atualizado com sucesso.')

    # Excluir estado
    within('.card', text: 'Novo Nome') do
      click_link 'Excluir'
    end
    expect(page).to have_content('Estado excluído com sucesso.')
  end
end
