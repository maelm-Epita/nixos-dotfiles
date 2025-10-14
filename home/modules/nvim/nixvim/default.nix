{pkgs, lib, ...}: {
  enable = true;
  colorscheme = "rose-pine";

  imports = [
    ./options.nix
    ./keymaps.nix
    ./plugins
  ];
  
  extraLuaConfig = ''
  '';
}
