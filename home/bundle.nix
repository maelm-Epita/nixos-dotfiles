{ pkgs, lib, ...}: 
{
  imports = [
    ./modules/environment.nix
    ./modules/hyprland.nix
    ./modules/foot.nix
  ];
}
