#!/usr/bin/env bash
find . -type f -exec sed -i 's/old-string/new-string/g' {} \;
