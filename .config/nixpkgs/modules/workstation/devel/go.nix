{ pkgs, lib, ... }:

let unstable = import <unstable> { };
in {
  home.packages = with pkgs; [
    gnumake
    unstable.gotestsum
    unstable.jetbrains.goland
  ];

  programs.go = {
    enable = true;
    package = unstable.go;
    goPath = lib.mkDefault "dev";
  };
}

