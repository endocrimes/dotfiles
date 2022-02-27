{ stdenv, config, pkgs, ... }:

{
  imports = [
    ./modules/base
    ./modules/workstation/devel
    ./modules/workworkwork/devel
    ./modules/workworkwork/tools
  ];

  home.packages = with pkgs; [
    gnupg
    syncthing
    ripgrep
  ];

  systemd.user.startServices = true;

  services.syncthing = { enable = true; };
}
