{pkgs, lib, ...}: {
  imports = [
    ./swaylock.nix
    ./rofi.nix
    ./foot.nix
    ./fcitx.nix
    ./hyprpanel.nix
    ./zsh
    ./nixvim
  ];
}
