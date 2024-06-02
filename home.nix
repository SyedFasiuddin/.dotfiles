{ config, pkgs, ... }:

let
  user = "syedfasiuddin";
in
{
  home.username = user;
  home.homeDirectory = "/Users/${user}";

  # This value determines the Home Manager release that your configuration is
  # compatible with. This helps avoid breakage when a new Home Manager release
  # introduces backwards incompatible changes.
  #
  # You should not change this value, even if you update Home Manager. If you do
  # want to update the value, then make sure to first check the Home Manager
  # release notes.
  home.stateVersion = "23.11"; # Please read the comment before changing.
  xdg.enable = true;

  home.packages = with pkgs; [
    abduco
    aerc
    bacon
    bat
    du-dust
    eza
    fd
    gh
    git
    gnupg
    hyperfine
    irssi
    isync
    jq
    ledger
    macchina
    mprocs
    msmtp
    nano
    neovim
    onefetch
    pandoc
    procs
    ripgrep
    speedtest-rs
    starship
    tealdeer
    teehee
    terminus_font_ttf
    texinfoInteractive
    tmux
    tokei
    wget
    zellij
  ];

  programs = {
    bash = {
      enable = true;
      initExtra = ''
        [ -f ~/.config/bash/custom.bashrc ] && . ~/.config/bash/custom.bashrc
      '';
    };
    zsh = {
      enable = true;
      dotDir = ".config/zsh";
      initExtra = ''
        [ -f ~/.config/zsh/custom.zshrc ] && . ~/.config/zsh/custom.zshrc
      '';
    };
    fzf.enable = true;
    zoxide.enable = true;
  };

  home.file = {
    ".config/aerc/aerc.conf".source = ./config/aerc.conf;
    ".config/aerc/binds.conf".source = ./config/aerc-binds.conf;
    ".config/bash/custom.bashrc".source = ./bash/custom.bashrc;
    ".config/gh/config.yml".source = ./config/gh-config.yml;
    ".config/git/config".source = ./config/git-config;
    ".config/git/ignore".source = ./config/git-ignore;
    ".config/homebrew/brew.env".source = ./config/brew.env;
    ".config/nano/nanorc".source = ./config/nanorc;
    ".config/npm/npmrc".source = ./config/npmrc;
    ".config/python/pythonrc".source = ./config/pythonrc;
    ".config/screenrc".source = ./config/screenrc;
    ".config/skhd/skhdrc".source = ./config/skhdrc;
    ".config/skhd/yabai.skhd".source = ./config/yabai.skhd;
    ".config/starship.toml".source = ./config/starship.toml;
    ".config/yabai/yabairc".source = ./config/yabairc;

    ".config/alacritty/" = {
      source = ./alacritty;
      recursive  = true;
    };
    ".config/zsh" = {
      source = ./zsh;
      recursive = true;
    };
    ".local/bin/" = {
      source = ./bin;
      recursive = true;
    };
    ".config/nvim/" = {
      source = ./nvim;
      recursive = true;
    };
    ".config/tmux/" = {
      source = ./tmux;
      recursive = true;
    };
  };

  programs.home-manager.enable = true;
  news.display = "silent";
}
