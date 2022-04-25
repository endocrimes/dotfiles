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
    ripgrep
  ];

  systemd.user.startServices = true;
}
