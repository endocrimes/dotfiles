{ config, pkgs, ... }:

let unstable = import <unstable> { };
in {
  home.packages = [
    unstable.consul
    unstable.vault
  ];
}
