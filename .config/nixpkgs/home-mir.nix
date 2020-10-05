{ stdenv, config, pkgs, ... }:

let
  unstable = import <unstable> { };
  endopkgs = import <endopkgs> { };
in {
  imports = [
    ./modules/base
    ./modules/workstation
    ./modules/workworkwork
    ./modules/email
    ./modules/games/light
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

    # AIO Controller
    endopkgs.liquidctl
  ];

  systemd.user.startServices = true;

  services.syncthing = { enable = true; };

  services.keybase.enable = true;

  services.kbfs = { enable = true; };
}

