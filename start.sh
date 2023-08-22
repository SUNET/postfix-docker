#!/usr/bin/env bash

set -e

for file in /config/*; do
    ln -vsf "${file}" /etc/postfix/
done

postfix -v start-fg
