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

add_key() {
  wget -qO - "$1" | sudo apt-key add - &> /dev/null
}

add_ppa() {
  sudo add-apt-repository -y ppa:"$1" &> /dev/null
}

add_to_source_list() {
  sudo sh -c "printf 'deb $1' >> '/etc/apt/sources.list.d/$2'"
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
