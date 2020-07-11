{ config, pkgs, ... }:

let unstable = import <unstable> { };
in {
  # config.fonts.fonts = with pkgs; [
  #   fira-code
  #   unstable.siji
  #   unifont
  #   fantasque-sans-mono
  # ];
  home.packages = with pkgs; [
    fira-code
    unstable.siji
    unifont
    fantasque-sans-mono
  ];
}
