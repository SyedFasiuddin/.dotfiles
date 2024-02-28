#!/bin/sh

mkdir -p $HOME/Developer/Rust

# setup env vars for .cargo & .rustup directories
export XDG_CACHE_HOME="$HOME/.cache"
export CARGO_HOME="$HOME/Developer/Rust/.cargo"
export RUSTUP_HOME="$HOME/Developer/Rust/.rustup"

# Install default rust toolchain using rustup
# See: <https://github.com/rust-lang/rustup/issues/297>
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- -y

# This has to be done so that I can use `cargo` to install stuff
# If this is not done then we get "command not found" error
export PATH="$PATH:$CARGO_HOME/bin"

cargo install cargo-binstall --locked
cargo install sccache -y

export RUSTC_WRAPPER="$CARGO_HOME/bin/sccache"
export SCCACHE_DIR="$XDG_CACHE_HOME/sccache"

# Install essentials
cargo binstall fd-find ripgrep          # Common dependencies for a lot of things
cargo binstall zoxide exa starship      # Regularly used stuff
cargo binstall bob fnm                  # To be able to install other tools

# Install everything else
cargo binstall\
      bacon\
      cargo-info cargo-install-update cargo-install-update-config\
      deno\
      hyperfine\
      mprocs\
      speedtest-rs\
      wiki-tui\
      zellij

echo "
Rust stuff has been installed, make sure to remove lines added by rustup
installation script from:
  .profile, .bashrc, .zshrc, .zshenv
"
