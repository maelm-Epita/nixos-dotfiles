{pkgs, lib, ...}: {
  imports = [
    ./swaylock.nix
    ./rofi.nix
    ./foot.nix
    ./waybar.nix
  ];
}
