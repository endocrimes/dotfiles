{ pkgs, lib, ... }:

{
  home.packages = with pkgs; [
    remmina # sadly, windows.
    packer
  ];
}

