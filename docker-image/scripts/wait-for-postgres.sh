#!/bin/sh -e

until psql -U postgres -c '\l'; do
  echo >&2 "Postgres is unavailable - sleeping"
  sleep 5
done
echo >&2 "Postgres is up - executing command"

exec "${@}"

#retry() {
#  max_attempts="$1"; shift
#  seconds="$1"; shift
#  cmd="${@}"
#  attempt=1
#
#  until $cmd
#  do
#    if [ $attempt -eq $max_attempts ]
#    then
#      echo "Attempt $attempt failed and there are no more attempts left!"
#      return 1
#    else
#      echo "Attempt $attempt failed! Trying again in $seconds seconds..."
#      attempt=$((attempt_num+1))
#      sleep "$seconds"
#    fi
#  done
#}
#
#retry 5 5 psql -c '\l' >/dev/null
#
#echo >&2 "$(date +%Y%m%dt%H%M%S) Postgres is up - executing command"
#
#exec "${@}"