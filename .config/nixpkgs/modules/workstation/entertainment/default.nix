{ config, pkgs, ... }:

let unstable = import <unstable> { };
in { home.packages = with pkgs; [ unstable.spotify vlc playerctl mpv ]; }
