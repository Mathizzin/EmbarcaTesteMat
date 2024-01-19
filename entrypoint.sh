#!/bin/bash
set -e

# Remova o arquivo de PID se existir
rm -f /cidade_projeto/tmp/pids/server.pid


# Execu
exec "$@"