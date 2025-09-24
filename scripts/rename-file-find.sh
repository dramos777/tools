#!/usr/bin/env bash
find . -name "old-file-name" -exec bash -c 'mv "$0" "$(dirname "$0")/new-file-name"' {} \;
