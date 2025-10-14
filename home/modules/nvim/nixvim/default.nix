{pkgs, lib, ...}: {
  enable = true;

  imports = [
    ./options.nix
    ./keymaps.nix
    ./plugins
  ];
  
  extraConfigLua = ''
  '';
}
