{ config, pkgs, ... }:

let endopkgs = import <endopkgs> { };
in {
  imports =
    [ ./devel ./fonts ./chat ./terminal ./entertainment ./yubikey.nix ];

  home.packages = with pkgs; [
    # Configure Planck
    wally-cli

    # xclip. why.
    xclip

    # Elgato Key Lights
    endopkgs.keylightctl

    # Useful for checking that my webcam works
    gnome3.cheese
  ];
}
