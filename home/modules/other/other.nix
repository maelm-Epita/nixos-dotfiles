{pkgs, lib, ...}: {
  imports = [
    ./environment.nix
    ./zsh.nix
  ];
}
