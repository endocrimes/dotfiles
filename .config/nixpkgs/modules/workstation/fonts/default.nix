{ config, pkgs, ... }:

{
  home.packages = with pkgs; [
    fira-code
    siji
    unifont
    fantasque-sans-mono
  ];
}
