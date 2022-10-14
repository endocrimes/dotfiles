{ stdenv, config, pkgs, ... }:

{
  imports = [ ./modules/base ./modules/develop ];

  home.packages = with pkgs; [ syncthing ];

  systemd.user.startServices = true;

  services.syncthing = { enable = true; };
}
