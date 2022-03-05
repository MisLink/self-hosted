#!/bin/env bash

main() {
  volume=$1
  rm -rf /tmp/backup
  tar -C /tmp -xvf "$volume".tar.gz
  docker run -d --name temp_restore_container -v "$volume":/backup_restore alpine
  docker cp /tmp/backup/data/. temp_restore_container:/backup_restore
  docker rm -f temp_restore_container
}

main "$@"
