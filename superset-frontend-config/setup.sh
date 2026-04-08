#!/usr/bin/env bash

cp "$SUPERSET_ROOT_PATH/mise.toml" mise.toml

# Use mise exec to run make install with the node version from mise.toml
mise exec -- make install
