#!/usr/bin/env bash

## Install rust language
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
source $HOME/.cargo/env

## Install webassembly support with rust
sudo apt install libssl-dev
cargo install cargo-generate
curl https://rustwasm.github.io/wasm-pack/installer/init.sh -sSf | sh

## utils from rust
cargo install du-dust
