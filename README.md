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

Você deve abrir o seu visual studio ir no terminal 




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





