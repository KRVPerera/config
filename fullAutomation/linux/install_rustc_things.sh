#!/usr/bin/env bash

## Install rust language
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
source $HOME/.cargo/env

## Install webassembly support with rust
sudo apt install -y libssl-dev
cargo install cargo-generate
curl https://rustwasm.github.io/wasm-pack/installer/init.sh -sSf | sh

## utils from rust
cargo install du-dust
cargo install exa
cargo install bat
cargo install tokei
cargo install procs
cargo install alacritty
sudo apt install -y ripgrep
sudo apt install -y fd-find
