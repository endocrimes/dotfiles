{ config, pkgs, ... }:

{
  home.packages = with pkgs; [
    # Chat
    signal-desktop
    quasselClient
    keybase-gui
    tdesktop
    skype
  ];

  services.keybase.enable = true;
}
