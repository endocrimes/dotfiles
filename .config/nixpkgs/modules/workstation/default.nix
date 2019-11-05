{ config, pkgs, ... }:

{
  imports = [
    ./devel
    ./fonts
    ./chat
    ./terminal
    ./entertainment
  ];

  home.packages = with pkgs; [
    # Photography & Images
    darktable
    inkscape
    gimp

    # Make things pretty!
    pywal
    polybar
    rofi
    jsoncpp

    # Fake Gamer Girl
    steam

    redshift
    gnome3.gnome-screenshot

    # xclip. why.
    xclip
  ];
}
