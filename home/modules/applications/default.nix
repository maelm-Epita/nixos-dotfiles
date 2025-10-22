{pkgs, lib, ...}: {
  imports = [
    ./swaylock.nix
    ./rofi.nix
    ./foot.nix
    ./waybar.nix
    ./mako.nix
    ./fcitx.nix
    ./zsh
    ./nixvim
  ];
}
