{ pkgs, lib, ...}: 
{
  imports = [
    ./modules/environment.nix
    ./modules/hyprland.nix
    ./modules/foot.nix
    ./modules/rofi.nix
    ./modules/waybar.nix
    ./modules/swaylock.nix
  ];
}
