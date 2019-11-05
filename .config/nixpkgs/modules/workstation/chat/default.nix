{ config, pkgs, ... }:

let unstable = import <unstable> { };
in {
  home.packages = with pkgs; [
    # Chat
    unstable.signal-desktop
    quasselClient
    keybase-gui
    unstable.tdesktop

    unstable.skype
  ];

  services.keybase.enable = true;
}
