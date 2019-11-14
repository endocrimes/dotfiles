# games/light installs games that do not need a high-end machine to be
# enjoyable, and should be playable on a high-ish end ultrabook (e.g X1 Carbon / XPS 13)
{ config, pkgs, ... }:

{
  home.packages = with pkgs; [
    openttd
  ];
}
