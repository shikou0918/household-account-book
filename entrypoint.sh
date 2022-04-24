#!/bin/bash
set -e

rm -f /household-account-book/tmp/pids/server.pid

exec "$@"
