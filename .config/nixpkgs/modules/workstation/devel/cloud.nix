{ pkgs, lib, ... }:

let
  unstable = import <unstable> { };
  endopkgs = import <endopkgs> { };
in {
  home.packages = with pkgs; [
    awscli
    unstable.google-cloud-sdk
#    endopkgs.hclfmt
  ];
}
