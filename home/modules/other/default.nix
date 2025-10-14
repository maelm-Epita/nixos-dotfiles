{pkgs, lib, ...}: {
  imports = [
    ./zsh.nix
    ./environment.nix
  ];
}
