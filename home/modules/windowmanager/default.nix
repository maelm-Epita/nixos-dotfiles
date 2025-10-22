{pkgs, lib, ...}: {
  imports = [
    ./hyprland.nix
    ./wallpaper.nix
    ./theme.nix
  ];
}
