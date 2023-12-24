#!/bin/bash

pushd "${1:-$(dirname $0)}"
git add .
git commit -m "$(date --iso-8601=seconds)"
popd
