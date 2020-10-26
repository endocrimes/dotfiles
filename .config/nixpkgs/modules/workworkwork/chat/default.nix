{ pkgs, lib, ... }:

{
  home.packages = with pkgs; [ slack zoom-us ];
}

