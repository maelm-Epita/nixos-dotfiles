{ pkgs, lib, ...}: {
  imports = [
    ./modules/other/other.nix
    ./modules/nvim/nvim.nix
    ./modules/applications/applications.nix
    ./modules/windowmanager/windowmanager.nix
  ];
}
