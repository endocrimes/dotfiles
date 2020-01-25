{ config, pkgs, ... }:

let unstable = import <unstable> { };
in { home.packages = [ unstable.kitty ]; }
