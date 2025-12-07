{pkgs, lib, ...}: {
  imports = [
    ./swaylock.nix
    ./rofi.nix
    ./foot.nix
    ./mako.nix
    ./fcitx.nix
    ./zsh
    ./nixvim
    ./waybar
  ];
}
