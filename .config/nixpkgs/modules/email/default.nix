{ config, pkgs, ... }:

{
  home.packages = with pkgs; [
    msmtp
    neomutt
    offlineimap
  ];
}
