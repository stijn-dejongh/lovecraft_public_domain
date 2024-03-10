#!/bin/bash

echo "Building documents"
echo ''
echo '> Building book using [sdd-base] '
docker-compose -f ./ops/docker-compose.yml exec -T linux sh /root/docGen/scripts/doc_runner.sh

echo '-=[ DONE ]=-'
