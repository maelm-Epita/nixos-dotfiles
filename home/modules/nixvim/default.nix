{ ... }: {
  programs.nixvim.enable = true;

  imports = [
    ./colorscheme.nix
    ./globals.nix
    ./options.nix
    ./diagnostic.nix
    ./plugins
    ./lsp.nix
    ./keymaps.nix
  ];

}
