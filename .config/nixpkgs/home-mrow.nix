{ stdenv, config, pkgs, ... }:

let
  endopkgs = import <endopkgs> { };
in {
  imports = [ ./modules/base ];

  home.packages = with pkgs; [ syncthing ];

  systemd.user.startServices = true;

  services.syncthing = { enable = true; };
}

