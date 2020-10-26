{ config, pkgs, ... }:

{ home.packages = [ pkgs.consul pkgs.vault pkgs.protobuf3_6 ]; }
