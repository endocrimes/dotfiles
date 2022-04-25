{ config, pkgs, ... }:

{
  imports = [ ./go.nix ./rust.nix ./cloud.nix ];

  home.packages = with pkgs; [
    gnumake
    gcc
    gitAndTools.hub
    nixfmt
    pre-commit
    github-cli

    vim_configurable # Config for clipboard support

    # Random dev utils
    jq
    fzf
    ripgrep
  ];
}
