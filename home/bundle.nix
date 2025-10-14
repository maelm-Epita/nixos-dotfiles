{ pkgs, lib, ...}: {
  imports = [
    ./modules/other/
    ./modules/nvim/
    ./modules/applications/
    ./modules/windowmanager/
  ];
}
