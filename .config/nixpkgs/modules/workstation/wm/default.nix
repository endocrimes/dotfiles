# window management config (i3/polybar etc)
{ config, pkgs, lib, ... }:

{
  home.packages = with pkgs; [
    i3
    pywal
    polybar
    rofi
    jsoncpp
    redshift
    gnome3.gnome-screenshot
 ];

 services.polybar = {
   enable = true;
   config = ./polybar.conf;
   script = lib.mkDefault ''
   wal -R
   polybar default &
   '';
 };
}
