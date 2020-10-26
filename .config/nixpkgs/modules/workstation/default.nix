{ config, pkgs, ... }:

let endopkgs = import <endopkgs> { };
in {
  imports =
    [ ./devel ./fonts ./chat ./terminal ./entertainment ./wm ./yubikey.nix ];

  home.packages = with pkgs; [
    # Configure Planck
    wally-cli

    # Photography & Images
    darktable
    inkscape
    gimp

    # Fake Gamer Girl
    steam

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
