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

    # Work stuff
    go

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
