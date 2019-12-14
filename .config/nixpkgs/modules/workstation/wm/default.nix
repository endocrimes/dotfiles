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
   # HACK: Cut is unavailable in the path so we do some sad indirection bc i'm
   #       too lazy to figure out which packages i need. excuse the horrible
   #       double shell too.
   export PATH="/var/run/current-system/sw/bin:$PATH"
   MONITORS=$(bash -c "polybar --list-monitors | cut -d ':' -f 1")
   for m in $MONITORS; do
     MONITOR=$m polybar default &
   done
   '';
 };
}
