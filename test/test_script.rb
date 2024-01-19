# test/test_script.rb
# frozen_string_literal: true

Cidade.create(nome: 'São Paulo', populacao: 1_234_567, estado: sp)
Cidade.create(nome: 'Campinas', populacao: 789_012, estado: sp)
Cidade.create(nome: 'Santos', populacao: 456_789, estado: sp)
Cidade.create(nome: 'Curitiba', populacao: 987_654, estado: pr)
Cidade.create(nome: 'Londrina', populacao: 543_210, estado: pr)
Cidade.create(nome: 'Maringá', populacao: 321_098, estado: pr)
Cidade.create(nome: 'Florianópolis', populacao: 654_321, estado: sc)
Cidade.create(nome: 'Joinville', populacao: 210_987, estado: sc)
Cidade.create(nome: 'Blumenau', populacao: 109_876, estado: sc)
Cidade.create(nome: 'Porto Alegre', populacao: 876_543, estado: rs)
Cidade.create(nome: 'Caxias do Sul', populacao: 543_210, estado: rs)
Cidade.create(nome: 'Pelotas', populacao: 210_987, estado: rs)

puts 'Estado records after creation:'
puts 'Cidade records after creation:'

# Existing code...
