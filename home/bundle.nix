{ pkgs, lib, ...}: {
  imports = [
    ./modules/other
    ./modules/nixvim
    ./modules/applications
    ./modules/windowmanager
  ];
}
