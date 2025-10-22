{ config, pkgs, lib, ...}: {
  imports = [
    ./modules/applications
    ./modules/windowmanager
    ./modules/theming
  ];
}
