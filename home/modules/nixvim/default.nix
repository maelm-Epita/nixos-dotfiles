{ config, lib, pkgs, ...}:
{
  programs.nixvim.enable = true;

  imports = [
    ./colorscheme.nix
    ./globals.nix
    ./options.nix
    ./plugins
    ./keymaps.nix
  ];

}
