FROM ruby:2.7.0

RUN apt-get update && apt-get install -y nodejs postgresql-client

WORKDIR /cidade_projeto

COPY Gemfile Gemfile.lock /cidade_projeto/

RUN bundle install

COPY entrypoint.sh /usr/bin/

# Dê permissões de execução ao entrypoint.sh
RUN chmod +x /usr/bin/entrypoint.sh

EXPOSE 3000

ENTRYPOINT ["entrypoint.sh"]

CMD ["bundle", "exec", "rails", "server", "-b", "0.0.0.0"]
