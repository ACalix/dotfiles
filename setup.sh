#!/usr/bin/env bash
source lib/lib.sh || exit

while IFS= read -r binary; do
  env::verify_dependency "$binary"
done < "REQUIREMENTS"

readonly POST_INSTALL="POST-INSTALL.sh"

sync_configs() {
  rsync -avh --no-perms --exclude=".zsh.local" dotfiles/ "$HOME";
  rsync -avh --no-perms --ignore-existing dotfiles/.zsh.local "$HOME";

  # This _will_ override an existing config
  ln -sf "$PWD"/extra/vscode-settings.json "$VS_CODE_DEST"
}

main() {
  vim::install_package_manager
  zsh::install_prompt

  echo "Syncing configs..."
  sync_configs
  echo "Installing additional dependencies..."
  vim::install_packages
  [[ -r "$POST_INSTALL" ]] && [[ -f "$POST_INSTALL" ]] && source "$POST_INSTALL"
  echo "Done."

  exit 0
}

main
