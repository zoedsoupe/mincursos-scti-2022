#!/bin/bash

set -e

remote_url="https://github.com/zoedsoupe/minicursos-scti-2022.git"

print_nix_config() {
echo <<-EOF
keep-outputs = true
keep-derivations = true
experimental-features = nix-command nix-flakes
EOF
}

install_nix() {
  echo "Baixando e instalando o Nix..."
  if grep -qEi "(Microsoft|WSL)" /proc/version &> /dev/null; then
    sh <(curl -L https://nixos.org/nix/install) --no-daemon
  else
    sh <(curl -L https://nixos.org/nix/install) --daemon
  fi

  echo "\nConfigurando o Nix..."
  sudo mkdir /etc/nix
  sudo touch /etc/nix/nix.conf
  print_nix_config | sudo tee -a /etc/nix/nix.conf

  echo "/home/$USER/.nix-profile/bin" >> ~/.bashrc

  mkdir ~/.config/nixpkgs
  touch ~/.config/nixpkgs/config.nix
  echo "{ allowUnfree = true; }" | ~/.config/nixpkgs/config.nix

  echo "Nix instalado com sucesso!\n"
}

install_direnv() {
  echo "Baixando e instalando direnv..."
  curl -sfL https://direnv.net/install.sh | bash

  echo "Configurando direnv..."
  echo "eval \"$(direnv hook bash)\"" >> ~/.bashrc
}

# Instala vscode em distribuições derivadas
# do Debian como Ubuntu ou Mint
install_vscode() {
  echo "Baixando e Instalando vscode"
  sudo apt-get install wget gpg
  wget -qO- https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > packages.microsoft.gpg
  sudo install -D -o root -g root -m 644 packages.microsoft.gpg /etc/apt/keyrings/packages.microsoft.gpg
  sudo sh -c 'echo "deb [arch=amd64,arm64,armhf signed-by=/etc/apt/keyrings/packages.microsoft.gpg] https://packages.microsoft.com/repos/code stable main" > /etc/apt/sources.list.d/vscode.list'
  rm -f packages.microsoft.gpg

  sudo apt-get install apt-transport-https
  sudo apt-get update && sudo apt-get install code
}

download_project() {
  mkdir $1
  cd $1
  git init
  git remote add origin -f $remote_url
  git pull origin main
}

PS3="Escolha o que deseja fazer: "
options=("Instalar Nix" "Instalar VScode" "Projeto Elixir" "Projeto SQLite" "Projeto Mongo" "Projeto CockroachDB")

select opt in "${options[@]}"
do
  case $opt in
    "Instalar Nix")
      if nix --version &> /dev/null; then
        echo "O comando nix já se encontra instalado!"
      else
        install_nix
      fi 

      if direnv &> /dev/null; then
        echo "direnv já se encontra instalado!"
      else
        install_direnv
      fi

      break
      ;;

    "Instalar VScode")
      if code -v &> /dev/null; then
        echo "VScode já se encontra instalado!"
      else
        install_vscode;
      fi

      break
      ;;

    "Projeto Elixir")
      path="$HOME/dummy"
      download_project $path
      mv "$path/concurrency" "$HOME/elixir_project"
      rm -rf $path
      break
      ;;

    "Projeto SQLite")
      path="$HOME/dummy"
      download_project $path
      mv "$path/sqlite_project" $HOME
      rm -rf $path
      break
      ;;

    "Projeto Mongo")
      path="$HOME/dummy"
      download_project $path
      mv "$path/mongodb_project" $HOME
      rm -rf $path
      break
      ;;

    "Projeto CockroachDB")
      path="$HOME/dummy"
      download_project $path
      mv "$path/cockroachdb_project" $HOME
      rm -rf $path
      break
      ;;

    *) echo "Opção Inválida";;
  esac
done

