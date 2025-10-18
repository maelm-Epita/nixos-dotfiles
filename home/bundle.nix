{ config, pkgs, lib, ...}: {
  imports = [
    ./modules/nixvim
    ./modules/applications
    ./modules/windowmanager
    ./modules/zsh
  ];
}
