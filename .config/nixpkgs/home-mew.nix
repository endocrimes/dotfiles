{ stdenv, config, pkgs, ... }:

let
  endopkgs = import <endopkgs> { };
in {
  imports = [
    ./modules/base
    ./modules/workworkwork
    ./modules/workstation
    ./modules/develop
  ];

  programs.firefox = {
    enable = true;
  };

  home.packages = with pkgs; [
    python27
    gnupg
    pinentry

    # xclip. why.
    xclip

    gimp

    syncthing

    keybase-gui
  ];

  systemd.user.startServices = true;

  services.syncthing = { enable = true; };

  services.keybase.enable = true;

  services.kbfs = { enable = true; };
}

