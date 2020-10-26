{ pkgs, lib, ... }:

{
  home.packages = with pkgs; [
    gnumake
    gotestsum
  ];

  programs.go = {
    enable = true;
    package = pkgs.go;
    goPath = lib.mkDefault "dev";
  };
}

