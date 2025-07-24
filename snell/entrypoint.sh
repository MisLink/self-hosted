#!/bin/sh

envsubst -no-unset -no-empty -i ./snell-server.conf -o ./snell-server.conf

exec snell-server -c ./snell-server.conf
