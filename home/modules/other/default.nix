{pkgs, lib, ...}: {
  imports = [
    ./zsh
    ./environment.nix
    ./fcitx.nix
  ];
}
