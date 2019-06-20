{ config, pkgs, ... }:

let unstable = import <unstable> {};
in {
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
    python27
    ripgrep
    gnupg

    # Work stuff
    gitAndTools.hub
    go
    slack
    zoom-us
    consul
    vault
    remmina # sadly, windows.

    rustup
    autoconf
    # gcc
    binutils.bintools

    # Chat
    signal-desktop
    quasselClient
    keybase
    keybase-gui

    # Entertainment
    spotify
    vlc
    playerctl

    # Photography & Images
    darktable
    inkscape

    # Make things pretty!
    pywal
    polybar
    rofi
    unstable.siji
    unifont
    jsoncpp
    nerdfonts
  ];

  programs.firefox = {
    enable = true;
    enableIcedTea = true;
  };

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
}

