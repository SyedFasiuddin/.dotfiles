{ config, pkgs, ... }:

let
  user = "syedfasiuddin";
in
{
  # Home Manager needs a bit of information about you and the paths it should
  # manage.
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

  # The home.packages option allows you to install Nix packages into your
  # environment.
  home.packages = with pkgs; [
    abduco
    aerc
    bacon
    bat
    du-dust
    eza
    fd
    gh
    gnupg
    hyperfine
    irssi
    jq
    ledger
    macchina
    mprocs
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

    # # It is sometimes useful to fine-tune packages, for example, by applying
    # # overrides. You can do that directly here, just don't forget the
    # # parentheses. Maybe you want to install Nerd Fonts with a limited number of
    # # fonts?
    # (pkgs.nerdfonts.override { fonts = [ "FantasqueSansMono" ]; })

    # # You can also create simple shell scripts directly inside your
    # # configuration. For example, this adds a command 'my-hello' to your
    # # environment:
    # (pkgs.writeShellScriptBin "my-hello" ''
    #   echo "Hello, ${config.home.username}!"
    # '')
  ];

  programs.bash = {
    enable = true;
    initExtra = ''
      [ -f ~/.config/bash/custom.bashrc ] && . ~/.config/bash/custom.bashrc
    '';
  };
  programs.zsh = {
    enable = true;
    dotDir = ".config/zsh";
    initExtra = ''
      [ -f ~/.config/zsh/custom.zshrc ] && . ~/.config/zsh/custom.zshrc
    '';
  };
  programs.fzf.enable = true;
  programs.zoxide.enable = true;

  # Home Manager is pretty good at managing dotfiles. The primary way to manage
  # plain files is through 'home.file'.
  home.file = {
    ".config/alacritty/" = {
      source = ./alacritty;
      recursive  = true;
    };

    ".config/bash/custom.bashrc".source = ./bash/custom.bashrc;

    ".config/zsh/custom.zshrc".source = ./zsh/custom.zshrc;
    ".config/zsh/aliases".source = ./zsh/aliases;
    ".config/zsh/exports".source = ./zsh/exports;
    ".config/zsh/prompt".source = ./zsh/prompt;
    ".config/zsh/prompt_common".source = ./zsh/prompt_common;
    ".config/zsh/prompt_starship".source = ./zsh/prompt_starship;

    ".config/aerc/aerc.conf".source = ./config/aerc.conf;
    ".config/aerc/binds.conf".source = ./config/aerc-binds.conf;
    ".config/homebrew/brew.env".source = ./config/brew.env;
    ".config/gh/config.yml".source = ./config/gh-config.yml;
    ".config/git/config".source = ./config/git-config;
    ".config/nano/nanorc".source = ./config/nanorc;
    ".config/npm/npmrc".source = ./config/npmrc;
    ".config/python/pythonrc".source = ./config/pythonrc;
    ".config/screenrc".source = ./config/screenrc;
    ".config/skhd/skhdrc".source = ./config/skhdrc;
    ".config/skhd/yabai.skhd".source = ./config/yabai.skhd;
    ".config/starship.toml".source = ./config/starship.toml;
    ".config/yabai/yabairc".source = ./config/yabairc;

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

    # # Building this configuration will create a copy of 'dotfiles/screenrc' in
    # # the Nix store. Activating the configuration will then make '~/.screenrc' a
    # # symlink to the Nix store copy.
    # ".screenrc".source = dotfiles/screenrc;

    # # You can also set the file content immediately.
    # ".gradle/gradle.properties".text = ''
    #   org.gradle.console=verbose
    #   org.gradle.daemon.idletimeout=3600000
    # '';
  };

  # Home Manager can also manage your environment variables through
  # 'home.sessionVariables'. If you don't want to manage your shell through Home
  # Manager then you have to manually source 'hm-session-vars.sh' located at
  # either
  #
  #  ~/.nix-profile/etc/profile.d/hm-session-vars.sh
  #
  # or
  #
  #  /etc/profiles/per-user/syedfasiuddin/etc/profile.d/hm-session-vars.sh
  #
  home.sessionVariables = {
    # EDITOR = "emacs";
  };

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
  news.display = "silent";
}
