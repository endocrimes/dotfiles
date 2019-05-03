{ config, pkgs, ... }:

{
  home.packages = with pkgs; [
    # Required for a good computing experience
    ## Important for clipboard support
    vim_configurable
    zsh
    fira-code
    jq
    tmux
    gnumake
    dnsutils.dnsutils
    mtr
    htop
    kitty
    redshift
    fzf
    gnome3.gnome-screenshot

    # Work stuff
    gitAndTools.hub
    go
    slack
    zoom-us
    consul
    vault

    # rustup -- installed manually because I can't get hm to install 1.17
    autoconf
   #  gcc
    binutils.bintools

    # Chat
    signal-desktop
    quasselClient

    # Entertainment
    spotify
    vlc
  ];
  programs.firefox = {
    enable = true;
    enableIcedTea = true;
  };

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
}

