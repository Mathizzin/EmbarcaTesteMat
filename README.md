# EmbarcaTesteMat
Teste da embarca

Primeiro de tudo vamos aos requisitos principais do teste

https://www.docker.com/products/docker-desktop/

https://github.com/oneclick/rubyinstaller2/releases/download/RubyInstaller-2.7.0-1/rubyinstaller-devkit-2.7.0-1-x64.exe 

https://rubygems.org/gems/rails/versions/5.2.8.1

https://rubygems.org/gems/rubocop/versions/1.60.1

Com esses Links a primeira serie de requisitos está completa

    1. This app should be written with ruby version 2.7.0 and Rails version 5.x
    2. This app should run in a docker container with docker-compose
    3. This app should use PostgreSQL as a database
    4. You need to use Rubocop to make sure your code follows the standards

Bem iniciando após baixar o projeto do GitHub 

Você deve abrir o seu docker-desktop

![image](https://github.com/Mathizzin/EmbarcaTesteMat/assets/115587512/8ed8fd55-a603-4834-909a-79c1e8a8bc83)

Ele vai estar assim completamente vazio se for a sua primeira vez usando (meu caso)

Abra o seu visual studio no cidade_projeto e abra o terminal do visual studio
projeto\cidade_projeto>                          

![image](https://github.com/Mathizzin/EmbarcaTesteMat/assets/115587512/08d117ce-8a21-4ee6-8b66-2cdc00d8b5f7)

O primeiro comando a ser executado é o docker-compose up --build 

![image](https://github.com/Mathizzin/EmbarcaTesteMat/assets/115587512/e1034888-aa56-44a1-bc9d-984c2beaa0bc)

Vai demorar um pouco pois ele está baixando algumas "dependencias / coisas importantes para executar o projeto"

Antes de qualquer coisa para garantir o funcionamento -> abra mais um terminal "não deixe o primeiro fechar"

![image](https://github.com/Mathizzin/EmbarcaTesteMat/assets/115587512/6f9aa906-123b-4461-be76-4157f784bc76)


![image](https://github.com/Mathizzin/EmbarcaTesteMat/assets/115587512/3a62df5b-1556-41fa-bd49-a3a282c47368)


      docker-compose exec web bundle exec rake db:create
      docker-compose exec web bundle exec rake db:migrate
      docker-compose exec web bundle exec rake db:seed
      
      1. A rails app, built from scratch that should contain:
      1. A table with these states from Brazil: Paraná, Santa Catarina, and the Rio Grande
      do Sul
      2. A table with some cities from Parana, Santa Catarina, and the Rio Grande do Sul
      (at least 3 of each state)

  

Com isso está  "Completo o banco de dados" e a primeira parte de criar uma tabela com os Estados e as 3 cidades ->

![image](https://github.com/Mathizzin/EmbarcaTesteMat/assets/115587512/3eb1df6c-9e37-4a50-9c8b-8dbe07550303)

Aproveitando ainda esse terminal aberto iremos iniciar a parte de teste -> 

      docker-compose exec web bundle exec rspec  

Esse comando -> vai fazer o rspec instalado RODAR e começar a executar os testes 
  
# Tests

1. The tests should be written with RSpec
2. You should test the method responsible for search cities
3. You should test the route to search cities


Comigo só deu certo usar o RSpec com um conjunto de algumas Gems 

    gem 'factory_bot', '6.4.2'
    gem 'factory_bot_rails'
    gem 'rails-controller-testing'
    gem 'rspec-rails', '~> 5.0.0'
    gem 'capybara', '>= 3.26'


Com elas foi possivel usar o RSpec para testar 
