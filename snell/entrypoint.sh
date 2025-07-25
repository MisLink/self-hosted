#!/bin/sh

envsubst < ./snell-server.conf.tmpl > ./snell-server.conf

exec snell-server -c ./snell-server.conf
