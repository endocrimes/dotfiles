#!/usr/bin/env bash

cd "$(dirname "${BASH_SOURCE[0]}")" \
  && . "../util.sh"

# Platform specific utility functions

install_package() {
  declare -r PACKAGE="$2"
  declare -r PACKAGE_READABLE_NAME="$1"

  if ! package_is_installed "$PACKAGE"; then
    execute "sudo apt-get install --allow-unauthenticated -qqy $PACKAGE" "$PACKAGE_READABLE_NAME"
  fi
}

package_is_installed() {
  dpkg -s "$1" &> /dev/null
}

update() {
  # Resynchronize the package index files from their sources.
  execute \
    "sudo apt-get update -qqy" \
    "APT (update)"
}
