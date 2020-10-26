{ config, pkgs, ... }:

{
  home.packages = with pkgs; [
    spotify
    vlc
    playerctl
    mpv
  ];
}
