{pkgs, lib, ...}: {
  imports = [
    ./hyprland.nix
    ./wallpaper.nix
    ./gtk-qt.nix
    #./thumbnails.nix
  ];
}
