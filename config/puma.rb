# config/puma.rb
# frozen_string_literal: true

# Puma can serve each request in a thread from an internal thread pool.
threads_count = ENV.fetch('RAILS_MAX_THREADS', 5)
threads threads_count, threads_count

# Specifies the `port` that Puma will listen on to receive requests; default is 3000.
port ENV.fetch('PORT', 3000)

# Specifies the `environment` that Puma will run in.
environment ENV.fetch('RAILS_ENV', 'development')

# Specifies the `pidfile` that Puma will use.
pidfile ENV.fetch('PIDFILE', 'tmp/pids/server.pid')

plugin :tmp_restart
