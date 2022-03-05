#!/bin/env bash


main(){
    cd "$(dirname "$0")" || exit 1
    mapfile -t volumes < <(docker volume ls -q)
    for volume in "${volumes[@]}"; do
        docker run --rm \
        -v "$volume":/backup/data \
        -v "$(pwd)"/backups:/archive \
        -e BACKUP_FILENAME="$volume"-%Y-%m-%dT%H-%M-%S.tar.gz \
        -e BACKUP_LATEST_SYMLINK="$volume".tar.gz \
        -e BACKUP_PRUNING_PREFIX="$volume"- \
        -e BACKUP_RETENTION_DAYS=7 \
        --entrypoint backup \
        offen/docker-volume-backup:v2.14.1
    done
}

main
