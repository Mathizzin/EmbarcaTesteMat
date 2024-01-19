# EmbarcaTesteMat
Teste da Embarca

Primeiro, vamos aos requisitos principais do teste.

1. [Docker Desktop](https://www.docker.com/products/docker-desktop/)
2. [RubyInstaller 2.7.0-1](https://github.com/oneclick/rubyinstaller2/releases/download/RubyInstaller-2.7.0-1/rubyinstaller-devkit-2.7.0-1-x64.exe)
3. [Rails 5.2.8.1](https://rubygems.org/gems/rails/versions/5.2.8.1)
4. [Rubocop 1.60.1](https://rubygems.org/gems/rubocop/versions/1.60.1)

Com esses links, a primeira série de requisitos está completa.

1. Este aplicativo deve ser escrito com a versão do Ruby 2.7.0 e Rails 5.x.
2. Este aplicativo deve ser executado em um contêiner Docker com Docker Compose.
3. Este aplicativo deve usar o PostgreSQL como banco de dados.
4. Você precisa usar o Rubocop para garantir que seu código siga os padrões.

Iniciando após baixar o projeto do GitHub:

Abra o Docker Desktop:

![Docker Desktop](https://github.com/Mathizzin/EmbarcaTesteMat/assets/115587512/8ed8fd55-a603-4834-909a-79c1e8a8bc83)

Ele estará completamente vazio se for a sua primeira vez usando (no meu caso).

Abra o Visual Studio no `cidade_projeto` e abra o terminal do Visual Studio em `projeto\cidade_projeto>`.

![Visual Studio Terminal](https://github.com/Mathizzin/EmbarcaTesteMat/assets/115587512/08d117ce-8a21-4ee6-8b66-2cdc00d8b5f7)

O primeiro comando a ser executado é `docker-compose up --build`.

![Docker Compose Up](https://github.com/Mathizzin/EmbarcaTesteMat/assets/115587512/e1034888-aa56-44a1-bc9d-984c2beaa0bc)

Vai demorar um pouco, pois ele está baixando algumas "dependências / coisas importantes para executar o projeto".

Antes de qualquer coisa, para garantir o funcionamento, abra mais um terminal e não deixe o primeiro fechar.

![Additional Terminal](https://github.com/Mathizzin/EmbarcaTesteMat/assets/115587512/6f9aa906-123b-4461-be76-4157f784bc76)

Execute os comandos:

```bash
docker-compose exec web bundle exec rake db:create
docker-compose exec web bundle exec rake db:migrate
docker-compose exec web bundle exec rake db:seed
```

1. Uma aplicação Rails, construída do zero, que deve conter:
   - Uma tabela com os estados do Brasil: Paraná, Santa Catarina e Rio Grande do Sul.
   - Uma tabela com algumas cidades de Paraná, Santa Catarina e Rio Grande do Sul (pelo menos 3 de cada estado).

Com isso, o banco de dados está "completo" e a primeira parte de criar uma tabela com os estados e as 3 cidades está concluída.

![Database Creation](https://github.com/Mathizzin/EmbarcaTesteMat/assets/115587512/3eb1df6c-9e37-4a50-9c8b-8dbe07550303)

Aproveitando ainda esse terminal aberto, iniciaremos a parte de teste.

Execute o comando:

```bash
docker-compose exec web bundle exec rspec
```

Esse comando vai fazer o RSpec instalado rodar e começar a executar os testes.

## Testes

1. Os testes devem ser escritos com RSpec.
2. Você deve testar o método responsável por pesquisar cidades.
3. Você deve testar a rota para pesquisar cidades.

Comigo, só deu certo usar o RSpec com um conjunto de algumas GEMs.

```ruby
gem 'factory_bot', '6.4.2'
gem 'factory_bot_rails'
gem 'rails-controller-testing'
gem 'rspec-rails', '~> 5.0.0'
gem 'capybara', '>= 3.26'
```

Com elas, foi possível usar o RSpec para testar.

Quando você iniciar o RSpec com aquele comando:

```bash
docker-compose exec web bundle exec rspec
```

Essa é a confirmação de que o teste funcionou. Ele leu todos os arquivos que estão sob o domínio do RSpec e retornou como "sucesso".

```
Finished in 16.3 seconds (files took 3.87 seconds to load)
14 examples, 0 failures
```

Os testes estão localizados nesta parte:

![RSpec Tests](https://github.com/Mathizzin/EmbarcaTesteMat/assets/115587512/012be588-c112-4676-aebf-56c133b11458)

Com eles retornando sucesso, a parte de teste também está concluída.

FRONTEND

Nesse MOMENTO já é possível fazer a maioria das coisas dentro do frontend através da rota http://localhost:3000.

As rotas para verificação dos inputs são duas:

http://localhost:3000 && http://localhost:3000/buscar_cidade/IdEstado/ParteCidade

Aqui estão os comandos que você precisa para iniciar o docker-compose, rodar o RSpec e o RuboCop dentro do seu projeto:

Iniciar o Docker Compose:

```bash
docker-compose up --build
```

Esse comando irá construir as imagens e iniciar os serviços definidos no seu docker-compose.yml. O ambiente do Docker Compose deve ser iniciado antes de rodar os comandos seguintes.

Rodar o RSpec dentro do Docker Compose:

```bash
docker-compose exec web bundle exec rspec
```

Este comando executa os testes RSpec dentro do contêiner do serviço web usando o Bundler.

Rodar o RuboCop dentro do Docker Compose:

```bash
docker-compose exec web bundle exec rubocop
```

```bash
bundler install
bundle install 
```
esse comando -> install as "dependencias do GEMFILE" 
Ajuda bastante pois ele verifica a compatibilidade e instala conforme o ruby.


Este comando executa o RuboCop para analisar o código em busca de conformidade com os estilos.

Lembre-se de substituir `web` pelo nome do serviço que contém sua aplicação Rails, se for diferente no seu arquivo docker-compose.yml. Esses comandos devem ser executados no diretório do seu projeto, onde está localizado o arquivo docker-compose.yml.

Outra coisa importante é talvez seja necessário configurar algumas variáveis de ambiente para funcionar tudo corretamente:

- C:\Ruby27-x64\bin
- C:\Program Files\PostgreSQL\10\bin
- C:\Ruby27-x64\lib\ruby\gems\2.7.0\gems\bundler-2.4.22\lib\bundler

E O COMANDO que mais vai te ajudar em caso de erro é o `bundle install`.

