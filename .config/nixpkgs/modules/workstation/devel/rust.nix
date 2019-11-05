{ pkgs, lib, ... }:

{
  home.packages = with pkgs; [
    rustup
  ];
}
