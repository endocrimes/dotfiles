{ stdenv, config, pkgs, ... }:

let unstable = import <unstable> { };
    endopkgs = import <endopkgs> { };
in {
  programs.firefox = {
    enable = true;
    package = unstable.firefox-unwrapped;
  };

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;

  home.packages = with pkgs; [
    # Required for a good computing experience
    vim_configurable # Important for clipboard support
    zsh
    fira-code
    jq
    tmux
    gnumake
    htop
    kitty
    redshift
    fzf
    gnome3.gnome-screenshot
    python27
    ripgrep
    gnupg
    pinentry
    elixir
    awscli
    lsof

    # email
    msmtp
    neomutt
    offlineimap

    # Work stuff
    gitAndTools.hub
    slack
    zoom-us
    consul
    vault
    remmina # sadly, windows.
    packer

    # Chat
    signal-desktop
    quasselClient
    keybase
    keybase-gui

    # Entertainment
    spotify
    vlc
    playerctl
    mpv

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

    # Fake Gamer Girl
    steam

    # Networking
    dnsutils.dnsutils
    mtr
    telnet

    # Rust (and some C things ;_;) <3
    rustup
    autoconf
    gcc9
    gcc9Stdenv
    binutils
    patchelf

    # xclip. why.
    xclip

    # ugh
    arduino
    arduino-mk

    libreoffice
    platformio

    gimp

    endopkgs.hclfmt
    unstable.skype

    syncthing

    unzip
  ];

  programs.go = {
    enable = true;
    package = unstable.go;
    goPath = "dev";
  };

  systemd.user.startServices = true;

  services.syncthing = {
    enable = true;
  };
}

