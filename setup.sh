#!/usr/bin/env bash
set -euo pipefail
shopt -s nullglob globstar

for script in lib/*.sh; do
  . "$script"
done

readonly POST_INSTALL="POST-INSTALL.sh"

sync_configs() {
  rsync --exclude ".git/" \
    --exclude ".gitignore" \
    --exclude ".DS_Store" \
    --exclude "README.md" \
    --exclude "POST-INSTALL.sh" \
    --exclude "extra" \
    --exclude "scripts/" \
    --exclude "setup.sh" \
    --exclude "brew" \
    -avh --no-perms . ~;

  # This _will_ override an existing config
  ln -sf "$PWD"/extra/vscode-settings.json "$VS_CODE_DEST"
}

main() {
  Vim_install_package_manager

  echo "Syncing configs..."
  sync_configs
  echo "Installing additional dependencies..."
  Vim_install_packages
  [[ -r "$POST_INSTALL" ]] && [[ -f "$POST_INSTALL" ]] && source "$POST_INSTALL"
  echo "Done."

  exit 0
}

main
