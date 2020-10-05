{ config, pkgs, ... }:

let unstable = import <unstable> { };
    endopkgs = import <endopkgs> { };
in {
  imports =
    [ ./devel ./fonts ./chat ./terminal ./entertainment ./wm ./yubikey.nix ];

  home.packages = with pkgs; [
    # Configure Planck
    unstable.wally-cli

    # Photography & Images
    darktable
    inkscape
    gimp

    # Fake Gamer Girl
    unstable.steam

    # The libre-est of boring.
    libreoffice

    # Screen recording
    kazam

    # xclip. why.
    xclip

    # Elgato Key Lights
    endopkgs.keylightctl

    # Useful for checking that my webcam works
    gnome3.cheese
  ];
}
