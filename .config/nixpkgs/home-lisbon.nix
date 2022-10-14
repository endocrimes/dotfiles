{ stdenv, config, pkgs, ... }:

{
  imports = [
    ./modules/base
    ./modules/develop
  ];

  home.packages = with pkgs; [
    gnupg
    ripgrep
  ];

  systemd.user.startServices = true;
}
