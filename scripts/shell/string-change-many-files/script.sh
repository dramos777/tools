#!/usr/bin/env bash
find . -type f -exec sed -i 's/old-stringnew-string/g' {} \;
