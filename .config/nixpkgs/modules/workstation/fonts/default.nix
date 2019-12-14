{ config, pkgs, ... }:

let unstable = import <unstable> { };
in {
  home.packages = with pkgs; [
    fira-code
    unstable.siji
    unifont
    fantasque-sans-mono
  ];
}
