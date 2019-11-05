{ config, pkgs, ... }:

{
  imports = [
    ./go.nix
    ./rust.nix
    ./cloud.nix
  ];

  home.packages = with pkgs; [
    gnumake
    gitAndTools.hub

    vim_configurable # Config for clipboard support

    # Random dev utils
    jq
    fzf
    ripgrep
  ];
}
