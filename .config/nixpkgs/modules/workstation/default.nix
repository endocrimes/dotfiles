{ config, pkgs, ... }:

{
  imports = [
    ./devel
    ./fonts
    ./chat
    ./terminal
    ./entertainment
    ./wm
  ];

  home.packages = with pkgs; [
    # Photography & Images
    darktable
    inkscape
    gimp

    # Fake Gamer Girl
    steam

    # xclip. why.
    xclip
  ];
}
