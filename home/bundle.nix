{ pkgs, lib, ...}: {
  imports = [
    ./environment.nix
    ./hyprland.nix
  ];
}
