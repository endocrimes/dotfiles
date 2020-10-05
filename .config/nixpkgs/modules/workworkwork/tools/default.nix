{ pkgs, lib, ... }:

{
  home.packages = with pkgs; [
    packer
    p4
  ];
}

