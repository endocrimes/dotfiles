
{ config, pkgs, lib, ... }:

{
  home.packages = with pkgs; [
    gnumake
    gcc
    rustup
    gnumake
    gotestsum

    nixfmt
    pre-commit
    github-cli

    awscli
    google-cloud-sdk

    vim_configurable # Config for clipboard support
    shellcheck

    # Random dev utils
    jq
    fzf
    ripgrep

    # HashiStack
    packer
    consul
    vault
    nomad
  ];

  # Current system default Go
  programs.go = {
    enable = true;
    package = pkgs.go_1_18;
    goPath = lib.mkDefault "dev";
  };
}
