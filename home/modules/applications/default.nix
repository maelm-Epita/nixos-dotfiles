{pkgs, lib, ...}: {
  imports = [
    ./swaylock.nix
    ./rofi.nix
    ./foot.nix
    ./fcitx.nix
    ./hyprpanel.nix
    ./hyprlock.nix
    ./fastfetch.nix
    ./zsh
    ./nixvim
  ];
}
