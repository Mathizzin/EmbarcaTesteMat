# frozen_string_literal: true

# db/seeds.rb

# Create states
estado_pr = Estado.create(nome: 'Paraná', sigla: 'PR', regiao: 'Sul')
estado_sc = Estado.create(nome: 'Santa Catarina', sigla: 'SC', regiao: 'Sul')
estado_rs = Estado.create(nome: 'Rio Grande do Sul', sigla: 'RS', regiao: 'Sul')

# Create cities
Cidade.create(nome: 'Curitiba', populacao: 987_654, estado: estado_pr)
Cidade.create(nome: 'Londrina', populacao: 543_210, estado: estado_pr)
Cidade.create(nome: 'Maringá', populacao: 321_098, estado: estado_pr)

Cidade.create(nome: 'Florianópolis', populacao: 654_321, estado: estado_sc)
Cidade.create(nome: 'Joinville', populacao: 210_987, estado: estado_sc)
Cidade.create(nome: 'Blumenau', populacao: 109_876, estado: estado_sc)

Cidade.create(nome: 'Porto Alegre', populacao: 876_543, estado: estado_rs)
Cidade.create(nome: 'Caxias do Sul', populacao: 543_210, estado: estado_rs)
Cidade.create(nome: 'Pelotas', populacao: 210_987, estado: estado_rs)

puts 'Seed Carregada com sucesso'
