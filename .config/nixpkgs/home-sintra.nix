{ stdenv, config, pkgs, ... }:

{
  imports = [ ./modules/base ];

  home.packages = with pkgs; [ syncthing ];

  systemd.user.startServices = true;

  services.syncthing = { enable = true; };
}
