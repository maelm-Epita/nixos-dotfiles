{ config, lib, pkgs, ...}:
{
  programs.nixvim.enable = true;

  imports = [
    ./colorscheme.nix
    ./globals.nix
    ./options.nix
    ./plugins
    ./lsp.nix
    ./keymaps.nix
  ];

}
