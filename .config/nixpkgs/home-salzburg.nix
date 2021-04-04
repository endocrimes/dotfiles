{ stdenv, config, pkgs, ... }:

let
  endopkgs = import <endopkgs> { };
in {
  imports = [ ./modules/base ];

  systemd.user.startServices = true;
}

