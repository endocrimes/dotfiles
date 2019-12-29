{ config, pkgs, ... }:

let unstable = import <unstable> { };
in {
  imports = [
    ./devel
    ./fonts
    ./chat
    ./terminal
    ./entertainment
    ./wm
  ];

  home.packages = with pkgs; [
    # Configure Planck
    unstable.wally-cli

    # Photography & Images
    darktable
    inkscape
    gimp

    # Fake Gamer Girl
    unstable.steam

    # xclip. why.
    xclip
  ];
}
